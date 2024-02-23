--
-- DonorSearch API.
-- Prepared SQL queries for 'BloodStationWithNeeds' definition.
--


--
-- SELECT template for table `BloodStationWithNeeds`
--
SELECT `id`, `city_id`, `city`, `has_blood_group`, `schedule`, `phone_numbers`, `lat`, `lng`, `blood_group`, `blood_status`, `title`, `parser_url`, `is_get_from_parser`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `address`, `site`, `phones`, `email`, `worktime`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `priority` FROM `BloodStationWithNeeds` WHERE 1;

--
-- INSERT template for table `BloodStationWithNeeds`
--
INSERT INTO `BloodStationWithNeeds`(`id`, `city_id`, `city`, `has_blood_group`, `schedule`, `phone_numbers`, `lat`, `lng`, `blood_group`, `blood_status`, `title`, `parser_url`, `is_get_from_parser`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `address`, `site`, `phones`, `email`, `worktime`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `priority`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `BloodStationWithNeeds`
--
UPDATE `BloodStationWithNeeds` SET `id` = ?, `city_id` = ?, `city` = ?, `has_blood_group` = ?, `schedule` = ?, `phone_numbers` = ?, `lat` = ?, `lng` = ?, `blood_group` = ?, `blood_status` = ?, `title` = ?, `parser_url` = ?, `is_get_from_parser` = ?, `o_plus` = ?, `o_minus` = ?, `a_plus` = ?, `a_minus` = ?, `b_plus` = ?, `b_minus` = ?, `ab_plus` = ?, `ab_minus` = ?, `blood` = ?, `plasma` = ?, `platelets` = ?, `erythrocytes` = ?, `leukocytes` = ?, `address` = ?, `site` = ?, `phones` = ?, `email` = ?, `worktime` = ?, `without_registration` = ?, `with_typing` = ?, `for_moscow` = ?, `closed` = ?, `priority` = ? WHERE 1;

--
-- DELETE template for table `BloodStationWithNeeds`
--
DELETE FROM `BloodStationWithNeeds` WHERE 0;

