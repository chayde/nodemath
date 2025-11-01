# Node Math - Puzzle Game Documentation

A documentation repository for tracking solutions and strategies for the Steam puzzle game "Node Math", where players create mathematical equations to reach target numbers using specific operators, numbers, and special island nodes.

## Overview

Node Math is a puzzle game that challenges you to build equations using available numbers and operators to hit specific target values. The goal is to use the fewest nodes (numbers + operators + island nodes) possible. This repository tracks game progression, solved puzzles, and strategies.

## Repository Contents

### `node-math-game.md`
The primary game documentation file containing:
- **Available Operators**: Currently `+` (addition) and `×` (multiplication)
- **Available Numbers**: Positive (1-7) and negative (-1 to -5) numbers unlocked so far
- **Special Islands**: Four islands with unique nodes that provide operations like subtraction, sign flipping, and larger multipliers
- **Game Rules**: Core mechanics including order of operations and parentheses usage
- **Solved Problems Table**: Complete history of confirmed working solutions with node counts
- **Strategy Tips**: Approaches for efficiently solving targets
- **Examples**: Detailed walkthroughs of solution approaches

### `CLAUDE.md`
Instructions for Claude Code when working with this repository, including:
- Repository purpose and structure
- Solution methodology and island routing constraints
- Agent usage guidelines for solving new targets
- Git workflow requirements for keeping documentation synced

### Key Game Concepts

**Island Routing Constraint**: The most critical rule - you can use multiple nodes from the SAME island in one equation, but routing between DIFFERENT islands is very difficult. Always prefer solutions using regular numbers/operators OR regular numbers + nodes from a SINGLE island.

**Node Efficiency**: Solutions are measured by total nodes used (regular numbers + island nodes). Fewer nodes = better solution.

## Getting Started

### Clone This Repository

To access this project on another computer:

```bash
git clone https://github.com/chayde/nodemath.git
cd nodemath
```

### Working with the Documentation

1. **View current game state**: Open `node-math-game.md` to see:
   - What numbers and operators are currently unlocked
   - What islands and nodes are available
   - Previously solved targets

2. **Solve new targets**: Use Claude Code to find efficient solutions
   - Claude will read the current constraints
   - Launch agents to explore multiple solution paths
   - Test solutions in the game
   - Confirm which ones work

3. **Update after game progression**: When you unlock new content:
   - New numbers → Update the "Available Numbers" section
   - New operators → Update the "Available Operators" section
   - New islands → Add to the "Special Islands" section
   - Confirmed solutions → Add to the "Solved Problems" table

4. **Sync changes**: All updates are automatically committed and pushed to GitHub by Claude Code

### Pulling Latest Changes

If you've made updates on another computer, pull the latest version:

```bash
cd nodemath
git pull
```

## Current Game State

As of the latest commit:
- **Numbers**: 1, 2, 3, 4, 5, 6, 7, -1, -2, -3, -4, -5
- **Operators**: +, ×
- **Islands**: 4 islands unlocked with various multipliers, adders, and subtractors
- **Solved Targets**: 10+ confirmed solutions documented

## Solution Workflow

1. Identify target number(s) to solve
2. Use Claude Code to analyze and find efficient solutions
3. Test solutions in the game
4. Confirm which solutions work
5. Claude automatically updates documentation and pushes to GitHub
6. Access updated documentation from any computer

## Repository Maintenance

This repository is maintained through Claude Code integration. All file changes are automatically:
- Committed with descriptive messages
- Pushed to GitHub
- Available across all devices

Changes are tracked for:
- Game progression (new unlocks)
- Confirmed solutions
- Strategy updates
- Documentation improvements

## Contributing

This is a personal game progression tracker. The primary workflow involves:
1. Playing Node Math on Steam
2. Using Claude Code to solve targets
3. Automatic documentation of progression

## Links

- **GitHub Repository**: https://github.com/chayde/nodemath
- **Steam Game**: Node Math (search on Steam)

---

Built with [Claude Code](https://claude.com/claude-code)
