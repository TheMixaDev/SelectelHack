--
-- DonorSearch API.
-- Prepared SQL queries for 'SimpleUserSocialAuth' definition.
--


--
-- SELECT template for table `SimpleUserSocialAuth`
--
SELECT `id`, `provider`, `uid`, `is_public`, `email` FROM `SimpleUserSocialAuth` WHERE 1;

--
-- INSERT template for table `SimpleUserSocialAuth`
--
INSERT INTO `SimpleUserSocialAuth`(`id`, `provider`, `uid`, `is_public`, `email`) VALUES (?, ?, ?, ?, ?);

--
-- UPDATE template for table `SimpleUserSocialAuth`
--
UPDATE `SimpleUserSocialAuth` SET `id` = ?, `provider` = ?, `uid` = ?, `is_public` = ?, `email` = ? WHERE 1;

--
-- DELETE template for table `SimpleUserSocialAuth`
--
DELETE FROM `SimpleUserSocialAuth` WHERE 0;

