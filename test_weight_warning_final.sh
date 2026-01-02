#!/bin/bash

echo "🧪 Testing weight template with team_all_gain WARNING..."
curl -X POST "https://render.nexme.vn/render" \
  -H "Content-Type: application/json" \
  -H "x-api-key: goPT@marathon10000TV" \
  --max-time 35 \
  -d '{
    "template": "weight_leaderboard.hbs",
    "width": 1080,
    "height": 1920,
    "data": {
      "team_name": "Đội Cánh Gió",
      "round_number": "3",
      "day_number": "5",
      "team_today_loss": "-2.5",
      "team_all_gain": true,
      "players": [
        {
          "rank": "1",
          "name": "Player 1",
          "avatar": "https://i.pravatar.cc/150?img=1",
          "today_display": "+0.5",
          "round_display": "+1.2",
          "has_warning_today": true,
          "has_warning_round": true
        },
        {
          "is_captain": true,
          "name": "Captain",
          "avatar": "https://i.pravatar.cc/150?img=99"
        }
      ]
    }
  }' | jq
