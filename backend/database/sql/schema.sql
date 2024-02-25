-- PhoneNumbers table remains unchanged as it does not directly reference other tables.
CREATE TABLE IF NOT EXISTS PhoneNumbers (
  id SERIAL4 UNIQUE NOT NULL,
  phone TEXT NOT NULL,
  comment TEXT NOT NULL
);

-- City table remains unchanged.
CREATE TABLE IF NOT EXISTS City (
  id SERIAL4 UNIQUE NOT NULL,
  title TEXT NOT NULL,
  region_id INT,
  region TEXT,
  country TEXT,
  priority INT,
  lat FLOAT,
  lng FLOAT
);

-- Additional join tables and modifications should be made based on the relationships that are not fully detailed in the provided schema.
-- Assuming the existence of a Partners table for Bonus references
CREATE TABLE IF NOT EXISTS Partners (
  id SERIAL UNIQUE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  website TEXT
);

-- Assuming the existence of a Reports table, define it for context
CREATE TABLE IF NOT EXISTS Reports (
  id SERIAL PRIMARY KEY,
  content TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  -- Other fields as necessary
);

-- BloodStation table with a foreign key reference to City
CREATE TABLE IF NOT EXISTS BloodStation (
  id SERIAL UNIQUE NOT NULL,
  city_id INT NOT NULL,
  schedule INT NOT NULL,
  lat FLOAT NOT NULL,
  lng FLOAT NOT NULL,
  blood_group TEXT NOT NULL,
  blood_status TEXT NOT NULL,
  title TEXT NOT NULL,
  parser_url TEXT,
  is_get_from_parser BOOLEAN,
  o_plus BOOLEAN,
  o_minus BOOLEAN,
  a_plus BOOLEAN,
  a_minus BOOLEAN,
  b_plus BOOLEAN,
  b_minus BOOLEAN,
  ab_plus BOOLEAN,
  ab_minus BOOLEAN,
  blood BOOLEAN,
  plasma BOOLEAN,
  platelets BOOLEAN,
  erythrocytes BOOLEAN,
  leukocytes BOOLEAN,
  address TEXT,
  site TEXT,
  phones_numbers INT NOT NULL,
  email TEXT,
  worktime INTERVAL,
  without_registration BOOLEAN,
  with_typing BOOLEAN,
  for_moscow BOOLEAN,
  closed BOOLEAN,
  small BOOLEAN,
  priority INT
  --   CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES City(id),
  --   CONSTRAINT fk_phones FOREIGN KEY (phones_numbers) REFERENCES PhoneNumbers(id)
);

-- Bonus table with a foreign key reference to a Partners table (assumed, needs to be created)
CREATE TABLE IF NOT EXISTS Bonus (
    id SERIAL4 UNIQUE NOT NULL,
  partner_image TEXT NOT NULL,
  is_taken BOOLEAN,
  partner_id INT NOT NULL,
  date_validity DATE NOT NULL,
  is_published BOOLEAN,
  is_expired BOOLEAN,
  has_feedback BOOLEAN,
  partner_url TEXT,
  state TEXT,
  bonus_confines TEXT NOT NULL,
  promocode TEXT NOT NULL,
  cities INT NOT NULL
   -- This should be replaced with a join table for many-to-many relationship with City
  --   CONSTRAINT fk_partner FOREIGN KEY (partner_id) REFERENCES Partners(id) -- Assuming a Partners table exists
);

