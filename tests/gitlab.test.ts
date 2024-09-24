import { test, expect } from "@playwright/test";
import path from "path";

test('setup a project', async ({ page, browserName }) => {
  const projectName = `${process.env.PROJECT_NAME!}-${browserName}`

  await page.goto('/projects/new#blank_project');
  await page.getByLabel('Project name').fill(projectName);
  await page.getByLabel('Initialize repository with a README').setChecked(true);
  await page.getByRole('button', { name: 'Create project' }).click();

  await expect(page).toHaveURL(`/doug/${projectName}`);

  await test.step('create a file', async () => {
    await page.goto(`/doug/${projectName}/-/new/main`);

    await page.getByTestId('file-name-field').fill('docs/README.md');
    await page.getByLabel('Editor content;Press Alt+F1').fill('# Docs', { force: true });
    await page.getByTestId('commit-button').click();

    await expect(page).toHaveURL(`/doug/${projectName}/-/blob/main/docs/README.md`)
    await expect(page.getByRole('heading', { level: 1 })).toContainText('Docs');
  });

  await test.step('create an issue', async () => {
    await page.goto(`/doug/${projectName}/-/issues/new`);

    await page.getByTestId('issuable-form-title-field').fill('We should write more tests!');

    const descriptionBox = page.getByTestId('issuable-form-description-field');

    await descriptionBox.fill(`Why are there no tests???\n\n`);

    // upload a file
    const fileChooserPromise = page.waitForEvent('filechooser');
    await page.getByRole('button', { name: 'Attach a file or image' }).click();
    const fileChooser = await fileChooserPromise;
    await fileChooser.setFiles(path.join(__dirname, 'data/unicorns.jpeg'));

    // check that markdown description box is updated
    await expect(descriptionBox).toHaveValue(/uploads\/[a-z0-9]+\/unicorns\.jpeg/);

    await page.getByTestId('issuable-create-button').click();

    // check that rendered image ends up in issue description
    await expect(page.getByRole('img', { name: 'unicorns' }))
      .toHaveAttribute('src', /uploads\/[a-z0-9]+\/unicorns\.jpeg/);
  });

  // regression test for Istio path decoding: https://github.com/defenseunicorns/uds-core/issues/288
  await test.step('fetch via API', async () => {
    const projectPath = encodeURIComponent(`doug/${projectName}`);

    const res = await page.request.get(`/api/v4/projects/${projectPath}`);

    expect(res.url()).toContain('%2F');
    await expect(res).toBeOK();

    const project = await res.json();

    expect(project.path).toBe(projectName);
    expect(project.namespace.path).toBe('doug');
  });
});
