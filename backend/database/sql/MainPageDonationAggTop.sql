--
-- DonorSearch API.
-- Prepared SQL queries for 'MainPageDonationAggTop' definition.
--


--
-- SELECT template for table `MainPageDonationAggTop`
--
SELECT `count`, `last_donation_at`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `count_year`, `blood_year`, `plasma_year`, `platelets_year`, `erythrocytes_year`, `leukocytes_year` FROM `MainPageDonationAggTop` WHERE 1;

--
-- INSERT template for table `MainPageDonationAggTop`
--
INSERT INTO `MainPageDonationAggTop`(`count`, `last_donation_at`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `count_year`, `blood_year`, `plasma_year`, `platelets_year`, `erythrocytes_year`, `leukocytes_year`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `MainPageDonationAggTop`
--
UPDATE `MainPageDonationAggTop` SET `count` = ?, `last_donation_at` = ?, `blood` = ?, `plasma` = ?, `platelets` = ?, `erythrocytes` = ?, `leukocytes` = ?, `count_year` = ?, `blood_year` = ?, `plasma_year` = ?, `platelets_year` = ?, `erythrocytes_year` = ?, `leukocytes_year` = ? WHERE 1;

--
-- DELETE template for table `MainPageDonationAggTop`
--
DELETE FROM `MainPageDonationAggTop` WHERE 0;

