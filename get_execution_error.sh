#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "🔍 LỖI CỦA EXECUTION GẦN NHẤT (281268)"
echo "======================================="
echo ""

curl -s "https://workflow.nexme.vn/api/v1/executions/281268" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '{
    id,
    status,
    data: .data.resultData.error,
    lastNodeExecuted: .data.resultData.lastNodeExecuted
  }'

echo ""
echo "Chi tiết error từ node cuối:"
curl -s "https://workflow.nexme.vn/api/v1/executions/281268" \
  -H "X-N8N-API-KEY: $API_KEY" > /tmp/exec_281268.json

jq -r '.data.resultData.runData | to_entries[] | select(.value[0].error != null) | "Node: \(.key)\nError: \(.value[0].error.message)\n"' /tmp/exec_281268.json
