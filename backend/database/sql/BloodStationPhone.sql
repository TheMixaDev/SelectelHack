--
-- DonorSearch API.
-- Prepared SQL queries for 'BloodStationPhone' definition.
--


--
-- SELECT template for table `BloodStationPhone`
--
SELECT `id`, `phone`, `comment` FROM `BloodStationPhone` WHERE 1;

--
-- INSERT template for table `BloodStationPhone`
--
INSERT INTO `BloodStationPhone`(`id`, `phone`, `comment`) VALUES (?, ?, ?);

--
-- UPDATE template for table `BloodStationPhone`
--
UPDATE `BloodStationPhone` SET `id` = ?, `phone` = ?, `comment` = ? WHERE 1;

--
-- DELETE template for table `BloodStationPhone`
--
DELETE FROM `BloodStationPhone` WHERE 0;

