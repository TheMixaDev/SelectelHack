--
-- DonorSearch API.
-- Prepared SQL queries for 'EmailRegistration' definition.
--


--
-- SELECT template for table `EmailRegistration`
--
SELECT `email`, `password`, `first_name`, `tag` FROM `EmailRegistration` WHERE 1;

--
-- INSERT template for table `EmailRegistration`
--
INSERT INTO `EmailRegistration`(`email`, `password`, `first_name`, `tag`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `EmailRegistration`
--
UPDATE `EmailRegistration` SET `email` = ?, `password` = ?, `first_name` = ?, `tag` = ? WHERE 1;

--
-- DELETE template for table `EmailRegistration`
--
DELETE FROM `EmailRegistration` WHERE 0;

