#!/bin/bash

export PATH=<>

# Array of cute words
WORDS=("honey" "sweetheart" "baby" "cutie" "pumpkin" "sweetie" "cupcake" "Beautiful" "Pudding" "Snuggles" "Dumpling" "Blossom" "Sunshine" "Sweet Pea" "Beloved" "Toots" "Peach" "Sweet Baby Girl" "Muffin" "Angel" "Princess" "Boo Bear" "Pookie" "Marshmallow" "Poppet" "Love" "Darling" "Baby Love" "Hon" "Snowflake" "Baby Girl" "Sugar" "Snookums" "Boo" "Sexy Mama" "Sugar Lips" "Gorgeous" "Buttercup" "Hottie" "Beloved" "Dearest" "Bae")

# Get a random word from the array
RANDOM_WORD=${WORDS[$RANDOM % ${#WORDS[@]}]}

# Generate a random number of seconds between 0 and 2700 (0 to 45 minutes)
SLEEP_DURATION=$((RANDOM % 2701))

# Sleep for the random duration
sleep $SLEEP_DURATION

# Send the good morning message
npx mudslide@latest send <add_phone_number> "Good Morning $RANDOM_WORD\n❤️ ❤️ ❤️ 🥰 😘"

