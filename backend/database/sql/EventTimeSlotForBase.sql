--
-- DonorSearch API.
-- Prepared SQL queries for 'EventTimeSlotForBase' definition.
--


--
-- SELECT template for table `EventTimeSlotForBase`
--
SELECT `id`, `joined_count`, `date`, `start_time`, `end_time`, `count` FROM `EventTimeSlotForBase` WHERE 1;

--
-- INSERT template for table `EventTimeSlotForBase`
--
INSERT INTO `EventTimeSlotForBase`(`id`, `joined_count`, `date`, `start_time`, `end_time`, `count`) VALUES (?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `EventTimeSlotForBase`
--
UPDATE `EventTimeSlotForBase` SET `id` = ?, `joined_count` = ?, `date` = ?, `start_time` = ?, `end_time` = ?, `count` = ? WHERE 1;

--
-- DELETE template for table `EventTimeSlotForBase`
--
DELETE FROM `EventTimeSlotForBase` WHERE 0;

