# Eyewear Retail Sales Analytics Dashboard-(Lenskart)
Uses a publicly available Kaggle dataset modeled on Lenskart's sales and customer data — not proprietary company data.

## 📌 Overview
A data analytics case study using a public eyewear retail dataset (India) modeled on Lenskart-style sales and customer data, exploring growth trends and business opportunities. The project covers schema design, exploratory analysis, statistical validation, and dashboard reporting to simulate real-world decision support around customer acquisition and retention.

## 🎯 Business Problem
Framed as a real-world business scenario: an eyewear retailer wants to understand what's driving (or holding back) customer acquisition and retention, and to surface growth opportunities in its sales data to support decision-making.

## 🗂️ Dataset
- **Source:** [https://www.kaggle.com/datasets/datamonkresearch/lenskart-india-sales-and-customer-analytics-dataset]
- **Tables/Files:** `orders_normalized` (fact table), `customers`, `products`, `locations`
-  spanning 2022–2025

## 🛠️ Tools & Tech Stack
- **SQL** (MySQL Workbench) — data extraction and business-question queries
- **Python** (Pandas, Matplotlib/Seaborn, SciPy, scikit-learn, statsmodels) — EDA, statistical testing, clustering, regression, and forecasting
- **Power BI** — interactive sales performance dashboard

## 🔑 Key Insights
- **Discounting isn't growing basket size, it's eroding margin** — quantity per order stays flat (~2 items) at every discount level, while average order value drops from ₹5,827 (0% discount) to ₹4,385 (25% discount).
- **Growth is real but decelerating** — YoY growth slowed from 3.89% (2024) to 1.43% (2025), with a linear forecast projecting 2026 revenue to nearly flatten.
- **Today's biggest markets aren't tomorrow's fastest-growing ones** — Maharashtra leads in current revenue, but Bihar (+46.3%) and Chandigarh (+38.5%) are growing far faster and warrant more investment.

## 📂 Project Files

- [`table_creation.md`](./ddl_table_creation.sql) — Table creation queries
- [`sql.md`](./sql.md) — All 15 business questions with queries, results, and explanations
- [`Dashboard.md`](./Dashboard.md) — Dashboard results and queries
- [`Lenskart_Sales_Dashboard`](./Lenskart_Sales_Dashboard.pbix) — the Power BI file (open in Power BI Desktop to interact with filters)
- [`screenshots`](./screenshots) — Screenshots of dashboard

## 📁 Repository Structure
```
├── README.md
├── sql/
│   └── sql.md                            # Queries + explanations + answers
├── notebooks/
│   └── Lenskart_Data_Analysis.ipynb       # Python EDA, plots, findings
├── powerbi/                              # if applicable
│   ├── Lenskart_Data_Dashboard.pbix
│   
```

## 📊 Dashboard Preview
<img width="1181" height="663" alt="image" src="https://github.com/user-attachments/assets/62d36f58-053d-4e1a-b433-12d00d75c66a" />



## 👤 Author
Arjav Jain
