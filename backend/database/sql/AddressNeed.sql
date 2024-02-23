--
-- DonorSearch API.
-- Prepared SQL queries for 'AddressNeed' definition.
--


--
-- SELECT template for table `AddressNeed`
--
SELECT `id`, `author`, `total_joined_count`, `image`, `blood_station_id`, `blood_station`, `time_slots`, `joined_users`, `object_id`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood_class`, `last_date`, `required_donors_count`, `birth_date`, `last_name`, `first_name`, `middle_name`, `_image`, `cropping`, `search_reason`, `status`, `time_by_blood_station`, `created_at`, `content_type` FROM `AddressNeed` WHERE 1;

--
-- INSERT template for table `AddressNeed`
--
INSERT INTO `AddressNeed`(`id`, `author`, `total_joined_count`, `image`, `blood_station_id`, `blood_station`, `time_slots`, `joined_users`, `object_id`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood_class`, `last_date`, `required_donors_count`, `birth_date`, `last_name`, `first_name`, `middle_name`, `_image`, `cropping`, `search_reason`, `status`, `time_by_blood_station`, `created_at`, `content_type`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `AddressNeed`
--
UPDATE `AddressNeed` SET `id` = ?, `author` = ?, `total_joined_count` = ?, `image` = ?, `blood_station_id` = ?, `blood_station` = ?, `time_slots` = ?, `joined_users` = ?, `object_id` = ?, `o_plus` = ?, `o_minus` = ?, `a_plus` = ?, `a_minus` = ?, `b_plus` = ?, `b_minus` = ?, `ab_plus` = ?, `ab_minus` = ?, `blood_class` = ?, `last_date` = ?, `required_donors_count` = ?, `birth_date` = ?, `last_name` = ?, `first_name` = ?, `middle_name` = ?, `_image` = ?, `cropping` = ?, `search_reason` = ?, `status` = ?, `time_by_blood_station` = ?, `created_at` = ?, `content_type` = ? WHERE 1;

--
-- DELETE template for table `AddressNeed`
--
DELETE FROM `AddressNeed` WHERE 0;

