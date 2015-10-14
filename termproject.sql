/*      
NAME : NEHA
STUDENT ID: C0646567
ORACLE DATABASE WITH SQL TERM PROJECT
*/

-- ********************* CREATE TABLE COMMANDS ***************-----
--EMPLOYEE


CREATE table employee
(employee_id 		NUMBER(10)     NOT NULL,
 first_name  		CHARACTER(30)  NOT NULL,
 last_name  		CHARACTER(30)  NOT NULL,
 birth_date 		DATE 		   NOT NULL,
 address  			CHARACTER(50)  NOT NULL,
 gender 			CHARACTER(1) ,
 salary 			NUMBER(9,2),
 hourly_rate  		NUMBER(10),
 bonus 				NUMBER(10),
 employee_type		CHARACTER(2) 	NOT NULL
)

--EMPLOYEE HISTORY

CREATE table employee_history
(employee_id 		NUMBER(10)     NOT NULL,
 job_title			CHARACTER(30)  NOT NULL,
 start_date 		DATE 		   NOT NULL,
 end_date 			DATE 		   NOT NULL,
 hourly_rate  		NUMBER(10)

)
	 	 
	 
-- CUSTOMER TABLE

CREATE TABLE customer

( customer_id 		NUMERIC(10) 		NOT NULL,
 first_name 		CHARACTER (30) 		NOT NULL,
 last_name 		    CHARACTER (30) 		NOT NULL, 
 email              CHARACTER (30)      NOT NULL,
 mobile_number      NUMERIC(10)         NOT NULL
 	 );
	 
--	  SERVICE TABLE
CREATE TABLE service

( service_id 			NUMERIC(10) 		NOT NULL,
 service_date 			DATE 		 		NOT NULL,
 service_description 	CHARACTER (30) 		NOT NULL, 
 hourly_labour_rate     NUMERIC(10)         NOT NULL,
 number_of_hours_spent  NUMERIC(10)         NOT NULL,
 customer_id			NUMERIC(10)			NOT NULL,
 serial_no				NUMERIC(10)			NOT NULL,
 employee_id			NUMERIC(10)			NOT NULL
 
 	 );
	 
-- PART TABLE
CREATE TABLE part

( part_id 			NUMERIC(10) 		NOT NULL,
 description 		CHARACTER (30) 		NOT NULL, 
 cost            	NUMERIC(9,2)        NOT NULL,
 quantity     		NUMERIC(10)         NOT NULL
 	 );
	 
--SERVICE_PART TABLE	 
CREATE TABLE service_part
( part_id 			NUMERIC(10) 		NOT NULL,
  service_id 		NUMERIC(10) 		NOT NULL,
  quantity_taken 	NUMERIC(10)			NOT NULL,
  unit_cost			NUMERIC(9,2)		NOT NULL
);

--EQUIPMENT
CREATE TABLE EQUIPMENT 
(serial_number 		NUMBER(10) 		NOT NULL,
 equipment_type 	CHARACTER(2) 	NOT NULL ,
 brand 				CHARACTER(30) 	NOT NULL ,
 model 				CHARACTER(30) 	NOT NULL,
 customer_id		NUMBER(10) 		NOT NULL

)
-- SNOW BLOWER TABLE
CREATE TABLE snow_blower

( serial_number			 NUMERIC(10) 		NOT NULL,
 amp_range 				 CHARACTER (30) 	NOT NULL,
 driveway_size 		     CHARACTER (30) 	NOT NULL, 
 clearing_width_range	 CHARACTER (30) 	NOT NULL, 
 chute_control           CHARACTER (30)     NOT NULL,
 intake_height_range	 CHARACTER(30) 		NOT NULL,
 electric_start          CHARACTER (30)     NOT NULL,
 usage            	     CHARACTER (30)     NOT NULL
 	 );
	 
-- LAWN MOWER TABLE
CREATE TABLE lawn_mower