INSERT INTO Bonus (partner_image, is_taken, partner_id, date_validity, is_published, is_expired, has_feedback, partner_url, state, bonus_confines, promocode, cities)
VALUES 
(
  'https://hackaton.donorsearch.org/media/%D0%BB%D0%BE%D0%B3%D0%BE_3_%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8_-_%D0%9E%D0%BB%D1%8C%D0%B3%D0%B0_%D0%9C%D0%BE%D0%B8%D1%81%D0%B5%D0%B5%D0%BD%D0%BA%D0%BE.png.177.44618395303326x150_q75_box-0%2C0%2C2418%2C2044_crop_detail_model-Bonus.png',
  false,
  8,
  '2024-12-31',
  true,
  false,
  false,
  NULL,
  NULL,
  'No confines', -- Replace with appropriate value
  'TestingString1', -- Replace with appropriate value
  0 -- Replace with appropriate value
),
(
  'https://hackaton.donorsearch.org/media/%D0%BB%D0%BE%D0%B3%D0%BE_3_%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8_-_%D0%9E%D0%BB%D1%8C%D0%B3%D0%B0_%D0%9C%D0%BE%D0%B8%D1%81%D0%B5%D0%B5%D0%BD%D0%BA%D0%BE.png.177.44618395303326x150_q75_box-0%2C0%2C2418%2C2044_crop_detail_model-Bonus.png',
  false,
  15,
  '2025-12-31',
  true,
  false,
  false,
  NULL,
  NULL,
  'Half confined', -- Replace with appropriate value
  'TestingString2', -- Replace with appropriate value
  0 -- Replace with appropriate value
),
(
  'https://hackaton.donorsearch.org/media/%D0%BB%D0%BE%D0%B3%D0%BE_3_%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8_-_%D0%9E%D0%BB%D1%8C%D0%B3%D0%B0_%D0%9C%D0%BE%D0%B8%D1%81%D0%B5%D0%B5%D0%BD%D0%BA%D0%BE.png.177.44618395303326x150_q75_box-0%2C0%2C2418%2C2044_crop_detail_model-Bonus.png',
  false,
  19,
  '2023-12-31',
  true,
  false,
  false,
  NULL,
  NULL,
  'No confines', -- Replace with appropriate value
  'TestingString3', -- Replace with appropriate value
  0 -- Replace with appropriate value
),
(
  'https://hackaton.donorsearch.org/media/color_big.png.150.0x150_q75_box-0%2C0%2C500%2C500_crop_detail_model-Bonus.png',
  false,
  10,
  '2029-12-31',
  true,
  false,
  false,
  NULL,
  NULL,
  'Fully confined', -- Replace with appropriate value
  'TestingString4', -- Replace with appropriate value
  0 -- Replace with appropriate value
);


-- Additional tables and foreign key references need to be defined based on the specific relationships.
-- For example, creating join tables for many-to-many relationships between Events and "User", "User" and Cities, etc.

-- Join table for many-to-many relationship between Bonus and City
CREATE TABLE IF NOT EXISTS BonusCity (
  bonus_id INT,
  city_id INT
  --   CONSTRAINT fk_bonuses PRIMARY KEY (bonus_id, city_id),
  --   CONSTRAINT fk_bonues FOREIGN KEY (bonus_id) REFERENCES Bonus(id),
  --   CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES City(id)
);

-- Event table modifications: assuming relationships to TimeSlots, "User", and Reports
CREATE TABLE IF NOT EXISTS "Event" (
  id SERIAL4 UNIQUE NOT NULL,
  city_id INT NOT NULL,
  -- Removed columns implying many-to-many relationships for normalization
  author_image TEXT NOT NULL,
  author TEXT NOT NULL,
  category TEXT NOT NULL,
  type TEXT NOT NULL,
  individual_partners INT, -- Assuming this references a Partners table
  unity_partners INT, -- Assuming this references a Partners table
  donors_requirements INT, -- Assuming this is a reference to a requirements table or field
  blood_station INT NOT NULL
  --   CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES City(id),
  --   CONSTRAINT fk_blood_station FOREIGN KEY (blood_station) REFERENCES BloodStation(id)
);

-- Join table for Events and TimeSlots (assuming TimeSlots table exists)
CREATE TABLE IF NOT EXISTS EventTimeSlots (
  event_id INT,
  time_slot_id INT,
  PRIMARY KEY (event_id, time_slot_id)
  --   CONSTRAINT fk_event_id FOREIGN KEY (event_id) REFERENCES "Event"(id),
  --   CONSTRAINT fk_time_slot FOREIGN KEY (time_slot_id) REFERENCES TimeSlots(id) -- TimeSlots table needs to be defined
);

CREATE TABLE IF NOT EXISTS "User" (
  id INT PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT,
  middle_name TEXT,
  birth_date DATE,
  city_id INT,
  blood_group TEXT,
  hash_password TEXT
  --   CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES City(id),
  --   CONSTRAINT fk_donation FOREIGN KEY (donation_agg_id) REFERENCES DonationsAggregate(id), -- Assuming a DonationsAggregate table exists
  --   CONSTRAINT fk_photo FOREIGN KEY (photo_id) REFERENCES Photos(id), -- Assuming a Photos table exists
  --   CONSTRAINT fk_donor FOREIGN KEY (donor_status_id) REFERENCES DonorStatus(id) -- Assuming a DonorStatus table exists
);

