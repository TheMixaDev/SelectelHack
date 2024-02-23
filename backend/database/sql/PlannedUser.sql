--
-- DonorSearch API.
-- Prepared SQL queries for 'PlannedUser' definition.
--


--
-- SELECT template for table `PlannedUser`
--
SELECT `id`, `first_name`, `last_name`, `middle_name`, `photo`, `legacy_avatar` FROM `PlannedUser` WHERE 1;

--
-- INSERT template for table `PlannedUser`
--
INSERT INTO `PlannedUser`(`id`, `first_name`, `last_name`, `middle_name`, `photo`, `legacy_avatar`) VALUES (?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `PlannedUser`
--
UPDATE `PlannedUser` SET `id` = ?, `first_name` = ?, `last_name` = ?, `middle_name` = ?, `photo` = ?, `legacy_avatar` = ? WHERE 1;

--
-- DELETE template for table `PlannedUser`
--
DELETE FROM `PlannedUser` WHERE 0;

