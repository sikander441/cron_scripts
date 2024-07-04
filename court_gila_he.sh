#!/bin/zsh

export PATH=<set_path>

# Set API key and location
apiKey="<add_api_key>"
LAT="18.5481"
LON="73.9026"
degreeCharacter="c"

# Fetch the weather data
data=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?lat=$LAT&lon=$LON&units=metric&appid=$apiKey")

# Check for errors in the response
if [[ $(echo "$data" | jq -r .cod) != "200" ]]; then
    echo "Error fetching weather data"
    exit 1
fi

# Get today's date in YYYY-MM-DD format
today=$(date +%F)

# Extract and format weather data for today between 8 PM to 10 PM
formatted_data=$(echo "$data" | jq -r --arg today "$today" '
    .list[]
    | select(.dt_txt | startswith($today))
    | select((.dt_txt | contains("20:")) or (.dt_txt | contains("21:")))
    | "Date: \(.dt_txt)\nDescription: \(.weather[0].description)\nWind Speed: \(.wind.speed) m/s\nCloud Cover: \(.clouds.all)%\n"
')

# Extract description using awk and add emojis based on conditions
description=$(echo "$formatted_data" | awk -F 'Description: ' '{print $2}')

case "$description" in
    *clear*)
        emoji="☀️"
        ;;
    *clouds*)
        emoji="☁️"
        ;;
    *rain*)
        emoji="🌧️"
        ;;
    *thunderstorm*)
        emoji="⛈️"
        ;;
    *snow*)
        emoji="❄️"
        ;;
    *)
        emoji=""
        ;;
esac

# Combine formatted data with emoji
new_formatted_data="${formatted_data/Description: /Description: ${emoji} }"

# Construct the final weather string
weather_string="Weather @ Kalyani Nagar\n$new_formatted_data"

# Print the weather string
#echo -e "$weather_string"

# Send the message using npx mudslide
npx mudslide@latest send <add_group_id> "$weather_string"

