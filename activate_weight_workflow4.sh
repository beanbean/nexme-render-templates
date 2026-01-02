#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "📥 Getting current workflow..."
WORKFLOW=$(curl -s "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
  -H "X-N8N-API-KEY: $API_KEY")

echo "🔄 Activating..."
echo "$WORKFLOW" | jq '.active = true | {name, nodes, connections, settings, active}' | \
  curl -X PUT "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
    -H "X-N8N-API-KEY: $API_KEY" \
    -H "Content-Type: application/json" \
    -d @-
