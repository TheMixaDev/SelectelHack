
--
-- Table structure for table AddressNeed generated from model 'AddressNeed'
--

CREATE TABLE IF NOT EXISTS AddressNeed (
  id SERIAL PRIMARY KEY,
  author TEXT NOT NULL,
  total_joined_count INT NOT NULL,
  image TEXT NOT NULL,
  blood_station_id INT NOT NULL,
  blood_station TEXT NOT NULL,
  time_slots JSON NOT NULL,
  joined_users JSON NOT NULL,
  object_id INT ,
  o_plus TEXT,
  o_minus TEXT,
  a_plus TEXT,
  a_minus TEXT,
  b_plus TEXT,
  b_minus TEXT,
  ab_plus TEXT,
  ab_minus TEXT,
  blood_class TEXT,
  last_date DATE NOT NULL,
  required_donors_count INT  NOT NULL,
  birth_date DATE,
  last_name VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  middle_name VARCHAR(255),
  _image TEXT,
  cropping VARCHAR(255),
  search_reason TEXT NOT NULL,
  status TEXT,
  time_by_blood_station INT,
  created_at TIMESTAMP NOT NULL,
  content_type INT 
);

--
-- Table structure for table AddressNeedJoinedUserForBase generated from model 'AddressNeedJoinedUserForBase'
--

CREATE TABLE IF NOT EXISTS AddressNeedJoinedUserForBase (
  id SERIAL PRIMARY KEY,
  "user" TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  timeslot INT NOT NULL
);

--
-- Table structure for table AddressNeedSerializerDetail generated from model 'AddressNeedSerializerDetail'
--

CREATE TABLE IF NOT EXISTS AddressNeedSerializerDetail (
  id SERIAL PRIMARY KEY,
  author TEXT NOT NULL,
  total_joined_count INT NOT NULL,
  image TEXT NOT NULL,
  blood_station_id INT NOT NULL,
  blood_station TEXT NOT NULL,
  time_slots JSON NOT NULL,
  joined_users JSON NOT NULL,
  user_status TEXT NOT NULL,
  requested_blood_type JSON NOT NULL,
  time_by_blood_station BOOLEAN DEFAULT true,
  object_id INT ,
  o_plus TEXT,
  o_minus TEXT,
  a_plus TEXT,
  a_minus TEXT,
  b_plus TEXT,
  b_minus TEXT,
  ab_plus TEXT,
  ab_minus TEXT,
  blood_class TEXT NOT NULL,
  last_date DATE NOT NULL,
  required_donors_count INT  NOT NULL,
  birth_date DATE NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  middle_name VARCHAR(255),
  _image TEXT,
  cropping VARCHAR(255),
  search_reason TEXT NOT NULL,
  status TEXT,
  created_at TIMESTAMP NOT NULL,
  content_type INT 
);

--
-- Table structure for table AddressNeedTimeSlotForBase generated from model 'AddressNeedTimeSlotForBase'
--

CREATE TABLE IF NOT EXISTS AddressNeedTimeSlotForBase (
  id SERIAL PRIMARY KEY,
  joined_count INT NOT NULL,
  date DATE NOT NULL
);

--
-- Table structure for table AllNamesBloodStation generated from model 'AllNamesBloodStation'
--

CREATE TABLE IF NOT EXISTS AllNamesBloodStation (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);

--
-- Table structure for table BloodStationAddress generated from model 'BloodStationAddress'
--

CREATE TABLE IF NOT EXISTS BloodStationAddress (
  address VARCHAR(255) 
);

--
-- Table structure for table BloodStationPhone generated from model 'BloodStationPhone'
--

CREATE TABLE IF NOT EXISTS BloodStationPhone (
  id SERIAL PRIMARY KEY,
  phone VARCHAR(25) NOT NULL,
  comment TEXT 
);

--
-- Table structure for table BloodStationSchedule generated from model 'BloodStationSchedule'
--

