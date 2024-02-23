--
-- DonorSearch API.
-- Prepared SQL queries for 'User' definition.
--


--
-- SELECT template for table `User`
--
SELECT `id`, `date_joined`, `username`, `first_name`, `last_name`, `middle_name`, `maiden_name`, `birth_date`, `gender`, `email`, `phone`, `login_via_phone`, `about`, `city_id`, `city`, `is_pin_20`, `is_pin_100`, `donation_agg`, `socials`, `photo`, `photo_id`, `next_donation_date`, `next_donation`, `blood_group`, `has_password`, `is_email_verified`, `is_phone_verified`, `email_reconfirmed_at`, `phone_reconfirmed_at`, `legacy_avatar`, `start_donor_year`, `referal_code`, `parent_user`, `invited_users`, `donor_status`, `managed_organizations`, `joined_events`, `joined_organizations`, `donor_certificate` FROM `User` WHERE 1;

--
-- INSERT template for table `User`
--
INSERT INTO `User`(`id`, `date_joined`, `username`, `first_name`, `last_name`, `middle_name`, `maiden_name`, `birth_date`, `gender`, `email`, `phone`, `login_via_phone`, `about`, `city_id`, `city`, `is_pin_20`, `is_pin_100`, `donation_agg`, `socials`, `photo`, `photo_id`, `next_donation_date`, `next_donation`, `blood_group`, `has_password`, `is_email_verified`, `is_phone_verified`, `email_reconfirmed_at`, `phone_reconfirmed_at`, `legacy_avatar`, `start_donor_year`, `referal_code`, `parent_user`, `invited_users`, `donor_status`, `managed_organizations`, `joined_events`, `joined_organizations`, `donor_certificate`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table `User`
--
UPDATE `User` SET `id` = ?, `date_joined` = ?, `username` = ?, `first_name` = ?, `last_name` = ?, `middle_name` = ?, `maiden_name` = ?, `birth_date` = ?, `gender` = ?, `email` = ?, `phone` = ?, `login_via_phone` = ?, `about` = ?, `city_id` = ?, `city` = ?, `is_pin_20` = ?, `is_pin_100` = ?, `donation_agg` = ?, `socials` = ?, `photo` = ?, `photo_id` = ?, `next_donation_date` = ?, `next_donation` = ?, `blood_group` = ?, `has_password` = ?, `is_email_verified` = ?, `is_phone_verified` = ?, `email_reconfirmed_at` = ?, `phone_reconfirmed_at` = ?, `legacy_avatar` = ?, `start_donor_year` = ?, `referal_code` = ?, `parent_user` = ?, `invited_users` = ?, `donor_status` = ?, `managed_organizations` = ?, `joined_events` = ?, `joined_organizations` = ?, `donor_certificate` = ? WHERE 1;

--
-- DELETE template for table `User`
--
DELETE FROM `User` WHERE 0;

