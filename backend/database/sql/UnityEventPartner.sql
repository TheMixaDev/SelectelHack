--
-- DonorSearch API.
-- Prepared SQL queries for 'UnityEventPartner' definition.
--


--
-- SELECT template for table `UnityEventPartner`
--
SELECT `id`, `name`, `image` FROM `UnityEventPartner` WHERE 1;

--
-- INSERT template for table `UnityEventPartner`
--
INSERT INTO `UnityEventPartner`(`id`, `name`, `image`) VALUES (?, ?, ?);

--
-- UPDATE template for table `UnityEventPartner`
--
UPDATE `UnityEventPartner` SET `id` = ?, `name` = ?, `image` = ? WHERE 1;

--
-- DELETE template for table `UnityEventPartner`
--
DELETE FROM `UnityEventPartner` WHERE 0;

