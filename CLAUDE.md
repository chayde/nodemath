# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This repository contains documentation for solving "Node Math" - a Steam puzzle game where players create mathematical equations to reach target numbers using specific operators, numbers, and special island nodes.

## Key Documentation

The primary file is `node-math-game.md` which contains:
- Available operators (currently: +, ×)
- Available numbers (positive: 1-6, negative: -1 to -4)
- Three islands with special nodes (multipliers, adders, subtractors)
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
   - Each island node can only be used once per equation
   - Standard order of operations applies

4. **Solution format**: Present solutions as:
   - The equation (e.g., `((6×6)×4) → [Island 2: +4]`)
   - Breakdown showing calculation steps
   - Total node count (regular numbers + island nodes)

5. **Update documentation**: After the user confirms a solution works in the game, update the "Solved Problems" table in `node-math-game.md`

## Using Agents

The documentation suggests using the Task tool to launch agents for solving puzzles. Agents should be instructed to:
- Read the game constraints from `node-math-game.md`
- Analyze the target number
- Find efficient solutions respecting the single-island routing constraint
- Return solution with breakdown and node count

## File Updates

As the user progresses in the game, they may unlock:
- New operators
- New numbers
- New islands with different special nodes

Update `node-math-game.md` accordingly when these unlocks occur.
