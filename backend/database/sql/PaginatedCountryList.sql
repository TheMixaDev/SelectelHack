--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedCountryList' definition.
--


--
-- SELECT template for table `PaginatedCountryList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedCountryList` WHERE 1;

--
-- INSERT template for table `PaginatedCountryList`
--
INSERT INTO `PaginatedCountryList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedCountryList`
--
UPDATE `PaginatedCountryList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedCountryList`
--
DELETE FROM `PaginatedCountryList` WHERE 0;

