#!/bin/bash

echo "⏳ Waiting 2 minutes for CDN cache (commit: c2bfe4e)..."
sleep 120

echo "🧪 Testing design updates (column labels + avatar size)..."
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
          "has_warning_today": false
        },
        {
          "rank": "2",
          "name": "Trần Thị B",
          "avatar": "https://i.pravatar.cc/150?img=22",
          "today_display": "-1.8",
          "round_display": "-5.2",
          "has_warning_today": false
        },
        {
          "is_captain": true,
          "name": "Captain",
          "avatar": "https://i.pravatar.cc/150?img=99"
        }
      ]
    }
  }' | jq

echo ""
echo "✅ Check the image above for design updates!"
