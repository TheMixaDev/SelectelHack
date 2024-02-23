--
-- DonorSearch API.
-- Prepared SQL queries for 'MapBloodStationSearch' definition.
--


--
-- SELECT template for table `MapBloodStationSearch`
--
SELECT `id`, `city_id`, `city`, `has_blood_group`, `schedule`, `phone_numbers`, `lat`, `lng`, `blood_group`, `blood_status`, `type`, `address`, `title`, `parser_url`, `is_get_from_parser`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `site`, `phones`, `email`, `worktime`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `priority` FROM `MapBloodStationSearch` WHERE 1;

--
-- INSERT template for table `MapBloodStationSearch`
--
INSERT INTO `MapBloodStationSearch`(`id`, `city_id`, `city`, `has_blood_group`, `schedule`, `phone_numbers`, `lat`, `lng`, `blood_group`, `blood_status`, `type`, `address`, `title`, `parser_url`, `is_get_from_parser`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `site`, `phones`, `email`, `worktime`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `priority`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `MapBloodStationSearch`
--
UPDATE `MapBloodStationSearch` SET `id` = ?, `city_id` = ?, `city` = ?, `has_blood_group` = ?, `schedule` = ?, `phone_numbers` = ?, `lat` = ?, `lng` = ?, `blood_group` = ?, `blood_status` = ?, `type` = ?, `address` = ?, `title` = ?, `parser_url` = ?, `is_get_from_parser` = ?, `o_plus` = ?, `o_minus` = ?, `a_plus` = ?, `a_minus` = ?, `b_plus` = ?, `b_minus` = ?, `ab_plus` = ?, `ab_minus` = ?, `blood` = ?, `plasma` = ?, `platelets` = ?, `erythrocytes` = ?, `leukocytes` = ?, `site` = ?, `phones` = ?, `email` = ?, `worktime` = ?, `without_registration` = ?, `with_typing` = ?, `for_moscow` = ?, `closed` = ?, `priority` = ? WHERE 1;

--
-- DELETE template for table `MapBloodStationSearch`
--
DELETE FROM `MapBloodStationSearch` WHERE 0;

