--
-- DonorSearch API.
-- Prepared SQL queries for 'BloodStationSmall' definition.
--


--
-- SELECT template for table `BloodStationSmall`
--
SELECT `id`, `city_id`, `city`, `lat`, `lng`, `title`, `blood_group`, `parser_url`, `is_get_from_parser`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `address`, `site`, `phones`, `email`, `worktime`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `priority` FROM `BloodStationSmall` WHERE 1;

--
-- INSERT template for table `BloodStationSmall`
--
INSERT INTO `BloodStationSmall`(`id`, `city_id`, `city`, `lat`, `lng`, `title`, `blood_group`, `parser_url`, `is_get_from_parser`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `address`, `site`, `phones`, `email`, `worktime`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `priority`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `BloodStationSmall`
--
UPDATE `BloodStationSmall` SET `id` = ?, `city_id` = ?, `city` = ?, `lat` = ?, `lng` = ?, `title` = ?, `blood_group` = ?, `parser_url` = ?, `is_get_from_parser` = ?, `o_plus` = ?, `o_minus` = ?, `a_plus` = ?, `a_minus` = ?, `b_plus` = ?, `b_minus` = ?, `ab_plus` = ?, `ab_minus` = ?, `blood` = ?, `plasma` = ?, `platelets` = ?, `erythrocytes` = ?, `leukocytes` = ?, `address` = ?, `site` = ?, `phones` = ?, `email` = ?, `worktime` = ?, `without_registration` = ?, `with_typing` = ?, `for_moscow` = ?, `closed` = ?, `priority` = ? WHERE 1;

--
-- DELETE template for table `BloodStationSmall`
--
DELETE FROM `BloodStationSmall` WHERE 0;

