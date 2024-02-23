--
-- DonorSearch API.
-- Prepared SQL queries for 'BonusDetail' definition.
--


--
-- SELECT template for table `BonusDetail`
--
SELECT `id`, `_bonus_image`, `partner_image`, `is_taken`, `bonus_name`, `bonus_description`, `partner_name`, `date_validity`, `is_published`, `is_expired`, `has_feedback`, `partner_url`, `state`, `bonus_confines`, `promocode`, `w`, `h`, `cities` FROM `BonusDetail` WHERE 1;

--
-- INSERT template for table `BonusDetail`
--
INSERT INTO `BonusDetail`(`id`, `_bonus_image`, `partner_image`, `is_taken`, `bonus_name`, `bonus_description`, `partner_name`, `date_validity`, `is_published`, `is_expired`, `has_feedback`, `partner_url`, `state`, `bonus_confines`, `promocode`, `w`, `h`, `cities`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `BonusDetail`
--
UPDATE `BonusDetail` SET `id` = ?, `_bonus_image` = ?, `partner_image` = ?, `is_taken` = ?, `bonus_name` = ?, `bonus_description` = ?, `partner_name` = ?, `date_validity` = ?, `is_published` = ?, `is_expired` = ?, `has_feedback` = ?, `partner_url` = ?, `state` = ?, `bonus_confines` = ?, `promocode` = ?, `w` = ?, `h` = ?, `cities` = ? WHERE 1;

--
-- DELETE template for table `BonusDetail`
--
DELETE FROM `BonusDetail` WHERE 0;

