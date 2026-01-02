#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"
WORKFLOW_ID="9fD7jTNV9LbMYGJu"

echo "🚀 Executing Weight Leaderboard Workflow"
echo "========================================"
echo ""
echo "📊 Reading Google Sheets + Calculating Rankings + Rendering Images + Queueing Messages..."
echo ""

curl -X POST "https://workflow.nexme.vn/api/v1/workflows/$WORKFLOW_ID/executions/sync" \
  -H "X-N8N-API-KEY: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' --max-time 120
  
echo ""
echo ""
echo "✅ Execution completed!"
