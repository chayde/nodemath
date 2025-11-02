#!/bin/bash

# Node Math Game - Session Welcome Script
# For SessionStart hook:
# - Outputs full game content to stdout (for Claude's context)
# - Outputs JSON with instruction to run /gamestatus (displays to user)

GAME_FILE="/home/mark/nodemath/node-math-game.md"

if [ ! -f "$GAME_FILE" ]; then
    echo '{"additionalContext": "⚠️ Warning: node-math-game.md not found. Unable to load game state."}'
    exit 0
fi

# Output full game content to stdout for Claude's context
echo "=== NODE MATH GAME STATE ==="
echo ""
cat "$GAME_FILE"
echo ""
echo "=== END GAME STATE ==="
echo ""

# Output JSON with strong instruction to run /gamestatus
cat << 'EOF'
{
  "additionalContext": "🚨 CRITICAL STARTUP INSTRUCTION 🚨\n\nYou MUST run the /gamestatus slash command as your FIRST action in this session, BEFORE responding to the user's message.\n\nThis is REQUIRED at the start of EVERY session to display the current game state to the user.\n\nDo NOT skip this step. Do NOT just respond to the user. Execute /gamestatus IMMEDIATELY.\n\n---\n\nFull game state from node-math-game.md has been loaded above for your reference."
}
EOF

exit 0
