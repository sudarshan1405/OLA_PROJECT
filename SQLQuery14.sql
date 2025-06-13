select car.[Car_ID]
      ,[Brand]
      ,[Model]
      ,[Year]
      ,[Fuel_Type]
      ,[Transmission]
      ,[Color]
      ,[Owner_Type]
      ,[Mileage_kmpl]
      ,[Price_Lakh]
      ,[Provider]
      ,[Policy_Number]
      ,[Expiry_Date]
      ,[Status]
      ,[Owner_Name]
      ,[Contact]
      ,[City]
      ,[Purchase_Year]
      ,[Sale_Price_Lakh]
      ,[Sale_Date]
      ,[Buyer_Name]
      ,[Service_Type]
      ,[Service_Date]
      ,[Service_Cost]
      ,[Service_Center] INTO MASTER_CAR_DATA
from car 
left join Insurance 
on car.car_id= Insurance.car_id
left join Owners
on Owners.car_id=car.car_id
left join Sales
on Sales.car_id = car.car_id
left join Service_History
on Service_History.car_id=car.car_id