--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedMapBloodStationSearchList' definition.
--


--
-- SELECT template for table `PaginatedMapBloodStationSearchList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedMapBloodStationSearchList` WHERE 1;

--
-- INSERT template for table `PaginatedMapBloodStationSearchList`
--
INSERT INTO `PaginatedMapBloodStationSearchList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedMapBloodStationSearchList`
--
UPDATE `PaginatedMapBloodStationSearchList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedMapBloodStationSearchList`
--
DELETE FROM `PaginatedMapBloodStationSearchList` WHERE 0;

