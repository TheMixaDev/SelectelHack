--
-- DonorSearch API.
-- Prepared SQL queries for 'Registration' definition.
--


--
-- SELECT template for table `Registration`
--
SELECT `email`, `password`, `first_name`, `tag`, `phone` FROM `Registration` WHERE 1;

--
-- INSERT template for table `Registration`
--
INSERT INTO `Registration`(`email`, `password`, `first_name`, `tag`, `phone`) VALUES (?, ?, ?, ?, ?);

--
-- UPDATE template for table `Registration`
--
UPDATE `Registration` SET `email` = ?, `password` = ?, `first_name` = ?, `tag` = ?, `phone` = ? WHERE 1;

--
-- DELETE template for table `Registration`
--
DELETE FROM `Registration` WHERE 0;

