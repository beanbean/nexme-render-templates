#!/bin/bash

echo "📤 COMMIT & TEST TEMPLATE CHANGES"
echo "=================================="
echo ""

# Check if file has changes
if git diff --quiet weight_leaderboard.hbs; then
  echo "⚠️  No changes detected in weight_leaderboard.hbs"
  echo "   Did you save the file? (Cmd+S in VSCode)"
  exit 1
fi

echo "📊 Changes detected:"
git diff weight_leaderboard.hbs | head -20
echo ""

# Prompt for commit message
read -p "💬 Enter commit message (or press Enter for default): " COMMIT_MSG
if [ -z "$COMMIT_MSG" ]; then
  COMMIT_MSG="fix: update weight leaderboard template"
fi

echo ""
echo "🔧 Committing changes..."
git add weight_leaderboard.hbs
git commit -m "$COMMIT_MSG"

echo ""
echo "📤 Pushing to GitHub..."
git push

echo ""
echo "✅ Pushed to GitHub!"
echo ""
echo "⏳ Waiting 3 minutes for GitHub CDN to update..."
echo "   (You can Ctrl+C to skip and test manually later)"
sleep 180

echo ""
echo "🧪 Testing template with Render API..."
./test_p1_p4_patches.sh

echo ""
echo "=================================="
echo "✅ DONE! Check the image URL above"