( serial_number			 NUMERIC(10) 		NOT NULL,
 propulsion_type		 CHARACTER (30) 	NOT NULL,
 starter_type 		     CHARACTER (30) 	NOT NULL, 
 drive_control			 CHARACTER (30) 	NOT NULL, 
 speed_control           CHARACTER (30)     NOT NULL,
 cutting_width			 CHARACTER(30) 		NOT NULL,
 wheel_size		         CHARACTER (30)     NOT NULL,
 discharge         	     CHARACTER (30)     NOT NULL,
 bag_capacity      	     CHARACTER (30)     NOT NULL
 	 );
	 
-- CHAIN SAW TABLE
CREATE TABLE chain_saw

( serial_number			 NUMERIC(10) 		NOT NULL,
 power_type		 		 CHARACTER (30) 	NOT NULL,
 chainsaw_length	     CHARACTER (30) 	NOT NULL, 
 chain_oiling			 CHARACTER (30) 	NOT NULL
 	 );
	 
-- GENERATOR TABLE
CREATE TABLE generator

( serial_number			 NUMERIC(10) 		NOT NULL,
 wattage_range			 CHARACTER (30) 	NOT NULL,
 fuel_type	 		     CHARACTER (30) 	NOT NULL
 	 );

-- **************************** CONSTRAINT COMMANDS *******************************
--PRIMARY KEY CONSTRAINTS
ALTER TABLE  employee
ADD CONSTRAINT employee_id_pk
PRIMARY KEY(employee_id);

ALTER TABLE  employee_history
ADD CONSTRAINT employee_history_id_pk
PRIMARY KEY(employee_id,start_date);


ALTER TABLE  customer
ADD CONSTRAINT customer_customer_id_pk
PRIMARY KEY(customer_id);

ALTER TABLE  service
ADD CONSTRAINT service_service_id_pk         
PRIMARY KEY(service_id);

ALTER TABLE  part
ADD CONSTRAINT part_part_id_pk
PRIMARY KEY(part_id);

ALTER TABLE service_part
ADD CONSTRAINT service_part_id_pk
PRIMARY KEY (service_id,part_id);

ALTER TABLE EQUIPMENT 
ADD CONSTRAINT equipment_serial_number_pk 
PRIMARY KEY (serial_number);

ALTER TABLE  snow_blower
ADD CONSTRAINT snow_blower_serial_number_pk
PRIMARY KEY(serial_number);

ALTER TABLE  lawn_mower
ADD CONSTRAINT lawn_mower_serial_number_pk
PRIMARY KEY(serial_number);

ALTER TABLE  chain_saw
ADD CONSTRAINT chain_saw_serial_number_pk
PRIMARY KEY(serial_number);

ALTER TABLE  generator
ADD CONSTRAINT generator_serial_number_pk
PRIMARY KEY(serial_number);


--***********************FOREIGN KEY CONSTRAINTS*************


--EMPLOYEE HISTORY TABLE
ALTER TABLE employee_history
ADD CONSTRAINT emp_history_employee_id_fk 
FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE;

--SERVICE TABLE

ALTER TABLE service
ADD CONSTRAINT service_serial_no_fk 
FOREIGN KEY (serial_no) REFERENCES equipment(serial_number) ON DELETE CASCADE;

ALTER TABLE service
ADD CONSTRAINT service_customer_id_fk 
FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE;

ALTER TABLE service
ADD CONSTRAINT service_employee_id_fk 
FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE;


--SERVICE_PART TABLE

ALTER TABLE service_part
ADD CONSTRAINT service_part_service_id_fk 
FOREIGN KEY(service_id) REFERENCES service(service_id) ON DELETE CASCADE;

ALTER TABLE service_part
ADD CONSTRAINT service_part_part_id_fk 
FOREIGN KEY(part_id) REFERENCES part(part_id) ON DELETE CASCADE;


--EQUIPMENT
ALTER TABLE equipment 
ADD CONSTRAINT equipment_customer_id_fk 
FOREIGN KEY(customer_id)REFERENCES customer(customer_id);

