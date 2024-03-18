CREATE SCHEMA Ins_Prj;
USE Ins_Prj;

CREATE TABLE CUSTOMER (customer_ID varchar(20) NOT NULL, first_name varchar(50) NOT NULL,last_name varchar(100) NOT NULL,DOB date,street varchar(20) , city varchar(50) ,district varchar(100) ,province varchar(100) ,agent_ID varchar(20) ,agent_as_customer varchar(20),Age int,PRIMARY KEY (customer_ID));

CREATE TABLE POLICY (policy_NO varchar(20) NOT NULL, policy_name varchar(255) NOT NULL,policy_type varchar(100) NOT NULL,coverage varchar(50),issued_date date,term_price int,customer_ID varchar(20),PRIMARY KEY (policy_NO));
CREATE TABLE VEHICLE (vehicle_ID varchar(20) NOT NULL, policy_type varchar(100) NOT NULL,start_date date,end_date date,policy_NO varchar(20),PRIMARY KEY (vehicle_ID));
CREATE TABLE LIFE (beneficiary_ID varchar(20) NOT NULL, first_name varchar(50) NOT NULL,last_name varchar(100) NOT NULL,relationship varchar(50),pecentage_share int,policy_NO varchar(20),PRIMARY KEY (beneficiary_ID));

CREATE TABLE PROPERTY (property_ID varchar(20) NOT NULL, cost int,property_type varchar(20),street varchar(20) , city varchar(50) ,district varchar(100) ,province varchar(100) ,policy_NO varchar(20),PRIMARY KEY (property_ID));

CREATE TABLE AGENT (agent_ID varchar(20) NOT NULL,first_name varchar(50) NOT NULL,last_name varchar(100) NOT NULL,email varchar(50),street varchar(20) ,city varchar(50) ,district varchar(100) ,province varchar(100) ,PRIMARY KEY (agent_ID));

CREATE TABLE CAR (car_number varchar(20) NOT NULL, make varchar(50),model varchar(20),policy_NO varchar(20),PRIMARY KEY (car_number));

CREATE TABLE BIKE (bike_number varchar(20) NOT NULL, make varchar(50),model varchar(20),policy_NO varchar(20),PRIMARY KEY (bike_number));

CREATE TABLE ACCIDENT (vehicle_ID varchar(20) NOT NULL,report_num varchar(20) NOT NULL, report_date date NOT NULL,report_time time NOT NULL,venue varchar(50),PRIMARY KEY (report_num, vehicle_ID));

CREATE TABLE PAYMENT (policy_NO varchar(20) NOT NULL, payment_date date NOT NULL,payment_method varchar(20) NOT NULL,payment_amount int,PRIMARY KEY (policy_NO, payment_date));

CREATE TABLE AGENT_CONTACT (agent_ID varchar(20) NOT NULL , contact_number varchar(50) NOT NULL,PRIMARY KEY (agent_ID, contact_number));

CREATE TABLE CUSTOMER_CONTACT (customer_ID varchar(20) , contact_number varchar(50) NOT NULL,PRIMARY KEY (customer_ID, contact_number));



ALTER TABLE CUSTOMER ADD CONSTRAINT FK_1 FOREIGN KEY(agent_ID) REFERENCES AGENT(agent_ID) ON DELETE cascade ON UPDATE cascade;


ALTER TABLE POLICY ADD CONSTRAINT FK_2 FOREIGN KEY(customer_ID) REFERENCES CUSTOMER(customer_ID) ON DELETE cascade on  UPDATE cascade;

ALTER TABLE VEHICLE ADD CONSTRAINT FK_3 FOREIGN KEY(policy_NO) REFERENCES POLICY(policy_NO)ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CAR ADD CONSTRAINT FK_4 FOREIGN KEY(policy_NO) REFERENCES VEHICLE(policy_NO) ON DELETE  cascade on update cascade;

ALTER TABLE BIKE ADD CONSTRAINT FK_5 FOREIGN KEY(policy_NO) REFERENCES VEHICLE(policy_NO) ON DELETE cascade ON UPDATE cascade;

ALTER TABLE LIFE ADD CONSTRAINT FK_6 FOREIGN KEY(policy_NO) REFERENCES POLICY(policy_NO) ON DELETE cascade ON UPDATE cascade;

