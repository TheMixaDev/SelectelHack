--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedBloodStationWithNeedsList' definition.
--


--
-- SELECT template for table `PaginatedBloodStationWithNeedsList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedBloodStationWithNeedsList` WHERE 1;

--
-- INSERT template for table `PaginatedBloodStationWithNeedsList`
--
INSERT INTO `PaginatedBloodStationWithNeedsList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedBloodStationWithNeedsList`
--
UPDATE `PaginatedBloodStationWithNeedsList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedBloodStationWithNeedsList`
--
DELETE FROM `PaginatedBloodStationWithNeedsList` WHERE 0;

