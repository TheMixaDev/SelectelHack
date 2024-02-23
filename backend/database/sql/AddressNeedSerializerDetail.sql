--
-- DonorSearch API.
-- Prepared SQL queries for 'AddressNeedSerializerDetail' definition.
--


--
-- SELECT template for table `AddressNeedSerializerDetail`
--
SELECT `id`, `author`, `total_joined_count`, `image`, `blood_station_id`, `blood_station`, `time_slots`, `joined_users`, `user_status`, `requested_blood_type`, `time_by_blood_station`, `object_id`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood_class`, `last_date`, `required_donors_count`, `birth_date`, `last_name`, `first_name`, `middle_name`, `_image`, `cropping`, `search_reason`, `status`, `created_at`, `content_type` FROM `AddressNeedSerializerDetail` WHERE 1;

--
-- INSERT template for table `AddressNeedSerializerDetail`
--
INSERT INTO `AddressNeedSerializerDetail`(`id`, `author`, `total_joined_count`, `image`, `blood_station_id`, `blood_station`, `time_slots`, `joined_users`, `user_status`, `requested_blood_type`, `time_by_blood_station`, `object_id`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood_class`, `last_date`, `required_donors_count`, `birth_date`, `last_name`, `first_name`, `middle_name`, `_image`, `cropping`, `search_reason`, `status`, `created_at`, `content_type`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `AddressNeedSerializerDetail`
--
UPDATE `AddressNeedSerializerDetail` SET `id` = ?, `author` = ?, `total_joined_count` = ?, `image` = ?, `blood_station_id` = ?, `blood_station` = ?, `time_slots` = ?, `joined_users` = ?, `user_status` = ?, `requested_blood_type` = ?, `time_by_blood_station` = ?, `object_id` = ?, `o_plus` = ?, `o_minus` = ?, `a_plus` = ?, `a_minus` = ?, `b_plus` = ?, `b_minus` = ?, `ab_plus` = ?, `ab_minus` = ?, `blood_class` = ?, `last_date` = ?, `required_donors_count` = ?, `birth_date` = ?, `last_name` = ?, `first_name` = ?, `middle_name` = ?, `_image` = ?, `cropping` = ?, `search_reason` = ?, `status` = ?, `created_at` = ?, `content_type` = ? WHERE 1;

--
-- DELETE template for table `AddressNeedSerializerDetail`
--
DELETE FROM `AddressNeedSerializerDetail` WHERE 0;

