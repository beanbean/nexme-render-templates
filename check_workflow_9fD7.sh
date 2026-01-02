#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "📋 CHI TIẾT WORKFLOW: 9fD7jTNV9LbMYGJu"
echo "====================================="
echo ""

echo "1. Metadata:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '{
    id,
    name,
    active,
    createdAt,
    updatedAt,
    nodeCount: (.nodes | length)
  }'

echo ""
echo "2. Danh sách 7 nodes:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq -r '.nodes[] | "  - \(.name)"'

echo ""
echo "3. Template được dùng trong Render node:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq -r '.nodes[] | select(.name == "Render Weight Leaderboard") | .parameters.jsonBody' | grep -o '"template": "[^"]*"'

echo ""
echo "4. bot_type trong queue:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq -r '.nodes[] | select(.type == "n8n-nodes-base.supabase") | "  - \(.name): bot_type = \(.parameters.fieldsUi.fieldValues[] | select(.fieldId == "bot_type") | .fieldValue)"'

echo ""
echo "====================================="
echo "Link để mở workflow:"
echo "https://workflow.nexme.vn/workflow/9fD7jTNV9LbMYGJu"
echo ""
