--
-- DonorSearch API.
-- Prepared SQL queries for 'EventList' definition.
--


--
-- SELECT template for table `EventList`
--
SELECT `id`, `name`, `description`, `city`, `city_id`, `author`, `type`, `object_id`, `start_date`, `end_date`, `address`, `joined_users`, `category`, `joined_count`, `available_slots`, `individual_partners`, `unity_partners`, `blood_station` FROM `EventList` WHERE 1;

--
-- INSERT template for table `EventList`
--
INSERT INTO `EventList`(`id`, `name`, `description`, `city`, `city_id`, `author`, `type`, `object_id`, `start_date`, `end_date`, `address`, `joined_users`, `category`, `joined_count`, `available_slots`, `individual_partners`, `unity_partners`, `blood_station`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `EventList`
--
UPDATE `EventList` SET `id` = ?, `name` = ?, `description` = ?, `city` = ?, `city_id` = ?, `author` = ?, `type` = ?, `object_id` = ?, `start_date` = ?, `end_date` = ?, `address` = ?, `joined_users` = ?, `category` = ?, `joined_count` = ?, `available_slots` = ?, `individual_partners` = ?, `unity_partners` = ?, `blood_station` = ? WHERE 1;

--
-- DELETE template for table `EventList`
--
DELETE FROM `EventList` WHERE 0;

