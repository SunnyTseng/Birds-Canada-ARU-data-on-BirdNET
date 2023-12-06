ARU data processing on BirdNET for Birds Canada
================
Sunny Tseng
2023-12-06

## Introduction

## About

## Workflow

## BirdNET settings

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
| year            | the year of detection                                                                                                    |
| month           | the month of detection                                                                                                   |
| day             | the day of detection                                                                                                     |
| hour            | the hour of detection                                                                                                    |
| start           | within a specific recording, where is the start time of the detection                                                    |
| end             | within a specific recording, where is the end time of the detection                                                      |
| scientific_name | scientific name of the detected species                                                                                  |
| common_name     | common name of the detected species                                                                                      |
| confidence      | confidence value for the detection provided by BirdNET. Higher confidence corresponded to higher probability of presence |
| file_path       | file path of the original recording file                                                                                 |
| note            | extra comments or notes                                                                                                  |

## Processing schedule

| Site              | Location | ARU ID | Type   | Date   | Time              | Output final csv | Computer for analysis |
|-------------------|----------|--------|--------|--------|-------------------|------------------|-----------------------|
| Axe Lake          | 1        | 9126   | BAR-LT | Dec.04 | 17:10 - 20:46     |                  | Asus Zen book         |
| Axe Lake          | 2        | 7859   | Mini   | Dec.04 | 21:20 - 22:30     |                  | Asus Zen book         |
| Baptiste Meadow   | 1        | 9742   | BAR-LT | Dec.06 | 10:19 - 12:32     |                  | UBC desktop           |
| Baptiste Meadow   | 2        | 9441   | BAR-LT | Dec.04 | 22:40 - 9:00 (+1) |                  | Asus Zen book         |
| Big Creek Control | 1        | 9089   | BAR-LT | Dec.06 | 13:08 - 14:46     |                  | UBC desktop           |
| Big Creek Control | 2        |        |        |        |                   |                  |                       |
| Burnson Lake      | 1        | 7915   | Mini   | Dec.06 | 14:58 -           |                  | UBC desktop           |
| Burnson Lake      | 2        | 9214   | BAR-LT | Dec.06 |                   |                  | UBC desktop           |
