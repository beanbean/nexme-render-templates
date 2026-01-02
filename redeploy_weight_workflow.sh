#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "🔄 RE-DEPLOYING Weight Workflow với đầy đủ 7 nodes..."
echo ""

# Extract only required fields and update
jq '{name, nodes, connections, settings}' /Users/congdau/Documents/Code-Project/Gen_image/workflows/Render_weight_leaderboard_api.json | \
  curl -X PUT "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu" \
    -H "X-N8N-API-KEY: $API_KEY" \
    -H "Content-Type: application/json" \
    -d @- | jq '{id, name, versionCounter, nodes: [.nodes[] | .name]}'
