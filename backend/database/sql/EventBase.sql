--
-- DonorSearch API.
-- Prepared SQL queries for 'EventBase' definition.
--


--
-- SELECT template for table `EventBase`
--
SELECT `id`, `city`, `city_id`, `time_slots`, `joined_users`, `reports`, `author`, `category`, `user_status`, `type`, `individual_partners`, `unity_partners`, `donors_requirements`, `blood_station`, `available_slots`, `socialnetworks`, `created_at`, `updated_at`, `object_id`, `name`, `description`, `start_date`, `end_date`, `address`, `email`, `website`, `phone`, `joined_count`, `is_private`, `content_type` FROM `EventBase` WHERE 1;

--
-- INSERT template for table `EventBase`
--
INSERT INTO `EventBase`(`id`, `city`, `city_id`, `time_slots`, `joined_users`, `reports`, `author`, `category`, `user_status`, `type`, `individual_partners`, `unity_partners`, `donors_requirements`, `blood_station`, `available_slots`, `socialnetworks`, `created_at`, `updated_at`, `object_id`, `name`, `description`, `start_date`, `end_date`, `address`, `email`, `website`, `phone`, `joined_count`, `is_private`, `content_type`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `EventBase`
--
UPDATE `EventBase` SET `id` = ?, `city` = ?, `city_id` = ?, `time_slots` = ?, `joined_users` = ?, `reports` = ?, `author` = ?, `category` = ?, `user_status` = ?, `type` = ?, `individual_partners` = ?, `unity_partners` = ?, `donors_requirements` = ?, `blood_station` = ?, `available_slots` = ?, `socialnetworks` = ?, `created_at` = ?, `updated_at` = ?, `object_id` = ?, `name` = ?, `description` = ?, `start_date` = ?, `end_date` = ?, `address` = ?, `email` = ?, `website` = ?, `phone` = ?, `joined_count` = ?, `is_private` = ?, `content_type` = ? WHERE 1;

--
-- DELETE template for table `EventBase`
--
DELETE FROM `EventBase` WHERE 0;

