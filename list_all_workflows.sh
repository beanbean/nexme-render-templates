#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "📋 Danh sách tất cả workflows trên n8n:"
echo "======================================="
curl -s "https://workflow.nexme.vn/api/v1/workflows" \
  -H "X-N8N-API-KEY: $API_KEY" | jq '.data[] | {id, name, active, updatedAt}'