CREATE TABLE IF NOT EXISTS BloodStationSchedule (
  id SERIAL PRIMARY KEY,
  dow TEXT NOT NULL,
  start TEXT NOT NULL,
  "end" TEXT NOT NULL
);

--
-- Table structure for table BloodStationSearch generated from model 'BloodStationSearch'
--

CREATE TABLE IF NOT EXISTS BloodStationSearch (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  address TEXT NOT NULL,
  lat TEXT NOT NULL,
  lng TEXT NOT NULL,
  city TEXT NOT NULL,
  city_id INT NOT NULL,
  type TEXT NOT NULL,
  priority INT ,
  without_registration INT,
  with_typing INT,
  for_moscow INT,
  closed INT,
  schedule JSON NOT NULL,
  phone_numbers JSON NOT NULL
);

--
-- Table structure for table BloodStationSearchResponse generated from model 'BloodStationSearchResponse'
--

CREATE TABLE IF NOT EXISTS BloodStationSearchResponse (
  blood_stations JSON NOT NULL,
  cities JSON NOT NULL
);

--
-- Table structure for table BloodStationSmall generated from model 'BloodStationSmall'
--

CREATE TABLE IF NOT EXISTS BloodStationSmall (
  id SERIAL PRIMARY KEY,
  city_id INT NOT NULL,
  city TEXT NOT NULL,
  lat TEXT NOT NULL,
  lng TEXT NOT NULL,
  title VARCHAR(255) NOT NULL,
  blood_group TEXT,
  parser_url VARCHAR(200),
  is_get_from_parser INT,
  o_plus TEXT,
  o_minus TEXT,
  a_plus TEXT,
  a_minus TEXT,
  b_plus TEXT,
  b_minus TEXT,
  ab_plus TEXT,
  ab_minus TEXT,
  blood TEXT,
  plasma TEXT,
  platelets TEXT,
  erythrocytes TEXT,
  leukocytes TEXT,
  address VARCHAR(255),
  site VARCHAR(255),
  phones VARCHAR(255),
  email VARCHAR(254),
  worktime VARCHAR(255),
  without_registration INT,
  with_typing INT,
  for_moscow INT,
  closed INT,
  priority INT  
);

--
-- Table structure for table BloodStationWithNeeds generated from model 'BloodStationWithNeeds'
--

CREATE TABLE IF NOT EXISTS BloodStationWithNeeds (
  id SERIAL PRIMARY KEY,
  city_id INT NOT NULL,
  city TEXT NOT NULL,
  has_blood_group TEXT NOT NULL,
  schedule JSON NOT NULL,
  phone_numbers JSON NOT NULL,
  lat TEXT NOT NULL,
  lng TEXT NOT NULL,
  blood_group TEXT NOT NULL,
  blood_status TEXT NOT NULL,
  title VARCHAR(255) NOT NULL,
  parser_url VARCHAR(200),
  is_get_from_parser INT,
  o_plus TEXT,
  o_minus TEXT,
  a_plus TEXT,
  a_minus TEXT,
  b_plus TEXT,
  b_minus TEXT,
  ab_plus TEXT,
  ab_minus TEXT,
  blood TEXT,
  plasma TEXT,
  platelets TEXT,
  erythrocytes TEXT,
  leukocytes TEXT,
  address VARCHAR(255),
  site VARCHAR(255),
  phones VARCHAR(255),
  email VARCHAR(254),
  worktime VARCHAR(255),
  without_registration INT,
  with_typing INT,
  for_moscow INT,
  closed INT,
  priority INT  
);

--
-- Table structure for table BonusDetail generated from model 'BonusDetail'
--

