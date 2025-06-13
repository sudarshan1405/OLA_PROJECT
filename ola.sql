create database ola;
use ola;

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


CREATE VIEW cancelled_rides_by_customers AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        booking_status = 'Canceled by Customer';

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


CREATE VIEW UPI_payment AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Payment_Method = 'UPI';



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


CREATE VIEW total_successful_ride_value AS
    SELECT 
        SUM(Booking_Value) AS total_successful_ride_value
    FROM
        bookings
    WHERE
        Booking_status = 'success';



#10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
    SELECT 
        Booking_ID, Incomplete_Rides_Reason
    FROM
        Bookings
    WHERE
        Incomplete_Rides = 'yes'
