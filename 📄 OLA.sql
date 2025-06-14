create database ola;
use ola;

#1. Retrieve all successful bookings:
 
CREATE VIEW successful_bookings AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        booking_status = 'success';

SELECT 
    *
FROM
    successful_bookings;


#2. Find the average ride distance for each vehicle type:
 
CREATE VIEW ride_distance_for_each_vehicle AS
    SELECT 
        Vehicle_Type, AVG(ride_distance) AS avg_distance
    FROM
        bookings
    GROUP BY vehicle_type;

SELECT 
    *
FROM
    ride_distance_for_each_vehicle;



#3. Get the total number of cancelled rides by customers:
 
CREATE VIEW cancelled_rides_by_customers AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        booking_status = 'Canceled by Customer';


#4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW Top_5_customers AS
    SELECT 
        Customer_ID, COUNT(Booking_ID) AS total_rides
    FROM
        Bookings
    GROUP BY Customer_ID
    ORDER BY total_rides DESC
    LIMIT 5;

SELECT 
    *
FROM
    Top_5_customers;



 #5. Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW canceled_by_driver_P_C_issues AS
    SELECT 
        COUNT(*)
    FROM
        Bookings
    WHERE
        Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT 
    *
FROM
    canceled_by_driver_P_C_issues;



#6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 

CREATE VIEW Max_Min_Driver_Rating AS
    SELECT 
        MAX(Driver_Ratings) AS max_rating,
        MIN(Driver_Ratings) AS min_rating
    FROM
        Bookings
    WHERE
        Vehicle_type = 'Prime Sedan';

SELECT 
    *
FROM
    Max_Min_Driver_Rating;



#7. Retrieve all rides where payment was made using UPI:

CREATE VIEW UPI_payment AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Payment_Method = 'UPI';




 #8. Find the average customer rating per vehicle type:

CREATE VIEW avg_cust_rating AS
    SELECT 
        Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
    FROM
        bookings
    GROUP BY Vehicle_Type;

SELECT 
    *
FROM
    avg_cust_rating;


 #9. Calculate the total booking value of rides completed successfully:


CREATE VIEW total_successful_ride_value AS
    SELECT 
        SUM(Booking_Value) AS total_successful_ride_value
    FROM
        bookings
    WHERE
        Booking_status = 'success';



 #10. List all incomplete rides along with the reason

CREATE VIEW Incomplete_Rides_Reason AS
    SELECT 
        Booking_ID, Incomplete_Rides_Reason
    FROM
        Bookings
    WHERE
        Incomplete_Rides = 'yes'
