--
-- DonorSearch API.
-- Prepared SQL queries for 'Top100User' definition.
--


--
-- SELECT template for table `Top100User`
--
SELECT `id`, `photo`, `first_name`, `last_name`, `donation_agg`, `blood_group`, `bs_count`, `city`, `donor_status`, `is_request_user`, `count_temp`, `count_blood_temp`, `count_plasma_temp`, `count_leukocytes_temp`, `count_erythrocytes_temp`, `count_platelets_temp` FROM `Top100User` WHERE 1;

--
-- INSERT template for table `Top100User`
--
INSERT INTO `Top100User`(`id`, `photo`, `first_name`, `last_name`, `donation_agg`, `blood_group`, `bs_count`, `city`, `donor_status`, `is_request_user`, `count_temp`, `count_blood_temp`, `count_plasma_temp`, `count_leukocytes_temp`, `count_erythrocytes_temp`, `count_platelets_temp`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `Top100User`
--
UPDATE `Top100User` SET `id` = ?, `photo` = ?, `first_name` = ?, `last_name` = ?, `donation_agg` = ?, `blood_group` = ?, `bs_count` = ?, `city` = ?, `donor_status` = ?, `is_request_user` = ?, `count_temp` = ?, `count_blood_temp` = ?, `count_plasma_temp` = ?, `count_leukocytes_temp` = ?, `count_erythrocytes_temp` = ?, `count_platelets_temp` = ? WHERE 1;

--
-- DELETE template for table `Top100User`
--
DELETE FROM `Top100User` WHERE 0;

