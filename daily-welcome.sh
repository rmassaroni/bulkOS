WELCOME_FILE="$HOME/.last_welcome_date"
TODAY=$(date +%Y-%m-%d)
LAST_LOGIN_RAW="$(cat "$WELCOME_FILE")"
LAST_LOGIN=$(date -d "$LAST_LOGIN_RAW" "+%a %b %d %Y" 2>/dev/null)

if [[ ! -f "$WELCOME_FILE" || "$(cat "$WELCOME_FILE")" != "$TODAY" ]]; then
fi
    echo " ________         __                                 __              __           __ __     _______ _______ "
    echo "|  |  |  |.-----.|  |.----.-----.--------.-----.    |  |_.-----.    |  |--.--.--.|  |  |--.|       |     __|"
    echo "|  |  |  ||  -__||  ||  __|  _  |        |  -__|    |   _|  _  |    |  _  |  |  ||  |    < |   -   |__     |"
    echo "|________||_____||__||____|_____|__|__|__|_____|    |____|_____|    |_____|_____||__|__|__||_______|_______|"
    echo -n "by RJM---------------------------------------------------------------------------------------" ; echo "$(date "+%a %b %d %Y")"
    echo
    echo "Last login: $LAST_LOGIN"
    echo -e "\n🌞 Welcome back, $USER!"
    echo -e "Today is $(date '+%A, %B %d, %Y')"
    echo "$TODAY" > "$WELCOME_FILE"
# fi