-- Example of a join table for "User" and Events for the many-to-many relationship
CREATE TABLE IF NOT EXISTS UserEvents (
  user_id INT,
  event_id INT
  --   CONSTRAINT fk_users PRIMARY KEY (user_id, event_id),
  --   CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES "User"(id),
  --   CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES Event(id)
);

-- Example of a join table for "User" and Organizations for the many-to-many relationship
CREATE TABLE IF NOT EXISTS UserOrganizations (
  user_id INT,
  organization_id INT,
  PRIMARY KEY (user_id, organization_id)
  --   CONSTRAINT fk_usr FOREIGN KEY (user_id) REFERENCES "User"(id),
  --   CONSTRAINT fk_organization FOREIGN KEY (organization_id) REFERENCES Organizations(id) -- Assuming an Organizations table exists
);

-- Join table for Events and "User" (Event Participants)
CREATE TABLE IF NOT EXISTS EventParticipants (
  event_id INT,
  user_id INT,
  PRIMARY KEY (event_id, user_id)
  --   CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES "Event"(id),
  --   CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES "User"(id)
);


-- Join table for Events and Reports
CREATE TABLE IF NOT EXISTS EventReports (
  event_id INT,
  report_id INT,
  PRIMARY KEY (event_id, report_id)
  --   CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES "Event"(id),
  --   CONSTRAINT fk_report FOREIGN KEY (report_id) REFERENCES Reports(id)
);

CREATE SEQUENCE IF NOT EXISTS donation_sequence;
-- Donation and DonationPlan tables were defined but might need foreign key adjustments based on actual relationships.
CREATE TABLE IF NOT EXISTS Donation (
    id INT4 PRIMARY KEY DEFAULT nextval('donation_sequence'),
    blood_station_id INT,
    image_id TEXT,
    city_id INT NOT NULL,
    donate_at TEXT,
    blood_class TEXT,
    payment_type TEXT,
    with_image BOOLEAN,
    user_id INT NOT NULL
);


CREATE SEQUENCE IF NOT EXISTS donation_plan_sequence;

CREATE TABLE IF NOT EXISTS DonationPlan (
  id INT4 PRIMARY KEY DEFAULT nextval('donation_plan_sequence'),
    blood_station_id INT,
    city_id INT NOT NULL,
    donate_at TEXT,
    blood_class TEXT,
    payment_type TEXT,
    user_id INT NOT NULL
);

INSERT INTO City (id, title) VALUES (1, 'Москва') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (2, 'Санкт-Петербург') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (89, 'Новосибирск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (50, 'Казань') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (49443, 'Киев') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (17, 'Барнаул') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (62, 'Краснодар') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (138, 'Уфа') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (85, 'Нижний Новгород') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (49441, 'Харьков') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (49460, 'Днепропетровск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (94, 'Омск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (63486, 'Ташкент') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (39, 'Екатеринбург') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (56, 'Киров') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (100, 'Пермь') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (156, 'Ярославль') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (49442, 'Одесса') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (49470, 'Львов') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (55788, 'Минск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (5, 'Волгоград') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (140, 'Хабаровск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (15, 'Астрахань') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (34, 'Воронеж') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (63, 'Красноярск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (75, 'Махачкала') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (87, 'Новокузнецк') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (121, 'Сочи') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (49458, 'Симферополь') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (49459, 'Запорожье') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (45, 'Иваново') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (51, 'Калининград') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (54, 'Кемерово') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (108, 'Ростов-на-Дону') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (111, 'Рязань') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (114, 'Саратов') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (133, 'Тула') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (144, 'Чебоксары') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (145, 'Челябинск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (2239, 'Искитим') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (55790, 'Гомель') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (57728, 'Алма-Ата') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (60630, 'Тбилиси') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (6, 'Северодвинск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (10, 'Альметьевск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (16, 'Балашиха') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (24, 'Братск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (29, 'Владивосток') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (46, 'Ижевск') ON CONFLICT DO NOTHING;
INSERT INTO City (id, title) VALUES (47, 'Иркутск') ON CONFLICT DO NOTHING;