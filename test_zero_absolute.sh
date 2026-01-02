#!/bin/bash

echo "⏳ Waiting 2 minutes for CDN cache refresh (commit: 2d3b831)..."
sleep 120

echo "🧪 Testing weight template with ZERO absolute positioning..."
curl -X POST "https://render.nexme.vn/render" \
  -H "Content-Type: application/json" \
  -H "x-api-key: goPT@marathon10000TV" \
  --max-time 35 \
  -d '{
    "template": "weight_leaderboard.hbs",
    "width": 1080,
    "height": 1920,
    "data": {
      "team_name": "Test Team",
      "round_number": "1",
      "day_number": "1",
      "team_today_loss": "5",
      "team_all_gain": false,
      "players": [
        {
          "rank": "1",
          "name": "Player A",
          "avatar": "https://i.pravatar.cc/150?img=1",
          "today_display": "-1.0",
          "round_display": "-2.0",
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
