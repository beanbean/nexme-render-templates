#!/bin/bash

echo "🧪 Testing weight template with FULL real-world payload..."
curl -X POST "https://render.nexme.vn/render" \
  -H "Content-Type: application/json" \
  -H "x-api-key: goPT@marathon10000TV" \
  --max-time 35 \
  -d '{
    "template": "weight_leaderboard.hbs",
    "width": 1080,
    "height": 1920,
    "data": {
      "team_name": "Đội Báo Săn",
      "round_number": "5",
      "day_number": "7",
      "team_today_loss": "18.5",
      "team_all_gain": false,
      "players": [
        {
          "rank": "1",
          "name": "Nguyễn Văn A",
          "avatar": "https://i.pravatar.cc/150?img=11",
          "today_display": "-2.5",
          "round_display": "-8.0",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "rank": "2",
          "name": "Trần Thị B",
          "avatar": "https://i.pravatar.cc/150?img=22",
          "today_display": "-1.8",
          "round_display": "-5.2",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "rank": "3",
          "name": "Lê Văn C",
          "avatar": "https://i.pravatar.cc/150?img=33",
          "today_display": "+0.3",
          "round_display": "-3.1",
          "has_warning_today": true,
          "has_warning_round": false
        },
        {
          "is_captain": true,
          "name": "Phạm Đội Trưởng",
          "avatar": "https://i.pravatar.cc/150?img=99"
        }
      ]
    }
  }' | jq
