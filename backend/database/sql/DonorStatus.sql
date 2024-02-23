--
-- DonorSearch API.
-- Prepared SQL queries for 'DonorStatus' definition.
--


--
-- SELECT template for table `DonorStatus`
--
SELECT `id`, `name`, `donations_count`, `background_color`, `text_color` FROM `DonorStatus` WHERE 1;

--
-- INSERT template for table `DonorStatus`
--
INSERT INTO `DonorStatus`(`id`, `name`, `donations_count`, `background_color`, `text_color`) VALUES (?, ?, ?, ?, ?);

--
-- UPDATE template for table `DonorStatus`
--
UPDATE `DonorStatus` SET `id` = ?, `name` = ?, `donations_count` = ?, `background_color` = ?, `text_color` = ? WHERE 1;

--
-- DELETE template for table `DonorStatus`
--
DELETE FROM `DonorStatus` WHERE 0;

