--
-- DonorSearch API.
-- Prepared SQL queries for 'PhoneVerificationSerialzier' definition.
--


--
-- SELECT template for table `PhoneVerificationSerialzier`
--
SELECT `code`, `user_id`, `phone` FROM `PhoneVerificationSerialzier` WHERE 1;

--
-- INSERT template for table `PhoneVerificationSerialzier`
--
INSERT INTO `PhoneVerificationSerialzier`(`code`, `user_id`, `phone`) VALUES (?, ?, ?);

--
-- UPDATE template for table `PhoneVerificationSerialzier`
--
UPDATE `PhoneVerificationSerialzier` SET `code` = ?, `user_id` = ?, `phone` = ? WHERE 1;

--
-- DELETE template for table `PhoneVerificationSerialzier`
--
DELETE FROM `PhoneVerificationSerialzier` WHERE 0;

