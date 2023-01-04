dirs=(bpg-csp-approval-api bpg-csp-approval-app-notification-audit-service bpg-csp-approval-app-notification-email-service bpg-csp-approval-app-notification-manager bpg-csp-approval-app-notification-service bpg-csp-approval-app-processor-service bpg-csp-approval-app-services)

for dir in "${dirs[@]}"; do

echo "Creating commit-msg file to $dir"
echo "#!/usr/bin/env bash
INPUT_FILE=\$1
START_LINE=\`head -n1 \$INPUT_FILE\`
PATTERN=\"^(TRPAPP)-[[:digit:]]+\"
if ! [[ \"\$START_LINE\" =~ \$PATTERN ]]; then
  echo \"[COMMIT REJECTED] Please include JIRA ticket ID in your commit message, see example: TRPAPP-123 commit message\"
  exit 1
fi" > "$dir/.git/hooks/commit-msg"
echo "Successfully created commit-msg file to $dirs"

done
echo "Press any key to exit..."
read -s -n 1 any_key