ALTER TABLE PROPERTY ADD CONSTRAINT FK_7 FOREIGN KEY(policy_NO) REFERENCES POLICY(policy_NO) ON DELETE cascade ON UPDATE cascade;

ALTER TABLE AGENT_CONTACT ADD CONSTRAINT FK_8 FOREIGN KEY(agent_ID) REFERENCES AGENT(agent_ID) ;

ALTER TABLE CUSTOMER_CONTACT ADD CONSTRAINT FK_9 FOREIGN KEY(customer_ID) REFERENCES CUSTOMER(customer_ID) ON DELETE cascade  on  UPDATE cascade; 


ALTER TABLE accident ADD CONSTRAINT FK_10 FOREIGN KEY(vehicle_ID) REFERENCES policy(policy_NO) ON DELETE cascade  on  UPDATE cascade ;

ALTER TABLE payment ADD CONSTRAINT FK_11 FOREIGN KEY(policy_NO) REFERENCES policy(policy_NO) ;

ALTER TABLE customer ADD CONSTRAINT FK_12 FOREIGN KEY(agent_as_customer) REFERENCES customer(customer_ID) ;




insert into agent values ('AG06', 'Kamali',  'Jayasinghe',  'jayasinghe18883@gmail.com', 'Main Street', 'Thalpe', 'Galle', 'Southern');

insert into agent values ('AG07', 'bimal',  'ruwan',  'bimal12345@gmail.com', 'Main Street', 'Unwatuna', 'Galle', 'Southern');

insert into agent values ('AG08', 'Jayani',  'Jayasinghe',  'jayasinghe0011@gmail.com', 'No234', 'Thalpe', 'Galle', 'Southern');

INSERT INTO AGENT VALUES ('AG01', 'Kamal',  'Jayasinghe',  'jayasinghe123@gmail.com', 'Main Street', 'Galle', 'Galle', 'Southern');

INSERT INTO AGENT VALUES ('AG02', 'Kumudu',  'Nimali',  'kumudunim23@gmail.com', 'Main Street', 'Dehiwala', 'Colombo', 'Western');

INSERT INTO AGENT VALUES ('AG03', 'Piyal',  'Samarasinghe',  'piyal123@gmail.com', 'NO 5', 'Hapugala', 'Galle', 'Southern');

INSERT INTO AGENT VALUES ('AG04', 'Ruwan',  'Perera',  'ruwan123@gmail.com', 'Main Street', 'Jaffna', 'Jaffna', 'Northern');

INSERT INTO AGENT VALUES ('AG05', 'Pawan',  'Weerasekara',  'Weerasekara456@gmail.com', 'Main Street', 'Koggala', 'Galle', 'Southern');







INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1001', 'Sumudu', 'Priyangani', '2000-09-10', 'Main Street', 'Wakwella', 'Galle', 'Southern', 'AG01', null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1002', 'Piyal',  'Samarasinghe',  '2001-09-10',  'No5', 'Hapugala', 'Galle', 'Southern', 'AG01','CU1002');
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1003', 'Raman',  'Udawala',  '2000-09-10',  'New Road', 'Jaffna', 'Jaffna', 'Northern', 'AG02',null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1004', 'Nuwan',  'Perera',  '2000-09-10',  'Main Street', 'Suriyawewa', 'Hambantota', 'Southern', 'AG03',null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1005', 'Pawan',  'Rajagiri',  '2001-09-10',  'Main Street', 'Thanamalwila', 'Monaragala', 'Uva', 'AG04',null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1006', 'Bimal',  'Sunil',  '2002-09-10', 'NO2', 'Kalmunai', 'Ampara', 'Uwa', 'AG05',null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1007', 'Lakmali',  'Silva',  '1999-09-10',  'Main Street', 'Homagama', 'Colombo', 'Western', 'AG05',null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1008', 'Umali',  'Srimali',  '2000-09-10',  'Main Street', 'Hikkaduwa', 'Galle', 'Southern', 'AG05',null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU1009', 'Umal',  'Srimal',  '2001-09-10',  'Main Street', 'Ginthota', 'Galle', 'Southern', 'AG06',null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU10010', 'Kumudu',  'Rathnayaka',  '2002-09-10',  'No234', 'Hikkaduwa', 'Galle', 'Southern', 'AG07',null);
INSERT INTO CUSTOMER (customer_ID, first_name, last_name, DOB, street, city, district, province, agent_ID, agent_as_customer) VALUES ('CU10011', 'Rayan',  'Srimal',  '2000-09-25',  'No23', 'Unwatuna', 'Galle', 'Southern', 'AG08',null);







