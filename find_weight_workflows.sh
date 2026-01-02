#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "🔍 TÌM TẤT CẢ WORKFLOW CÓ TÊN 'weight' HOẶC 'leaderboard'"
echo "========================================================"
echo ""

curl -s "https://workflow.nexme.vn/api/v1/workflows" \
  -H "X-N8N-API-KEY: $API_KEY" | \
  jq '.data[] | select(.name | test("weight|leaderboard"; "i")) | {
    id,
    name,
    active,
    createdAt,
    updatedAt,
    versionCounter
  }'
