--
-- DonorSearch API.
-- Prepared SQL queries for 'Country' definition.
--


--
-- SELECT template for table `Country`
--
SELECT `id`, `title` FROM `Country` WHERE 1;

--
-- INSERT template for table `Country`
--
INSERT INTO `Country`(`id`, `title`) VALUES (?, ?);

--
-- UPDATE template for table `Country`
--
UPDATE `Country` SET `id` = ?, `title` = ? WHERE 1;

--
-- DELETE template for table `Country`
--
DELETE FROM `Country` WHERE 0;

