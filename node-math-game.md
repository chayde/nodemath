# Node Math Game

**Current Version: v1.2**

**Version History:**
- **v1.2** (2025-11-03): Number 10 unlocked
- **v1.1** (2025-11-03): Number 9 unlocked
- **v1.0** (2025-11-03): Initial version - Operators: +, ×; Numbers: 1-8, -1 to -7; Islands: 1-4

## Overview
Node Math is a Steam game where you create equations to hit target numbers using specific operators and numbers. The goal is to use the fewest numbers and operators possible.

## Current Constraints

### Available Operators
- Addition (+)
- Multiplication (×)

### Available Numbers
- Positive: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
- Negative: -1, -2, -3, -4, -5, -6, -7

### Special Islands
Islands contain powerful special nodes that can be used in equations. Each node on an island can be used at most once per equation.

#### Island 1
- **×(-7)** - Multiply input by -7
- **-4** - Subtract 4 from input
- **×(-5)** - Multiply input by -5
- **×(-3)** - Multiply input by -3
- **×(-1)** - Multiply input by -1 (sign flip)

#### Island 2
- **+3** - Add 3 to input
- **+4** - Add 4 to input
- **×5** - Multiply input by 5
- **×6** - Multiply input by 6

#### Island 3
- **-1** - Subtract 1 from input
- **-2** - Subtract 2 from input
- **-4** - Subtract 4 from input
- **×(-3)** - Multiply input by -3
- **×(-1)** - Multiply input by -1 (sign flip)

#### Island 4
- **×4** - Multiply input by 4
- **×3** - Multiply input by 3
- **+1** - Add 1 to input
- **+1** - Add 1 to input (second +1 node)
- **+2** - Add 2 to input

**Important Notes:**
- Each island node can only be used once per equation
- **Routing constraint:** Using multiple nodes from the SAME island is usually possible, but routing between DIFFERENT islands is very difficult
- When solving, prefer solutions that use regular numbers/operators with nodes from at most ONE island
- These provide access to operations not available with regular operators (subtraction, larger multipliers, sign changes)
- As new islands are unlocked, they will be added here with their own sets of special nodes

## Game Rules
- Combine the available numbers using the available operators
- Try to use the fewest numbers and operators possible
- Standard order of operations applies (multiplication before addition)
- Use parentheses to control operation order

## Examples

### Target: 76
**Solution:** `((2×6)×6)+4`
- Breakdown: (12×6)+4 = 72+4 = 76
- Numbers used: 5 (2, 6, 6, 4)

### Target: 166
**Solution:** `((6×5)×5)+(4×4)` or `(6×5×5)+(4×4)`
- Breakdown: (30×5)+(16) = 150+16 = 166
- Numbers used: 5 (6, 5, 5, 4, 4)

### Target: 148
**Solution:** `((6×6)×4) → [Island 2: +4]`
- Breakdown: (36×4) = 144, then +4 = 148
- Total nodes: 3 regular numbers + 1 island node
- Demonstrates efficient use of island nodes to reduce regular numbers needed

### Target: 166
**Solution:** `((6×4)+3) → [Island 2: ×6] → [Island 2: +4]`
- Breakdown: (24+3) = 27, then ×6 = 162, then +4 = 166
- Total nodes: 3 regular numbers + 2 nodes from Island 2
- More efficient than 5 regular numbers solution

### Target: 196
**Solution:** `((6×4)+4) → [Island 1: ×(-1)] → [Island 1: ×(-7)]`
- Breakdown: (24+4) = 28, then ×(-1) = -28, then ×(-7) = 196
- Total nodes: 3 regular numbers + 2 nodes from Island 1
- Demonstrates chaining within a single island

## Solved Problems

