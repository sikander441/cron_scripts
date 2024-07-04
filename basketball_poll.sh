#!/bin/bash

export PATH=<set_path>
today=$(date +%Y-%m-%d)
npx mudslide@latest send-poll <add_group_id> "Game today: $today" --item 'Kalyani' --item 'Kharadi' --item '👨‍🦽‍➡️' --selectable 2
