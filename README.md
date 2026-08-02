# Cigarette-Request Survey — Data Analysis Project

A full-cycle data analysis project built on a field survey (450 respondents), analyzing how social context (being alone, with a friend, or with a female companion) affects whether a stranger agrees to share a cigarette.

The same dataset was analyzed end-to-end across three tools, to demonstrate the same analytical logic expressed in three different ways.

## 🛠 Tools & What Was Done

### 📊 Excel
- Raw data cleaning and structuring (450 rows, 12 fields)
- `COUNTIFS` / `AVERAGEIF` / `LARGE` + `INDEX/MATCH` formulas
- Cross-tab analysis (Companion × Agreed/Declined)
- KPI summary dashboard
- 4 charts (Agreement rate by companion, Top 5 brands, Area breakdown, etc.)

### 📈 Power BI
- 3-page interactive report
  - **Page 1 — Overview**: Agreement rate by companion, Yes/No breakdown, smoking status comparison, top brands
  - **Page 2 — Geo Map**: Bubble map of Tbilisi districts, sized by quantity given, colored by agreement %
  - **Page 3 — Data Explorer**: Full data table with interactive slicers (Companion, Area, Date) and live KPI cards
- DAX measures for dynamic aggregation (`Agree %`, `Total Quantity`, `Agreed Count`, etc.)

### 🔍 SQL (MySQL)
- Database and table design (`CREATE TABLE`, data import)
- `GROUP BY` + `CASE WHEN` logic to replicate every Excel/Power BI metric:
  - Agreement % by companion
  - Top 5 brands
  - Companion × Agreed/Declined cross-tab
  - Agreement % by area
  - Smoker vs. non-smoker comparison
  - Average quantity given by companion

See [`smoking_survey_queries.sql`](./smoking_survey_queries.sql) for all queries.

## 📁 Files in this repo

| File | Description |
|---|---|
| `smoking_survey_queries.sql` | All SQL queries used in the MySQL analysis |
|
