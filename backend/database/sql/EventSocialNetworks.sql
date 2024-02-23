--
-- DonorSearch API.
-- Prepared SQL queries for 'EventSocialNetworks' definition.
--


--
-- SELECT template for table `EventSocialNetworks`
--
SELECT `id`, `social`, `url` FROM `EventSocialNetworks` WHERE 1;

--
-- INSERT template for table `EventSocialNetworks`
--
INSERT INTO `EventSocialNetworks`(`id`, `social`, `url`) VALUES (?, ?, ?);

--
-- UPDATE template for table `EventSocialNetworks`
--
UPDATE `EventSocialNetworks` SET `id` = ?, `social` = ?, `url` = ? WHERE 1;

--
-- DELETE template for table `EventSocialNetworks`
--
DELETE FROM `EventSocialNetworks` WHERE 0;

