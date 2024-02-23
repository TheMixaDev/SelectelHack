--
-- DonorSearch API.
-- Prepared SQL queries for 'AddressNeedTimeSlotForBase' definition.
--


--
-- SELECT template for table `AddressNeedTimeSlotForBase`
--
SELECT `id`, `joined_count`, `date` FROM `AddressNeedTimeSlotForBase` WHERE 1;

--
-- INSERT template for table `AddressNeedTimeSlotForBase`
--
INSERT INTO `AddressNeedTimeSlotForBase`(`id`, `joined_count`, `date`) VALUES (?, ?, ?);

--
-- UPDATE template for table `AddressNeedTimeSlotForBase`
--
UPDATE `AddressNeedTimeSlotForBase` SET `id` = ?, `joined_count` = ?, `date` = ? WHERE 1;

--
-- DELETE template for table `AddressNeedTimeSlotForBase`
--
DELETE FROM `AddressNeedTimeSlotForBase` WHERE 0;

