WELCOME_FILE="$HOME/.last_welcome_date"
TODAY=$(date +%Y-%m-%d)
NOW_TIME=$(date "+%I:%M %p")
LAST_LOGIN=$(date -d "$(cat "$WELCOME_FILE")" "+%a %b %d %Y" 2>/dev/null)

if [[ -f "$WELCOME_FILE" ]]; then
    LAST_LOGIN_RAW=$(cat "$WELCOME_FILE")
    LAST_LOGIN_DATE=${LAST_LOGIN_RAW%% *}
    LAST_LOGIN_TIME=${LAST_LOGIN_RAW#* }
else
    LAST_LOGIN_DATE=""
    LAST_LOGIN_TIME=""
fi

if [[ "$LAST_LOGIN_DATE" == "$TODAY" ]]; then
    LAST_LOGIN_RELATIVE="Today at $LAST_LOGIN_TIME"
elif [[ "$LAST_LOGIN_DATE" == "$(date -d "yesterday" +%Y-%m-%d)" ]]; then
    LAST_LOGIN_RELATIVE="Yesterday at $LAST_LOGIN_TIME"
elif [[ -n "$LAST_LOGIN_DATE" ]]; then
    LAST_LOGIN_RELATIVE="$(date -d "$LAST_LOGIN_DATE" "+%a %b %d %Y") at $LAST_LOGIN_TIME"
else
    LAST_LOGIN_RELATIVE="(first login)"
fi

if [[ ! -f "$WELCOME_FILE" || "$LAST_LOGIN_DATE" != "$TODAY" ]]; then
    echo " ________         __                                 __              __           __ __     _______ _______ "
    echo "|  |  |  |.-----.|  |.----.-----.--------.-----.    |  |_.-----.    |  |--.--.--.|  |  |--.|       |     __|"
    echo "|  |  |  ||  -__||  ||  __|  _  |        |  -__|    |   _|  _  |    |  _  |  |  ||  |    < |   -   |__     |"
    echo "|________||_____||__||____|_____|__|__|__|_____|    |____|_____|    |_____|_____||__|__|__||_______|_______|"
    echo -n "by RJM---------------------------------------------------------------------------------------" ; echo "$(date "+%a %b %d %Y")"
    echo "Last login: $LAST_LOGIN_RELATIVE"
else
    # echo -e "Welcome back, $USER."
    # echo -e "Today is $(date '+%A, %B %d, %Y')"
    echo -e "Welcome back, $USER. Today is $(date '+%A, %B %d, %Y'). Last login: $LAST_LOGIN_RELATIVE"

fi
# echo "Last login: $LAST_LOGIN_RELATIVE"
echo "$TODAY $NOW_TIME" > "$WELCOME_FILE"
