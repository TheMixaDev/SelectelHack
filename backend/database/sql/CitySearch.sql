--
-- DonorSearch API.
-- Prepared SQL queries for 'CitySearch' definition.
--


--
-- SELECT template for table `CitySearch`
--
SELECT `id`, `title`, `address`, `lat`, `lng`, `type`, `slug` FROM `CitySearch` WHERE 1;

--
-- INSERT template for table `CitySearch`
--
INSERT INTO `CitySearch`(`id`, `title`, `address`, `lat`, `lng`, `type`, `slug`) VALUES (?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `CitySearch`
--
UPDATE `CitySearch` SET `id` = ?, `title` = ?, `address` = ?, `lat` = ?, `lng` = ?, `type` = ?, `slug` = ? WHERE 1;

--
-- DELETE template for table `CitySearch`
--
DELETE FROM `CitySearch` WHERE 0;