| Target | Solution | Numbers Used | Version | Notes |
|--------|----------|--------------|---------|-------|
| 76 | ((2×6)×6)+4 | 5 | v1.0 | Regular operators only |
| 136 | (9×5×3) → [Island 4: +1] | 3 + 1 Island 4 | v1.1 | Single island node, uses number 9 |
| 140 | 4×5×7 | 3 | v1.0 | Regular operators only |
| 143 | (6×6×4) → [Island 3: -1] | 3 + 1 Island 3 | v1.0 | Single island node |
| 145 | (6×6×4) → [Island 4: +1] | 3 + 1 Island 4 | v1.0 | Single island node |
| 146 | ((5×5)×6) → [Island 3: -4] | 3 + 1 Island 3 | v1.0 | Single island node |
| 148 | ((6×6)×4) → [Island 2: +4] | 3 + 1 island node | v1.0 | Single island node |
| 156 | (2×6)×(6+7) | 4 | v1.0 | Regular operators only |
| 159 | ((7×7)+4) → [Island 4: ×3] | 3 + 1 Island 4 | v1.0 | Single island node |
| 161 | (8×5×4) → [Island 4: +1] | 3 + 1 Island 4 | v1.0 | Single island node |
| 166 | ((6×4)+3) → [Island 2: ×6] → [Island 2: +4] | 3 + 2 Island 2 | v1.0 | Chaining Island 2 |
| 167 | (6×7×4) → [Island 3: -1] | 3 + 1 Island 3 | v1.0 | Single island node |
| 171 | (6×7×4) → [Island 2: +3] | 3 + 1 Island 2 | v1.1 | Re-evaluated from v1.0, uses island instead |
| 177 | (7×5×5) → [Island 4: +2] | 3 + 1 Island 4 | v1.0 | Single island node |
| 179 | (9×5×4) → [Island 3: -1] | 3 + 1 Island 3 | v1.1 | Single island node, uses number 9 |
| 184 | (6×6) → [Island 2: ×5] → [Island 2: +4] | 2 + 2 Island 2 | v1.0 | Chaining Island 2 |
| 189 | 3×3×3×7 | 4 | v1.0 | Regular operators only |
| 191 | (6×8×4) → [Island 3: -1] | 3 + 1 Island 3 | v1.0 | Single island node |
| 196 | ((6×4)+4) → [Island 1: ×(-1)] → [Island 1: ×(-7)] | 3 + 2 Island 1 | v1.0 | Chaining Island 1 |
| 202 | (5×5×8) → [Island 4: +2] | 3 + 1 Island 4 | v1.0 | Single island node |
| 212 | (6×6×6) → [Island 3: -4] | 3 + 1 Island 3 | v1.0 | Single island node |
| 220 | (7×8×4) → [Island 3: -4] | 3 + 1 Island 3 | v1.0 | Single island node |
| 242 | (6×8×5) → [Island 4: +2] | 3 + 1 Island 4 | v1.0 | Single island node |
| 284 | (6×8×6) → [Island 3: -4] | 3 + 1 Island 3 | v1.0 | Single island node |
| -128 | (6×7) → [Island 3: ×(-3)] → [Island 3: -2] | 2 + 2 Island 3 | v1.0 | Chaining Island 3 |
| -168 | -3×7×8 | 3 | v1.0 | Regular operators only |
| -205 | (-5×7×6)+5 | 4 | v1.0 | Regular operators only |
| -222 | (-7×8×4) → [Island 4: +2] | 3 + 1 Island 4 | v1.0 | Single island node |

## Proposed WIP Solutions

This section contains solutions that have been calculated but not yet tested in the game. Once confirmed, they will be moved to the "Solved Problems" table above.

| Target | Proposed Solution | Numbers Used | Notes |
|--------|-------------------|--------------|-------|

## Strategy Tips
- Look for products that get close to the target
- Consider what remainders can be easily made with addition
- Larger multiplications are generally more efficient
- Keep track of what combinations of numbers can make useful building blocks (e.g., 4×4=16, 5×6=30)
- **With Island Nodes:**
  - **Prefer single-island solutions:** Chain multiple nodes from ONE island rather than mixing islands
  - Large multipliers: ×6 (Island 2), ×5 (Island 2), ×(-7) (Island 1), ×(-5) (Island 1) can create big numbers efficiently
  - Addition nodes: +3 and +4 (Island 2) provide direct addition without using a separate operator
  - Subtraction nodes: -1, -2, -4 (Island 3) and -4 (Island 1) give fine-tuned subtraction
  - Sign flipping: ×(-1) nodes (Islands 1 & 3) can change signs when needed
  - Chaining within same island: e.g., (value) → [Island 1: ×(-5)] → [Island 1: ×(-1)] = multiply by 5
  - Island nodes can significantly reduce the total number of regular numbers needed
  - Each island offers different capabilities - choose the island that best fits your target

## Working with Claude Code Agents

When the user provides target numbers:

1. **Check current version** at the top of this file

2. **Check for existing solutions** in the Solved Problems table
   - Compare each target's solution version (if exists) with current version
   - **Same version**: Report existing solution, skip solving
   - **Different version**: Follow re-evaluation rules (see Version Management in CLAUDE.md)
   - **No solution**: Proceed to solve

3. **Launch agents in parallel** for targets that need solving/re-evaluation
   - **Multiple targets:** Launch one agent per target in a single message for parallel execution
   - **Single target:** Launch one agent
   - Example: For targets "284, 220, -205" → launch 3 agents simultaneously

4. **Instruct each agent to:**
   - Read `/home/mark/nodemath/node-math-game.md` to understand game constraints
   - Analyze its specific target number
   - Find the most efficient solution using:
     - Regular numbers/operators only, OR
     - Regular numbers/operators + nodes from a SINGLE island (can chain multiple nodes from that island)
   - Return the solution with breakdown and node count

5. **Share all agent solutions** with the user for testing in the game

6. **Update this file** with confirmed working solutions
   - Add new solutions with current version
   - Update re-evaluated solutions (either new solution or just version number)
   - Commit all changes to GitHub

This approach maximizes efficiency through parallel execution, avoids redundant solving, and ensures solutions stay optimized across game progression.

## Updates
- Add new operators here as they become available in the game
- Add new numbers as they unlock
- Add new islands and their nodes as they are unlocked
- Document solved problems in the table above
