--
-- DonorSearch API.
-- Prepared SQL queries for 'ResetPassword' definition.
--


--
-- SELECT template for table `ResetPassword`
--
SELECT `token`, `password` FROM `ResetPassword` WHERE 1;

--
-- INSERT template for table `ResetPassword`
--
INSERT INTO `ResetPassword`(`token`, `password`) VALUES (?, ?);

--
-- UPDATE template for table `ResetPassword`
--
UPDATE `ResetPassword` SET `token` = ?, `password` = ? WHERE 1;

--
-- DELETE template for table `ResetPassword`
--
DELETE FROM `ResetPassword` WHERE 0;

