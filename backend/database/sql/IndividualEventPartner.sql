--
-- DonorSearch API.
-- Prepared SQL queries for 'IndividualEventPartner' definition.
--


--
-- SELECT template for table `IndividualEventPartner`
--
SELECT `id`, `image`, `created_at`, `updated_at`, `name`, `url`, `cropping`, `event` FROM `IndividualEventPartner` WHERE 1;

--
-- INSERT template for table `IndividualEventPartner`
--
INSERT INTO `IndividualEventPartner`(`id`, `image`, `created_at`, `updated_at`, `name`, `url`, `cropping`, `event`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `IndividualEventPartner`
--
UPDATE `IndividualEventPartner` SET `id` = ?, `image` = ?, `created_at` = ?, `updated_at` = ?, `name` = ?, `url` = ?, `cropping` = ?, `event` = ? WHERE 1;

--
-- DELETE template for table `IndividualEventPartner`
--
DELETE FROM `IndividualEventPartner` WHERE 0;

