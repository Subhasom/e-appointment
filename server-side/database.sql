--
-- Definition for table user
--
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  user_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL,
  passwd VARCHAR(60) NOT NULL,
  owner VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table city_place
--
DROP TABLE IF EXISTS city_place;
CREATE TABLE city_place (
  id INT(11) DEFAULT NULL,
  name VARCHAR(50) DEFAULT NULL,
  UNIQUE INDEX city_place_id (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table doctor
--
DROP TABLE IF EXISTS doctor;
CREATE TABLE doctor (
  doctor_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  speciality VARCHAR(255) NOT NULL,
  qualification TEXT NOT NULL,
  pic VARCHAR(255) DEFAULT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  contact VARCHAR(255) DEFAULT NULL,
  fee VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (doctor_id),
  UNIQUE INDEX doctor_doctor_id (doctor_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 15
AVG_ROW_LENGTH = 1260
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table user
--
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  userid INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(30) NOT NULL,
  cell VARCHAR(30) NOT NULL,
  passwd VARCHAR(250) NOT NULL,
  pic VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (userid)
)
ENGINE = INNODB
AUTO_INCREMENT = 38
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table blood_bank
--
DROP TABLE IF EXISTS blood_bank;
CREATE TABLE blood_bank (
  blood_bank_id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) NOT NULL,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(255) DEFAULT NULL,
  phone VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  `A+` SMALLINT(6) DEFAULT NULL,
  `B+` SMALLINT(6) DEFAULT NULL,
  `AB+` SMALLINT(6) DEFAULT NULL,
  `O+` SMALLINT(6) DEFAULT NULL,
  `A-` SMALLINT(6) DEFAULT NULL,
  `B-` SMALLINT(6) DEFAULT NULL,
  `AB-` SMALLINT(6) DEFAULT NULL,
  `O-` SMALLINT(6) DEFAULT NULL,
  PRIMARY KEY (blood_bank_id),
  CONSTRAINT FK_blood_bank_user_user_id FOREIGN KEY (user_id)
    REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table donor
--
DROP TABLE IF EXISTS donor;
CREATE TABLE donor (
  donor_id INT(11) NOT NULL AUTO_INCREMENT,
  userid INT(11) NOT NULL DEFAULT 0,
  date_of_birth VARCHAR(30) NOT NULL,
  blood_group VARCHAR(10) NOT NULL,
  city_place VARCHAR(50) DEFAULT NULL,
  last_donated DATE DEFAULT NULL,
  area VARCHAR(255) DEFAULT NULL,
  lat FLOAT(10, 6) DEFAULT NULL,
  lng FLOAT(10, 6) DEFAULT NULL,
  PRIMARY KEY (donor_id),
  CONSTRAINT FK_donor_user_userid FOREIGN KEY (userid)
    REFERENCES user(userid) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table hospital
--
DROP TABLE IF EXISTS hospital;
CREATE TABLE hospital (
  hospital_id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) NOT NULL,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  speciality VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  phone VARCHAR(255) DEFAULT NULL,
  emergency VARCHAR(255) DEFAULT NULL,
  fax VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  lat FLOAT(10, 6) DEFAULT NULL,
  lng FLOAT(10, 6) DEFAULT NULL,
  PRIMARY KEY (hospital_id),
  CONSTRAINT FK_hospital_user_user_id FOREIGN KEY (user_id)
    REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table subcity_place_thana
--
DROP TABLE IF EXISTS subcity_place_thana;
CREATE TABLE subcity_place_thana (
  id INT(11) DEFAULT NULL,
  sub_thana VARCHAR(255) DEFAULT NULL,
  CONSTRAINT FK_subcity_place_thana_city_place_id FOREIGN KEY (id)
    REFERENCES city_place(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table booking
--
DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
  booking_id INT(11) NOT NULL AUTO_INCREMENT,
  userid INT(11) NOT NULL,
  hospital_id INT(11) NOT NULL,
  patient_name VARCHAR(50) DEFAULT NULL,
  age VARCHAR(20) DEFAULT NULL,
  category VARCHAR(50) NOT NULL,
  contact VARCHAR(20) DEFAULT NULL,
  time_of_booking TIMESTAMP NULL DEFAULT NULL,
  reason_of_booking VARCHAR(255) DEFAULT NULL,
  status VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (booking_id),
  INDEX FK_booking_hospitals_room_room_id (category),
  CONSTRAINT FK_booking_hospital_hospital_id FOREIGN KEY (hospital_id)
    REFERENCES hospital(hospital_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_booking_user_userid FOREIGN KEY (userid)
    REFERENCES user(userid) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 7
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table event
--
DROP TABLE IF EXISTS event;
CREATE TABLE event (
  event_id INT(11) NOT NULL AUTO_INCREMENT,
  blood_bank_id INT(11) NOT NULL,
  time VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  banner VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (event_id),
  CONSTRAINT FK_event_blood_bank_blood_bank_id FOREIGN KEY (blood_bank_id)
    REFERENCES blood_bank(blood_bank_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table hospitals_room
--
DROP TABLE IF EXISTS hospitals_room;
CREATE TABLE hospitals_room (
  hospital_id INT(11) NOT NULL,
  icu_aval VARCHAR(10) DEFAULT 'no',
  icu_quantity SMALLINT(6) DEFAULT 0,
  icu_rate SMALLINT(6) DEFAULT NULL,
  ccu_aval VARCHAR(10) DEFAULT 'no',
  ccu_quantity SMALLINT(6) DEFAULT 0,
  ccu_rate SMALLINT(6) DEFAULT NULL,
  single_aval VARCHAR(10) DEFAULT 'no',
  single_quantity SMALLINT(6) DEFAULT 0,
  single_rate SMALLINT(6) DEFAULT NULL,
  share_aval VARCHAR(10) DEFAULT 'no',
  share_quantity SMALLINT(6) DEFAULT 0,
  share_rate SMALLINT(6) DEFAULT NULL,
  male_ward_aval VARCHAR(10) DEFAULT 'no',
  male_ward_quantity SMALLINT(6) DEFAULT 0,
  male_ward_rate SMALLINT(6) DEFAULT NULL,
  female_ward_aval VARCHAR(10) DEFAULT 'no',
  female_ward_quantity SMALLINT(6) DEFAULT 0,
  female_ward_rate SMALLINT(6) DEFAULT NULL,
  icu_remaining SMALLINT(6) DEFAULT 0,
  ccu_remaining SMALLINT(6) DEFAULT 0,
  single_remaining SMALLINT(6) DEFAULT 0,
  share_remaining SMALLINT(6) DEFAULT 0,
  male_ward_remaining SMALLINT(6) DEFAULT 0,
  female_ward_remaining SMALLINT(6) DEFAULT 0,
  CONSTRAINT FK_hospitals_room_hospital_hospital_id FOREIGN KEY (hospital_id)
    REFERENCES hospital(hospital_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table rating
--
DROP TABLE IF EXISTS rating;
CREATE TABLE rating (
  rating_id INT(11) NOT NULL,
  userid INT(11) NOT NULL,
  hospital_id INT(11) NOT NULL,
  text TEXT DEFAULT NULL,
  stars VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (rating_id, userid, hospital_id),
  CONSTRAINT FK_Rating_hospital_hospital_id FOREIGN KEY (hospital_id)
    REFERENCES hospital(hospital_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_Rating_user_userid FOREIGN KEY (userid)
    REFERENCES user(userid) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table schedule
--
DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule (
  schedule_id INT(11) NOT NULL AUTO_INCREMENT,
  doctor_id INT(11) NOT NULL,
  hospital_id INT(11) NOT NULL,
  doctor_contact VARCHAR(25) DEFAULT NULL,
  doctor_asst_contact VARCHAR(25) DEFAULT NULL,
  fee VARCHAR(25) DEFAULT NULL,
  will_join VARCHAR(50) DEFAULT NULL,
  room VARCHAR(50) DEFAULT NULL,
  availability VARCHAR(25) DEFAULT 'yes',
  sat_aval VARCHAR(25) DEFAULT NULL,
  sat_from VARCHAR(25) DEFAULT NULL,
  sat_to VARCHAR(25) DEFAULT NULL,
  sat_max INT(11) DEFAULT NULL,
  sun_aval VARCHAR(25) DEFAULT NULL,
  sun_from VARCHAR(25) DEFAULT NULL,
  sun_to VARCHAR(25) DEFAULT NULL,
  sun_max INT(11) DEFAULT NULL,
  mon_aval VARCHAR(25) DEFAULT NULL,
  mon_from VARCHAR(25) DEFAULT NULL,
  mon_to VARCHAR(25) DEFAULT NULL,
  mon_max INT(11) DEFAULT NULL,
  tues_aval VARCHAR(25) DEFAULT NULL,
  tues_from VARCHAR(25) DEFAULT NULL,
  tues_to VARCHAR(25) DEFAULT NULL,
  tues_max INT(11) DEFAULT NULL,
  wed_aval VARCHAR(25) DEFAULT NULL,
  wed_from VARCHAR(25) DEFAULT NULL,
  wed_to VARCHAR(25) DEFAULT NULL,
  wed_max INT(11) DEFAULT NULL,
  thur_aval VARCHAR(25) DEFAULT NULL,
  thur_from VARCHAR(25) DEFAULT NULL,
  thur_to VARCHAR(25) DEFAULT NULL,
  thur_max INT(11) DEFAULT NULL,
  fri_aval VARCHAR(25) DEFAULT NULL,
  fri_from VARCHAR(25) DEFAULT NULL,
  fri_to VARCHAR(25) DEFAULT NULL,
  fri_max INT(11) DEFAULT NULL,
  PRIMARY KEY (doctor_id, hospital_id),
  UNIQUE INDEX schedule_schedule_id (schedule_id),
  CONSTRAINT FK_schedule_doctor_doctor_id FOREIGN KEY (doctor_id)
    REFERENCES doctor(doctor_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_schedule_hospital_hospital_id FOREIGN KEY (hospital_id)
    REFERENCES hospital(hospital_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 23
AVG_ROW_LENGTH = 1260
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table stock
--
DROP TABLE IF EXISTS stock;
CREATE TABLE stock (
  bank_id INT(11) DEFAULT NULL,
  `O+ max` SMALLINT(6) DEFAULT NULL,
  `O+ value` SMALLINT(6) DEFAULT NULL,
  `O+ low` SMALLINT(6) DEFAULT NULL,
  `O+ optimum` SMALLINT(6) DEFAULT NULL,
  `O- max` SMALLINT(6) DEFAULT NULL,
  `O- value` SMALLINT(6) DEFAULT NULL,
  `O- low` SMALLINT(6) DEFAULT NULL,
  `O- optimum` SMALLINT(6) DEFAULT NULL,
  `A+ max` SMALLINT(6) DEFAULT NULL,
  `A+ value` SMALLINT(6) DEFAULT NULL,
  `A+ low` SMALLINT(6) DEFAULT NULL,
  `A+ optimum` SMALLINT(6) DEFAULT NULL,
  `A- max` SMALLINT(6) DEFAULT NULL,
  `A- value` SMALLINT(6) DEFAULT NULL,
  `A- low` SMALLINT(6) DEFAULT NULL,
  `A- optimum` SMALLINT(6) DEFAULT NULL,
  `B+ max` SMALLINT(6) DEFAULT NULL,
  `B+ value` SMALLINT(6) DEFAULT NULL,
  `B+ low` SMALLINT(6) DEFAULT NULL,
  `B+ optimum` SMALLINT(6) DEFAULT NULL,
  `B- max` SMALLINT(6) DEFAULT NULL,
  `B- value` SMALLINT(6) DEFAULT NULL,
  `B- low` SMALLINT(6) DEFAULT NULL,
  `B- optimum` SMALLINT(6) DEFAULT NULL,
  `AB+ max` SMALLINT(6) DEFAULT NULL,
  `AB+ value` SMALLINT(6) DEFAULT NULL,
  `AB+ low` SMALLINT(6) DEFAULT NULL,
  `AB+ optimum` SMALLINT(6) DEFAULT NULL,
  `AB- max` SMALLINT(6) DEFAULT NULL,
  `AB- value` SMALLINT(6) DEFAULT NULL,
  `AB- low` SMALLINT(6) DEFAULT NULL,
  `AB- optimum` SMALLINT(6) DEFAULT NULL,
  CONSTRAINT FK_stock_blood_bank_blood_bank_id FOREIGN KEY (bank_id)
    REFERENCES blood_bank(blood_bank_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table appointment
--
DROP TABLE IF EXISTS appointment;
CREATE TABLE appointment (
  appoint_id BIGINT(20) NOT NULL,
  schedule_id INT(11) NOT NULL,
  userid INT(11) NOT NULL,
  patient_name VARCHAR(30) DEFAULT NULL,
  day_of_appointment DATE DEFAULT NULL,
  time_of_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dob DATE DEFAULT NULL,
  contact VARCHAR(20) DEFAULT NULL,
  asthma VARCHAR(10) DEFAULT NULL,
  cardiac_failure VARCHAR(10) DEFAULT NULL,
  kidney_disease VARCHAR(10) DEFAULT NULL,
  diabetes VARCHAR(10) DEFAULT NULL,
  hyperlipidaemia VARCHAR(10) DEFAULT NULL,
  hypertension VARCHAR(10) DEFAULT NULL,
  serial SMALLINT(6) DEFAULT NULL,
  PRIMARY KEY (appoint_id),
  CONSTRAINT FK_appointment_schedule_schedule_id FOREIGN KEY (schedule_id)
    REFERENCES schedule(schedule_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_appointment_user_userid FOREIGN KEY (userid)
    REFERENCES user(userid) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci;