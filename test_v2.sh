#!/bin/bash
echo "⏳ Waiting 2 min for CDN..."
sleep 120

echo "🧪 Testing weight v2 (full CSS, static HTML)..."
curl -X POST "https://render.nexme.vn/render" \
  -H "Content-Type: application/json" \
  -H "x-api-key: goPT@marathon10000TV" \
  --max-time 35 \
  -d '{
    "template": "weight_test_v2.hbs",
    "width": 1080,
    "height": 1920,
    "data": {}
  }' | jq
