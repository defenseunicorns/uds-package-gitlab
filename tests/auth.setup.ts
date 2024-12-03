/**
 * Copyright 2024 Defense Unicorns
 * SPDX-License-Identifier: AGPL-3.0-or-later OR LicenseRef-Defense-Unicorns-Commercial
 */

import { test as setup, expect } from '@playwright/test';
import { authFile } from './playwright.config';

setup('authenticate', async ({ page, context }) => {
  await page.goto('/dashboard/projects');

  await page.getByLabel('Username or email').fill('doug');
  await page.getByLabel('Password').fill('unicorn123!@#UN');
  await page.getByRole('button', { name: "Log In" }).click();

  await page.waitForURL('/dashboard/projects');  // successful redirect

  // ensure auth cookies were set
  const cookies = await context.cookies();
  const keycloakCookie = cookies.find(
    (cookie) => cookie.name === "KEYCLOAK_SESSION",
  );

  expect(keycloakCookie).toBeDefined();
  expect(keycloakCookie?.value).not.toBe("");
  expect(keycloakCookie?.domain).toContain("sso.");

  await page.context().storageState({ path: authFile });

  await expect(page).toHaveURL('/dashboard/projects');

  await page.goto("/-/user_settings/ssh_keys")
  await page.getByRole('button', { name: "Add new key" }).click();

  await page.getByLabel('Key', { exact: true}).fill(process.env.SSH_PUBLIC_KEY!);
  await page.getByRole('button', { name: "Add key" }).click();
  
  await page.goto('/dashboard/projects');
})
