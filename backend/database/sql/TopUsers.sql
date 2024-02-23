--
-- DonorSearch API.
-- Prepared SQL queries for 'TopUsers' definition.
--


--
-- SELECT template for table `TopUsers`
--
SELECT `id`, `photo`, `first_name`, `last_name`, `donation_agg`, `blood_group`, `bs_count`, `city`, `donor_status`, `is_request_user` FROM `TopUsers` WHERE 1;

--
-- INSERT template for table `TopUsers`
--
INSERT INTO `TopUsers`(`id`, `photo`, `first_name`, `last_name`, `donation_agg`, `blood_group`, `bs_count`, `city`, `donor_status`, `is_request_user`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `TopUsers`
--
UPDATE `TopUsers` SET `id` = ?, `photo` = ?, `first_name` = ?, `last_name` = ?, `donation_agg` = ?, `blood_group` = ?, `bs_count` = ?, `city` = ?, `donor_status` = ?, `is_request_user` = ? WHERE 1;

--
-- DELETE template for table `TopUsers`
--
DELETE FROM `TopUsers` WHERE 0;

