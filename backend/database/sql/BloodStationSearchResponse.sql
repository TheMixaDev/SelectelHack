--
-- DonorSearch API.
-- Prepared SQL queries for 'BloodStationSearchResponse' definition.
--


--
-- SELECT template for table `BloodStationSearchResponse`
--
SELECT `blood_stations`, `cities` FROM `BloodStationSearchResponse` WHERE 1;

--
-- INSERT template for table `BloodStationSearchResponse`
--
INSERT INTO `BloodStationSearchResponse`(`blood_stations`, `cities`) VALUES (?, ?);

--
-- UPDATE template for table `BloodStationSearchResponse`
--
UPDATE `BloodStationSearchResponse` SET `blood_stations` = ?, `cities` = ? WHERE 1;

--
-- DELETE template for table `BloodStationSearchResponse`
--
DELETE FROM `BloodStationSearchResponse` WHERE 0;

