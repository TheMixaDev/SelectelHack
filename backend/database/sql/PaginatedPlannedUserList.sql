--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedPlannedUserList' definition.
--


--
-- SELECT template for table `PaginatedPlannedUserList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedPlannedUserList` WHERE 1;

--
-- INSERT template for table `PaginatedPlannedUserList`
--
INSERT INTO `PaginatedPlannedUserList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedPlannedUserList`
--
UPDATE `PaginatedPlannedUserList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedPlannedUserList`
--
DELETE FROM `PaginatedPlannedUserList` WHERE 0;

