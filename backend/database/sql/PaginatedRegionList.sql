--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedRegionList' definition.
--


--
-- SELECT template for table `PaginatedRegionList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedRegionList` WHERE 1;

--
-- INSERT template for table `PaginatedRegionList`
--
INSERT INTO `PaginatedRegionList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedRegionList`
--
UPDATE `PaginatedRegionList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedRegionList`
--
DELETE FROM `PaginatedRegionList` WHERE 0;

