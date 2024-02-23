--
-- DonorSearch API.
-- Prepared SQL queries for 'EventReportVideoURL' definition.
--


--
-- SELECT template for table `EventReportVideoURL`
--
SELECT `id`, `url` FROM `EventReportVideoURL` WHERE 1;

--
-- INSERT template for table `EventReportVideoURL`
--
INSERT INTO `EventReportVideoURL`(`id`, `url`) VALUES (?, ?);

--
-- UPDATE template for table `EventReportVideoURL`
--
UPDATE `EventReportVideoURL` SET `id` = ?, `url` = ? WHERE 1;

--
-- DELETE template for table `EventReportVideoURL`
--
DELETE FROM `EventReportVideoURL` WHERE 0;

