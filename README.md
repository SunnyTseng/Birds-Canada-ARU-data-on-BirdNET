ARU data processing on BirdNET for Birds Canada
================
Sunny Tseng

## Introduction

The ARU data was collected by Birds Canada during 2023 breeding season
in the area of Chilcotin, Cariboo, BC, Canada. A total of 21 sites were
set up, with each site having 2 ARU locations. The goal of this
repository is to analyzing all the ARU recordings that collected from
this project through BirdNET, and provide detection information for each
of the ARU.

## Workflow

*This session is still under developing*

1.  Data organization
2.  Data exploration
3.  Processing data through BirdNET GUI
4.  Data wrangling and cleaning
5.  Final summarizing

## BirdNET Analyzer GUI settings

All the analysis will be done on [BirdNET
Analyzer](https://github.com/kahst/BirdNET-Analyzer) GUI on Windows. The
model version that used in the GUI is
*BirdNET_GLOBAL_6K_V2.4_Model_FP32.tfile*.

- Species by location tab
  - latitude: 51 or 52, base on site location
  - longitude: -121 or -122, base on site location
  - week: 24, mid June
- Inference settings
  - Minimum confidence: 0.5 (default)
  - Sensitivity: 1 (default)
  - Overlap: 0 (default)
- Other settings
  - Result type: R
  - Batch size: 4
  - Threads: 4

## Output format

- One excel file will be produced for each site, each ARU, with the
  following naming rule: `site_location_aruid_type.csv`

- Each row of the data frame represents single BirdNET detection

- Columns of the data set are explained below:

| Column name     | Description                                                                                                              |
|-----------------|--------------------------------------------------------------------------------------------------------------------------|
| site            | the site name of ARU employment, one of the 21 sites                                                                     |
| location        | value being 1 or 2. The first or the second location of ARU within each site                                             |
| aru_id          | a 4 digits number. Unique ID of each ARU unit                                                                            |
| type            | “Mini” or “BAR-LT”                                                                                                       |
| date            | the date of detection, with the format yyyymmdd                                                                          |
| hour            | the hour of detection                                                                                                    |
| start           | within a specific recording, where is the start time of the detection                                                    |
| end             | within a specific recording, where is the end time of the detection                                                      |
| scientific_name | scientific name of the detected species                                                                                  |
| common_name     | common name of the detected species                                                                                      |
| confidence      | confidence value for the detection provided by BirdNET. Higher confidence corresponded to higher probability of presence |
| filepath        | file path of the original recording file                                                                                 |

## Processing schedule

| Site              | Location | ARU ID | Type   | Date   | Time              | Output final csv                                | Computer for analysis |
|-------------------|----------|--------|--------|--------|-------------------|-------------------------------------------------|-----------------------|
| Axe Lake          | 1        | 9126   | BAR-LT | Dec.04 | 17:10 - 20:46     | [file](./data/cleaned/AxeLake_1_9126_BARLT.csv) | Asus Zen book         |
| Axe Lake          | 2        | 7859   | Mini   | Dec.04 | 21:20 - 22:30     |                                                 | Asus Zen book         |
| Baptiste Meadow   | 1        | 9742   | BAR-LT | Dec.06 | 10:19 - 12:32     |                                                 | UBC desktop           |
| Baptiste Meadow   | 2        | 9441   | BAR-LT | Dec.04 | 22:40 - 9:00 (+1) |                                                 | Asus Zen book         |
| Big Creek Control | 1        | 9089   | BAR-LT | Dec.06 | 13:08 - 14:46     |                                                 | UBC desktop           |
| Big Creek Control | 2        | 9515   | BAR-LT | Dec.08 | 10:20 -           |                                                 | UBC desktop           |
| Burnson Lake      | 1        | 7915   | Mini   | Dec.06 | 14:58 - 16:20     |                                                 | UBC desktop           |
| Burnson Lake      | 2        | 9214   | BAR-LT | Dec.06 | 16:20 - 18:10     |                                                 | UBC desktop           |
