--
-- Database: `league_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE IF NOT EXISTS `games` (
  `home_team_name` varchar(255) NOT NULL,
  `away_team_name` varchar(255) NOT NULL,
  `home_team_league_name` varchar(255) NOT NULL,
  `home_team_league_season_name` varchar(15) NOT NULL,
  `home_team_league_year` year(4) NOT NULL,
  `away_team_league_name` varchar(255) NOT NULL,
  `away_team_league_season_name` varchar(15) NOT NULL,
  `away_team_league_year` year(4) NOT NULL,
  `datetime` datetime NOT NULL,
  `location_address` varchar(255) NOT NULL,
  `home_score` tinyint(4) DEFAULT NULL,
  `away_score` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`home_team_name`,`away_team_name`,`home_team_league_name`,`home_team_league_season_name`,`home_team_league_year`,`away_team_league_name`,`away_team_league_season_name`,`away_team_league_year`,`datetime`,`location_address`),
  KEY `away_team_name` (`away_team_name`),
  KEY `home_team_league_name` (`home_team_league_name`),
  KEY `home_team_league_season_name` (`home_team_league_season_name`),
  KEY `home_team_league_year` (`home_team_league_year`),
  KEY `away_team_league_name` (`away_team_league_name`),
  KEY `away_team_league_season_name` (`away_team_league_season_name`),
  KEY `away_team_league_year` (`away_team_league_year`),
  KEY `location_address` (`location_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leagues`
--

CREATE TABLE IF NOT EXISTS `leagues` (
  `name` varchar(255) NOT NULL,
  `season_name` varchar(15) NOT NULL,
  `year` year(4) NOT NULL,
  `admin_user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`,`season_name`,`year`),
  KEY `admin_user_email` (`admin_user_email`),
  KEY `season_name` (`season_name`),
  KEY `name` (`name`),
  KEY `year` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `address` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `poc_user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address`),
  KEY `poc_user_email` (`poc_user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `user_email` varchar(255) NOT NULL,
  `team_league_name` varchar(255) NOT NULL,
  `team_league_season_name` varchar(15) NOT NULL,
  `team_league_year` year(4) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `position_name` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`user_email`,`team_league_name`,`team_league_season_name`,`team_league_year`,`team_name`),
  KEY `position_name` (`position_name`),
  KEY `team_league_name` (`team_league_name`),
  KEY `team_league_season_name` (`team_league_season_name`),
  KEY `team_league_year` (`team_league_year`),
  KEY `team_name` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE IF NOT EXISTS `positions` (
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`name`) VALUES
('attack'),
('defense'),
('goalie'),
('midfield');

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE IF NOT EXISTS `seasons` (
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seasons`
--

INSERT INTO `seasons` (`name`) VALUES
('fall'),
('spring'),
('summer'),
('winter');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `name` varchar(255) NOT NULL,
  `league_name` varchar(255) NOT NULL,
  `league_season_name` varchar(15) NOT NULL,
  `league_year` year(4) NOT NULL,
  `coach_user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`,`league_name`,`league_season_name`,`league_year`),
  KEY `coach_user_email` (`coach_user_email`),
  KEY `league_name` (`league_name`),
  KEY `league_season_name` (`league_season_name`),
  KEY `league_year` (`league_year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_role_name` varchar(15) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `user_role_name` (`user_role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `name` varchar(15) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`name`, `description`) VALUES
('admin', 'League Administrator'),
('coach', 'Coach'),
('player', 'Player/Parent');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_9` FOREIGN KEY (`location_address`) REFERENCES `locations` (`address`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`home_team_name`) REFERENCES `teams` (`name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`away_team_name`) REFERENCES `teams` (`name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_3` FOREIGN KEY (`home_team_league_name`) REFERENCES `teams` (`league_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_4` FOREIGN KEY (`home_team_league_season_name`) REFERENCES `teams` (`league_season_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_5` FOREIGN KEY (`home_team_league_year`) REFERENCES `teams` (`league_year`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_6` FOREIGN KEY (`away_team_league_name`) REFERENCES `teams` (`league_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_7` FOREIGN KEY (`away_team_league_season_name`) REFERENCES `teams` (`league_season_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `games_ibfk_8` FOREIGN KEY (`away_team_league_year`) REFERENCES `teams` (`league_year`) ON UPDATE CASCADE;

--
-- Constraints for table `leagues`
--
ALTER TABLE `leagues`
  ADD CONSTRAINT `leagues_ibfk_2` FOREIGN KEY (`admin_user_email`) REFERENCES `users` (`email`) ON UPDATE CASCADE,
  ADD CONSTRAINT `leagues_ibfk_1` FOREIGN KEY (`season_name`) REFERENCES `seasons` (`name`) ON UPDATE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`poc_user_email`) REFERENCES `users` (`email`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_6` FOREIGN KEY (`position_name`) REFERENCES `positions` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON UPDATE CASCADE,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`team_league_name`) REFERENCES `teams` (`league_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `players_ibfk_3` FOREIGN KEY (`team_league_season_name`) REFERENCES `teams` (`league_season_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `players_ibfk_4` FOREIGN KEY (`team_league_year`) REFERENCES `teams` (`league_year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `players_ibfk_5` FOREIGN KEY (`team_name`) REFERENCES `teams` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_4` FOREIGN KEY (`coach_user_email`) REFERENCES `users` (`email`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`league_name`) REFERENCES `leagues` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`league_season_name`) REFERENCES `leagues` (`season_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teams_ibfk_3` FOREIGN KEY (`league_year`) REFERENCES `leagues` (`year`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_role_name`) REFERENCES `user_roles` (`name`) ON UPDATE CASCADE;
