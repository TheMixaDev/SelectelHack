--
-- DonorSearch API.
-- Prepared SQL queries for 'DonationAggTop' definition.
--


--
-- SELECT template for table `DonationAggTop`
--
SELECT `count`, `last_donation_at`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `unconfirmed_donations`, `count_year`, `blood_year`, `plasma_year`, `platelets_year`, `erythrocytes_year`, `leukocytes_year` FROM `DonationAggTop` WHERE 1;

--
-- INSERT template for table `DonationAggTop`
--
INSERT INTO `DonationAggTop`(`count`, `last_donation_at`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `unconfirmed_donations`, `count_year`, `blood_year`, `plasma_year`, `platelets_year`, `erythrocytes_year`, `leukocytes_year`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `DonationAggTop`
--
UPDATE `DonationAggTop` SET `count` = ?, `last_donation_at` = ?, `blood` = ?, `plasma` = ?, `platelets` = ?, `erythrocytes` = ?, `leukocytes` = ?, `unconfirmed_donations` = ?, `count_year` = ?, `blood_year` = ?, `plasma_year` = ?, `platelets_year` = ?, `erythrocytes_year` = ?, `leukocytes_year` = ? WHERE 1;

--
-- DELETE template for table `DonationAggTop`
--
DELETE FROM `DonationAggTop` WHERE 0;

