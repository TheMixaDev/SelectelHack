--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedAllNamesBloodStationList' definition.
--


--
-- SELECT template for table `PaginatedAllNamesBloodStationList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedAllNamesBloodStationList` WHERE 1;

--
-- INSERT template for table `PaginatedAllNamesBloodStationList`
--
INSERT INTO `PaginatedAllNamesBloodStationList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedAllNamesBloodStationList`
--
UPDATE `PaginatedAllNamesBloodStationList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedAllNamesBloodStationList`
--
DELETE FROM `PaginatedAllNamesBloodStationList` WHERE 0;

