--
-- DonorSearch API.
-- Prepared SQL queries for 'DonorsRequirement' definition.
--


--
-- SELECT template for table `DonorsRequirement`
--
SELECT `id`, `requirement`, `event` FROM `DonorsRequirement` WHERE 1;

--
-- INSERT template for table `DonorsRequirement`
--
INSERT INTO `DonorsRequirement`(`id`, `requirement`, `event`) VALUES (?, ?, ?);

--
-- UPDATE template for table `DonorsRequirement`
--
UPDATE `DonorsRequirement` SET `id` = ?, `requirement` = ?, `event` = ? WHERE 1;

--
-- DELETE template for table `DonorsRequirement`
--
DELETE FROM `DonorsRequirement` WHERE 0;