--SNOW BLOWER
ALTER TABLE 
SNOW_BLOWER ADD CONSTRAINT sb_serial_no_fk 
FOREIGN KEY(serial_number) REFERENCES equipment(serial_number);

--LAWN_MOWER
ALTER TABLE LAWN_MOWER 
ADD CONSTRAINT lm_serial_no_fk 
FOREIGN KEY(serial_number) REFERENCES equipment(serial_number);

--CHAIN_SAW
ALTER TABLE CHAIN_SAW ADD CONSTRAINT cs_serial_no_fk 
FOREIGN KEY(serial_number) REFERENCES equipment(serial_number);

--GENERATOR
ALTER TABLE GENERATOR ADD CONSTRAINT ge_serial_no_fk 
FOREIGN KEY(serial_number) REFERENCES equipment(serial_number);






--************UNIQUE CONSTRAINTS***************
ALTER TABLE customer
ADD CONSTRAINT customer_email_uq 
UNIQUE(email);

ALTER TABLE customer
ADD CONSTRAINT customer_mobile_number_uq 
UNIQUE(mobile_number);



--****************CHECK CONSTRAINTS***********

--EMPLOYEE
ALTER table employee 
ADD CONSTRAINT employee_employee_type_ck 
CHECK (employee_type IN ('OF','SE','PA'));

ALTER TABLE employee 
ADD CONSTRAINT employee_office_type_ck 
CHECK((employee_type ='OF'
					AND salary is NOT NULL
					AND hourly_rate is NULL
					AND bonus IS NULL)
					OR(employee_type <> 'OF'));
																 

ALTER TABLE employee 
ADD CONSTRAINT employee_service_type_ck 
CHECK ((employee_type = 'SE'
						AND SALARY IS NULL
						AND hourly_rate IS  NOT NULL AND BONUS IS NOT NULL)														
						OR (employee_type <>'SE'));

						
ALTER TABLE employee 
ADD CONSTRAINT employee_part_type_ck 
CHECK ((employee_type = 'PA'
	AND salary IS NULL
	AND hourly_rate IS NOT NULL 
	AND bonus IS NULL)														
	OR (employee_type <> 'PA'));
	
--EQUIPMENT						
ALTER table equipment
ADD CONSTRAINT equip_equipment_type_ck 
CHECK (equipment_type IN ('SB','LM','CS','GE'));

ALTER TABLE employee_history
ADD CONSTRAINT employee_history_end_date_ck
CHECK(end_date>=start_date);

ALTER TABLE employee_history
ADD CONSTRAINT employee_hourly_rate_ck
CHECK(hourly_rate>=10);

ALTER TABLE service
ADD CONSTRAINT service_hourly_labour_rate_ck
CHECK(hourly_labour_rate>=10);

ALTER TABLE part
ADD CONSTRAINT part_cost_ck
CHECK(cost>0);

ALTER TABLE service_part
ADD CONSTRAINT service_part_unit_cost_ck
CHECK(unit_cost>0);

--***********INSERT STATEMENTS************

