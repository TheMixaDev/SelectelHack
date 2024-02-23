--
-- DonorSearch API.
-- Prepared SQL queries for 'Top100Response' definition.
--


--
-- SELECT template for table `Top100Response`
--
SELECT `items`, `user_info` FROM `Top100Response` WHERE 1;

--
-- INSERT template for table `Top100Response`
--
INSERT INTO `Top100Response`(`items`, `user_info`) VALUES (?, ?);

--
-- UPDATE template for table `Top100Response`
--
UPDATE `Top100Response` SET `items` = ?, `user_info` = ? WHERE 1;

--
-- DELETE template for table `Top100Response`
--
DELETE FROM `Top100Response` WHERE 0;