INSERT INTO POLICY VALUES ('V-4000', 'Car Gaurd',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU1009');
INSERT INTO POLICY VALUES ('V-4001', 'Car Gaurd',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU1009');
INSERT INTO POLICY VALUES ('V-4002', 'Car Gaurd',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU10010');
INSERT INTO POLICY VALUES ('V-4003', 'Car Gaurd',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU10011');
INSERT INTO POLICY VALUES ('V-4004', 'Car Gaurd',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU1009');
INSERT INTO POLICY VALUES ('V-4005', 'Motorcycle Protection',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU10010');
INSERT INTO POLICY VALUES ('V-4006', 'Motorcycle Protection',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU1001');
INSERT INTO POLICY VALUES ('V-4007', 'Motorcycle Protection',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU1009');
INSERT INTO POLICY VALUES ('V-4008', 'Motorcycle Protection',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU1009');
INSERT INTO POLICY VALUES ('V-4009', 'Motorcycle Protection',  'Auto',  'Comprehensive Coverarage', '2023-03-01', 25000, 'CU10010');

INSERT INTO POLICY VALUES ('L-3000', 'Family Security',  'Life',  'RS.10,000,000', '2023-09-01', 50000, 'CU10011');
INSERT INTO POLICY VALUES ('L-3001', 'Family Security',  'Life',  'RS.10,000,000', '2023-09-01', 50000, 'CU10010');
INSERT INTO POLICY VALUES ('L-3002', 'Family Security',  'Life',  'RS.10,000,000', '2023-09-01', 50000, 'CU1009');
INSERT INTO POLICY VALUES ('L-3003', 'Family Security',  'Life',  'RS.10,000,000', '2023-09-01', 50000, 'CU1008');


INSERT INTO POLICY VALUES ('P-2000', 'Renters Security',  'Property',  'Personal Belongings: Rs.40,000, Liability Coverage', '2023-04-01', 75000, 'CU1009');
INSERT INTO POLICY VALUES ('P-2001', 'Renters Security',  'Property',  'Personal Belongings: Rs.40,000, Liability Coverage', '2023-04-01', 25000, 'CU10010');
INSERT INTO POLICY VALUES ('P-2002', 'Renters Security',  'Property',  'Personal Belongings: Rs.40,000, Liability Coverage', '2023-04-01', 75000, 'CU1008');
INSERT INTO POLICY VALUES ('P-2003', 'Renters Security',  'Property',  'Personal Belongings: Rs.40,000, Liability Coverage', '2023-04-01', 85000, 'CU1008');

INSERT INTO POLICY VALUES ('L-4157', 'Family Security',  'Life',  'RS.10,000,000', '2023-09-01', 25000, 'CU1002');
INSERT INTO POLICY VALUES ('P-4287', 'Home Safety',  'Property',  'Dwelling: Rs.1,50000 ', '2023-08-01', 6000, 'CU1003');
INSERT INTO POLICY VALUES ('V-4259', 'Motorcycle Protection',  'Auto',  'Motorcycle Coverage', '2023-07-01', 8000, 'CU1002');
INSERT INTO POLICY VALUES ('V-7257', 'Motorcycle Protection',  'Auto',  'Motorcycle Coverage', '2022-03-01', 8000, 'CU1004');
INSERT INTO POLICY VALUES ('P-4957', 'Renters Security',  'Property',  'Personal Belongings: Rs.40,000, Liability Coverage', '2023-04-01', 25000, 'CU1005');
INSERT INTO POLICY VALUES ('L-4237', 'Life Gaurd',  'Life',  'Rs.500,000', '2023-03-01', 25000, 'CU1006');
INSERT INTO POLICY VALUES ('P-1257', 'Home Safety', 'property' , 'Dwelling: Rs.1000,000', '2023-03-03', 25000, 'CU1003');
INSERT INTO POLICY VALUES ('V-4857', 'Car Gaurd',  'Auto',  'Comprehensive Coverarage', '2023-03-02', 50000, 'CU1007');
INSERT INTO POLICY VALUES ('V-4157', 'Motorcycle Protection',  'Auto',  'Motorcycle Coverage', '2023-03-08', 75000, 'CU1008');
INSERT INTO POLICY VALUES ('L-6257', 'Children Future',  'Life',  'Rs.2500,000', '2023-03-01', 25000, 'CU1001');



INSERT INTO VEHICLE VALUES ('PQR-223', 'Bike',  '2023-01-01',  '2023-12-31', 'V-4259');
INSERT INTO VEHICLE VALUES ('OLM-123', 'Bike',  '2023-02-01',  '2024-01-31', 'V-7257');
INSERT INTO VEHICLE VALUES ('XYZ-321', 'Car',  '2023-01-01',  '2023-12-31', 'V-4857');
INSERT INTO VEHICLE VALUES ('JKL-123', 'Bike',  '2023-01-01',  '2023-12-31', 'V-4157');

INSERT INTO VEHICLE VALUES ('ABC-001', 'car',  '2023-01-01',  '2023-12-31', 'V-4000');
INSERT INTO VEHICLE VALUES ('XYZ-002', 'car',  '2023-01-01',  '2023-12-31', 'V-4001');
INSERT INTO VEHICLE VALUES ('ABC-003', 'car',  '2023-01-01',  '2023-12-31', 'V-4002');
INSERT INTO VEHICLE VALUES ('XYZ-004', 'car',  '2023-01-01',  '2023-12-31', 'V-4003');
INSERT INTO VEHICLE VALUES ('XYZ-005', 'car',  '2023-01-01',  '2023-12-31', 'V-4004');


INSERT INTO VEHICLE VALUES ('PQR-001', 'bike',  '2023-01-01',  '2023-12-31', 'V-4005');
INSERT INTO VEHICLE VALUES ('PQR-002', 'bike',  '2023-01-01',  '2023-12-31', 'V-4006');
INSERT INTO VEHICLE VALUES ('PQR-003', 'bike',  '2023-01-01',  '2023-12-31', 'V-4007');
INSERT INTO VEHICLE VALUES ('PQR-004', 'bike',  '2023-01-01',  '2023-12-31', 'V-4008');
INSERT INTO VEHICLE VALUES ('PQR-005', 'bike',  '2023-01-01',  '2023-12-31', 'V-4009');



INSERT INTO CAR VALUES ('XYZ-321', 'BMW',  'BMW X5', 'V-4857');

INSERT INTO CAR VALUES ('ABC-001', 'Toyota',  'Toyota Highlander', 'V-4000');
INSERT INTO CAR VALUES ('XYZ-002', 'BMW',  'BMW X5', 'V-4001');
INSERT INTO CAR VALUES ('ABC-003', 'Toyota',  'Toyota Highlander', 'V-4002');
INSERT INTO CAR VALUES ('XYZ-004', 'BMW',  'BMW X5', 'V-4003');
INSERT INTO CAR VALUES ('XYZ-005', 'BMW',  'BMW X5', 'V-4004');


INSERT INTO BIKE VALUES ('JKL-123', 'Honda',  'Honda CRF25', 'V-4157');
INSERT INTO BIKE VALUES ('OLM-123', 'Yamaha',  'MT7', 'V-7257');

INSERT INTO BIKE VALUES ('OLM-001', 'Yamaha',  'MT7', 'V-4005');
INSERT INTO BIKE VALUES ('OLM-002', 'Yamaha',  'MT7', 'V-4006');
INSERT INTO BIKE VALUES ('OLM-003', 'Yamaha',  'MT7', 'V-4007');
INSERT INTO BIKE VALUES ('OLM-004', 'Yamaha',  'MT7', 'V-4008');
INSERT INTO BIKE VALUES ('OLM-005', 'Yamaha',  'MT6', 'V-4009');











INSERT INTO LIFE VALUES ('B1001', 'Sunil',  ' Perera', 'Child', 55, 'L-4157');
INSERT INTO LIFE VALUES ('B1002', 'Yamaha',  'MT7', 'V-7257', 30, 'L-4237');

INSERT INTO LIFE VALUES ('B1003', 'Kamal',  'Perea', 'Child', 30, 'L-3000');
INSERT INTO LIFE VALUES ('B1004', 'Raman',  'Perea', 'Child', 30, 'L-3001');
INSERT INTO LIFE VALUES ('B1005', 'Pamali',  'Perea', 'Child', 30, 'L-3002');
INSERT INTO LIFE VALUES ('B1006', 'Bimal',  'Perea', 'Child', 30, 'L-3003');



INSERT INTO PROPERTY VALUES ('P1001', 25000,  ' Single-family home', '234 Palm Lane', 'Weligama', 'Matara','Southern', 'P-4287');
INSERT INTO PROPERTY VALUES ('P1002', 50000,  ' Townhouse', 'Main road', 'Colombo', 'Colombo','Western', 'P-4957');

INSERT INTO PROPERTY VALUES ('P1003', 75000,  ' Townhouse', 'Main road', 'Colombo', 'Colombo','Western', 'P-2000');
INSERT INTO PROPERTY VALUES ('P1004', 75000,  ' Townhouse', 'Main road', 'Colombo', 'Colombo','Western', 'P-2001');
INSERT INTO PROPERTY VALUES ('P1005', 75000,  ' Townhouse', 'Main road', 'Colombo', 'Colombo','Western', 'P-2002');
INSERT INTO PROPERTY VALUES ('P1006', 75000,  ' Townhouse', 'Main road', 'Colombo', 'Colombo','Western', 'P-2003');















INSERT INTO agent_contact VALUES ('AG01', '0711234567');
INSERT INTO agent_contact VALUES ('AG01', '0711236845');
INSERT INTO agent_contact VALUES ('AG02', '0721234567');
INSERT INTO agent_contact VALUES ('AG03', '0741234567');
INSERT INTO agent_contact VALUES ('AG03', '0749934567');
INSERT INTO agent_contact VALUES ('AG04', '0761234567');
INSERT INTO agent_contact VALUES ('AG05', '077123456');

INSERT INTO customer_contact VALUES ('CU1001', '077133356');
INSERT INTO customer_contact VALUES ('CU1001', '077133396');
INSERT INTO customer_contact VALUES ('CU1002', '077133352');
INSERT INTO customer_contact VALUES ('CU1003', '077133350');
INSERT INTO customer_contact VALUES ('CU1004', '077970350');
INSERT INTO customer_contact VALUES ('CU1005', '074513356');
INSERT INTO customer_contact VALUES ('CU1005', '077133096');
INSERT INTO customer_contact VALUES ('CU1006', '077137352');
INSERT INTO customer_contact VALUES ('CU1007', '077134350');
INSERT INTO customer_contact VALUES ('CU1008', '077139350');






INSERT INTO accident VALUES ('V-7257', 'ACC-40023',  '2023-09-12', '13:07:00', 'Weligama');
INSERT INTO accident VALUES ('V-4857', 'ACC-41234',  '2023-08-13', '11:08:00', 'Colombo');

INSERT INTO accident VALUES ('V-4000', 'ACC-41234',  '2023-08-13', '11:08:00', 'Colombo');
INSERT INTO accident VALUES ('V-4002', 'ACC-41344',  '2023-08-23', '15:08:00', 'Galle');
INSERT INTO accident VALUES ('V-4003', 'ACC-41456',  '2023-08-23', '15:08:00', 'Galle');



INSERT INTO payment VALUES ('V-7257', '2023-06-10',  'Credit', 4000);
INSERT INTO payment VALUES ('L-4237', '2023-08-10',  'Bank Transfer', 3000);

INSERT INTO payment VALUES ('L-3000', '2023-07-10',  'Bank Transfer', 6000);
INSERT INTO payment VALUES ('L-3001', '2023-07-10',  'Credit', 7000);
INSERT INTO payment VALUES ('L-3002', '2023-07-10',  'Bank Transfer', 6000);

update customer set first_name ='Umali' where customer_ID = 'CU1001';
update customer set last_name ='Ariyarathna' where customer_ID = 'CU1002';

update agent set first_name ='Piyumal' where agent_ID = 'AG01';
update agent set last_name ='Arachchige' where agent_ID = 'AG02';

update policy set policy_name ='Motorcycle Protection Pro' where policy_NO = 'V-4000';
update policy set policy_type ='Auto Plus' where policy_NO = 'V-4001 ';

update VEHICLE set start_date ='2023-02-01' where policy_NO = 'V-4000';
update VEHICLE set end_date ='2023-11-30' where policy_NO = 'V-4002 ';

update car set model ='xxxx' where car_number = 'ABC-001';
update car set make ='yyyyy' where car_number = 'ABC-003 ';

update bike set model ='bbbbb' where bike_number = 'OLM-001';
update bike set make ='aaaaa' where bike_number = 'OLM-003 ';

update life set first_name ='Priyawardana' where beneficiary_ID = 'B1001';
update life set relationship ='Gurdian' where beneficiary_ID = 'B1003 ';

update property set cost =100000 where property_ID = 'P1001';
update property set street ='Udagama Road' where property_ID = 'P1003 ';

update accident set venue ='Matara' where vehicle_ID = 'V-4257';
update accident set venue ='Galle' where vehicle_ID = 'V-7257 ';

update payment set payment_method ='Debit' where policy_NO = 'L-3000';
update payment set payment_method ='Debit' where policy_NO = 'L-3001 ';


delete from payment  where policy_NO = 'L-3000';
delete from accident  where vehicle_ID = 'V-4000';
delete from property  where policy_NO = 'P-2003';
delete from life  where policy_NO = 'L-3003';
delete from bike  where policy_NO = 'V-4005';
delete from car  where policy_NO = 'V-4001';
delete from vehicle  where policy_NO = 'V-4005';
delete from policy  where policy_NO = 'L-3000';

delete from agent  where agent_ID = 'AG08';
delete from customer  where customer_ID = 'CU1007';

-- Simple Queries

-- 1. Select Operation:

SELECT * FROM CUSTOMER;

-- 2. Project Operation:

SELECT first_name, last_name FROM CUSTOMER;

-- 3. Cartesian Product Operation:

SELECT C.first_name, C.last_name, P.policy_name
FROM CUSTOMER C
CROSS JOIN POLICY P;



-- 4. Creating a User View:

CREATE VIEW CustomerAgentView AS SELECT customer_ID, first_name, last_name, agent_ID FROM CUSTOMER;
select * from CustomerAgentView;

-- 5. Renaming Operation:

SELECT first_name AS 'Full Name', last_name AS 'Full Name' FROM CUSTOMER;

-- 6. Aggregation Function (Average):

SELECT AVG(term_price) AS 'Average Term Price' FROM POLICY;

-- 7. Use of the LIKE Keyword:

SELECT * FROM CUSTOMER WHERE last_name LIKE 'S%';

use ins_prj;

-- complex Queries

-- 1. Union Operation:
SELECT policy_NO, policy_type FROM POLICY where policy_type ='life' UNION  SELECT policy_NO, relationship FROM LIFE where relationship = 'child';


-- 2. Intersection Operation:

SELECT C.first_name, C.last_name FROM CUSTOMER C WHERE C.customer_ID IN ( SELECT P1.customer_ID FROM POLICY P1 WHERE P1.policy_type = 'Auto') INTERSECT SELECT C2.first_name, C2.last_name FROM CUSTOMER C2 WHERE C2.customer_ID IN ( SELECT P2.customer_ID FROM POLICY P2 WHERE P2.policy_type = 'Life');

-- 3. Set Difference Operation:

SELECT city,district  FROM CUSTOMER where district ='Galle' EXCEPT SELECT policy_type, term_price FROM Policy where term_price = '25000';

-- 4. Division Operation:

SELECT C.first_name, C.last_name FROM CUSTOMER C WHERE NOT EXISTS ( SELECT P.policy_type FROM POLICY P WHERE P.policy_type = 'Auto' AND NOT EXISTS ( SELECT CP.policy_type FROM POLICY CP WHERE CP.customer_ID = C.customer_ID AND CP.policy_type = P.policy_type));


-- 5. Inner Join:

SELECT C.first_name, C.last_name FROM CUSTOMER C INNER JOIN  AGENT A ON C.province = A.province;

-- 6. Natural Join:

SELECT C.first_name, C.last_name, P.policy_name FROM CUSTOMER C NATURAL JOIN POLICY P;

-- 7. Left Outer Join:

SELECT C.first_name, C.last_name, P.property_type FROM PROPERTY P LEFT JOIN CUSTOMER C ON C.province = P.province;

-- 8. Right Outer Join:

SELECT C.first_name, C.last_name, P.policy_name FROM CUSTOMER C RIGHT JOIN POLICY P ON C.customer_ID = P.customer_ID;

-- 9. Full Outer Join:

(SELECT C.first_name, C.last_name, P.policy_name FROM CUSTOMER C LEFT JOIN POLICY P ON C.customer_ID = P.customer_ID) UNION (SELECT C.first_name, C.last_name, P.policy_name FROM CUSTOMER C RIGHT JOIN POLICY P ON C.customer_ID = P.customer_ID);

-- 10. Outer Union:

SELECT C.first_name, C.last_name FROM CUSTOMER C WHERE EXISTS ( SELECT * FROM POLICY P WHERE C.street = 'Main Street' ) UNION ALL SELECT C.first_name, C.last_name FROM CUSTOMER C WHERE EXISTS ( SELECT * FROM VEHICLE V WHERE C.customer_ID = V.policy_NO);


-- 11: Nested Subquery with Aggregation

SELECT C.first_name, C.last_name, IFNULL(P.street_count, 0) AS total_streets FROM CUSTOMER C  LEFT JOIN ( SELECT street, COUNT(*) AS street_count FROM Agent GROUP BY street ) P ON C.street = P.street;


--  12: Nested Subquery with Set Difference

SELECT C.first_name, C.last_name FROM CUSTOMER C WHERE EXISTS ( SELECT * FROM POLICY P1 WHERE P1.customer_ID = C.customer_ID AND P1.policy_type = 'Auto' ) AND NOT EXISTS ( SELECT * FROM POLICY P2 WHERE P2.customer_ID = C.customer_ID AND P2.policy_type = 'Property');


-- 13: Nested Subquery with Union

SELECT C.first_name, C.last_name, C.street, C.province FROM CUSTOMER C WHERE C.first_name  IN ( SELECT A.first_name  FROM Agent A WHERE A.street ='Main Street' UNION SELECT P2.first_name FROM Agent P2 WHERE P2.province = 'Southern');



-- Tunning Queries

-- 1. Union Operation:

show index from policy;
explain(SELECT policy_NO, policy_type FROM POLICY where policy_type ='life' UNION  SELECT policy_NO, relationship FROM LIFE where relationship = 'child');
create index type_policy on policy(policy_type);
explain(SELECT policy_NO, policy_type FROM POLICY where policy_type ='life' UNION  SELECT policy_NO, relationship FROM LIFE where relationship = 'child');

-- 2. Intersection Operation:

show index from policy;

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE C.customer_ID IN (
  SELECT P1.customer_ID
  FROM POLICY P1
  WHERE P1.policy_type = 'Auto'
)
INTERSECT
SELECT C2.first_name, C2.last_name
FROM CUSTOMER C2
WHERE C2.customer_ID IN (
  SELECT P2.customer_ID
  FROM POLICY P2
  WHERE P2.policy_type = 'Life'
)
);

create index type_policy on policy(policy_type);

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE C.customer_ID IN (
  SELECT P1.customer_ID
  FROM POLICY P1
  WHERE P1.policy_type = 'Auto'
)
INTERSECT
SELECT C2.first_name, C2.last_name
FROM CUSTOMER C2
WHERE C2.customer_ID IN (
  SELECT P2.customer_ID
  FROM POLICY P2
  WHERE P2.policy_type = 'Life'
)
);

-- 3. Set Difference Operation:

show index from customer;

explain(SELECT city,district  FROM CUSTOMER where district ='Galle'
EXCEPT
SELECT policy_type, term_price FROM Policy where term_price = '25000');

create index customer_district on customer(district);

explain(SELECT city,district  FROM CUSTOMER where district ='Galle'
EXCEPT
SELECT policy_type, term_price FROM Policy where term_price = '25000');


-- 4. Division Operation:

show index from policy;

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE NOT EXISTS (
  SELECT P.policy_type
  FROM POLICY P
  WHERE P.policy_type = 'Auto'
  AND NOT EXISTS (
    SELECT CP.policy_type
    FROM POLICY CP
    WHERE CP.customer_ID = C.customer_ID
    AND CP.policy_type = P.policy_type
  )
));

create index type_policy on policy(policy_type);

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE NOT EXISTS (
  SELECT P.policy_type
  FROM POLICY P
  WHERE P.policy_type = 'Auto'
  AND NOT EXISTS (
    SELECT CP.policy_type
    FROM POLICY CP
    WHERE CP.customer_ID = C.customer_ID
    AND CP.policy_type = P.policy_type
  )
));


-- 5. Inner Join:

show index from Agent;

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C 
INNER JOIN  AGENT A ON C.province = A.province);

create index agent_province on Agent(province);

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C 
INNER JOIN  AGENT A ON C.province = A.province);

-- 7. Left Outer Join:

show index from property;

explain(SELECT C.first_name, C.last_name, P.property_type
FROM PROPERTY P
LEFT JOIN CUSTOMER C ON C.province = P.province);

create index pro_pro on property(province);

explain(SELECT C.first_name, C.last_name, P.property_type
FROM PROPERTY P
LEFT JOIN CUSTOMER C ON C.province = P.province);

-- 10. Outer Union:

show index from customer;

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE EXISTS (
  SELECT *
  FROM POLICY P
  WHERE C.street = 'Main Street'
)
UNION ALL
SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE EXISTS (
  SELECT *
  FROM VEHICLE V
  WHERE C.customer_ID = V.policy_NO
));

create index cus_stree on customer(street);

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE EXISTS (
  SELECT *
  FROM POLICY P
  WHERE C.street = 'Main Street'
)
UNION ALL
SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE EXISTS (
  SELECT *
  FROM VEHICLE V
  WHERE C.customer_ID = V.policy_NO
));

-- 11: Nested Subquery with Aggregation:

show index from agent;

explain(SELECT C.first_name, C.last_name, IFNULL(P.street_count, 0) AS total_streets
FROM CUSTOMER C 
LEFT JOIN (
  SELECT street, COUNT(*) AS street_count
  FROM Agent
  GROUP BY street
) P ON C.street = P.street);

create index a_street on agent(street);

explain(SELECT C.first_name, C.last_name, IFNULL(P.street_count, 0) AS total_streets
FROM CUSTOMER C 
LEFT JOIN (
  SELECT street, COUNT(*) AS street_count
  FROM Agent
  GROUP BY street
) P ON C.street = P.street);

-- 12: Nested Subquery with Set Difference:

show index from policy;
 
explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE EXISTS (
  SELECT *
  FROM POLICY P1
  WHERE P1.customer_ID = C.customer_ID AND P1.policy_type = 'Auto'
) AND NOT EXISTS (
  SELECT *
  FROM POLICY P2
  WHERE P2.customer_ID = C.customer_ID AND P2.policy_type = 'Property'
));


create index type_policy on policy(policy_type);

explain(SELECT C.first_name, C.last_name
FROM CUSTOMER C
WHERE EXISTS (
  SELECT *
  FROM POLICY P1
  WHERE P1.customer_ID = C.customer_ID AND P1.policy_type = 'Auto'
) AND NOT EXISTS (
  SELECT *
  FROM POLICY P2
  WHERE P2.customer_ID = C.customer_ID AND P2.policy_type = 'Property'
));

-- 13: Nested Subquery with Union:

show index from customer;

explain(SELECT C.first_name, C.last_name, C.street, C.province
FROM CUSTOMER C
WHERE C.first_name  IN (
  SELECT A.first_name 
  FROM Agent A
  WHERE A.street ='Main Street'
  UNION
  SELECT P2.first_name 
  FROM Agent P2
  WHERE P2.province = 'Southern'
));

create index f_name on customer(first_name);

explain(SELECT C.first_name, C.last_name, C.street, C.province
FROM CUSTOMER C
WHERE C.first_name  IN (
  SELECT A.first_name 
  FROM Agent A
  WHERE A.street ='Main Street'
  UNION
  SELECT P2.first_name 
  FROM Agent P2
  WHERE P2.province = 'Southern'
));

