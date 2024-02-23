--
-- DonorSearch API.
-- Prepared SQL queries for 'OrganizationPartner' definition.
--


--
-- SELECT template for table `OrganizationPartner`
--
SELECT `id`, `name`, `image`, `_image` FROM `OrganizationPartner` WHERE 1;

--
-- INSERT template for table `OrganizationPartner`
--
INSERT INTO `OrganizationPartner`(`id`, `name`, `image`, `_image`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `OrganizationPartner`
--
UPDATE `OrganizationPartner` SET `id` = ?, `name` = ?, `image` = ?, `_image` = ? WHERE 1;

--
-- DELETE template for table `OrganizationPartner`
--
DELETE FROM `OrganizationPartner` WHERE 0;

