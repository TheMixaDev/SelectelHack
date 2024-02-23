--
-- DonorSearch API.
-- Prepared SQL queries for 'AllNamesBloodStation' definition.
--


--
-- SELECT template for table `AllNamesBloodStation`
--
SELECT `id`, `title` FROM `AllNamesBloodStation` WHERE 1;

--
-- INSERT template for table `AllNamesBloodStation`
--
INSERT INTO `AllNamesBloodStation`(`id`, `title`) VALUES (?, ?);

--
-- UPDATE template for table `AllNamesBloodStation`
--
UPDATE `AllNamesBloodStation` SET `id` = ?, `title` = ? WHERE 1;

--
-- DELETE template for table `AllNamesBloodStation`
--
DELETE FROM `AllNamesBloodStation` WHERE 0;