CREATE TABLE IF NOT EXISTS BonusDetail (
  id SERIAL PRIMARY KEY,
  _bonus_image TEXT NOT NULL,
  partner_image TEXT NOT NULL,
  is_taken TEXT NOT NULL,
  bonus_name VARCHAR(48) NOT NULL,
  bonus_description TEXT NOT NULL,
  partner_name VARCHAR(29) NOT NULL,
  date_validity DATE NOT NULL,
  is_published INT,
  is_expired INT NOT NULL,
  has_feedback INT NOT NULL,
  partner_url VARCHAR(200) NOT NULL,
  state TEXT NOT NULL,
  bonus_confines TEXT NOT NULL,
  promocode TEXT NOT NULL,
  w INT NOT NULL,
  h INT NOT NULL,
  cities JSON NOT NULL
);

--
-- Table structure for table BonusList generated from model 'BonusList'
--

CREATE TABLE IF NOT EXISTS BonusList (
  id SERIAL PRIMARY KEY,
  bonus_image TEXT NOT NULL,
  partner_image TEXT NOT NULL,
  is_taken TEXT NOT NULL,
  bonus_name VARCHAR(48) NOT NULL,
  partner_name VARCHAR(29) NOT NULL,
  date_validity DATE NOT NULL,
  is_published INT,
  h INT NOT NULL,
  w INT NOT NULL,
  cities JSON,
  priority INT  
);

--
-- Table structure for table City generated from model 'City'
--

CREATE TABLE IF NOT EXISTS City (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255),
  region_id INT NOT NULL,
  region TEXT NOT NULL,
  country TEXT NOT NULL,
  priority INT ,
  lat TEXT NOT NULL,
  lng TEXT NOT NULL
);

--
-- Table structure for table CitySearch generated from model 'CitySearch'
--

CREATE TABLE IF NOT EXISTS CitySearch (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  address TEXT NOT NULL,
  lat TEXT NOT NULL,
  lng TEXT NOT NULL,
  type TEXT NOT NULL,
  slug VARCHAR(255) 
);

--
-- Table structure for table Country generated from model 'Country'
--

CREATE TABLE IF NOT EXISTS Country (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);

--
-- Table structure for table DonationAgg generated from model 'DonationAgg'
--

CREATE TABLE IF NOT EXISTS DonationAgg (
  count INT ,
  last_donation_at DATE,
  blood INT ,
  plasma INT ,
  platelets INT ,
  erythrocytes INT ,
  leukocytes INT ,
  unconfirmed_donations INT  
);

--
-- Table structure for table DonationAggTop generated from model 'DonationAggTop'
--

CREATE TABLE IF NOT EXISTS DonationAggTop (
  count INT ,
  last_donation_at DATE,
  blood INT ,
  plasma INT ,
  platelets INT ,
  erythrocytes INT ,
  leukocytes INT ,
  unconfirmed_donations INT ,
  count_year INT ,
  blood_year INT ,
  plasma_year INT ,
  platelets_year INT ,
  erythrocytes_year INT ,
  leukocytes_year INT  
);

--
-- Table structure for table DonationAggTopLight generated from model 'DonationAggTopLight'
--

CREATE TABLE IF NOT EXISTS DonationAggTopLight (
  count INT ,
  blood INT ,
  plasma INT ,
  platelets INT ,
  erythrocytes INT ,
  leukocytes INT  
);

--
-- Table structure for table DonorStatus generated from model 'DonorStatus'
--

CREATE TABLE IF NOT EXISTS DonorStatus (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  donations_count INT  NOT NULL,
  background_color VARCHAR(100),
  text_color VARCHAR(100) 
);

--
-- Table structure for table DonorsRequirement generated from model 'DonorsRequirement'
--

CREATE TABLE IF NOT EXISTS DonorsRequirement (
  id SERIAL PRIMARY KEY,
  requirement VARCHAR(255) NOT NULL,
  event INT NOT NULL
);

--
-- Table structure for table EmailRegistration generated from model 'EmailRegistration'
--

CREATE TABLE IF NOT EXISTS EmailRegistration (
  email TEXT NOT NULL,
  password TEXT NOT NULL,
  first_name TEXT NOT NULL,
  tag TEXT 
);

