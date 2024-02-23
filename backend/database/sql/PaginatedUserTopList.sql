--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedUserTopList' definition.
--


--
-- SELECT template for table `PaginatedUserTopList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedUserTopList` WHERE 1;

--
-- INSERT template for table `PaginatedUserTopList`
--
INSERT INTO `PaginatedUserTopList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedUserTopList`
--
UPDATE `PaginatedUserTopList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedUserTopList`
--
DELETE FROM `PaginatedUserTopList` WHERE 0;

