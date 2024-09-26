# Reusable Pod spec for settings jobs
{{- define "uds-gitlab-settings.botaccounts-pod" }}
metadata:
  labels:
    app: gitlab
spec:
  serviceAccountName: gitlab-settings-sa #todo (@ewyles) -- use a different service account here
  containers:
  - name: gitlab-settings
    image: "{{ .Values.global.kubectl.image.repository }}:{{ .Values.global.kubectl.image.tag }}"
    command: ["/bin/sh", "-c"]
    args:
      - |
        {{- range .Values.botAccounts }}
        echo "Making bot account for {{ .username }}"
        {{- end }}
    volumeMounts:
      - name: gitlab-settings-volume
        mountPath: /etc/gitlab-settings
        readOnly: true
  restartPolicy: OnFailure
  volumes:
  - name: gitlab-settings-volume
    secret:
      secretName: gitlab-settings-secret
{{- end }}
