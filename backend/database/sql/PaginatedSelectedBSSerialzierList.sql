--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedSelectedBSSerialzierList' definition.
--


--
-- SELECT template for table `PaginatedSelectedBSSerialzierList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedSelectedBSSerialzierList` WHERE 1;

--
-- INSERT template for table `PaginatedSelectedBSSerialzierList`
--
INSERT INTO `PaginatedSelectedBSSerialzierList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedSelectedBSSerialzierList`
--
UPDATE `PaginatedSelectedBSSerialzierList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedSelectedBSSerialzierList`
--
DELETE FROM `PaginatedSelectedBSSerialzierList` WHERE 0;

