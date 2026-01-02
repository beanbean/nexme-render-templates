#!/bin/bash
API_KEY="goPT@marathon10000TV"

echo "🧪 TESTING WEIGHT LEADERBOARD P1-P4 PATCHES"
echo "==========================================="
echo ""
echo "Changes implemented:"
echo "✅ P1: Crown z-index = 9999 (top layer)"
echo "✅ P2: Captain row added (avatar + name + 'Đội Trưởng')"
echo "✅ P3: 'Hôm nay' label centered (padding-right: 40px)"
echo "✅ P4: Avatar 20% larger (100px → 120px)"
echo ""
echo "⏳ Rendering test image..."

curl -X POST "https://render.nexme.vn/render?api_key=$API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "template": "weight_leaderboard.hbs",
    "width": 1080,
    "height": 1920,
    "filename_prefix": "weight_p1_p4_test",
    "data": {
      "team_name": "Đội Test Patches",
      "round_number": "1",
      "day_number": "10",
      "team_today_loss": "2.5",
      "team_all_gain": false,
      "players": [
        {
          "rank": "1",
          "name": "Nguyễn Văn A (Top 1)",
          "avatar": "https://i.pravatar.cc/150?img=1",
          "today_display": "-0.8",
          "round_display": "-3.2",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "rank": "2",
          "name": "Trần Thị B",
          "avatar": "https://i.pravatar.cc/150?img=2",
          "today_display": "-0.6",
          "round_display": "-2.8",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "rank": "3",
          "name": "Lê Văn C",
          "avatar": "https://i.pravatar.cc/150?img=3",
          "today_display": "-0.5",
          "round_display": "-2.1",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "rank": "4",
          "name": "Phạm Thị D",
          "avatar": "https://i.pravatar.cc/150?img=4",
          "today_display": "-0.3",
          "round_display": "-1.5",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "rank": "5",
          "name": "Hoàng Văn E",
          "avatar": "https://i.pravatar.cc/150?img=5",
          "today_display": "0",
          "round_display": "-0.8",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "rank": "6",
          "name": "Vũ Thị F (Tăng cân!)",
          "avatar": "https://i.pravatar.cc/150?img=6",
          "today_display": "+0.2",
          "round_display": "+0.5",
          "has_warning_today": true,
          "has_warning_round": true
        },
        {
          "rank": "7",
          "name": "Đỗ Văn G",
          "avatar": "https://i.pravatar.cc/150?img=7",
          "today_display": "--",
          "round_display": "--",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "rank": "8",
          "name": "Bùi Thị H (Tên Rất Dài Để Test Ellipsis)",
          "avatar": "https://i.pravatar.cc/150?img=8",
          "today_display": "-0.1",
          "round_display": "-0.3",
          "has_warning_today": false,
          "has_warning_round": false
        },
        {
          "is_captain": true,
          "name": "Đội Trưởng Nguyễn",
          "avatar": "https://i.pravatar.cc/150?img=9"
        }
      ]
    }
  }' | jq -r '.image_url // .url // .error'

echo ""
echo "==========================================="
echo ""
echo "✅ ACCEPTANCE CRITERIA:"
echo ""
echo "P1 - Crown Layer:"
echo "  ☐ Crown fully visible on top1 row"
echo "  ☐ Crown NOT clipped/hidden behind green pill"
echo "  ☐ Crown z-index working correctly"
echo ""
echo "P2 - Captain Row:"
echo "  ☐ Row #9 shows captain (after 8 players)"
echo "  ☐ Captain row has avatar + name"
echo "  ☐ Right side shows 'Đội Trưởng' (NOT numbers)"
echo "  ☐ Captain row uses same pill style"
echo ""
echo "P3 - Label Centering:"
echo "  ☐ 'Hôm nay' label centered over orange column"
echo "  ☐ 'vòng này' label centered over purple column"
echo ""
echo "P4 - Avatar Size:"
echo "  ☐ All avatars visibly LARGER (120px vs old 100px)"
echo "  ☐ No overlap with names or pill edges"
echo "  ☐ Avatar ring proportionally scaled"
echo ""
echo "Wait 2-3 minutes for GitHub CDN cache, then check image!"
