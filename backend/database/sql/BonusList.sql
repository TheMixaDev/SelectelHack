--
-- DonorSearch API.
-- Prepared SQL queries for 'BonusList' definition.
--


--
-- SELECT template for table `BonusList`
--
SELECT `id`, `bonus_image`, `partner_image`, `is_taken`, `bonus_name`, `partner_name`, `date_validity`, `is_published`, `h`, `w`, `cities`, `priority` FROM `BonusList` WHERE 1;

--
-- INSERT template for table `BonusList`
--
INSERT INTO `BonusList`(`id`, `bonus_image`, `partner_image`, `is_taken`, `bonus_name`, `partner_name`, `date_validity`, `is_published`, `h`, `w`, `cities`, `priority`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `BonusList`
--
UPDATE `BonusList` SET `id` = ?, `bonus_image` = ?, `partner_image` = ?, `is_taken` = ?, `bonus_name` = ?, `partner_name` = ?, `date_validity` = ?, `is_published` = ?, `h` = ?, `w` = ?, `cities` = ?, `priority` = ? WHERE 1;

--
-- DELETE template for table `BonusList`
--
DELETE FROM `BonusList` WHERE 0;

