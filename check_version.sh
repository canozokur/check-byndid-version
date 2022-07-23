#!/bin/sh
set -euo pipefail

send_dm() {
	curl -s -X POST -H 'Content-Type: application/json' -d '{"chat_id": '"${TELEGRAM_CHAT_ID}"', "text": "'"${1}"'", "disable_notification": true}' https://api.telegram.org/bot"${TELEGRAM_BOT_TOKEN}"/sendMessage
}

CURRENT_AUR_VERSION=$(curl -s 'https://aur.archlinux.org/rpc/?v=5&type=info&arg[]=beyond-identity-bin' | jq .results[].Version -r | cut -d'-' -f1 | sed 's/_/-/g')

LATEST_BUILD_VERSION=$(curl -s -G --data-urlencode 'query=format:raw' 'https://api.cloudsmith.io/v1/packages/beyond-identity/linux-authenticator/' | jq '.|max_by(.version)|.version' -r)

if [ "${LATEST_BUILD_VERSION}" != "${CURRENT_AUR_VERSION}" ]; then
	send_dm "Heads up! A different beyond-identity version is available: ${LATEST_BUILD_VERSION}"
	send_dm "Current version is ${CURRENT_AUR_VERSION}"
	send_dm "Check https://cloudsmith.io/~beyond-identity/repos/linux-authenticator/packages/?q=filename%3Agz%24 for all packages."
	exit 0
fi

echo "Current version (${CURRENT_AUR_VERSION}) is the latest one."
exit 0