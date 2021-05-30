-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 28 mai 2021 à 13:01
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pp1`
--

-- --------------------------------------------------------

--
-- Structure de la table `equipements`
--

CREATE TABLE `equipements` (
  `equipement_id` int(11) NOT NULL,
  `equipement_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipements`
--

INSERT INTO `equipements` (`equipement_id`, `equipement_type`) VALUES
(0, 'aucun'),
(1, 'camescope'),
(2, 'enceintes'),
(3, 'sonorisation'),
(4, 'ecran plat interractif'),
(5, 'ordinateur portable');

-- --------------------------------------------------------

--
-- Structure de la table `leagues`
--

CREATE TABLE `leagues` (
  `leagues_id` int(11) NOT NULL,
  `league_nom` varchar(250) NOT NULL,
  `league_actif` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `leagues`
--

INSERT INTO `leagues` (`leagues_id`, `league_nom`, `league_actif`) VALUES
(2, 'Handball', 1),
(3, 'Football', 1),
(4, 'Basketball', 1),
(5, 'Judo', 1),
(6, 'Tennis', 1),
(7, 'Natation', 1),
(20, 'Admin', 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `listreservations`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `listreservations` (
`reserver_id` int(11)
,`room_id` int(11)
,`room_name` varchar(255)
,`leagues_id` int(11)
,`league_nom` varchar(250)
,`date_debut` datetime
,`date_fin` datetime
);

-- --------------------------------------------------------

--
-- Structure de la table `reservation_equipements`
--

CREATE TABLE `reservation_equipements` (
  `reserver_id` int(11) NOT NULL,
  `equipement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE `reserver` (
  `reserver_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `date_debut` datetime NOT NULL DEFAULT current_timestamp(),
  `date_fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reserver`
--

INSERT INTO `reserver` (`reserver_id`, `room_id`, `league_id`, `date_debut`, `date_fin`) VALUES
(106, 1, 2, '2021-05-27 08:00:00', '2021-05-27 17:00:00'),
(107, 2, 5, '2021-05-27 08:00:00', '2021-05-27 17:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `room_type` varchar(250) NOT NULL,
  `room_place` int(11) NOT NULL,
  `room_actif` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `room_type`, `room_place`, `room_actif`) VALUES
(1, 'New York', 'informatique', 18, 0),
(2, 'Paris', 'informatique', 18, 0),
(3, 'Hong Kong', 'informatique', 18, 1),
(4, 'Le Caire', 'informatique', 18, 1),
(5, 'Los Angeles', 'informatique', 18, 1),
(6, 'Dauphin', 'Banalisée', 18, 1),
(7, 'Ours', 'Banalisée', 18, 1),
(8, 'Lion', 'Banalisée', 18, 1),
(9, 'Espadon', 'Banalisée', 18, 1),
(10, 'Aigle', 'Banalisée', 18, 1),
(11, 'Perec', 'Banalisée', 30, 1),
(12, 'Manaudou', 'Banalisée', 30, 1),
(13, 'Douillet', 'Banalisée', 30, 1),
(14, 'Galthié', 'Banalisée', 30, 1),
(15, 'Noah', 'Banalisée', 30, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `user_pwd` varchar(250) NOT NULL,
  `user_actif` tinyint(1) NOT NULL DEFAULT 1,
  `league_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `username`, `user_pwd`, `user_actif`, `league_id`) VALUES
(2, 'admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 20),
(3, 'league', 'Hand', 'f8075f506ffc619cb8e6bf17c7b9b3e8664a4cd8', 1, 2),
(4, 'league', 'Foot', 'fa707449a400d2b2a40a99fec39155237811d4d4', 1, 3),
(9, 'league', 'Basket', '0f8d27389a73b66013f989d0f9f8d917b472896b', 1, 4),
(10, 'league', 'Judo', 'e9f54f5c135911202ec51919cf917654afb0629a', 1, 5),
(11, 'league', 'Tennis', 'adca27e0f8e567b7b857b3203c3807bdecfe2b7d', 1, 6),
(12, 'league', 'Natation', 'f3d554a123fdfdac8c0a2ef9a0caad101ea8503f', 1, 7);

-- --------------------------------------------------------

--
-- Structure de la vue `listreservations`
--
DROP TABLE IF EXISTS `listreservations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listreservations`  AS SELECT `r`.`reserver_id` AS `reserver_id`, `r`.`room_id` AS `room_id`, `ro`.`room_name` AS `room_name`, `l`.`leagues_id` AS `leagues_id`, `l`.`league_nom` AS `league_nom`, `r`.`date_debut` AS `date_debut`, `r`.`date_fin` AS `date_fin` FROM ((`reserver` `r` join `leagues` `l` on(`r`.`league_id` = `l`.`leagues_id`)) join `rooms` `ro` on(`r`.`room_id` = `ro`.`room_id`)) WHERE `r`.`date_fin` > curtime() ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `equipements`
--
ALTER TABLE `equipements`
  ADD PRIMARY KEY (`equipement_id`);

--
-- Index pour la table `leagues`
--
ALTER TABLE `leagues`
  ADD PRIMARY KEY (`leagues_id`);

--
-- Index pour la table `reservation_equipements`
--
ALTER TABLE `reservation_equipements`
  ADD PRIMARY KEY (`reserver_id`,`equipement_id`),
  ADD KEY `fk_equipement_id` (`equipement_id`);

--
-- Index pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD PRIMARY KEY (`reserver_id`),
  ADD UNIQUE KEY `room_id` (`room_id`,`date_debut`,`date_fin`) USING BTREE,
  ADD KEY `league_id` (`league_id`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `league_id` (`league_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `equipements`
--
ALTER TABLE `equipements`
  MODIFY `equipement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT pour la table `leagues`
--
ALTER TABLE `leagues`
  MODIFY `leagues_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `reserver`
--
ALTER TABLE `reserver`
  MODIFY `reserver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation_equipements`
--
ALTER TABLE `reservation_equipements`
  ADD CONSTRAINT `fk_equipement_id` FOREIGN KEY (`equipement_id`) REFERENCES `equipements` (`equipement_id`),
  ADD CONSTRAINT `fk_reserver_id` FOREIGN KEY (`reserver_id`) REFERENCES `reserver` (`reserver_id`);

--
-- Contraintes pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `reserver_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`leagues_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserver_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_leagues` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`leagues_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
