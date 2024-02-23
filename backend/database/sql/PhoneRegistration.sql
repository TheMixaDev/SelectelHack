--
-- DonorSearch API.
-- Prepared SQL queries for 'PhoneRegistration' definition.
--


--
-- SELECT template for table `PhoneRegistration`
--
SELECT `phone`, `password`, `first_name`, `tag` FROM `PhoneRegistration` WHERE 1;

--
-- INSERT template for table `PhoneRegistration`
--
INSERT INTO `PhoneRegistration`(`phone`, `password`, `first_name`, `tag`) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table `PhoneRegistration`
--
UPDATE `PhoneRegistration` SET `phone` = ?, `password` = ?, `first_name` = ?, `tag` = ? WHERE 1;

--
-- DELETE template for table `PhoneRegistration`
--
DELETE FROM `PhoneRegistration` WHERE 0;

