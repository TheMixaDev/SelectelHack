--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedCityList' definition.
--


--
-- SELECT template for table `PaginatedCityList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedCityList` WHERE 1;

--
-- INSERT template for table `PaginatedCityList`
--
INSERT INTO `PaginatedCityList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedCityList`
--
UPDATE `PaginatedCityList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedCityList`
--
DELETE FROM `PaginatedCityList` WHERE 0;

