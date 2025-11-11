USE project;

SELECT * FROM [Location Table];
SELECT * FROM [Uber Trip Details];

---1.How many trips were booked over a given period?
SELECT COUNT(trip_id) as TotalBookings FROM [Uber Trip Details];

---2.What is the total revenue generated from all bookings?
SELECT ROUND(SUM(fare_amount+Surge_Fee),0) as TotalRevenue FROM [Uber Trip Details];

---3.What is the average revenue per booking?
SELECT ROUND(AVG(fare_amount+COALESCE(Surge_Fee,0)),0) as AvgRevenue FROM [Uber Trip Details];

---4.What is the total distance covered by all trips?
SELECT ROUND(SUM(trip_distance),0) as TotalTripDistance FROM [Uber Trip Details];

---5.How far are customers traveling on average per trip?
SELECT ROUND(Avg(trip_distance),0) as AvgTripDistance FROM [Uber Trip Details];

---6.What is the average duration of trips?
SELECT Avg(DATEDIFF(minute,pickup_time, drop_off_time)) as AvgTripDuration FROM [Uber Trip Details];

---7. Show the various metrics like-
---a)total bookings
---b)total booking value
---c)avg booking value
---d)total trip distance 
---across different vehicle types in Uber trips

SELECT vehicle, COUNT(trip_id) as TotalBookings,  ROUND(SUM(fare_amount+Surge_Fee),0) as TotalRevenue,
ROUND(AVG(fare_amount+COALESCE(Surge_Fee,0)),0) as AvgRevenue, ROUND(SUM(trip_distance),0) as TotalTripDistance
FROM [Uber Trip Details]
GROUP BY vehicle;


---8. Show the total bookings by Day.
SELECT CAST(pickup_time AS DATE) TripDate, COUNT(trip_id) as TotalBookings
FROM [Uber Trip Details]
GROUP BY CAST(pickup_time AS DATE)
ORDER BY TripDate;

---9. Identify the most common starting locations for trips.
SELECT Top 1 l.location as MostFrequentPickupPoint
FROM [Uber Trip Details] u
JOIN [Location Table] l ON u.PULocationID = l.LocationID
GROUP BY l.location
ORDER BY COUNT(*) DESC

 ---10.Find the most common drop-off location.
 SELECT Top 1 l.location as MostFrequentDropoffPoint
 FROM [Uber Trip Details] u
 JOIN [Location Table] l ON u.DOLocationID = l.LocationID
 GROUP BY l.location
 ORDER BY COUNT(*) DESC

 --- 11. Determine the longest trip based on distance travelled.

 SELECT l.location as PickUp,l2.location as DropOff, u.trip_distance
 FROM [Uber Trip Details] u JOIN [Location Table] l ON u.PULocationID = l.LocationID
 JOIN [Location Table] l2 ON u.DOLocationID = l2.LocationID
 ORDER BY u.trip_distance desc

 ---12. Identify the top 5 locations with the highest trip bookings.

 SELECT TOP 5 l.location, COUNT(u.trip_id) as HighestTripBookings
 FROM [Uber Trip Details] u
 JOIN [Location Table] l ON u.PULocationID = l.LocationID
 GROUP BY l.location
 ORDER BY COUNT(u.trip_id) DESC
 
 ---13. Determine the most frequently booked vehicle type at each pickup location.

SELECT location, vehicle as MostFrequentlyBookedVehicle, Vehiclecount FROM
(SELECT l.location, u.vehicle, COUNT(u.trip_id) Vehiclecount,
rank() over(partition by l.location order by count(u.trip_id)desc) 
as rnk
FROM [Uber Trip Details] u
JOIN [Location Table] l ON u.PULocationID = l.LocationID
GROUP BY l.location, u.vehicle)t
WHERE rnk = 1;


 


