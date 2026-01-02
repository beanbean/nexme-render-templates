#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "🔍 KIỂM TRA EXECUTIONS GẦN ĐÂY"
echo "================================"
echo ""

echo "Executions của workflow 9fD7jTNV9LbMYGJu (weight):"
curl -s "https://workflow.nexme.vn/api/v1/executions?workflowId=9fD7jTNV9LbMYGJu&limit=3" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.data[] | {
    id,
    workflowId,
    status: .status,
    startedAt,
    stoppedAt,
    mode
  }'

echo ""
echo "================================"
echo ""
echo "Nếu có execution đang chạy (status: running), đợi nó xong rồi kiểm tra kết quả"
