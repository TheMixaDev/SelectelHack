--
-- DonorSearch API.
-- Prepared SQL queries for 'BloodStationSearch' definition.
--


--
-- SELECT template for table `BloodStationSearch`
--
SELECT `id`, `title`, `address`, `lat`, `lng`, `city`, `city_id`, `type`, `priority`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `schedule`, `phone_numbers` FROM `BloodStationSearch` WHERE 1;

--
-- INSERT template for table `BloodStationSearch`
--
INSERT INTO `BloodStationSearch`(`id`, `title`, `address`, `lat`, `lng`, `city`, `city_id`, `type`, `priority`, `without_registration`, `with_typing`, `for_moscow`, `closed`, `schedule`, `phone_numbers`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `BloodStationSearch`
--
UPDATE `BloodStationSearch` SET `id` = ?, `title` = ?, `address` = ?, `lat` = ?, `lng` = ?, `city` = ?, `city_id` = ?, `type` = ?, `priority` = ?, `without_registration` = ?, `with_typing` = ?, `for_moscow` = ?, `closed` = ?, `schedule` = ?, `phone_numbers` = ? WHERE 1;

--
-- DELETE template for table `BloodStationSearch`
--
DELETE FROM `BloodStationSearch` WHERE 0;

