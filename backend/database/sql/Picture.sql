--
-- DonorSearch API.
-- Prepared SQL queries for 'Picture' definition.
--


--
-- SELECT template for table `Picture`
--
SELECT `id`, `image`, `date_added` FROM `Picture` WHERE 1;

--
-- INSERT template for table `Picture`
--
INSERT INTO `Picture`(`id`, `image`, `date_added`) VALUES (?, ?, ?);

--
-- UPDATE template for table `Picture`
--
UPDATE `Picture` SET `id` = ?, `image` = ?, `date_added` = ? WHERE 1;

--
-- DELETE template for table `Picture`
--
DELETE FROM `Picture` WHERE 0;

