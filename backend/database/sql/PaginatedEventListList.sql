--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedEventListList' definition.
--


--
-- SELECT template for table `PaginatedEventListList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedEventListList` WHERE 1;

--
-- INSERT template for table `PaginatedEventListList`
--
INSERT INTO `PaginatedEventListList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedEventListList`
--
UPDATE `PaginatedEventListList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedEventListList`
--
DELETE FROM `PaginatedEventListList` WHERE 0;

