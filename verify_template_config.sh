#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "✅ VERIFY WORKFLOW CONFIGURATION"
echo "================================="
echo ""

echo "1. Template được sử dụng:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq -r '.nodes[] | select(.name == "Render Weight Leaderboard") | .parameters.options.bodyParameters.parameters[] | select(.name == "template") | .value'

echo ""
echo "2. Canvas size:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.nodes[] | select(.name == "Render Weight Leaderboard") | .parameters.options.bodyParameters.parameters[] | select(.name == "width" or .name == "height") | {name, value}'

echo ""
echo "3. bot_type trong Queue nodes:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.nodes[] | select(.type == "n8n-nodes-base.supabase") | {name, bot_type: (.parameters.fieldsUi.fieldValues[] | select(.fieldId == "bot_type") | .fieldValue)}'

echo ""
echo "4. Workflow connections:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.connections | keys'
