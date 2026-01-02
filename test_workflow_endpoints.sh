#!/bin/bash
API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiNjFmZmIxYy00ODNjLTQ3YjUtOTg5ZC1iYzJiNWQ1YjM3NzYiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY3MjQ2NTA1fQ.wRd6jgQh73FXPWeW_Rn7b1UXXI_L8PGU_3JO6GcQOTg"

echo "Testing different endpoints..."
echo ""

echo "1. POST /test-workflow:"
curl -X POST "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu/test-workflow" \
  -H "X-N8N-API-KEY: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' 2>&1 | head -5

echo ""
echo ""
echo "2. GET /activate:"
curl -X GET "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu/activate" \
  -H "X-N8N-API-KEY: $API_KEY" 2>&1 | head -5

echo ""
echo ""
echo "3. POST /activate:"
curl -X POST "https://workflow.nexme.vn/api/v1/workflows/9fD7jTNV9LbMYGJu/activate" \
  -H "X-N8N-API-KEY: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' 2>&1 | head -5
