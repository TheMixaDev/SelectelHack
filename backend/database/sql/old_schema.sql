
CREATE TABLE IF NOT EXISTS PhoneNumbers (
  id SERIAL PRIMARY KEY,
  phone TEXT NOT NULL,
  comment TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS BloodStation (
  id SERIAL PRIMARY KEY,
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
);

CREATE TABLE IF NOT EXISTS Bonus (
  id SERIAL PRIMARY KEY,
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
  cities INT NOT NULL -- Many to many to city
);

CREATE TABLE IF NOT EXISTS City (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  region_id INT NOT NULL,
  region TEXT NOT NULL,
  country TEXT NOT NULL,
  priority INT,
  lat FLOAT NOT NULL,
  lng FLOAT NOT NULL
);


CREATE TABLE IF NOT EXISTS "Event" (
  id SERIAL PRIMARY KEY,
  city_id INT NOT NULL,
  time_slots INT NOT NULL, -- Many-to-many
  joined_users INT NOT NULL, -- Many-to-many
  reports INT NOT NULL, -- Many-to-many
  author_image TEXT NOT NULL, -- Организация
  author TEXT NOT NULL, -- Организация
  category TEXT NOT NULL,
  type TEXT NOT NULL,
  individual_partners INT,
  unity_partners INT,
  donors_requirements INT,
  blood_station INT NOT NULL, -- one-to-one
  available_slots INT NOT NULL,
  socialnetworks INT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  address TEXT,
  email TEXT,
  website TEXT,
  phone TEXT,
  joined_count INT ,
  is_private BOOLEAN,
  content_type INT NOT NULL -- Make as table
  reports INT NOT NULL, -- Many-to-many
);

CREATE TABLE IF NOT EXISTS EventReport (
  id SERIAL PRIMARY KEY,
  images JSON NOT NULL,
  video_urls JSON NOT NULL,
  massmedia_about TEXT 
);


-- TODO: Do something with this
CREATE TABLE IF NOT EXISTS EventTimeSlots (
  id INT,
  joined_count INT NOT NULL,
  date DATE NOT NULL,
  start_time TEXT NOT NULL,
  end_time TEXT NOT NULL,
  count INT  
);

-- TODO: Do something with this
CREATE TABLE IF NOT EXISTS IndividualEventPartner (
  id SERIAL PRIMARY KEY,
  image TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  name TEXT NOT NULL,
  url TEXT NOT NULL,
  cropping TEXT,
  event INT NOT NULL
);


-- TODO: Do something with this
CREATE TABLE IF NOT EXISTS OrganizationPartner (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  image TEXT NOT NULL,
);

CREATE TABLE IF NOT EXISTS DonationAgg(
  id SERIAL PRIMARY KEY,
)
	
CREATE TABLE IF NOT EXISTS DonorStatus (
  id SERIAL PRIMARY KEY,
)

CREATE TABLE IF NOT EXISTS "User" (
  id SERIAL PRIMARY KEY,
  date_joined TIMESTAMP,
  username TEXT NOT NULL UNIQUE,
  first_name TEXT NOT NULL,
  last_name TEXT,
  middle_name TEXT,
  maiden_name TEXT,
  birth_date DATE,
  gender TEXT,
  email TEXT,
  phone TEXT UNIQUE,
  login_via_phone BOOLEAN,
  about TEXT,
  city_id INT,
  -- city TEXT, -- add to resp object
  is_pin_20 INT,
  is_pin_100 INT,
  donation_agg_id INT, -- one-to-one
  socials JSON,
  -- photo TEXT, -- add to resp object
  photo_id INT,
  next_donation_date DATE,
  next_donation JSON,
  blood_group TEXT,
  hash_password TEXT NOT NULL,
  is_email_verified BOOLEAN,
  is_phone_verified BOOLEAN,
  email_reconfirmed_at TIMESTAMP,
  phone_reconfirmed_at TIMESTAMP,
  start_donor_year TIMESTAMP,
  referral_code TEXT,
  parent_user INT,
  invited_users JSON,
  donor_status_id INT, -- one-to-one
  managed_organizations TEXT,
  joined_events INT,
  joined_organizations INT,
  donor_certificate BOOLEAN 
);

CREATE TABLE IF NOT EXISTS Donation (
    id SERIAL PRIMARY KEY,
    blood_station_id INT,
    image_id INT,
    city_id INT NOT NULL,
    has_reply BOOLEAN,
    reply_viewed BOOLEAN,
    allowed_modify BOOLEAN,
    feedback TEXT,
    favorite_blood_station_id INT,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    status TEXT NOT NULL,
    reject_reason TEXT,
    donate_at DATE,
    blood_class TEXT,
    payment_type TEXT,
    is_out BOOLEAN,
    volume FLOAT,
    payment_cost FLOAT,
    on_moderation_date TIMESTAMP WITH TIME ZONE,
    with_image BOOLEAN,
    created_using_ocr BOOLEAN,
    user_id INT NOT NULL
);


CREATE TABLE IF NOT EXISTS DonationPlan (
    id SERIAL PRIMARY KEY,
    event TEXT NOT NULL,
    blood_station_id INT,
    city_id INT,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    object_id INT,
    blood_class TEXT,
    plan_date DATE NOT NULL,
    payment_type TEXT,
    status TEXT,
    is_out BOOLEAN,
    user_id INT NOT NULL,
    content_type INT,
    donation INT
);
