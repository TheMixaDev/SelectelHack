--
-- DonorSearch API.
-- Prepared SQL queries for 'PaginatedAddressNeedList' definition.
--


--
-- SELECT template for table `PaginatedAddressNeedList`
--
SELECT `count`, `next`, `previous`, `results` FROM `PaginatedAddressNeedList` WHERE 1;

--
-- INSERT template for table `PaginatedAddressNeedList`
--
INSERT INTO `PaginatedAddressNeedList`(`count`, `next`, `previous`, `results`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PaginatedAddressNeedList`
--
UPDATE `PaginatedAddressNeedList` SET `count` = ?, `next` = ?, `previous` = ?, `results` = ? WHERE 1;

--
-- DELETE template for table `PaginatedAddressNeedList`
--
DELETE FROM `PaginatedAddressNeedList` WHERE 0;

