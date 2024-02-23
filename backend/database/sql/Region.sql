--
-- DonorSearch API.
-- Prepared SQL queries for 'Region' definition.
--


--
-- SELECT template for table `Region`
--
SELECT `id`, `title` FROM `Region` WHERE 1;

--
-- INSERT template for table `Region`
--
INSERT INTO `Region`(`id`, `title`) VALUES (?, ?);

--
-- UPDATE template for table `Region`
--
UPDATE `Region` SET `id` = ?, `title` = ? WHERE 1;

--
-- DELETE template for table `Region`
--
DELETE FROM `Region` WHERE 0;

