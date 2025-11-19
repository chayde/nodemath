# GEMINI.md

This file provides guidance to Gemini when working with code in this repository.

## Session Startup Behavior

At the beginning of each session, review `node-math-game.md` to load the full game state.

## Repository Purpose

This repository contains documentation for solving "Node Math" - a Steam puzzle game where players create mathematical equations to reach target numbers using specific operators, numbers, and special island nodes.

## Key Documentation

The primary file is `node-math-game.md` which contains:
- Available operators (currently: +, ×)
- Available numbers (positive: 1-10, negative: -1 to -7)
- Four islands with special nodes (multipliers, adders, subtractors)
- Game rules and constraints
- Solved problems table
- Strategy tips

## Working with Target Numbers

When the user provides a new target number to solve:

1. **Read the constraints**: Always start by reading `node-math-game.md` to understand current game state (available operators, numbers, and islands)

2. **Island routing constraint**: This is critical - using multiple nodes from different islands is very difficult. Solutions should either:
   - Use regular numbers/operators only, OR
   - Use regular numbers/operators + nodes from ONE island only (can chain multiple nodes from the same island)

3. **Solution approach**:
   - Find the most efficient solution (fewest total nodes)
   - Consider both regular-only solutions and single-island solutions
   - **CRITICAL: Throughput optimization** - When multiple solutions have the same total node count, ALWAYS prefer the solution with fewer regular numbers and more island nodes, as this provides significantly better game throughput/performance
     - Example: 2 regular + 2 island (4 total) > 4 regular (4 total)
     - Island routing reduces computational load and increases throughput
   - Each island node can only be used once per equation
   - Standard order of operations applies

4. **Solution format**: Present solutions as:
   - The equation (e.g., `((6×6)×4) → [Island 2: +4]`)
   - Breakdown showing calculation steps
   - Total node count (regular numbers + island nodes)

5. **Update documentation**: After the user confirms a solution works in the game, update the "Solved Problems" table in `node-math-game.md`

## Solving Target Numbers

When provided with target numbers, process them in parallel for maximum efficiency.

**For multiple targets:** Process each target concurrently.
**For a single target:** Process the single target.

Each process should:
- Read the game constraints from `node-math-game.md`
- Analyze the specific target number assigned to it
- Find the most efficient solution respecting the single-island routing constraint
- **Prioritize throughput:** When solutions have equal total node count, prefer the one with fewer regular numbers and more island nodes (significantly better game performance)
- Return solution with breakdown and node count

Example: If the user provides "284, 220, -205", you should work on solving for 284, 220, and -205 in parallel.

## Version Management

### Current Version Tracking
The current version is tracked at the top of `node-math-game.md` in the format `**Current Version: vX.Y**`. Always check this before solving targets.

### Versioning Format: Two-Part Semantic Versioning (MAJOR.MINOR)

**MAJOR version (vX.0 → v(X+1).0):** Increment when:
- New **operators** unlocked (e.g., subtraction, division)
- Fundamental changes that enable entirely new solving strategies
- Changes that make re-evaluating ALL old solutions potentially worthwhile

**MINOR version (vX.Y → vX.(Y+1)):** Increment when:
- New **numbers** unlocked (extends possibilities)
- New **islands** unlocked (adds new capabilities)
- AI strategy improvements or documentation updates
- Changes that might improve some solutions but don't fundamentally change strategies

### Version History Format
When incrementing version, add entry to Version History at top of `node-math-game.md`:
```
**Version History:**
- **v1.1** (YYYY-MM-DD): Numbers 9 and -8 unlocked
- **v1.0** (2025-11-03): Initial version - Operators: +, ×; Numbers: 1-8, -1 to -7; Islands: 1-4
```

### Solution Version Checking Workflow

When the user provides target numbers:

**Step 1: Check current version**
- Read the current version from top of `node-math-game.md`

**Step 2: Check for existing solutions**
- Search Solved Problems table for each target
- Compare solution version with current version

**Step 3: Determine action for each target**

**If target has NO solution:**
- Work to solve it.
- Add solution(s) with current version.

**If solution version MATCHES current version (e.g., both v1.0):**
- Use existing solution as-is.
- Report to user: "Target X already solved in current version (vX.Y): [solution]"
- Do NOT re-solve.

**If solution version is DIFFERENT - Apply re-evaluation rules:**

**MAJOR version difference (e.g., solution is v1.x, current is v2.x):**
- Report to user: "Target X has a v1.x solution, re-evaluating with v2.x constraints..."
- Find new solution with current constraints.
- Compare old vs new solution efficiency:
  - If new solution is better: Update table with new solution and current version.
  - If old solution is still optimal: Update version field to current version (no solution change).
- Report findings to user.

**MINOR version difference within same MAJOR (e.g., solution is v1.0, current is v1.2):**
- Check if solution could benefit from new features:
  - If solution uses 4+ total nodes: Worth re-evaluating (new numbers/islands might optimize).
  - If solution uses ≤3 total nodes: Likely optimal, update version to current without re-solving.
- Report to user what action was taken.

**Multiple targets with mixed versions:**
- Process all targets that need solving/re-evaluation in parallel.
- Report existing solutions that don't need changes.

### Updating Solutions After Re-evaluation
When a solution is re-evaluated:
1. If new solution is more efficient: Replace entire row with new solution and current version.
2. If old solution is still optimal: Update only the Version column to current version.
3. Always commit changes to git.

## File Updates and Version Control

This repository is version-controlled with Git and synced to GitHub at: https://github.com/chayde/nodemath

**IMPORTANT: Commit and push ALL changes to GitHub automatically.**

Whenever you make changes to any file in this repository, you MUST:
1. Stage the changes with `git add .`
2. Create a descriptive commit with `git commit -m "message"`
3. Push to GitHub with `git push`

### Common scenarios requiring commits:

**Game progression updates:**
- New operators unlocked → Update `node-math-game.md` and commit
- New numbers unlocked → Update `node-math-game.md` and commit
- New islands unlocked → Update `node-math-game.md` and commit
- New island nodes discovered → Update `node-math-game.md` and commit

**Solution updates:**
- User confirms a solution works → Add to solved problems table and commit
- Multiple solutions confirmed → Add all to table and commit once

**Documentation updates:**
- Changes to GEMINI.md → Commit
- Changes to game rules or strategy → Commit

### Commit message format:
Use descriptive messages that explain what changed:
- "Add number 8 to available numbers"
- "Add Island 5 with new nodes"
- "Add confirmed solutions for targets 184, 171, 140"
- "Update strategy tips for new operators"

Always include the standard footer:
```
🤖 Generated with Gemini
```

This ensures the user can access the latest game state from any computer and maintains a history of progression through the game.
