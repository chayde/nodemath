#!/bin/bash

# Node Math Game - Session Welcome Script
# Reads current game state and provides context for the session
# Outputs to stderr so it displays to user (stdout goes to Claude's context)

GAME_FILE="/home/mark/nodemath/node-math-game.md"

if [ ! -f "$GAME_FILE" ]; then
    >&2 echo "⚠️  Warning: node-math-game.md not found"
    exit 0
fi

# All output goes to stderr (>&2) to display directly to user
{
    echo "═══════════════════════════════════════════════════════════════"
    echo "📊 NODE MATH GAME - Current Status"
    echo "═══════════════════════════════════════════════════════════════"
    echo ""

    # Extract available operators
    echo "🔧 Available Operators:"
    sed -n '/### Available Operators/,/### Available Numbers/p' "$GAME_FILE" | grep '^-' | sed 's/^/  /'
    echo ""

    # Extract available numbers
    echo "🔢 Available Numbers:"
    POSITIVE=$(grep -A 1 "^- Positive:" "$GAME_FILE" | tail -1 | sed 's/^- Positive: //')
    NEGATIVE=$(grep -A 1 "^- Negative:" "$GAME_FILE" | tail -1 | sed 's/^- Negative: //')
    echo "  Positive: $POSITIVE"
    echo "  Negative: $NEGATIVE"
    echo ""

    # Count islands
    ISLAND_COUNT=$(grep -c "^#### Island" "$GAME_FILE")
    echo "🏝️  Islands Unlocked: $ISLAND_COUNT"
    echo ""

    # Count solved problems
    SOLVED_COUNT=$(grep -c "^|" "$GAME_FILE" | awk '{print $1-2}')  # Subtract header rows
    echo "✅ Solved Problems: $SOLVED_COUNT targets confirmed"
    echo ""

    # Show proposed solutions awaiting testing
    echo "🧪 PROPOSED SOLUTIONS (Ready for Testing):"
    echo "───────────────────────────────────────────────────────────────"
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
                echo "$line"
            fi
        fi
    done < "$GAME_FILE"
    echo ""

    echo "═══════════════════════════════════════════════════════════════"
    echo "💡 NEXT STEPS:"
    echo "───────────────────────────────────────────────────────────────"
    echo "  • Test proposed solutions above in the game"
    echo "  • Provide new target numbers to solve"
    echo "  • Report unlocked operators, numbers, or islands"
    echo "═══════════════════════════════════════════════════════════════"
    echo ""
} >&2

exit 0
