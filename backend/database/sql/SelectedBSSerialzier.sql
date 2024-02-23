--
-- DonorSearch API.
-- Prepared SQL queries for 'SelectedBSSerialzier' definition.
--


--
-- SELECT template for table `SelectedBSSerialzier`
--
SELECT `id`, `city_id`, `city`, `lat`, `lng`, `schedule`, `phone_numbers`, `blood_group`, `status`, `title`, `parser_url`, `is_get_from_parser`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `address`, `site`, `phones`, `email`, `worktime`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `priority` FROM `SelectedBSSerialzier` WHERE 1;

--
-- INSERT template for table `SelectedBSSerialzier`
--
INSERT INTO `SelectedBSSerialzier`(`id`, `city_id`, `city`, `lat`, `lng`, `schedule`, `phone_numbers`, `blood_group`, `status`, `title`, `parser_url`, `is_get_from_parser`, `o_plus`, `o_minus`, `a_plus`, `a_minus`, `b_plus`, `b_minus`, `ab_plus`, `ab_minus`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `address`, `site`, `phones`, `email`, `worktime`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `priority`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `SelectedBSSerialzier`
--
UPDATE `SelectedBSSerialzier` SET `id` = ?, `city_id` = ?, `city` = ?, `lat` = ?, `lng` = ?, `schedule` = ?, `phone_numbers` = ?, `blood_group` = ?, `status` = ?, `title` = ?, `parser_url` = ?, `is_get_from_parser` = ?, `o_plus` = ?, `o_minus` = ?, `a_plus` = ?, `a_minus` = ?, `b_plus` = ?, `b_minus` = ?, `ab_plus` = ?, `ab_minus` = ?, `blood` = ?, `plasma` = ?, `platelets` = ?, `erythrocytes` = ?, `leukocytes` = ?, `address` = ?, `site` = ?, `phones` = ?, `email` = ?, `worktime` = ?, `without_registration` = ?, `with_typing` = ?, `for_moscow` = ?, `closed` = ?, `priority` = ? WHERE 1;

--
-- DELETE template for table `SelectedBSSerialzier`
--
DELETE FROM `SelectedBSSerialzier` WHERE 0;

