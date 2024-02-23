--
-- DonorSearch API.
-- Prepared SQL queries for 'City' definition.
--


--
-- SELECT template for table `City`
--
SELECT `id`, `title`, `slug`, `region_id`, `region`, `country`, `priority`, `lat`, `lng` FROM `City` WHERE 1;

--
-- INSERT template for table `City`
--
INSERT INTO `City`(`id`, `title`, `slug`, `region_id`, `region`, `country`, `priority`, `lat`, `lng`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `City`
--
UPDATE `City` SET `id` = ?, `title` = ?, `slug` = ?, `region_id` = ?, `region` = ?, `country` = ?, `priority` = ?, `lat` = ?, `lng` = ? WHERE 1;

--
-- DELETE template for table `City`
--
DELETE FROM `City` WHERE 0;

