--
-- DonorSearch API.
-- Prepared SQL queries for 'AddressNeedJoinedUserForBase' definition.
--


--
-- SELECT template for table `AddressNeedJoinedUserForBase`
--
SELECT `id`, `user`, `created_at`, `updated_at`, `timeslot` FROM `AddressNeedJoinedUserForBase` WHERE 1;

--
-- INSERT template for table `AddressNeedJoinedUserForBase`
--
INSERT INTO `AddressNeedJoinedUserForBase`(`id`, `user`, `created_at`, `updated_at`, `timeslot`) VALUES (?, ?, ?, ?, ?);

--
-- UPDATE template for table `AddressNeedJoinedUserForBase`
--
UPDATE `AddressNeedJoinedUserForBase` SET `id` = ?, `user` = ?, `created_at` = ?, `updated_at` = ?, `timeslot` = ? WHERE 1;

--
-- DELETE template for table `AddressNeedJoinedUserForBase`
--
DELETE FROM `AddressNeedJoinedUserForBase` WHERE 0;

