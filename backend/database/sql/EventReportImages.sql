--
-- DonorSearch API.
-- Prepared SQL queries for 'EventReportImages' definition.
--


--
-- SELECT template for table `EventReportImages`
--
SELECT `id`, `image` FROM `EventReportImages` WHERE 1;

--
-- INSERT template for table `EventReportImages`
--
INSERT INTO `EventReportImages`(`id`, `image`) VALUES (?, ?);

--
-- UPDATE template for table `EventReportImages`
--
UPDATE `EventReportImages` SET `id` = ?, `image` = ? WHERE 1;

--
-- DELETE template for table `EventReportImages`
--
DELETE FROM `EventReportImages` WHERE 0;

