# Pizza Sales SQL Project – Query Outputs

This file contains summarized outputs for each query.

---

## Dataset Exploration

**Q1. How many orders were placed in total?**  
➡ [Total_orders
    21350]  


**Q2. How many unique pizzas are available on the menu?**  
➡ [available_pizza_count
    32]  


**Q3. What are the different pizza categories and sizes available?**  
➡ Categories: [Chicken
                Classic
                Supreme
                Veggie]  
➡ Sizes: [L
           M
           S
           XL
           XXL]  

---

## Order & Sales Trends

**Q4. What is the trend of orders per day/week/month?**  
➡ Daily Trend: 
Sample Daily Data (first 5 days):
    date	      total_orders
  2015-01-01	      69
  2015-01-02	      67
  2015-01-03	      66
  2015-01-04	      52
  2015-01-05	      54

➡ Weekly Trend: 
Sample Weekly Data (first 5 weeks):
  week	total_orders
    1	      202
    2	      427
    3	      401
    4	      422
    5	      393

➡ Monthly Trend: 
Sample Monthly Data (first 5 months):
   month	  month_no	total_orders
  January	    1	          1845
  February	  2	          1685
  March	      3	          1840
  April	      4	          1799
  May	        5	          1853
 

**Q5. What days of the week and times of the day is the restaurant the busiest?**  
Sample Data (first 5 values):
    DAY 	    Hour	Total_orders
  Thursday	   13	      438
  Thursday	   12	      434
  Tuesday	     12	      421
  Wednesday	   12	      420
  Friday	     12	      415  


**Q6. How many pizzas are made during peak periods?**  
    Day	    Hour	Total_orders
  Thursday	 12	    1149
  Thursday	 13    	1131
  Monday	   12	    1126
  Tuesday	   12	    1105
  Friday	   12	    1101  


**Q7. What is the average number of pizzas per order?**  
  avg_pizzas_per_order
          2  

---

## Revenue Analysis

**Q8. What is the total revenue generated?**  
  total_revevue
  817860.05  


**Q9. What is the average order value (AOV)?**  
  AOV
  37.5618126463696


**Q10. Which pizza size contributes the most to total revenue?**  
  size	total_price
    L	    375318.7 


**Q11. Which pizza category (Classic, Chicken, Supreme, and Veggie) generates the highest revenue?**  
  category	total_revenue
  Classic	    220053.1  


**Q12. What is the monthly/quarterly revenue trend?**  

month_name	month	  total_revenue
  January	    1	      69793.3
  February	  2	      65159.6
  March	      3	      70397.1
  April	      4	      68736.8
  May	        5	      71402.75

---

## Best & Worst Performers

**Q13. What are the top 5 best-selling pizzas by quantity?**  
   pizza_type_id	 Orders
    classic_dlx	    2453
    bbq_ckn	        2432
    hawaiian	      2422
    pepperoni	      2418
    thai_ckn	      2371 


**Q14. Which pizzas generate the highest revenue?**  
  pizza_type_id	   revenue
    thai_ckn	    43434.25  


**Q15. What are the bottom 5 worst-selling pizzas by quantity?**  
   pizza_type_id	 Orders
    brie_carre	    490
    mediterraneo	  934
    calabrese	      937
    spinach_supr	  950
    soppressata	    961  


**Q16. Which pizzas are ordered frequently but generate low revenue (popular but cheap)?**  
  pizza_type_id  total_pizzas_ordered	  total_orders   revenue
    big_meat	             1914	            1811	      22968


**Q17. Which pizzas generate very little revenue (least popular + least profitable)?**  
  pizza_type_id	  total_pizzas_ordered	total_orders	  revenue
    five_cheese	          1409	            1359	      26066.5
    mexicana	            1484	            1426	      26780.75
    the_greek	            1420	            1361	      28454.1 

---

## Advanced / Business-Oriented Analysis

**Q18. What percentage of total revenue does each pizza category contribute?**  
  category	  revenue	     percentage_contribution
  Chicken	    195919.5	        23.96
  Classic	    220053.1	        26.91
  Supreme	    208197	          25.46
  Veggie	    193690.45	        23.68


**Q19. Rank pizzas by revenue contribution (Top 10).**  
  pizza_type_id	   revenue	  rn
    thai_ckn       43434.25   1
    bbq_ckn        42768      2
    cali_ckn	     41409.5	  3
    classic_dlx	   38180.5	  4
    spicy_ital	   34831.25	  5
    southw_ckn	   34705.75	  6
    ital_supr      33476.75	  7
    hawaiian	     32273.25	  8
    four_cheese	   32265.7	  9
    sicilian	     30940.5	  10 


**Q20. If a 10% discount is applied on Supreme pizzas, how much revenue loss will occur?**  
  loss
  157315.05


**Q21. Compare small vs. large pizzas: which size is more profitable overall?**  
  size	  profit
    L	   375318.7 

