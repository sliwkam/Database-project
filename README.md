# Database-project for hotel industry.

**1.	Description of database functionality**

This database is part of the management system for a network of hotels. Consists of tables connected with each other by different 
types of relations. It is used for better hotels work organisation. Includes data for faster and more effective work and communication 
between employees. 
The database has many applications:
   - checking whether the client with the entered identifier exists in the database
   - calculating the amount due for the stay
   - showing number of reservations for each hotel
   - presenting the real number of visitors in hotels
   - creating the view that shows reservations whose arrival date is older than 50 days from the current day
   - removing 'obsolete' reservations
   - displaying the most frequently booked hotels
   - and many other which can be created for specific needs. 

**2.	Database design**
![alt text]( https://github.com/sliwkam/Database-project/blob/master/ERP.jpg)

Contents of tables:
-	Hotels (includes information about hotels’ names, addresses, number of rooms and number of the star) 
-	Clients (contains personal information about any customers using hotel services) 
-	Rooms (defines which rooms are in the hotel, the number of places in room and price for them) 
-	Rooms_types (two elements table which includes information about rooms types); in this table, the primary key was created by two          values: room_id and hotel_id;
-	Reservations (table with information about every reservation) 
-	Parking (allocating parking spaces for clients) 
-	Inhabitants (stores information about people currently living in the hotel)
-	History_of_rents (containing information about past stays)
