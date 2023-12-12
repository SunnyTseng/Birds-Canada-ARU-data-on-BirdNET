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

<table style="width:95%;">
<colgroup>
<col style="width: 19%" />
<col style="width: 10%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 18%" />
<col style="width: 8%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr class="header">
<th>Site</th>
<th>Location</th>
<th>ARU ID</th>
<th>Type</th>
<th>Date</th>
<th>Time</th>
<th>Output</th>
<th>Note</th>
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
<td></td>
<td>3.5 hr</td>
</tr>
<tr class="even">
<td>Axe Lake</td>
<td>2</td>
<td>7859</td>
<td>Mini</td>
<td>Dec.04</td>
<td>21:20 - 22:30</td>
<td></td>
<td>1.5 hr</td>
</tr>
<tr class="odd">
<td>Baptiste Meadow</td>
<td>1</td>
<td>9742</td>
<td>BAR-LT</td>
<td>Dec.06</td>
<td>10:19 - 12:32</td>
<td></td>
<td>2 hr</td>
</tr>
<tr class="even">
<td>Baptiste Meadow</td>
<td>2</td>
<td>9441</td>
<td>BAR-LT</td>
<td>Dec.04</td>
<td>22:40 - 9:00 (+1)</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Big Creek Control</td>
<td>1</td>
<td>9089</td>
<td>BAR-LT</td>
<td>Dec.06</td>
<td>13:08 - 14:46</td>
<td></td>
<td>1.5 hr</td>
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
<td>1.5 hr</td>
</tr>
<tr class="odd">
<td>Burnson Lake</td>
<td>1</td>
<td>7915</td>
<td>Mini</td>
<td>Dec.06</td>
<td>14:58 - 16:20</td>
<td></td>
<td>1.5 hr</td>
</tr>
<tr class="even">
<td>Burnson Lake</td>
<td>2</td>
<td>9214</td>
<td>BAR-LT</td>
<td>Dec.06</td>
<td>16:20 - 18:10</td>
<td></td>
<td>2 hr</td>
</tr>
<tr class="odd">
<td>Chilco Ranch</td>
<td>1</td>
<td>9807</td>
<td>BAR-LT</td>
<td>Dec.08</td>
<td>19:09 - 20:36</td>
<td></td>
<td>Run in batch</td>
</tr>
<tr class="even">
<td>Chilco Ranch</td>
<td>2</td>
<td>9603</td>
<td>BAR-LT</td>
<td>Dec.08</td>
<td>17:41 - 19:08</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Colpitt Lake</td>
<td>1</td>
<td>8792</td>
<td>BAR-LT</td>
<td>Dec.08</td>
<td>21:57 - 23:50</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Colpitt Lake</td>
<td>2</td>
<td>7255</td>
<td>Mini</td>
<td>Dec.08</td>
<td>20:46 - 21:57</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Dog Creek Road</td>
<td>1</td>
<td>9029</td>
<td>BAR-LT</td>
<td>Dec.09</td>
<td>00:34 - 02:35</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Dog Creek Road</td>
<td>2</td>
<td>7245</td>
<td>Mini</td>
<td>Dec.08</td>
<td>11:56 - 00:34 (+1)</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Enterprise Road</td>
<td>NA, put 1</td>
<td>9270</td>
<td>BAR-LT</td>
<td>Dec.09</td>
<td>2:36 - 4:36</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Fiftynine Creek</td>
<td>1</td>
<td>9782</td>
<td>BAR-LT</td>
<td>Dec.09</td>
<td>6:52 - 9:05</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Fiftynine Creek</td>
<td>2</td>
<td>8990</td>
<td>BAR-LT</td>
<td>Dec.09</td>
<td>4:37 - 6:51</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Helena Conservation</td>
<td>1</td>
<td>9235</td>
<td>BAR-LT</td>
<td>Dec.11</td>
<td>14:03 - 16:24</td>
<td></td>
<td>Run in batch</td>
</tr>
<tr class="odd">
<td>Helena Conservation</td>
<td>2</td>
<td>9140</td>
<td>BAR-LT</td>
<td>Dec.11</td>
<td>11:16 - 14:02</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Helena Lake</td>
<td>1</td>
<td>9621</td>
<td>BAR-LT</td>
<td>Dec.11</td>
<td>18:42 - 20:51</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Helena Lake</td>
<td>2</td>
<td>8923</td>
<td>BAR-LT</td>
<td>Dec.11</td>
<td>16:25 - 18:41</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Lilypad Lake</td>
<td>1</td>
<td>8860</td>
<td>BAR-LT</td>
<td>Dec.11</td>
<td>22:18 - 00:20 (+1)</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Lilypad Lake</td>
<td>2</td>
<td>7836</td>
<td>Mini</td>
<td>Dec.11</td>
<td>21:02 - 22:08</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Murphy Lake</td>
<td>1</td>
<td>6663</td>
<td>Mini</td>
<td>Dec.12</td>
<td>00:32 - 1:53</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Murphy Lake</td>
<td>2</td>
<td>7710</td>
<td>Mini</td>
<td>Dec.12</td>
<td>2:04 - 3:25</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Pete Kitchen Lake</td>
<td>1</td>
<td>9058</td>
<td>NA</td>
<td>NA</td>
<td>NA</td>
<td></td>
<td>empty folder</td>
</tr>
<tr class="odd">
<td>Pete Kitchen Lake</td>
<td>2</td>
<td>9205</td>
<td>BAR-LT</td>
<td>Dec.12</td>
<td>3:25 - 5:28</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
