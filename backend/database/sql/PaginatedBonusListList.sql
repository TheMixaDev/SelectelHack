--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedBonusListList' definition.
--


--
-- SELECT template for table `PaginatedBonusListList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedBonusListList` WHERE 1;

--
-- INSERT template for table `PaginatedBonusListList`
--
INSERT INTO `PaginatedBonusListList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedBonusListList`
--
UPDATE `PaginatedBonusListList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedBonusListList`
--
DELETE FROM `PaginatedBonusListList` WHERE 0;

