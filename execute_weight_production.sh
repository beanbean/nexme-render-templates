#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "🚀 EXECUTING WEIGHT WORKFLOW WITH REAL GOOGLE SHEETS DATA"
echo "=========================================================="
echo ""
echo "📊 Steps:"
echo "  1. Reading Google Sheets (marathon data)"
echo "  2. Calculating weight rankings (Day 0-10)"
echo "  3. Rendering images (1080×1920)"
echo "  4. Queueing to bot_queue (bot_type=WEIGHT_LEADER)"
echo ""
echo "⏳ Executing... (may take 30-60 seconds)"
echo ""

# Try to execute workflow directly
curl -X POST "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu/run" \
  -H "X-N8N-API-KEY: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"executionMode": "manual"}' 2>&1

echo ""
echo ""
