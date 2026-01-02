#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "🔍 KIỂM TRA GOOGLE SHEETS DATA"
echo "=============================="
echo ""
echo "Đang lấy data từ workflow execution..."

# Execute workflow và lấy output
EXECUTION_ID=$(curl -s -X POST "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu/execute" \
  -H "X-N8N-API-KEY: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' | jq -r '.data.executionId')

echo "Execution ID: $EXECUTION_ID"
echo ""
echo "Đợi 10 giây cho workflow chạy xong..."
sleep 10

echo ""
echo "📊 OUTPUT TỪ CODE NODE:"
echo "======================"
curl -s "https://workflow.nexme.vn/api/v1/executions/$EXECUTION_ID" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.data.resultData.runData["Calculate Weight Rankings"][0].data.main[0][] | {
    team_name,
    day_number,
    players: .players | map({
      name,
      is_captain,
      rank,
      today_display,
      round_display
    })
  }'

echo ""
echo "=============================="
echo ""
echo "❓ KIỂM TRA:"
echo "1. Có captain trong players array không? (is_captain: true)"
echo "2. Captain có xuất hiện ở cuối array không?"
echo "3. Có bao nhiêu players? (phải là 8 + 1 captain = 9)"
