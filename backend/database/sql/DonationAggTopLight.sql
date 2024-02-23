--
-- DonorSearch API.
-- Prepared SQL queries for 'DonationAggTopLight' definition.
--


--
-- SELECT template for table `DonationAggTopLight`
--
SELECT `count`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes` FROM `DonationAggTopLight` WHERE 1;

--
-- INSERT template for table `DonationAggTopLight`
--
INSERT INTO `DonationAggTopLight`(`count`, `blood`, `plasma`, `platelets`, `erythrocytes`, `leukocytes`) VALUES (?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `DonationAggTopLight`
--
UPDATE `DonationAggTopLight` SET `count` = ?, `blood` = ?, `plasma` = ?, `platelets` = ?, `erythrocytes` = ?, `leukocytes` = ? WHERE 1;

--
-- DELETE template for table `DonationAggTopLight`
--
DELETE FROM `DonationAggTopLight` WHERE 0;

