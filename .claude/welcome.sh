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

exit 0
