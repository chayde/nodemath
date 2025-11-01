#!/bin/bash

# Node Math Game - Session Welcome Script
# Reads current game state and provides context for the session
# Uses JSON output to display message to user

GAME_FILE="/home/mark/nodemath/node-math-game.md"

if [ ! -f "$GAME_FILE" ]; then
    echo '{"systemMessage": "⚠️  Warning: node-math-game.md not found"}'
    exit 0
fi

# Build the status message
STATUS_MSG="═══════════════════════════════════════════════════════════════
📊 NODE MATH GAME - Current Status
═══════════════════════════════════════════════════════════════

🔧 Available Operators:"

# Extract available operators
OPERATORS=$(sed -n '/### Available Operators/,/### Available Numbers/p' "$GAME_FILE" | grep '^-' | sed 's/^/  /')
STATUS_MSG="$STATUS_MSG
$OPERATORS

🔢 Available Numbers:"

# Extract available numbers
POSITIVE=$(grep -A 1 "^- Positive:" "$GAME_FILE" | tail -1 | sed 's/^- Positive: //')
NEGATIVE=$(grep -A 1 "^- Negative:" "$GAME_FILE" | tail -1 | sed 's/^- Negative: //')
STATUS_MSG="$STATUS_MSG
  Positive: $POSITIVE
  Negative: $NEGATIVE

"

# Count islands
ISLAND_COUNT=$(grep -c "^#### Island" "$GAME_FILE")
STATUS_MSG="$STATUS_MSG🏝️  Islands Unlocked: $ISLAND_COUNT

"

# Count solved problems
SOLVED_COUNT=$(grep -c "^|" "$GAME_FILE" | awk '{print $1-2}')  # Subtract header rows
STATUS_MSG="$STATUS_MSG✅ Solved Problems: $SOLVED_COUNT targets confirmed

"

# Show proposed solutions awaiting testing
STATUS_MSG="$STATUS_MSG🧪 PROPOSED SOLUTIONS (Ready for Testing):
───────────────────────────────────────────────────────────────"

IN_PROPOSED=0
while IFS= read -r line; do
    if [[ "$line" == "## Proposed WIP Solutions" ]]; then
        IN_PROPOSED=1
        continue
    fi
    if [[ $IN_PROPOSED -eq 1 ]]; then
        if [[ "$line" == "## Strategy Tips" ]]; then
            break
        fi
        if [[ "$line" =~ ^\|[[:space:]]*[0-9-]+ ]]; then
            STATUS_MSG="$STATUS_MSG
$line"
        fi
    fi
done < "$GAME_FILE"

STATUS_MSG="$STATUS_MSG

═══════════════════════════════════════════════════════════════
💡 NEXT STEPS:
───────────────────────────────────────────────────────────────
  • Test proposed solutions above in the game
  • Provide new target numbers to solve
  • Report unlocked operators, numbers, or islands
═══════════════════════════════════════════════════════════════"

# Output JSON with systemMessage to display to user
# Also include the message in stdout for Claude's context
printf '%s' "$STATUS_MSG"
echo ""
echo ""
echo '{"systemMessage": "'"$(echo "$STATUS_MSG" | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')"'"}'

exit 0
