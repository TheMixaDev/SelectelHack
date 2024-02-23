--
-- DonorSearch API.
-- Prepared SQL queries for 'EventReport' definition.
--


--
-- SELECT template for table `EventReport`
--
SELECT `id`, `images`, `video_urls`, `massmedia_about` FROM `EventReport` WHERE 1;

--
-- INSERT template for table `EventReport`
--
INSERT INTO `EventReport`(`id`, `images`, `video_urls`, `massmedia_about`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `EventReport`
--
UPDATE `EventReport` SET `id` = ?, `images` = ?, `video_urls` = ?, `massmedia_about` = ? WHERE 1;

--
-- DELETE template for table `EventReport`
--
DELETE FROM `EventReport` WHERE 0;

