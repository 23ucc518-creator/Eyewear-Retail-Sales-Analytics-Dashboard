# 📊 Lenskart India Sales Performance Dashboard — Power BI

## Overview

An interactive Power BI dashboard summarizing Lenskart's India sales performance across payment modes, store types, product categories, states, and time — built on top of the same `orders_normalized` dataset used in the SQL and Python analysis.

**Filters:** Quarter (Qtr 1–4) and a category slicer, allowing the whole dashboard to be sliced by time period or category.

## Dashboard Preview


<img width="700" height="400" alt="Screenshot 2026-08-08 154507" src="https://github.com/user-attachments/assets/f3a7dd86-5335-4658-9eef-112a1218ca62" />


## What Each Visual Shows

| Visual | What it shows |
|---|---|
| **Payment Mode** (donut) | Split of net sales by payment method — Cash (21%), UPI (20%), Credit Card (20%), Debit Card (19%), Net Banking (19%) |
| **Net Sales by Store Type** (donut) | Online Only dominates at 62% of net sales; the remaining 38% is split fairly evenly across Standalone (13%), High Street (13%), and Mall stores (12%) |
| **Net Sales by Year** (line) | Revenue dipped in 2023 before recovering through 2024 and 2025 |
| **Net Sales by Product Category** (bar) | Sunglasses is the top-selling category, ahead of Eyeglasses, Contact Lenses, and Computer Glasses |
| **Net Sales per State** (bar) | Maharashtra leads, followed by a cluster of mid-tier states (Odisha, Kerala, Madhya Pradesh, Rajasthan, Uttar Pradesh); Bihar and Chandigarh have the smallest current sales base |

## Key Insights

- **Payment mode is evenly distributed** — no single method dominates, so there's no urgent need to push customers toward a "preferred" payment channel.
- **Online Only is the dominant store type at 62% of sales** — consistent with the SQL/Python findings that online drives the highest order volume.
- **Sunglasses is the top revenue category** on the dashboard — worth cross-checking against the SQL state-level finding that Contact Lenses/Sunglasses trade the top spot depending on region.
- **Maharashtra is the clear top state by current sales**, but Bihar and Chandigarh — despite having the smallest current base — were flagged as the fastest-growing states in the Python analysis, making them ones to watch rather than write off.
- **The 2023 dip and recovery** visible in the yearly trend line matches the SQL yearly-growth analysis (Q7), giving the same story in visual form.

## File
- `Lenskart_Sales_Dashboard.pbix` — the Power BI file (open in Power BI Desktop to interact with filters)

