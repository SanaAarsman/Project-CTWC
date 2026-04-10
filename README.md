*Latest update: 10.04.2026*

# Project-CTWC

## Project overview
This project analyses the Classic Tetris World Championship (CTWC) to understand how the competition evolved over time, what may have driven the rise in performance, and whether that competitive growth was also reflected in Twitch audience trends.

The project combines competition data and Twitch stream data to compare changes in player performance, tournament structure, playstyles, and online viewership across years.

## Project objective
The main goal of this project is to answer two connected questions:

- How did CTWC grow and change as a competition over time?
- Was that competitive growth matched by similar growth in its online audience?

To answer this, the project focuses on:
- tournament structure changes across years
- playstyle evolution (`DAS`, `Tap`, `Roll`)
- performance trends over time
- relationships between score, total lines, and playstyle
- Twitch audience trends alongside competition trends

## Key insights
- CTWC performance increased strongly over time, but this was not a simple year-to-year improvement story
- Changes in tournament structure affected how some years should be interpreted and compared
- The pandemic years introduced major format changes, making direct comparison with earlier in-person years less straightforward
- Playstyle shifts were closely linked to the rise in performance
- Competition growth was clear, but audience growth was less consistent and less straightforward than the competitive side

## Why this project matters
CTWC is not only a tournament. It is also a long-term record of how a game, a competitive scene, and player skill ceilings evolved over time.

This project turns that history into a structured, evidence-based story using data cleaning, SQL modelling, and visual analysis.

## Tools used
- Python
- Jupyter Notebook
- Pandas
- MySQL
- Tableau Public

## Data overview
This project uses a mix of competition and Twitch-related source data.

Main source areas:
- CTWC match and year-level competition data
- player and country reference data
- TwitchTracker stream-level data for CTWC-related broadcasts

The final processed data is organised into:
- cleaned CSV files for SQL input
- SQL-generated view exports for Tableau Public

## Repository structure
    Project-CTWC/
    ├── data/
    │   ├── raw/                        # Original source files
    │   └── processed/
    │       ├── csv_files/              # Cleaned SQL-ready input files
    │       └── sql_views/              # Exported SQL views used in Tableau Public
    ├── images/                         # Project and presentation images
    ├── notebooks/                      # Cleaning, review, integration, and prep notebooks
    ├── sql/
    │   ├── database_model/             # ERD / database model file
    │   ├── 01_ctwc_import_and_setup.sql
    │   ├── 02_ctwc_validation.sql
    │   ├── 03_ctwc_views.sql
    │   └── 04_ctwc_export_for_tableau_public.sql
    ├── tableau/
    │   └── ctwc_project_class_presentation.twbx
    └── README.md

## Workflow
The project workflow followed these main steps:

1. Review and assess the available source datasets
2. Clean and prepare useful sheets in Python
3. Standardise files for SQL input
4. Import cleaned data into MySQL
5. Validate table quality and joins
6. Build analysis-layer SQL views
7. Export Tableau-ready view files
8. Create the final visual analysis in Tableau Public

## SQL pipeline
The SQL workflow is split into four main files:

- `01_ctwc_import_and_setup.sql` → loads the cleaned CSV files into MySQL
- `02_ctwc_validation.sql` → checks row counts, duplicates, nulls, and join quality
- `03_ctwc_views.sql` → builds the main analytical views
- `04_ctwc_export_for_tableau_public.sql` → exports the final views for Tableau Public

## Important data note
`views_gained` is available through 2021 and missing from 2022 onward in the TwitchTracker stream dataset.

Because of that, it should not be used for full-period comparison across all years.

## Outputs
- Tableau Public dashboard/story: **[add Tableau Public link here]**
- Presentation text/script: **[add presentation text link here]**

## Final note
This repository is structured to show the full project pipeline, from cleaned source data and SQL preparation to final analytical views and Tableau-based presentation outputs.
