# Node Math Game

## Overview
Node Math is a Steam game where you create equations to hit target numbers using specific operators and numbers. The goal is to use the fewest numbers and operators possible.

## Current Constraints

### Available Operators
- Addition (+)
- Multiplication (×)

### Available Numbers
- Positive: 1, 2, 3, 4, 5, 6, 7, 8
- Negative: -1, -2, -3, -4, -5

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

| Target | Solution | Numbers Used | Notes |
|--------|----------|--------------|-------|
| 76 | ((2×6)×6)+4 | 5 | Regular operators only |
| 148 | ((6×6)×4) → [Island 2: +4] | 3 + 1 island node | Single island node |
| 166 | ((6×4)+3) → [Island 2: ×6] → [Island 2: +4] | 3 + 2 Island 2 | Chaining Island 2 |
| 196 | ((6×4)+4) → [Island 1: ×(-1)] → [Island 1: ×(-7)] | 3 + 2 Island 1 | Chaining Island 1 |
| 161 | (7×7×3)+(7×2) | 5 | Regular operators only |
| 146 | ((5×5)×6) → [Island 3: -4] | 3 + 1 Island 3 | Single island node |
| -128 | (6×7) → [Island 3: ×(-3)] → [Island 3: -2] | 2 + 2 Island 3 | Chaining Island 3 |
| 189 | 3×3×3×7 | 4 | Regular operators only |
| 156 | (2×6)×(6+7) | 4 | Regular operators only |
| 159 | ((7×7)+4) → [Island 4: ×3] | 3 + 1 Island 4 | Single island node |
| 184 | (6×6) → [Island 2: ×5] → [Island 2: +4] | 2 + 2 Island 2 | Chaining Island 2 |
| 171 | (6×7×4)+3 | 4 | Regular operators only |
| 140 | 4×5×7 | 3 | Regular operators only |

## Proposed WIP Solutions

This section contains solutions that have been calculated but not yet tested in the game. Once confirmed, they will be moved to the "Solved Problems" table above.

| Target | Proposed Solution | Numbers Used | Notes |
|--------|-------------------|--------------|-------|
| 167 | (6×7×4) → [Island 3: -1] | 3 + 1 Island 3 | Alternative: (7×7×3)+(4×5) = 5 regular |
| -168 | -3×7×8 | 3 | Alternatives: (8×3) → [Island 1: ×(-7)] or (8×7) → [Island 3: ×(-3)] |
| 143 | (6×6×4) → [Island 3: -1] | 3 + 1 Island 3 | Alternatives: (4×5×7)+3 = 4 regular, (7×7×3) → [Island 3: -4] |

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

When a new target number needs to be solved:

1. **Launch an agent** using the Task tool
2. **Instruct the agent to:**
   - Read `/home/mark/nodemath/node-math-game.md` to understand game constraints
   - Analyze the target number provided
   - Find the most efficient solution using:
     - Regular numbers/operators only, OR
     - Regular numbers/operators + nodes from a SINGLE island (can chain multiple nodes from that island)
   - Return the solution with breakdown and node count
3. **Share the agent's solution** with the user for testing in the game
4. **Update this file** with confirmed working solutions

This approach ensures consistent problem-solving across sessions and leverages the agent's ability to explore multiple solution paths efficiently.

## Updates
- Add new operators here as they become available in the game
- Add new numbers as they unlock
- Add new islands and their nodes as they are unlocked
- Document solved problems in the table above
