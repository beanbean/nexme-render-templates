# EXECUTION ERROR DIAGNOSTIC

## Current Status ❌

Workflow `9fD7jTNV9LbMYGJu` (Render_weight_leaderboard) đã được deploy đúng với **7 nodes** nhưng **TẤT CẢ executions đều FAILED**.

## Recent Executions (All Failed)

| Execution ID | Started At | Duration | Status |
|--------------|------------|----------|--------|
| 281273 | 14:02:43 | 5s | ❌ error |
| 281268 | 14:00:09 | 8s | ❌ error |
| 281191 | 12:57:54 | 6s | ❌ error |

## Workflow Configuration ✅

Workflow structure is **CORRECT**:

```
✅ 7 nodes deployed:
  1. Manual Trigger
  2. Get Marathon Data (Google Sheets)
  3. Calculate Weight Rankings (Code node)
  4. Render Weight Leaderboard (HTTP Request)
  5. Check: Render Success? (If node)
  6. Queue: Weight Success (Supabase)
  7. Queue: Weight Fallback (Supabase)

✅ Template: weight_leaderboard.hbs
✅ Bot type: WEIGHT_LEADER
✅ Updated: 2026-01-02 12:37:54
✅ Version: 6
```

## Problem

**n8n API does NOT return execution error details** - chỉ có status "error" mà không có error message hoặc lastNodeExecuted.

Ví dụ response từ API:
```json
{
  "id": "281268",
  "status": "error",
  "finished": false,
  "startedAt": "2026-01-02T14:00:09.216Z",
  "stoppedAt": "2026-01-02T14:00:17.769Z"
  // NO error details!
}
```

## How to Diagnose (MUST use n8n UI)

### Step 1: Open Workflow in n8n
https://workflow.nexme.vn/workflow/9fD7jTNV9LbMYGJu

### Step 2: Check Executions Tab
1. Click **"Executions"** tab (top right)
2. Click on failed execution (e.g., 281273)
3. Look for **red node** (node that failed)
4. Click on red node to see **error message**

### Step 3: Common Error Causes

#### A. Google Sheets Node Error
**Symptoms**: Node "Get Marathon Data" is red

**Possible causes**:
- ❌ Credential expired/invalid
- ❌ Document ID wrong: `1Z9nU5cQwEDeSKAn-Ba5HFpHUhQQyOoSxukaO7mG5DV4`
- ❌ Sheet name wrong: should be `marathon`
- ❌ Range wrong: should be `A1:Z`

**Check**:
```
Node: Get Marathon Data
Operation: Read Rows
Document: Should be "Chương Trình Marathon"
Sheet: "marathon"
Range: A1:Z
```

#### B. Code Node Error
**Symptoms**: Node "Calculate Weight Rankings" is red

**Possible causes**:
- ❌ Missing fields in Google Sheets data
- ❌ JavaScript syntax error
- ❌ Data format unexpected

**Required fields from Google Sheets**:
```javascript
// Must have these columns:
- "Người chơi" or "player_name"
- "Đội" or "team"
- "avatar_url" or "avatar"
- "Day 0" through "Day 10" (weight columns)
```

#### C. HTTP Request Node Error
**Symptoms**: Node "Render Weight Leaderboard" is red

**Possible causes**:
- ❌ Render API down
- ❌ Template not found: `weight_leaderboard.hbs`
- ❌ Data format wrong
- ❌ Timeout (unlikely - template renders in 3s)

**Test manually**:
```bash
curl -X POST "https://render.nexme.vn/render" \
  -H "Content-Type: application/json" \
  -d '{
    "template": "weight_leaderboard.hbs",
    "width": 1080,
    "height": 1920,
    "data": {
      "team_name": "Test Team",
      "round_number": 1,
      "day_number": 10,
      "team_today_loss": 1.5,
      "team_all_gain": 5.2,
      "players": []
    }
  }'
```

#### D. Supabase Node Error
**Symptoms**: Node "Queue: Weight Success" or "Queue: Weight Fallback" is red

**Possible causes**:
- ❌ Supabase credential expired
- ❌ Table `bot_queue` missing
- ❌ Missing required fields

## Next Steps

1. **Open workflow in n8n UI** tại link trên
2. **Click vào execution mới nhất** (281273)
3. **Tìm node màu đỏ** và xem error message
4. **Chụp screenshot error** và gửi cho tôi
5. Tôi sẽ fix ngay khi biết error cụ thể

## Why This Happened

The workflow was **deployed correctly via API** but something in the **configuration or credentials** is causing runtime errors.

API deployment ≠ Runtime success

We need the actual error message from n8n UI to fix this.
