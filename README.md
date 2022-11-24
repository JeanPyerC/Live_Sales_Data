# Live Sales Data

### Project

I have a client who needs a live report to show histroical sales information for the past 12 months. Based on the following conversation, the client wants to check on sales and restock inventory when needed. I made a list of items I need to review the information:
1. Review the database.
2. Create the report for all items and include Inventory level, Stock level and Reorder Level.
3. Add a 12 month running sales data.


## 1. Revewing the database

After reviewing the database, I took notes to what table I need to use to gather the following information to meet my goal. From the photo below, you can see that we have sales information in the first table, inventory level in the second table, and product information in the third table. We can also see, the product key will be the main key to connect all 3 tables. 

I will encourage you to skim through the column and see what information they have. This can also help for any future challenges, for example in the third, there are a lot of null value, the question can arise if I should ignore them, fix them, or delete them. 



## 2. Create the report for all items and include Inventory level, Stock level and Reorder Level.

### Main Table
For this task, the main table I will be using is 'DimProduct', as this holds the entire product information. It's important to know what main table to use, for example, if I used the 'FactInternetSales' table, I will be missing product information as some items don't sale. 

### Item Status, Safety Stock Level, and Reorder Level
I selected the following columns as these columns meets our goal. Please noticed how the 'Status' column had null values, instead of removing them, I used Coalesce where if there is a Null value, it will replace it with "Clearance". This helps the report look more organize. 

### Inventory Level
For this task, I will be using 'FactProductInventory', and this will be a challenge. As you can see, there is no set inventory level. The unit balance is based on the transaction date. Luckly for us, there is a way to work around this. Not only that, we have to conduct a Join operation so both tables can join and talk to each other

The best way to tackle this, is making a where clause where it's selecting the Max Date Key from the table we are using. With this operation, we will always have the latest inventory balance within the report.  




## 3. Add a 12 month running sales data.
This is a fun challenge, and it was very fun. We will be using table 'FactInternetSales' and we have to sum the OrderQuantity based on the month(s).  

I summed the quantity by on the criteria being the ShipDateKey Month equaling to our current month "-1", also know as prevoius month and the same condition for the year. I also had to convert the ShipDateKey into a date format (MM/DD/YYYY). 





# OVERVIEW
This was a fun project, and the report can now be used anytime to review. I encourage to upload the query in a Power Bi report as it is live. You can customize the graph to show the items trend, if it's going up/down, review top items, etc.   


