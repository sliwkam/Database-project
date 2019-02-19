-- the query checks whether the client with the entered identifier exists in the database
select if(client_id in(select client_id from clients), 'YES', 'NO') As 'Does that client exists in database?' from clients
where client_id = '2';

-- calculating the amount due for the stay
select client_id, reservation_number,  ((departure_date - arrival_date)*room_price) As 'charge' from inhabitants natural join rooms
where inhabitant_id = 2;

-- number of reservations for each hotel 
select  hotel_id, count(reservation_number) As 'number of reservations' from reservations
group by hotel_id;

-- the real number of visitors in hotels 
select hotel_id, sum(number_of_places) As "number of hotel inhabitants" from inhabitants natural join rooms 
group by hotel_id;

-- the view that shows reservations whose arrival date is older than 50 days from the current day
create or replace view past_reservations As
select hotel_id, client_id,reservation_number, arrival_date, departure_date from reservations
where  arrival_date < ADDDATE(CURDATE(), INTERVAL -50 DAY); 

--  removing 'obsolete' reservations
delete from reservations where arrival_date < ADDDATE(CURDATE(), INTERVAL -50 DAY);

-- displaying the most frequently booked hotels
create or replace view popularity as
select hotel_id, count(reservation_number) as res_count from reservations
group by hotel_id;
select hotel_id, count(hotel_id) from reservations
group by hotel_id
having count(hotel_id) = (select max(res_count) from popularity);





 
