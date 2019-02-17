use hotel_industry;


INSERT INTO hotels (hotel_name, stars, town, street, ZIP_code, hotel_id)   VALUES ('Mercury', '3', 'Wroclaw','Wyspianskiego','12-345', 1), 
		('Venus','4','Warszawa','Gorna','23-456', 2), 
        ('Jupiter','3', 'Poznan','Dolna','33-567', 3), 
        ('Amber','4', 'Zakopane', 'Niska','11-222', 4), 
        ('Saturn','3', 'Krakow','Poprzeczna','33-458', 5); 
        
     
     INSERT INTO clients (surname, name, client_id, address)  
VALUES     ('Kowalski', 'Jan', 1,'Kielce, ul.Niska 5' ), 
         ('Wisniewski', 'Tadeusz', 2,'Kielce, ul.Wysoka 7'), 
     ('Cebulska', 'Malgorzata', 3,'Kielce, ul.Szeroka 8'), 
        ('Kwiatkowska', 'Irena', 4,'Warszawa, ul.Niska 5'), 
        ('Rogalski', 'Miroslaw', 5,'Kraków, ul.Niska 11'), 
        ('Markowski', 'Zygmunt', 6,'Katowice, ul.Niska 9'), 
        ('Kapuscinski','Marek', 7,'Poznań, ul.Waska 5'), 
        ('Bieganska', 'Jolanta', 8,'Bydgoszcz, ul.Krakowska 5'), 
        ('Nowak', 'Kazimierz', 9,'Poznan, ul.Niska 5'), 
        ('Sliwka','Maateusz',10,'Naramow 8'),
        ('Pacek','Karolina',11,'Lipie ul.Starachowicka 10 '),
        ('Mazurek','Klaudia', 12,'Starachowice, ul.Niska 5'); 
        
        
        INSERT INTO rooms_types (type_id,type) 
VALUES     ('ak','Apartament krolewski'), 
        ('ap','Apartament prezydencki'), 
        ('sz','Standard zwykly'), 
        ('sw','Standard wysoki'); 
        
       
	INSERT INTO rooms (room_id,room_price,number_of_places,type_id,hotel_id) Values
     (1,'250.00',2,'sz',3),
     (1,'150.00',1,'ap',1),
	 (2,'350.00',2,'ak',1),
     (3,'450.00',3,'sw',1),
     (2,'350.00',4,'sz',3),
     (3,'550.00',4,'sw',3),
     (1,'450.00',1,'ak',2),
     (2,'250.00',2,'ap',2),
     (3,'550.00',3,'sw',2),
     (1,'650.00',4,'ak',4),
     (2,'250.00',2,'sz',4),
     (1,'150.00',1,'sz',5),
	 (2,'550.00',3,'ak',5),
	 (3,'350.00',2,'ap',5);
     
     INSERT INTO reservations (reservation_number, hotel_id, client_id, room_id, arrival_date, departure_date, parking)  
VALUES   
 (1,1,1 , '1', '2019-01-22', '2019-01-29', 'N'), 
(2,5, 2, '2', '2018-12-14', '2018-12-31','Y'), 
(3,1,3, '2', '2019-02-17', '2019-03-01','N'), 
(4,2,4, '3', '2019-01-02', '2019-01-05', 'Y'), 
(5,4, 5, '1', '2019-04-19', '2019-04-29', 'N'), 
(6,4, 6, '2', '2019-05-19', '2019-05-29','N'), 
(7,3, 1, '1', '2019-02-10', '2019-02-11', 'Y'), 
(8,3, 7, '2', '2019-01-10', '2019-01-30', 'Y'), 
(9,3, 8, '3', '2019-02-10', '2019-02-15', 'Y'), 
(10,5, 9, '1', '2019-03-12', '2019-03-17', 'N'), 
(11,5, 2, '2', '2019-03-12', '2019-03-17', 'N'), 
(12,5, 10, '3', '2019-02-12', '2019-02-21', 'N'), 
(13,2, 11, '1', '2018-11-15', '2018-11-30 ', 'Y'); 
     
     
     INSERT INTO inhabitants (inhabitant_id, reservation_number, client_id, hotel_id, room_id, arrival_date, departure_date)  
VALUES 
(1,2,1,5,1, '2018-12-14', '2018-12-31'), 
(2,4,2,2,2, '2019-01-02', '2019-01-05'), 
(3,13,3,2,3, '2018-11-15', '2018-11-30'); 

INSERT INTO parking VALUES (1,5);

