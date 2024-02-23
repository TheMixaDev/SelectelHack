--
-- DonorSearch API.
-- Prepared SQL queries for 'BloodStationSchedule' definition.
--


--
-- SELECT template for table `BloodStationSchedule`
--
SELECT `id`, `dow`, `start`, `end` FROM `BloodStationSchedule` WHERE 1;

--
-- INSERT template for table `BloodStationSchedule`
--
INSERT INTO `BloodStationSchedule`(`id`, `dow`, `start`, `end`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `BloodStationSchedule`
--
UPDATE `BloodStationSchedule` SET `id` = ?, `dow` = ?, `start` = ?, `end` = ? WHERE 1;

--
-- DELETE template for table `BloodStationSchedule`
--
DELETE FROM `BloodStationSchedule` WHERE 0;

