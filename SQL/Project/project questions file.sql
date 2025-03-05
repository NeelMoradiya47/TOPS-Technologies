-- 1. Retrieve all records from the cars table.
SELECT * FROM cars;

-- 2. Show distinct car brands.
SELECT DISTINCT brand FROM cars;

-- 3. Count the total number of cars.
SELECT COUNT(*) AS total_cars FROM cars;

-- 4. Find the most expensive car.
SELECT * FROM cars ORDER BY selling_price DESC LIMIT 1;

-- 5. Find the cheapest car.
SELECT * FROM cars ORDER BY selling_price ASC LIMIT 1;

-- 6. Find all cars with more than 50,000 km driven.
SELECT * FROM cars WHERE km_drive > 50000;

-- 7. List all cars that use "Petrol" as fuel.
SELECT * FROM cars WHERE fuel = 'Petrol';

-- 8. Find all diesel cars with a selling price under 500,000.
SELECT * FROM cars WHERE fuel = 'Diesel' AND selling_price < 500000;

-- 9. Find all cars that belong to the first owner.
SELECT * FROM cars WHERE owner = 'First Owner';

-- 10. Find the total number of diesel cars.
SELECT COUNT(*) AS diesel_cars FROM cars WHERE fuel = 'Diesel';

-- 11. Calculate the average selling price of all cars.
SELECT AVG(selling_price) AS avg_price FROM cars;

-- 12. Find the total number of cars for each brand.
SELECT brand, COUNT(*) AS total_cars FROM cars GROUP BY brand;

-- 13. Find the maximum and minimum selling prices.
SELECT MAX(selling_price) AS max_price, MIN(selling_price) AS min_price FROM cars;

-- 14. Find the average km driven for each fuel type.
SELECT fuel, AVG(km_drive) AS avg_km FROM cars GROUP BY fuel;

-- 15. Show the top 5 most expensive cars.
SELECT * FROM cars ORDER BY selling_price DESC LIMIT 5;

-- 16. Show the top 5 least driven cars.
SELECT * FROM cars ORDER BY km_drive ASC LIMIT 5;

-- 17. Find cars priced between 200,000 and 500,000.
SELECT * FROM cars WHERE selling_price BETWEEN 200000 AND 500000;

-- 18. Find all cars that are either Petrol or Diesel.
SELECT * FROM cars WHERE fuel IN ('Petrol', 'Diesel');

-- 19. Find all cars that are neither Petrol nor Diesel (e.g., CNG, Electric).
SELECT * FROM cars WHERE fuel NOT IN ('Petrol', 'Diesel');

-- 20. Find all cars with a brand name that starts with 'T' (like Toyota, Tata).
SELECT * FROM cars WHERE brand LIKE 'T%';

-- 21. Find all cars with a brand name containing "Maruti".
SELECT * FROM cars WHERE brand LIKE '%Maruti%';

-- 22. Get the details of the owner along with the car details.
SELECT cars.*, owners.name, owners.contact 
FROM cars 
JOIN owners ON cars.owner = owners.owner_id;

-- 23. Find the brand with the highest average selling price.
SELECT brand, AVG(selling_price) AS avg_price 
FROM cars 
GROUP BY brand 
ORDER BY avg_price DESC 
LIMIT 1;

-- 24. Find the most common fuel type used.
SELECT fuel, COUNT(*) AS count 
FROM cars 
GROUP BY fuel 
ORDER BY count DESC 
LIMIT 1;

-- 25. Find the number of cars owned by different ownership types (First Owner, Second Owner, etc.).
SELECT owner, COUNT(*) AS count FROM cars GROUP BY owner;

-- 26. Find the oldest car (assuming you add a year column).
SELECT * FROM cars ORDER BY year ASC LIMIT 1;

-- 27. Find all cars priced above the average selling price.
SELECT * FROM cars 
WHERE selling_price > (SELECT AVG(selling_price) FROM cars);

-- 28. Find cars with the highest km driven for each fuel type.
SELECT * FROM cars c1
WHERE km_drive = (SELECT MAX(km_drive) FROM cars c2 WHERE c1.fuel = c2.fuel);