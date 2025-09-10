# Pizza Sales SQL Project – Query Outputs

This file contains summarized outputs for each query.

---

## Dataset Exploration

**Q1. How many orders were placed in total?**  
`Total Orders: 21,350`

**Q2. How many unique pizzas are available on the menu?**  
`Available Pizzas: 32`

**Q3. What are the different pizza categories and sizes available?**  
- **Categories:** Chicken, Classic, Supreme, Veggie  
- **Sizes:** S, M, L, XL, XXL  

---

## Order & Sales Trends

**Q4. What is the trend of orders per day/week/month?**  

- **Daily Trend (sample first 5 days):**

| Date       | Total Orders |
|------------|--------------|
| 2015-01-01 | 69           |
| 2015-01-02 | 67           |
| 2015-01-03 | 66           |
| 2015-01-04 | 52           |
| 2015-01-05 | 54           |

- **Weekly Trend (sample first 5 weeks):**

| Week | Total Orders |
|------|--------------|
| 1    | 202          |
| 2    | 427          |
| 3    | 401          |
| 4    | 422          |
| 5    | 393          |

- **Monthly Trend (sample first 5 months):**

| Month    | Month No | Total Orders |
|----------|----------|--------------|
| January  | 1        | 1845         |
| February | 2        | 1685         |
| March    | 3        | 1840         |
| April    | 4        | 1799         |
| May      | 5        | 1853         |

---

**Q5. What days of the week and times of the day is the restaurant the busiest?**  

| Day       | Hour | Total Orders |
|-----------|------|--------------|
| Thursday  | 13   | 438          |
| Thursday  | 12   | 434          |
| Tuesday   | 12   | 421          |
| Wednesday | 12   | 420          |
| Friday    | 12   | 415          |

---

**Q6. How many pizzas are made during peak periods?**  

| Day      | Hour | Total Orders |
|----------|------|--------------|
| Thursday | 12   | 1149         |
| Thursday | 13   | 1131         |
| Monday   | 12   | 1126         |
| Tuesday  | 12   | 1105         |
| Friday   | 12   | 1101         |

---

**Q7. What is the average number of pizzas per order?**  
`Avg Pizzas per Order: 2`

---

## Revenue Analysis

**Q8. What is the total revenue generated?**  
`Total Revenue: 817,860.05`

**Q9. What is the average order value (AOV)?**  
`AOV: 37.56`

**Q10. Which pizza size contributes the most to total revenue?**  

| Size | Total Revenue |
|------|---------------|
| L    | 375,318.7     |

**Q11. Which pizza category generates the highest revenue?**  

| Category | Total Revenue |
|----------|---------------|
| Classic  | 220,053.1     |

**Q12. What is the monthly/quarterly revenue trend?**  

| Month    | Month No | Total Revenue |
|----------|----------|---------------|
| January  | 1        | 69,793.3      |
| February | 2        | 65,159.6      |
| March    | 3        | 70,397.1      |
| April    | 4        | 68,736.8      |
| May      | 5        | 71,402.75     |

---

## Best & Worst Performers

**Q13. What are the top 5 best-selling pizzas by quantity?**  

| Pizza Type ID | Orders |
|---------------|--------|
| classic_dlx   | 2453   |
| bbq_ckn       | 2432   |
| hawaiian      | 2422   |
| pepperoni     | 2418   |
| thai_ckn      | 2371   |

**Q14. Which pizzas generate the highest revenue?**  

| Pizza Type ID | Revenue   |
|---------------|-----------|
| thai_ckn      | 43,434.25 |

**Q15. What are the bottom 5 worst-selling pizzas by quantity?**  

| Pizza Type ID  | Orders |
|----------------|--------|
| brie_carre     | 490    |
| mediterraneo   | 934    |
| calabrese      | 937    |
| spinach_supr   | 950    |
| soppressata    | 961    |

**Q16. Which pizzas are ordered frequently but generate low revenue (popular but cheap)?**  

| Pizza Type ID | Total Pizzas Ordered | Total Orders | Revenue |
|---------------|-----------------------|--------------|---------|
| big_meat      | 1914                  | 1811         | 22,968  |

**Q17. Which pizzas generate very little revenue (least popular + least profitable)?**  

| Pizza Type ID | Total Pizzas Ordered | Total Orders | Revenue   |
|---------------|-----------------------|--------------|-----------|
| five_cheese   | 1409                  | 1359         | 26,066.5  |
| mexicana      | 1484                  | 1426         | 26,780.75 |
| the_greek     | 1420                  | 1361         | 28,454.1  |

---

## Advanced / Business-Oriented Analysis

**Q18. What percentage of total revenue does each pizza category contribute?**  

| Category | Revenue   | % Contribution |
|----------|-----------|----------------|
| Chicken  | 195,919.5 | 23.96%         |
| Classic  | 220,053.1 | 26.91%         |
| Supreme  | 208,197   | 25.46%         |
| Veggie   | 193,690.5 | 23.68%         |

**Q19. Rank pizzas by revenue contribution (Top 10).**  

| Pizza Type ID | Revenue   | Rank |
|---------------|-----------|------|
| thai_ckn      | 43,434.25 | 1    |
| bbq_ckn       | 42,768    | 2    |
| cali_ckn      | 41,409.5  | 3    |
| classic_dlx   | 38,180.5  | 4    |
| spicy_ital    | 34,831.25 | 5    |
| southw_ckn    | 34,705.75 | 6    |
| ital_supr     | 33,476.75 | 7    |
| hawaiian      | 32,273.25 | 8    |
| four_cheese   | 32,265.7  | 9    |
| sicilian      | 30,940.5  | 10   |

**Q20. If a 10% discount is applied on Supreme pizzas, how much revenue loss will occur?**  
`Revenue Loss: 157,315.05`

**Q21. Compare small vs. large pizzas: which size is more profitable overall?**  

| Size | Profit     |
|------|------------|
| L    | 375,318.7  |

---


