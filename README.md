*Latest update: 28.03.2026*

# Project-CTWC

## Project overview
This project analyzes the Classic Tetris World Championship (CTWC) to understand how the competition has changed over time.

The main goal is to show the growth and evolution of the game through:
- tournament structure changes across years
- playstyle evolution (`DAS`, `Tap`, `Roll`)
- performance trends over time
- relationships between score, total lines, and playstyle
- broader competitive growth, with viewership/context data added where useful

## Current focus
The project is currently centered on the historical CTWC match dataset.

The analysis is focused on:
- identifying which trends are real competitive changes
- separating gameplay evolution from format effects
- understanding how rule and structure changes affect year-to-year comparisons
- building a clean story for final presentation and dashboarding

## Current status
So far, I have completed:
- dataset loading and review
- dataset usefulness assessment
- missing-value investigation
- univariate EDA
- core bivariate EDA
- initial interpretation of major year-level patterns
- preparation for SQL/Tableau-ready outputs where needed

## Main findings so far
The clearest finding so far is that CTWC performance cannot be interpreted as a simple year-to-year improvement story.

Several major shifts overlap in the data:
- changes in tournament structure
- changes in competitive depth
- changes in dominant playstyles
- pandemic-related format changes

This means some apparent jumps or drops in performance are not purely player-skill changes. They must be interpreted in the context of how the competition itself changed.

A particularly important point is that the pandemic years introduced major format changes, making direct comparison with earlier in-person years less straightforward.

## Why this project matters
CTWC is not just a record of tournament results. It also reflects how a game, a competitive scene, and player skill ceilings evolved over time.

This project aims to turn that history into a clear, evidence-based story using data analysis and visualization.

## Project structure
- `data/` → raw and prepared project data files
- `notebooks/` → data cleaning, investigation, and analysis notebooks
- `README.md` → project summary and status

## Next steps
- refine the strongest findings into a tighter final project narrative
- prepare final visuals and dashboard views
- integrate Twitch/viewership context where it adds value
- finalize presentation-ready insights and recommendations
- update project documentation as the analysis expands
