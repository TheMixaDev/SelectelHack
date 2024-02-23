--
-- DonorSearch API.
-- Prepared SQL queries for 'UserTop' definition.
--


--
-- SELECT template for table `UserTop`
--
SELECT `id`, `first_name`, `last_name`, `middle_name`, `blood_group`, `photo`, `legacy_avatar`, `honor_donor`, `count`, `count_bs`, `count_blood`, `count_plasma`, `count_leukocytes`, `count_erythrocytes`, `count_platelets`, `donor_status`, `donation_agg`, `is_request_user` FROM `UserTop` WHERE 1;

--
-- INSERT template for table `UserTop`
--
INSERT INTO `UserTop`(`id`, `first_name`, `last_name`, `middle_name`, `blood_group`, `photo`, `legacy_avatar`, `honor_donor`, `count`, `count_bs`, `count_blood`, `count_plasma`, `count_leukocytes`, `count_erythrocytes`, `count_platelets`, `donor_status`, `donation_agg`, `is_request_user`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `UserTop`
--
UPDATE `UserTop` SET `id` = ?, `first_name` = ?, `last_name` = ?, `middle_name` = ?, `blood_group` = ?, `photo` = ?, `legacy_avatar` = ?, `honor_donor` = ?, `count` = ?, `count_bs` = ?, `count_blood` = ?, `count_plasma` = ?, `count_leukocytes` = ?, `count_erythrocytes` = ?, `count_platelets` = ?, `donor_status` = ?, `donation_agg` = ?, `is_request_user` = ? WHERE 1;

--
-- DELETE template for table `UserTop`
--
DELETE FROM `UserTop` WHERE 0;

