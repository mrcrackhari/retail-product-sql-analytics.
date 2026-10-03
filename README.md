# Retail Product & Supply Chain Analytics (MySQL)

An end-to-end SQL data analytics project focused on inventory turnover, revenue-at-risk estimation, product affinity (Market Basket Analysis), and revenue classification using MySQL 8.0.

---

## 📌 Business Overview

Unoptimized inventory and poor product bundling can lead to stockout revenue losses and inefficient warehouse space allocation. This project models a retail transaction system to solve three key operational challenges:
1. **Stockout Risk Management:** Identifying SKUs falling below reorder thresholds and calculating prospective revenue loss.
2. **Cross-Selling Opportunities:** Analyzing co-purchase patterns via Market Basket Analysis to optimize product bundling.
3. **Inventory Prioritization:** Categorizing products using Pareto's 80/20 Rule (ABC Analysis) to prioritize high-value stock.

---

## 🛠️ Data Architecture & Schema

The relational model consists of three core entities: `products`, `inventory`, and `sales`.