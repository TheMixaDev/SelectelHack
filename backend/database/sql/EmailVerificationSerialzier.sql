--
-- DonorSearch API.
-- Prepared SQL queries for 'EmailVerificationSerialzier' definition.
--


--
-- SELECT template for table `EmailVerificationSerialzier`
--
SELECT `code`, `user_id`, `email` FROM `EmailVerificationSerialzier` WHERE 1;

--
-- INSERT template for table `EmailVerificationSerialzier`
--
INSERT INTO `EmailVerificationSerialzier`(`code`, `user_id`, `email`) VALUES (?, ?, ?);

--
-- UPDATE template for table `EmailVerificationSerialzier`
--
UPDATE `EmailVerificationSerialzier` SET `code` = ?, `user_id` = ?, `email` = ? WHERE 1;

--
-- DELETE template for table `EmailVerificationSerialzier`
--
DELETE FROM `EmailVerificationSerialzier` WHERE 0;

