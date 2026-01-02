#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "🔍 KIỂM TRA WORKFLOW 9fD7jTNV9LbMYGJu"
echo "========================================"
echo ""

echo "1. Workflow metadata:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '{
    id,
    name,
    active,
    createdAt,
    updatedAt,
    versionCounter
  }'

echo ""
echo "2. Node names trong workflow:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.nodes[] | .name'

echo ""
echo "3. Kiểm tra template được sử dụng:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.nodes[] | select(.type == "n8n-nodes-base.httpRequest") | .parameters.options.bodyParameters.parameters[] | select(.name == "template")'

echo ""
echo "4. Kiểm tra bot_type trong Supabase nodes:"
curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.nodes[] | select(.type == "n8n-nodes-base.supabase") | {name, bot_type: .parameters.fieldsUi.fieldValues[] | select(.fieldId == "bot_type") | .fieldValue}'
