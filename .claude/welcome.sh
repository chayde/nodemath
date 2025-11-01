#!/bin/bash

# Node Math Game - Session Welcome Script
# For SessionStart hook: Outputs JSON to instruct Claude to run /gamestatus command
# This displays the game state to both Claude and the user

GAME_FILE="/home/mark/nodemath/node-math-game.md"

if [ ! -f "$GAME_FILE" ]; then
    echo '{"additionalContext": "⚠️ Warning: node-math-game.md not found. Unable to load game state."}'
    exit 0
fi

# Read the game file content for Claude's context
GAME_CONTENT=$(cat "$GAME_FILE")

# Output JSON with strong instruction to run /gamestatus
cat << 'EOF'
{
  "additionalContext": "🚨 CRITICAL STARTUP INSTRUCTION 🚨\n\nYou MUST run the /gamestatus slash command as your FIRST action in this session, BEFORE responding to the user's message.\n\nThis is REQUIRED at the start of EVERY session to display the current game state to the user.\n\nDo NOT skip this step. Do NOT just respond to the user. Execute /gamestatus IMMEDIATELY.\n\n---\n\nGame context has been loaded from node-math-game.md for your reference."
}
EOF

exit 0