--
-- Table structure for table EmailVerificationSerialzier generated from model 'EmailVerificationSerialzier'
--

CREATE TABLE IF NOT EXISTS EmailVerificationSerialzier (
  code INT NOT NULL,
  user_id INT NOT NULL,
  email TEXT NOT NULL
);

--
-- Table structure for table EventBase generated from model 'EventBase'
--

CREATE TABLE IF NOT EXISTS EventBase (
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  city_id INT NOT NULL,
  time_slots JSON NOT NULL,
  joined_users TEXT NOT NULL,
  reports JSON NOT NULL,
  author TEXT NOT NULL,
  category TEXT NOT NULL,
  user_status TEXT NOT NULL,
  type TEXT NOT NULL,
  individual_partners JSON NOT NULL,
  unity_partners JSON NOT NULL,
  donors_requirements JSON NOT NULL,
  blood_station TEXT NOT NULL,
  available_slots TEXT NOT NULL,
  socialnetworks JSON NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  object_id INT  NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  address VARCHAR(255),
  email VARCHAR(254),
  website VARCHAR(200),
  phone VARCHAR(25),
  joined_count INT ,
  is_private INT,
  content_type INT NOT NULL
);

--
-- Table structure for table EventCategory generated from model 'EventCategory'
--

CREATE TABLE IF NOT EXISTS EventCategory (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

--
-- Table structure for table EventList generated from model 'EventList'
--

CREATE TABLE IF NOT EXISTS EventList (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  city TEXT NOT NULL,
  city_id INT NOT NULL,
  author TEXT NOT NULL,
  type TEXT NOT NULL,
  object_id INT  NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  address VARCHAR(255),
  joined_users TEXT NOT NULL,
  category TEXT NOT NULL,
  joined_count INT ,
  available_slots TEXT NOT NULL,
  individual_partners JSON NOT NULL,
  unity_partners JSON NOT NULL,
  blood_station TEXT NOT NULL
);

--
-- Table structure for table EventReport generated from model 'EventReport'
--

CREATE TABLE IF NOT EXISTS EventReport (
  id SERIAL PRIMARY KEY,
  images JSON NOT NULL,
  video_urls JSON NOT NULL,
  massmedia_about TEXT 
);

--
-- Table structure for table EventReportImages generated from model 'EventReportImages'
--

CREATE TABLE IF NOT EXISTS EventReportImages (
  id INT,
  image TEXT 
);

--
-- Table structure for table EventReportVideoURL generated from model 'EventReportVideoURL'
--

CREATE TABLE IF NOT EXISTS EventReportVideoURL (
  id INT,
  url TEXT 
);

--
-- Table structure for table EventSocialNetworks generated from model 'EventSocialNetworks'
--

CREATE TABLE IF NOT EXISTS EventSocialNetworks (
  id SERIAL PRIMARY KEY,
  social TEXT NOT NULL,
  url VARCHAR(200) NOT NULL
);

--
-- Table structure for table EventTimeSlotForBase generated from model 'EventTimeSlotForBase'
--

CREATE TABLE IF NOT EXISTS EventTimeSlotForBase (
  id INT,
  joined_count INT NOT NULL,
  date DATE NOT NULL,
  start_time TEXT NOT NULL,
  end_time TEXT NOT NULL,
  count INT  
);

--
-- Table structure for table IndividualEventPartner generated from model 'IndividualEventPartner'
--

CREATE TABLE IF NOT EXISTS IndividualEventPartner (
  id SERIAL PRIMARY KEY,
  image TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  name VARCHAR(255) NOT NULL,
  url VARCHAR(200) NOT NULL,
  cropping VARCHAR(255),
  event INT NOT NULL
);

--
-- Table structure for table InlinePicture generated from model 'InlinePicture'
--

CREATE TABLE IF NOT EXISTS InlinePicture (
  image TEXT NOT NULL
);

--
-- Table structure for table MainPageDonationAggTop generated from model 'MainPageDonationAggTop'
--

CREATE TABLE IF NOT EXISTS MainPageDonationAggTop (
  count INT ,
  last_donation_at DATE,
  blood INT ,
  plasma INT ,
  platelets INT ,
  erythrocytes INT ,
  leukocytes INT ,
  count_year INT ,
  blood_year INT ,
  plasma_year INT ,
  platelets_year INT ,
  erythrocytes_year INT ,
  leukocytes_year INT  
);

--
-- Table structure for table MapBloodStationSearch generated from model 'MapBloodStationSearch'
--

CREATE TABLE IF NOT EXISTS MapBloodStationSearch (
  id SERIAL PRIMARY KEY,
  city_id INT NOT NULL,
  city TEXT NOT NULL,
  has_blood_group TEXT NOT NULL,
  schedule JSON NOT NULL,
  phone_numbers JSON NOT NULL,
  lat TEXT NOT NULL,
  lng TEXT NOT NULL,
  blood_group TEXT NOT NULL,
  blood_status TEXT NOT NULL,
  type TEXT NOT NULL,
  address TEXT NOT NULL,
  title VARCHAR(255) NOT NULL,
  parser_url VARCHAR(200),
  is_get_from_parser INT,
  o_plus TEXT,
  o_minus TEXT,
  a_plus TEXT,
  a_minus TEXT,
  b_plus TEXT,
  b_minus TEXT,
  ab_plus TEXT,
  ab_minus TEXT,
  blood TEXT,
  plasma TEXT,
  platelets TEXT,
  erythrocytes TEXT,
  leukocytes TEXT,
  site VARCHAR(255),
  phones VARCHAR(255),
  email VARCHAR(254),
  worktime VARCHAR(255),
  without_registration INT,
  with_typing INT,
  for_moscow INT,
  closed INT,
  priority INT  
);

--
-- Table structure for table OrganizationPartner generated from model 'OrganizationPartner'
--

CREATE TABLE IF NOT EXISTS OrganizationPartner (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  image TEXT NOT NULL,
  _image TEXT 
);

--
-- Table structure for table PaginatedAddressNeedList generated from model 'PaginatedAddressNeedList'
--

CREATE TABLE IF NOT EXISTS PaginatedAddressNeedList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedAllNamesBloodStationList generated from model 'PaginatedAllNamesBloodStationList'
--

CREATE TABLE IF NOT EXISTS PaginatedAllNamesBloodStationList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedBloodStationWithNeedsList generated from model 'PaginatedBloodStationWithNeedsList'
--

CREATE TABLE IF NOT EXISTS PaginatedBloodStationWithNeedsList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedBonusListList generated from model 'PaginatedBonusListList'
--

CREATE TABLE IF NOT EXISTS PaginatedBonusListList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedCityList generated from model 'PaginatedCityList'
--

CREATE TABLE IF NOT EXISTS PaginatedCityList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedCountryList generated from model 'PaginatedCountryList'
--

CREATE TABLE IF NOT EXISTS PaginatedCountryList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedEventListList generated from model 'PaginatedEventListList'
--

CREATE TABLE IF NOT EXISTS PaginatedEventListList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedMapBloodStationSearchList generated from model 'PaginatedMapBloodStationSearchList'
--

CREATE TABLE IF NOT EXISTS PaginatedMapBloodStationSearchList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedPlannedUserList generated from model 'PaginatedPlannedUserList'
--

CREATE TABLE IF NOT EXISTS PaginatedPlannedUserList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedRegionList generated from model 'PaginatedRegionList'
--

CREATE TABLE IF NOT EXISTS PaginatedRegionList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedSelectedBSSerialzierList generated from model 'PaginatedSelectedBSSerialzierList'
--

CREATE TABLE IF NOT EXISTS PaginatedSelectedBSSerialzierList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PaginatedUserTopList generated from model 'PaginatedUserTopList'
--

CREATE TABLE IF NOT EXISTS PaginatedUserTopList (
  count INT,
  next TEXT,
  previous TEXT,
  results JSON 
);

--
-- Table structure for table PhoneRegistration generated from model 'PhoneRegistration'
--

CREATE TABLE IF NOT EXISTS PhoneRegistration (
  phone TEXT NOT NULL,
  password TEXT NOT NULL,
  first_name TEXT NOT NULL,
  tag TEXT 
);

--
-- Table structure for table PhoneVerificationSerialzier generated from model 'PhoneVerificationSerialzier'
--

CREATE TABLE IF NOT EXISTS PhoneVerificationSerialzier (
  code INT NOT NULL,
  user_id INT NOT NULL,
  phone TEXT NOT NULL
);

--
-- Table structure for table Picture generated from model 'Picture'
--

CREATE TABLE IF NOT EXISTS Picture (
  id SERIAL PRIMARY KEY,
  image TEXT NOT NULL,
  date_added TIMESTAMP NOT NULL
);

--
-- Table structure for table PlannedUser generated from model 'PlannedUser'
--

CREATE TABLE IF NOT EXISTS PlannedUser (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  middle_name VARCHAR(255),
  photo TEXT NOT NULL,
  legacy_avatar TEXT NOT NULL
);

--
-- Table structure for table Region generated from model 'Region'
--

CREATE TABLE IF NOT EXISTS Region (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);

--
-- Table structure for table Registration generated from model 'Registration'
--

CREATE TABLE IF NOT EXISTS Registration (
  email TEXT NOT NULL,
  password TEXT NOT NULL,
  first_name TEXT NOT NULL,
  tag TEXT,
  phone TEXT NOT NULL
);

--
-- Table structure for table ResetPassword generated from model 'ResetPassword'
--

CREATE TABLE IF NOT EXISTS ResetPassword (
  token TEXT NOT NULL,
  password TEXT NOT NULL
);

--
-- Table structure for table SelectedBSSerialzier generated from model 'SelectedBSSerialzier'
--

CREATE TABLE IF NOT EXISTS SelectedBSSerialzier (
  id SERIAL PRIMARY KEY,
  city_id INT NOT NULL,
  city TEXT NOT NULL,
  lat TEXT NOT NULL,
  lng TEXT NOT NULL,
  schedule JSON NOT NULL,
  phone_numbers JSON NOT NULL,
  blood_group TEXT NOT NULL,
  status TEXT NOT NULL,
  title VARCHAR(255) NOT NULL,
  parser_url VARCHAR(200),
  is_get_from_parser INT,
  o_plus TEXT,
  o_minus TEXT,
  a_plus TEXT,
  a_minus TEXT,
  b_plus TEXT,
  b_minus TEXT,
  ab_plus TEXT,
  ab_minus TEXT,
  blood TEXT,
  plasma TEXT,
  platelets TEXT,
  erythrocytes TEXT,
  leukocytes TEXT,
  address VARCHAR(255),
  site VARCHAR(255),
  phones VARCHAR(255),
  email VARCHAR(254),
  worktime VARCHAR(255),
  without_registration INT,
  with_typing INT,
  for_moscow INT,
  closed INT,
  priority INT  
);

--
-- Table structure for table SimpleUserSocialAuth generated from model 'SimpleUserSocialAuth'
--

CREATE TABLE IF NOT EXISTS SimpleUserSocialAuth (
  id SERIAL PRIMARY KEY,
  provider TEXT NOT NULL,
  uid TEXT NOT NULL,
  is_public INT,
  email TEXT NOT NULL
);

--
-- Table structure for table Top100Response generated from model 'Top100Response'
--

CREATE TABLE IF NOT EXISTS Top100Response (
  items JSON NOT NULL,
  user_info TEXT NOT NULL
);

--
-- Table structure for table Top100User generated from model 'Top100User'
--

CREATE TABLE IF NOT EXISTS Top100User (
  id SERIAL PRIMARY KEY,
  photo TEXT NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  donation_agg TEXT NOT NULL,
  blood_group TEXT NOT NULL,
  bs_count TEXT NOT NULL,
  city TEXT NOT NULL,
  donor_status TEXT NOT NULL,
  is_request_user INT NOT NULL,
  count_temp TEXT NOT NULL,
  count_blood_temp TEXT NOT NULL,
  count_plasma_temp TEXT NOT NULL,
  count_leukocytes_temp TEXT NOT NULL,
  count_erythrocytes_temp TEXT NOT NULL,
  count_platelets_temp TEXT NOT NULL
);

--
-- Table structure for table TopUsers generated from model 'TopUsers'
--

CREATE TABLE IF NOT EXISTS TopUsers (
  id SERIAL PRIMARY KEY,
  photo TEXT NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  donation_agg TEXT NOT NULL,
  blood_group TEXT NOT NULL,
  bs_count TEXT NOT NULL,
  city TEXT NOT NULL,
  donor_status TEXT NOT NULL,
  is_request_user INT NOT NULL
);

--
-- Table structure for table UnityEventPartner generated from model 'UnityEventPartner'
--

CREATE TABLE IF NOT EXISTS UnityEventPartner (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  image TEXT NOT NULL
);

--
-- Table structure for table User generated from model 'User'
--

CREATE TABLE IF NOT EXISTS "User" (
  id SERIAL PRIMARY KEY,
  date_joined TIMESTAMP NOT NULL,
  username VARCHAR(50) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  middle_name VARCHAR(255),
  maiden_name VARCHAR(255),
  birth_date DATE,
  gender TEXT,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,
  login_via_phone INT,
  about VARCHAR(130),
  city_id INT NOT NULL,
  city TEXT NOT NULL,
  is_pin_20 INT,
  is_pin_100 INT,
  donation_agg TEXT NOT NULL,
  socials JSON NOT NULL,
  photo TEXT NOT NULL,
  photo_id INT,
  next_donation_date TEXT NOT NULL,
  next_donation TEXT NOT NULL,
  blood_group TEXT NOT NULL,
  has_password TEXT NOT NULL,
  is_email_verified TEXT NOT NULL,
  is_phone_verified TEXT NOT NULL,
  email_reconfirmed_at TIMESTAMP,
  phone_reconfirmed_at TIMESTAMP,
  legacy_avatar TEXT NOT NULL,
  start_donor_year TEXT NOT NULL,
  referal_code TEXT NOT NULL,
  parent_user TEXT NOT NULL,
  invited_users JSON NOT NULL,
  donor_status TEXT NOT NULL,
  managed_organizations TEXT NOT NULL,
  joined_events TEXT NOT NULL,
  joined_organizations TEXT NOT NULL,
  donor_certificate INT 
);

--
-- Table structure for table UserInfo generated from model 'UserInfo'
--

CREATE TABLE IF NOT EXISTS UserInfo (
  place TEXT NOT NULL
);

--
-- Table structure for table UserTop generated from model 'UserTop'
--

CREATE TABLE IF NOT EXISTS UserTop (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  middle_name VARCHAR(255),
  blood_group TEXT NOT NULL,
  photo TEXT NOT NULL,
  legacy_avatar TEXT NOT NULL,
  honor_donor INT,
  count TEXT NOT NULL,
  count_bs TEXT NOT NULL,
  count_blood TEXT NOT NULL,
  count_plasma TEXT NOT NULL,
  count_leukocytes TEXT NOT NULL,
  count_erythrocytes TEXT NOT NULL,
  count_platelets TEXT NOT NULL,
  donor_status TEXT NOT NULL,
  donation_agg TEXT NOT NULL,
  is_request_user TEXT NOT NULL
);


