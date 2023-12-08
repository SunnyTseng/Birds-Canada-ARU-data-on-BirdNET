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

<table style="width:96%;">
<colgroup>
<col style="width: 12%" />
<col style="width: 6%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 12%" />
<col style="width: 31%" />
<col style="width: 15%" />
</colgroup>
<thead>
<tr class="header">
<th>Site</th>
<th>Location</th>
<th>ARU ID</th>
<th>Type</th>
<th>Date</th>
<th>Time</th>
<th>Output final csv</th>
<th>Computer for analysis</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Axe Lake</td>
<td>1</td>
<td>9126</td>
<td>BAR-LT</td>
<td>Dec.04</td>
<td>17:10 - 20:46</td>
<td><a href="./data/cleaned/AxeLake_1_9126_BARLT.csv">file</a></td>
<td>Asus Zen book</td>
</tr>
<tr class="even">
<td>Axe Lake</td>
<td>2</td>
<td>7859</td>
<td>Mini</td>
<td>Dec.04</td>
<td>21:20 - 22:30</td>
<td></td>
<td>Asus Zen book</td>
</tr>
<tr class="odd">
<td>Baptiste Meadow</td>
<td>1</td>
<td>9742</td>
<td>BAR-LT</td>
<td>Dec.06</td>
<td>10:19 - 12:32</td>
<td></td>
<td>UBC desktop</td>
</tr>
<tr class="even">
<td>Baptiste Meadow</td>
<td>2</td>
<td>9441</td>
<td>BAR-LT</td>
<td>Dec.04</td>
<td>22:40 - 9:00 (+1)</td>
<td></td>
<td>Asus Zen book</td>
</tr>
<tr class="odd">
<td>Big Creek Control</td>
<td>1</td>
<td>9089</td>
<td>BAR-LT</td>
<td>Dec.06</td>
<td>13:08 - 14:46</td>
<td></td>
<td>UBC desktop</td>
</tr>
<tr class="even">
<td>Big Creek Control</td>
<td>2</td>
<td>9515</td>
<td>BAR-LT</td>
<td>Dec.08</td>
<td><p>10:20 -</p>
<p>11:52</p></td>
<td></td>
<td>UBC desktop</td>
</tr>
<tr class="odd">
<td>Burnson Lake</td>
<td>1</td>
<td>7915</td>
<td>Mini</td>
<td>Dec.06</td>
<td>14:58 - 16:20</td>
<td></td>
<td>UBC desktop</td>
</tr>
<tr class="even">
<td>Burnson Lake</td>
<td>2</td>
<td>9214</td>
<td>BAR-LT</td>
<td>Dec.06</td>
<td>16:20 - 18:10</td>
<td></td>
<td>UBC desktop</td>
</tr>
</tbody>
</table>
