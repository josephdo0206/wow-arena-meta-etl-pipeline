# World of Warcraft Competitive Meta Analysis: End-to-End ETL Pipeline

## 📌 Project Overview
This project is an end-to-end data engineering and analytics pipeline designed to identify the optimal Class and Specialization "meta" within the top 1,000 players of the World of Warcraft Season 3 competitive ladder. 

**Interactive Dashboard:** [View on Tableau Public](https://public.tableau.com/app/profile/joseph.do7102/viz/WorldofWarcraftTWWSeason3ArenaMetaAnalysisTop1000/WorldofWarcraftTWWSeason3ArenaMetaAnalysisTop1000)

## 🛠️ Tech Stack
* **Language:** Python (Pandas, Requests)
* **Database:** Google BigQuery (SQL)
* **Visualization:** Tableau
* **API:** Official Blizzard Battle.net API

## 🚀 The Methodology
### 1. API Extraction & Data Cleansing (Python/Pandas)
* Queried the live Battle.net API to extract the top 1,000 player profiles on the 3v3 Arena ladder.
* Utilized **Pandas** to flatten nested JSON responses and structure the data into a relational format.
* Handled inconsistent API responses by applying robust data cleansing techniques, specifically filtering out null values and mapping missing specializations to 'Unknown' to preserve overall dataset integrity.

### 2. Relational Database & Aggregation (SQL/BigQuery)
* Imported the clean CSV into a **Google BigQuery** relational database.
* Executed advanced SQL queries utilizing `GROUP BY` and `HAVING` clauses to isolate elite performance metrics.
* Filtered out statistically insignificant sample sizes (e.g., specs with fewer than 10 players) to prevent outlier manipulation of average win rates.

### 3. Visualization & Business Logic (Tableau)
* Engineered dynamic Calculated Fields within Tableau to generate accurate win-rate percentages.
* Designed an interactive scatter plot and stacked bar chart dashboard to visualize the correlation between class popularity, total wins, and average ladder rating.

## 📊 Key Insights
* **The Popularity vs. Efficiency Gap:** While Demon Hunters had the highest volume of individual specialization representation, they were not the most mathematically efficient.
* **The Meta Winners:** **Frost Mages** and **Assassination Rogues** dominated the elite bracket, maintaining the highest average ratings (2790+) and win rates (>60%) when filtering for statistically significant sample sizes. 
* **Faction Imbalance:** The Alliance drastically outperformed the Horde within the top 1,000 ladder, capturing nearly 75% of the total representation.
