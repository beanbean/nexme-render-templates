#!/bin/bash
echo "Waiting 2 minutes for CDN..."
sleep 120

echo "Testing minimal template..."
curl -X POST "https://render.nexme.vn/render" \
  -H "Content-Type: application/json" \
  -H "x-api-key: goPT@marathon10000TV" \
  --max-time 35 \
  -d '{
    "template": "weight_test_minimal.hbs",
    "width": 1080,
    "height": 1920,
    "data": {}
  }' | jq