--EMPLOYEE TABLE

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (50, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F',20000,'','','OF');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (51, 'Emma', 'Watson', '07-Jan-1990','15 Lewisham Road','F','',11,12,'SE');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (52, 'Christian', 'Bale', '05-Feb-1970','501 London Road','M','',12,'10','SE');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (53, 'Edward', 'Nortan', '07-Dec-1982','501 Murphy Road','M',50000,'','','OF');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (54, 'Edward', 'Watson', '06-Mar-1980','509 Maxwell Road','M',80000,'','','OF');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (55, 'Harry', 'Potter', '31-Jul-1989','15 Surrey Road','M','',11,12,'SE');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (56, 'Bruce', 'Wayne', '07-Jan-1990','15 Oxford Road','M','',11,12,'SE');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (57, 'Briane', 'Wayne', '07-Jan-1990','15 Oxford Road','F','',11,'','PA');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (58, 'Connie', 'Cox', '05-Jan-1994','15 Surrey Road','F','',11,'','PA');

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (59, 'Amy', 'Adams', '09-Dec-1994','508 Fanshawe Road','F','',11,'','PA');



--EMPLOYEE HISTORY
INSERT INTO employee_history
(employee_id,start_date,job_title,end_date,hourly_rate)
VALUES(57,'01-Feb-1992','MA','04-Feb-1992',11);

INSERT INTO employee_history
(employee_id,start_date,job_title,end_date,hourly_rate)
VALUES(58,'01-Feb-1992','FA','04-Feb-1992',12);

INSERT INTO employee_history
(employee_id,start_date,job_title,end_date,hourly_rate)
VALUES(59,'08-Feb-1990','FA','20-Feb-1990',12);





--CUSTOMER TABLE
INSERT INTO customer

(customer_id, first_name, last_name, email, mobile_number)

VALUES (10, 'John', 'Smith', 'jsmith@gmail.com', 102456321);

INSERT INTO customer

(customer_id, first_name, last_name, email, mobile_number)

VALUES (11, 'Michael', 'Fassbender', 'mfassbender@gmail.com', 102455421);

INSERT INTO customer

(customer_id, first_name, last_name, email, mobile_number)

VALUES (12, 'Natalie', 'Portman', 'nportman@gmail.com', 102489321);

INSERT INTO customer

(customer_id, first_name, last_name, email, mobile_number)

VALUES (13, 'Kate', 'Beckinsale', 'kbeckinsale@gmail.com', 105456321);

INSERT INTO customer

(customer_id, first_name, last_name, email, mobile_number)

VALUES (14, 'John', 'Marsh', 'jmarsh@gmail.com', 572456321);

INSERT INTO customer

(customer_id, first_name, last_name, email, mobile_number)

VALUES (15, 'Nicole', 'Kidman', 'nkidman@gmail.com', 962456321);


--PART TABLE
INSERT INTO part

(part_id, description, cost, quantity)

VALUES (20, 'oil filter', 100, 20);

INSERT INTO part

(part_id, description, cost, quantity)

VALUES (21, 'air filter', 80, 10);

INSERT INTO part

(part_id, description, cost, quantity)

VALUES (22, 'blade', 100, 1);

INSERT INTO part

(part_id, description, cost, quantity)

VALUES (23, 'spark plugs', 50, 50);

INSERT INTO part

(part_id, description, cost, quantity)

VALUES (24, 'oil filter', 100, 1);

--EQUIPMENT

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(30,'SB','WAO','A24',10);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(31,'SB','TORO','A40',11);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(32,'SB','TORO','A45',11);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(33,'SB','OREGAN','A56',12);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(34,'SB','TORO','A78',14);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(35,'LM','OREGAN','K75',10);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(36,'LM','CRAFTSMAN','B54',11);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(37,'LM','OREGAN','M45',12);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(38,'LM','SYMA','N45',13)

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(39,'LM','OREGAN','H54',14);

INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(40,'CS','OREGAN','A56',10);
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(41,'CS','WAO','A56',10);
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(42,'CS','FORESTER','A56',10);
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(43,'CS','WAO','K75',13);
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(44,'CS','WAO','A',13);


INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(45,'GE','WAO','D56',13);
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(46,'GE','WAO','P56',12);
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(47,'GE','OREGAN','A60',11);
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(48,'GE','STEMS','A6',10);
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(49,'CS','FORESTER','Q56',14);




--SNOW BLOWER TABLE

INSERT INTO snow_blower

(serial_number,amp_range, driveway_size, clearing_width_range, chute_control , intake_height_range, electric_start , usage)

VALUES(30, '10 to 15 ',' Up to 12 vehicles','13 to 24 in','Joystick','13 to 18 in','No','Medium use');

INSERT INTO snow_blower

(serial_number,amp_range, driveway_size, clearing_width_range, chute_control , intake_height_range, electric_start , usage)

VALUES(31, '14 to 16 ',' Up to 6 vehicles','13 to 24 in','Crank Manual','13 to 14 in','Yes','Heavy use');

INSERT INTO snow_blower

(serial_number,amp_range, driveway_size, clearing_width_range, chute_control , intake_height_range, electric_start , usage)
 
VALUES(32, 'Less than 10 ',' Up to 8 vehicles','13 to 24 in','Manual','10 to 12 in','No','Medium use');

INSERT INTO snow_blower

(serial_number,amp_range, driveway_size, clearing_width_range, chute_control , intake_height_range, electric_start , usage)

VALUES(33, '7 to 15 ',' Up to 4 vehicles','8 to 10 in','Switch','13 to 16 in','Yes','Heavy use');

INSERT INTO snow_blower

(serial_number,amp_range, driveway_size, clearing_width_range, chute_control , intake_height_range, electric_start , usage)

VALUES(34, '10 to 12 ',' Up to 8 vehicles','13 to 15 in','Joystick','15 to 18 in','No','Medium use');


--LAWN MOWER

INSERT INTO lawn_mower

(serial_number,propulsion_type, starter_type, drive_control, speed_control , cutting_width, wheel_size , discharge ,bag_capacity)

VALUES(35, 'Power Propelled ',' Key start','All wheel control','Single speed','14 up tp 20 in','Small','Less','Small');

INSERT INTO lawn_mower

(serial_number,propulsion_type, starter_type, drive_control, speed_control , cutting_width, wheel_size , discharge ,bag_capacity)

VALUES(36, 'Push','Pull start','Front wheel drive','Variable pace control','15 up tp 20 in','Large','More','Medium');

INSERT INTO lawn_mower

(serial_number,propulsion_type, starter_type, drive_control, speed_control , cutting_width, wheel_size , discharge ,bag_capacity)

VALUES(37, 'Power Propelled','Push button ','Reae wheel drive','Variable with ball','20 up tp 30 in','Small','More','Large');

INSERT INTO lawn_mower

(serial_number,propulsion_type, starter_type, drive_control, speed_control , cutting_width, wheel_size , discharge ,bag_capacity)

VALUES(38, 'Push',' Key start','All wheel control','Single speed','10 up tp 16 in','Small','Less','Large');

INSERT INTO lawn_mower

(serial_number,propulsion_type, starter_type, drive_control, speed_control , cutting_width, wheel_size , discharge ,bag_capacity)

VALUES(39, 'Power Propelled','Key start','All wheel control','Single speed','14 up tp 20 in','Medium ','Less','Medium');

--CHAIN SAW

INSERT INTO chain_saw

(serial_number,power_type, chainsaw_length, chain_oiling)

VALUES(40, 'Needs external power','11 in','Automatic');

INSERT INTO chain_saw

(serial_number,power_type, chainsaw_length, chain_oiling)

VALUES(41, '110V electric','12 in','Manual');

INSERT INTO chain_saw

(serial_number,power_type, chainsaw_length, chain_oiling)

VALUES(42, 'Needs external power','16 in','Automatic');

INSERT INTO chain_saw

(serial_number,power_type, chainsaw_length, chain_oiling)

VALUES(43, 'Needs external power','16 in','Manual');

INSERT INTO chain_saw

(serial_number,power_type, chainsaw_length, chain_oiling)

VALUES(44, '110V electric','14 in','Automatic');

--GENERATOR
INSERT INTO generator

(serial_number,wattage_range, fuel_type )

VALUES(45, '10-15 kW','Diesel');

INSERT INTO generator

(serial_number,wattage_range, fuel_type)

VALUES(46, '16-19 kW','Gasoline');

INSERT INTO generator

(serial_number,wattage_range, fuel_type)

VALUES(47, '30-39 kW','Hybrid');

INSERT INTO generator

(serial_number,wattage_range, fuel_type)

VALUES(48, '100+ kW','Propane');

INSERT INTO generator

(serial_number,wattage_range, fuel_type)

VALUES(49, '10-15 kW','LP');


------------ CREATE SEQUENCE ----------
CREATE SEQUENCE service_service_id_seq
  START WITH 100
  INCREMENT BY 1
  MAXVALUE 999
  NOCACHE
  NOCYCLE;

  
  --*****************************************USING SEQUENCE IN SERVICE AND SERVICE_PART *******************************************
  
  INSERT  INTO SERVICE (service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
VALUES (service_service_id_seq.NEXTVAL, '01-Feb-2015','New Air Filter',11,2,11,52,35);

INSERT INTO SERVICE_PART (service_id,part_id, quantity_taken,unit_cost) 
VALUES (service_service_id_seq.CURRVAL, 22,1,75);

INSERT INTO service(service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
 VALUES (service_service_id_seq.NEXTVAL,'05-Feb-2015','New Oil Filter',11,5,12,51,35);
 
 INSERT INTO service_part (service_id,part_id, quantity_taken,unit_cost)
  VALUES (service_service_id_seq.CURRVAL, 21,1,50);
  
  INSERT INTO service(service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
 VALUES (service_service_id_seq.NEXTVAL,'06-Mar-2015','New Blade',11,5,13,56,42);

 INSERT INTO service_part (service_id,part_id, quantity_taken,unit_cost)
  VALUES (service_service_id_seq.CURRVAL, 23,1,52);
  
 INSERT INTO service(service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
 VALUES (service_service_id_seq.NEXTVAL,'07-Jan-2015','New Blade',11,6,14,55,44);

 INSERT INTO service_part (service_id,part_id, quantity_taken,unit_cost)
  VALUES (service_service_id_seq.CURRVAL, 20,1,50);
  
  INSERT INTO service(service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
 VALUES (service_service_id_seq.NEXTVAL,'08-Mar-2015','New Air Filter',11,7,13,55,45);

 INSERT INTO service_part (service_id,part_id, quantity_taken,unit_cost)
  VALUES (service_service_id_seq.CURRVAL, 22,1,100);
  
   INSERT INTO service(service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
 VALUES (service_service_id_seq.NEXTVAL,'03-Apr-2015','New Air Filter',10,7,13,55,49);

 INSERT INTO service_part (service_id,part_id, quantity_taken,unit_cost)
  VALUES (service_service_id_seq.CURRVAL, 22,1,100);
  
   INSERT INTO service(service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
 VALUES (service_service_id_seq.NEXTVAL,'10-Apr-2015','New Blade',15,12,10,51,44);

 INSERT INTO service_part (service_id,part_id, quantity_taken,unit_cost)
 VALUES (service_service_id_seq.CURRVAL, 22,2,100);
  
 

--**********************CONSTRAINT TESTING*****************************************

--******************************PRIMARY KEY CONSTRAINTS*************************
--EMPLOYEE
INSERT INTO employee
(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)
VALUES (50, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F',20000,'','','PA');
--ORA-00001: unique constraint (CA_1800_SQL01_S29.EMPLOYEE_ID_PK) violated

--EMPLOYEE_HISTORY
INSERT INTO employee_history
(employee_id,start_date,job_title,end_date,hourly_rate)
VALUES(57,'01-Feb-1992','MA','04-Feb-1992',11);
--ORA-00001: unique constraint (CA_1800_SQL01_S29.EMPLOYEE_HISTORY_ID_PK) violated 

--SERVICE
INSERT  INTO SERVICE (service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_number)
VALUES (100, '01-Feb-2015','New Air Filter',11,2,11,52,35);
--ORA-00001: unique constraint (CA_1800_SQL01_S29.SERVICE_SERVICE_ID_PK) violated

--PART
INSERT INTO part
(part_id, description, cost, quantity)
VALUES (20, 'oil filter', 100, 20);
--ORA-00001: unique constraint (CA_1800_SQL01_S29.PART_PART_ID_PK) violated

--SERVICE_PART
INSERT INTO SERVICE_PART (service_id,part_id, quantity_taken,unit_cost) 
VALUES (100, 22,1,75);
--ORA-00001: unique constraint (CA_1800_SQL01_S29.SERVICE_PART_ID_PK) violated

--SNOW_BLOWER
INSERT INTO snow_blower
(serial_number,amp_range, driveway_size, clearing_width_range, chute_control , intake_height_range, electric_start , usage)
VALUES(30, '10 to 15 ',' Up to 12 vehicles','13 to 24 in','Joystick','13 to 18 in','No','Medium use');
--ORA-00001: unique constraint (CA_1800_SQL01_S29.SNOW_BLOWER_SERIAL_NUMBER_PK) violated

--LAWN_MOWER
INSERT INTO lawn_mower
(serial_number,propulsion_type, starter_type, drive_control, speed_control , cutting_width, wheel_size , discharge ,bag_capacity)
VALUES(35, 'Power Propelled ',' Key start','All wheel control','Single speed','14 up tp 20 in','Small','Less','Small');
--ORA-00001: unique constraint (CA_1800_SQL01_S29.LAWN_MOWER_SERIAL_NUMBER_PK) violated

--CHAIN_SAW
INSERT INTO chain_saw
(serial_number,power_type, chainsaw_length, chain_oiling)
VALUES(40, 'Needs external power','11 in','Automatic');
--ORA-00001: unique constraint (CA_1800_SQL01_S29.CHAIN_SAW_SERIAL_NUMBER_PK) violated

--GENERATOR
INSERT INTO generator
(serial_number,wattage_range, fuel_type)
VALUES(45, '10-15 kW','Diesel');
--ORA-00001: unique  onstraint(CA_1800_SQL01_S29.GENERATOR_SERIAL_NUMBER_PK) violated



--*****************************FOREIGN KEY CONSTRAINTS***************************


--EMPLOYEE_HISTORY
INSERT INTO employee_history
(employee_id,start_date,job_title,end_date,hourly_rate)
VALUES(1000,'01-Feb-1992','MA','04-Feb-1992',11);
--ORA-02291: integrity constraint (CA_1800_SQL01_S29.EMP_HISTORY_EMPLOYEE_ID_FK) violated - parent key not found

--SERVICE
INSERT  INTO SERVICE (service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
VALUES (service_service_id_seq.NEXTVAL, '01-Feb-2015','New Air Filter',11,2,11,52,500);
--ORA-02291: integrity constraint (CA_1800_SQL01_S29.SERVICE_SERIAL_NO_FK) violated - parent key not found

INSERT  INTO SERVICE (service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
VALUES (service_service_id_seq.NEXTVAL, '01-Feb-2015','New Air Filter',11,2,1000,52,35);
--ORA-02291: integrity constraint (CA_1800_SQL01_S29.SERVICE_CUSTOMER_ID_FK) violated - parent key not found

INSERT  INTO SERVICE (service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,serial_no)
VALUES (service_service_id_seq.NEXTVAL, '01-Feb-2015','New Air Filter',11,2,100,1000,35);
--ORA-02291: integrity constraint (CA_1800_SQL01_S29.SERVICE_EMPLOYEE_ID_FK) violated - parent key not found

--SERVICE_PART
INSERT INTO SERVICE_PART (service_id,part_id, quantity_taken,unit_cost) 
VALUES (1000, 22,1,75);
--ORA-02291: integrity constraint (CA_1800_SQL01_S29.SERVICE_PART_SERVICE_ID_FK) violated - parent key not found

INSERT INTO SERVICE_PART (service_id,part_id, quantity_taken,unit_cost) 
VALUES (100, 1000,1,75);
--ORA-02291: integrity constraint (CA_1800_SQL01_S29.SERVICE_PART_PART_ID_FK) violated - parent key not found

--EQUIPMENT
INSERT INTO equipment (serial_number,equipment_type,brand,model,customer_id)
VALUES(1000,'SB','WAO','A24',1000);
--ORA-02291: integrity constraint (CA_1800_SQL01_S29.EQUIPMENT_CUSTOMER_ID_FK) violated - parent key not found






--****************************UNIQUE CONSTRAINTS********************************8


--CUSTOMER
INSERT INTO customer
(customer_id, first_name, last_name, email, mobile_number)
VALUES (10000, 'John', 'Smith', 'jsmith@gmail.com', 102456321);
--ORA-00001: unique constraint (CA_1800_SQL01_S29.CUSTOMER_EMAIL_UQ) violated

INSERT INTO customer
(customer_id, first_name, last_name, email, mobile_number)
VALUES (10000, 'John', 'Smith', 'jsth@gmail.com', 102456321);
--ORA-00001: unique constraint (CA_1800_SQL01_S29.CUSTOMER_MOBILE_NUMBER_UQ) violated


--***************************************CHECK CONSTRAINTS*********************************




--	EMPLOYEE_TYPE SHOULD BE IN OF,SE,PA
INSERT INTO employee
(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)
VALUES (1000, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F',20000,'','','AB');
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_EMPLOYEE_TYPE_CK) violated

--FOR OFFICE EMPLOYEES
INSERT INTO employee
(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)
VALUES (1000, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F',20000,'','11','OF');
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_OFFICE_TYPE_CK) violated

INSERT INTO employee
(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)
VALUES (1000, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F',20000,'10','','OF');
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_OFFICE_TYPE_CK) violated

--FOR SERVICE EMPLOYEES
INSERT INTO employee
(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)
VALUES (1000, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F',20000,'10','','SE');
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_SERVICE_TYPE_CK) violated

INSERT INTO employee
(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)
VALUES (1000, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F','','10','','SE');
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_SERVICE_TYPE_CK) violated

--FOR PART TIME EMPLOYEES
INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (450, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F','2000','','10','PA');
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_PART_TYPE_CK) violated

INSERT INTO employee

(employee_id, first_name, last_name, birth_date, address, gender,salary,hourly_rate,bonus,employee_type)

VALUES (450, 'Neha', 'Sahota', '06-Nov-1989','501 Erindale Crt','F','','10','10','PA');
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_PART_TYPE_CK) violated






--EMPOYEE_HISTORY
--END DATE GREATER THAN START DATE
INSERT INTO employee_history
(employee_id,start_date,job_title,end_date,hourly_rate)
VALUES(1000,'04-Feb-1992','MA','01-Feb-1992',11);
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_HISTORY_END_DATE_CK) violated

--HOURLY RATE MUST BE GREATER THAN EQUAL TO 10 
INSERT INTO employee_history
(employee_id,start_date,job_title,end_date,hourly_rate)
VALUES(1000,'01-Feb-1992','MA','04-Feb-1992',9);
--ORA-02290: check constraint (CA_1800_SQL01_S29.EMPLOYEE_HOURLY_RATE_CK) violated

--SERVICE
--HOURLY_LABOUR_RATE MUST BE GREATER THAN EQUAL TO 10
INSERT  INTO SERVICE (service_id,service_date,service_description,hourly_labour_rate,number_of_hours_spent,customer_id,employee_id,snow_blower_serial_no,lawn_mower_serial_no,generator_serial_no,chain_saw_serial_no)
VALUES (service_service_id_seq.NEXTVAL, '01-Feb-2015','New Air Filter',9,2,11,52,'',35,'','');
--ORA-02290: check constraint (CA_1800_SQL01_S29.SERVICE_HOURLY_LABOUR_RATE_CK) violated

--PART
--COST MUST BE GREATER THAN ZERO
INSERT INTO part
(part_id, description, cost, quantity)
VALUES (1000, 'oil filter', 0, 20);
--ORA-02290: check constraint (CA_1800_SQL01_S29.PART_COST_CK) violated

--SERVICE_PART
--UNIT_COST MUST BE GREATER THAN ZERO
INSERT INTO SERVICE_PART (service_id,part_id, quantity_taken,unit_cost) 
VALUES (service_service_id_seq.CURRVAL, 22,1,0);












