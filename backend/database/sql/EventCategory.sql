--
-- DonorSearch API.
-- Prepared SQL queries for 'EventCategory' definition.
--


--
-- SELECT template for table `EventCategory`
--
SELECT `id`, `name` FROM `EventCategory` WHERE 1;

--
-- INSERT template for table `EventCategory`
--
INSERT INTO `EventCategory`(`id`, `name`) VALUES (?, ?);

--
-- UPDATE template for table `EventCategory`
--
UPDATE `EventCategory` SET `id` = ?, `name` = ? WHERE 1;

--
-- DELETE template for table `EventCategory`
--
DELETE FROM `EventCategory` WHERE 0;

