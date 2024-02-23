--
-- DonorSearch API.
-- Prepared SQL queries for 'DonationAgg' definition.
--


--
-- SELECT template for table `DonationAgg`
--
SELECT `count`, `last_donation_at`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `unconfirmed_donations` FROM `DonationAgg` WHERE 1;

--
-- INSERT template for table `DonationAgg`
--
INSERT INTO `DonationAgg`(`count`, `last_donation_at`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`, `unconfirmed_donations`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `DonationAgg`
--
UPDATE `DonationAgg` SET `count` = ?, `last_donation_at` = ?, `blood` = ?, `plasma` = ?, `platelets` = ?, `erythrocytes` = ?, `leukocytes` = ?, `unconfirmed_donations` = ? WHERE 1;

--
-- DELETE template for table `DonationAgg`
--
DELETE FROM `DonationAgg` WHERE 0;

