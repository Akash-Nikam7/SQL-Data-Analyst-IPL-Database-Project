# SQL-Data-Analyst-IPL-Database-Project
# IPL Analysis SQL Case Study (2019-2024)

## 📋 Overview

This repository contains a comprehensive SQL case study analyzing **Indian Premier League (IPL)** data from **2019 to 2024**. Using this dataset, we explore key cricket insights, player performances, team statistics, and trends over six seasons. The case study serves as a practical demonstration of SQL skills applied to a real-world dataset.

---

## 🏏 Objectives

- Perform detailed analysis of IPL matches and player performances.
- Gain insights into team strategies and match outcomes.
- Analyze player contributions using advanced SQL techniques.
- Develop a structured and efficient data analysis workflow.

---

## 🗂️ Dataset Description

The dataset includes three primary tables:

### 1. **matches**
   - Contains match-level details.
   - **Columns:**
     - `id`: Unique match identifier.
     - `city`, `venue`: Match location details.
     - `Season`, `date`: Season and date of the match.
     - `team1`, `team2`: Competing teams.
     - `toss_winner`, `toss_decision`: Toss outcomes.
     - `winner`, `result`, `result_margin`: Match results.
     - `player_of_match`: Player awarded the "Man of the Match."
     - `super_over`: Whether a super over occurred.

### 2. **deliveries**
   - Ball-by-ball data of each match.
   - **Columns:**
     - `match_id`, `inning`: Match and inning identifiers.
     - `batting_team`, `bowling_team`: Teams involved.
     - `over`, `ball`: Over and ball numbers.
     - `batter`, `non_striker`, `bowler`: Player information.
     - `batsman_runs`, `extra_runs`, `total_runs`: Run details.
     - `is_wicket`, `player_dismissed`, `dismissal_kind`, `fielder`: Wicket details.

### 3. **match_winners**
   - Summary of final match results.
   - **Columns:**
     - `Year`, `Winner`, `Runner Up`: Season results.
     - `Final Match Venue`, `Captain`: Match and team details.
     - `Teams`: Total participating teams.
     - `Player of the Series`, `Man of the Match`: Awards.

---

## 💡 Key Insights and Queries

### Easy Queries:
- List all matches played in Mumbai.
- Count the number of matches won by each team across all seasons.
- Find the total runs scored by a specific player (e.g., Virat Kohli).

### Medium Queries:
- Identify the player with the most "Man of the Match" awards.
- Calculate the highest team total in each season.
- Find the match with the highest margin of victory in terms of runs.

### Hard Queries:
- Find the player with the highest strike rate who has faced more than 200 balls.
- Calculate the economy rate of each bowler across all matches.
- Identify the match with the most wickets taken by a single bowler.

---

## 🚀 Features and Highlights

- **Comprehensive Analysis:** Covers team, player, and season-level insights.
- **Advanced SQL Techniques:**
  - Subqueries and Common Table Expressions (CTEs).
  - Window functions for ranking and running totals.
  - Data aggregation and filtering using `HAVING` and `GROUP BY`.
- **Trend Analysis:** Identifies seasonal patterns in team performance and player contributions.

---

## 📖 Prerequisites

- MySQL Workbench or any SQL-based database client.
- Basic understanding of SQL syntax and relational databases.

---

## 🛠️ How to Use

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/username/IPL-SQL-Analysis.git
   cd IPL-SQL-Analysis
   ```
2. **Set Up the Database:**
   - Import the provided `.sql` file into your database client.
   - Ensure all tables (`matches`, `deliveries`, `match_winners`) are properly loaded.

3. **Run the Queries:**
   - Open the provided SQL scripts in your database client.
   - Execute the queries and explore the insights.

---

## 👨‍💻 Author

**Akash Nikam**  
[LinkedIn](https://www.linkedin.com/in/akash-nikam)
[Gmail](akashnikam803@gmail.com) 

For any queries or collaborations, feel free to reach out!

---


