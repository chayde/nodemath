# SessionStart Hook Troubleshooting

## Problem
Claude was not automatically running `/gamestatus` at session startup despite instructions in CLAUDE.md requiring it.

## Root Cause
SessionStart hooks cannot display output directly to users - their stdout only goes to Claude's context, not to the user interface.

## Solution Attempted
Modified `.claude/welcome.sh` to:
1. Output full game content to stdout (for Claude's context)
2. Output JSON with `additionalContext` containing a critical instruction to run `/gamestatus` immediately

### Current State of Files

**`.claude/welcome.sh`** (SessionStart hook script):
- Outputs the full content of `node-math-game.md` to stdout
- Outputs JSON with strong instruction: "You MUST run the /gamestatus slash command as your FIRST action"
- This should load context for Claude AND instruct Claude to run `/gamestatus`

**`.claude/display-status.sh`** (created but not integrated):
- Separate script that formats and displays game status
- Could be used by `/gamestatus` command instead of welcome.sh
- Currently NOT being used

**`.claude/commands/gamestatus.md`**:
- Still references `welcome.sh`
- Could be updated to use `display-status.sh` instead

## What to Test
Start a new session and check if:
1. Claude automatically runs `/gamestatus` without being asked
2. The game status displays to you at startup

## If It Doesn't Work

### Check 1: Is the hook running?
The SessionStart hook should be loading context for Claude automatically. If Claude has no knowledge of the game state, the hook might not be running.

### Check 2: Is the instruction strong enough?
The JSON contains: "🚨 CRITICAL STARTUP INSTRUCTION 🚨 - You MUST run the /gamestatus slash command as your FIRST action"

If Claude isn't following this, the instruction may need to be even more prominent or the context structure might need adjustment.

### Check 3: Hook configuration
Verify `.claude/settings.json` has:
```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/welcome.sh"
          }
        ]
      }
    ]
  }
}
```

## Alternative Approaches if Current Solution Fails

### Option 1: UserPromptSubmit Hook
Could try using a UserPromptSubmit hook instead that detects the first message and injects the `/gamestatus` command.

### Option 2: Modify /gamestatus to use display-status.sh
Update `.claude/commands/gamestatus.md` to reference `display-status.sh` instead of `welcome.sh` to avoid showing the JSON output when manually running the command.

### Option 3: Accept Manual Execution
If hooks cannot reliably trigger commands, may need to accept that user must manually run `/gamestatus` at session start.

## Documentation Reference
- SessionStart hooks: https://docs.claude.com/en/docs/claude-code/hooks
- Hook output behavior: stdout goes to Claude's context, not displayed to users
- Only certain hook types can display to users (SessionStart is not one of them)

## Commits Made
- `7afbf47`: Modified SessionStart hook to force /gamestatus execution
- `f8a5ad9`: Include full game content in SessionStart hook output
