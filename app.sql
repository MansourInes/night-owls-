-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 12 jan. 2024 à 11:24
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `app`
--

-- --------------------------------------------------------

--
-- Structure de la table `capteur`
--

CREATE TABLE `capteur` (
  `id_capteur` int(11) NOT NULL,
  `id_evenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `capteur`
--

INSERT INTO `capteur` (`id_capteur`, `id_evenement`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `capteur_data`
--

CREATE TABLE `capteur_data` (
  `id_capteur_data` int(11) NOT NULL,
  `id_capteur` int(11) DEFAULT NULL,
  `frequence` int(11) DEFAULT NULL,
  `intensite_sonore` int(11) DEFAULT NULL,
  `musique` varchar(100) DEFAULT NULL,
  `date_data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `capteur_data`
--

INSERT INTO `capteur_data` (`id_capteur_data`, `id_capteur`, `frequence`, `intensite_sonore`, `musique`, `date_data`) VALUES
(95, 1, 3175, 95, 'Sucker - Jonas Brothers', '2024-01-08 23:00:00'),
(96, 1, 18357, 86, 'Someone You Loved - Lewis Capaldi', '2024-01-08 23:05:00'),
(97, 1, 17392, 99, 'Shallow - Lady Gaga', '2024-01-08 23:10:00'),
(98, 1, 9794, 95, 'Say So - Doja Cat', '2024-01-08 23:15:00'),
(99, 1, 10326, 107, 'WAP - Cardi B', '2024-01-08 23:20:00'),
(100, 1, 14460, 71, 'Wonderwall - Oasis', '2024-01-08 23:25:00'),
(101, 1, 2203, 82, 'Bohemian Rhapsody - Queen', '2024-01-08 23:30:00'),
(102, 1, 614, 60, 'Say So - Doja Cat', '2024-01-08 23:35:00'),
(103, 1, 14957, 103, 'Perfect - Ed Sheeran', '2024-01-08 23:40:00'),
(104, 1, 824, 91, 'Thank U, Next - Ariana Grande', '2024-01-08 23:45:00'),
(105, 1, 14386, 95, 'All of Me - John Legend', '2024-01-08 23:50:00'),
(106, 1, 10885, 101, 'Uptown Funk - Mark Ronson', '2024-01-08 23:55:00'),
(107, 1, 11990, 67, 'Savage Love - Jason Derulo', '2024-01-09 00:00:00'),
(108, 1, 12733, 69, 'Uptown Funk - Mark Ronson', '2024-01-09 00:05:00'),
(109, 1, 7769, 103, 'Old Town Road - Lil Nas X', '2024-01-09 00:10:00'),
(110, 1, 5713, 97, 'All of Me - John Legend', '2024-01-09 00:15:00'),
(111, 1, 240, 95, 'Someone You Loved - Lewis Capaldi', '2024-01-09 00:20:00'),
(112, 1, 15931, 88, 'High Hopes - Panic! At The Disco', '2024-01-09 00:25:00'),
(113, 1, 12201, 73, 'Can t Stop the Feeling - Justin Timberlake', '2024-01-09 00:30:00'),
(114, 1, 14377, 64, 'Mood - 24kGoldn', '2024-01-09 00:35:00'),
(115, 1, 9430, 88, 'Without Me - Halsey', '2024-01-09 00:40:00'),
(116, 1, 7260, 108, 'One Dance - Drake', '2024-01-09 00:45:00'),
(117, 1, 18432, 81, 'Havana - Camila Cabello', '2024-01-09 00:50:00'),
(118, 1, 17013, 90, 'Mood - 24kGoldn', '2024-01-09 00:55:00'),
(119, 1, 18093, 89, 'Sunflower - Post Malone', '2024-01-09 01:00:00'),
(120, 1, 7572, 98, 'Despacito - Luis Fonsi', '2024-01-09 01:05:00'),
(121, 1, 6202, 69, 'Goosebumps - Travis Scott', '2024-01-09 01:10:00'),
(122, 1, 10191, 109, 'Yummy - Justin Bieber', '2024-01-09 01:15:00'),
(123, 1, 11502, 72, 'Sucker - Jonas Brothers', '2024-01-09 01:20:00'),
(124, 1, 13456, 89, 'Despacito - Luis Fonsi', '2024-01-09 01:25:00'),
(125, 1, 8984, 102, 'Sunflower - Post Malone', '2024-01-09 01:30:00'),
(126, 1, 19090, 81, 'Starboy - The Weeknd', '2024-01-09 01:35:00'),
(127, 1, 14243, 108, 'Yummy - Justin Bieber', '2024-01-09 01:40:00'),
(128, 1, 13831, 98, 'Thinking Out Loud - Ed Sheeran', '2024-01-09 01:45:00'),
(129, 1, 6133, 63, 'Sucker - Jonas Brothers', '2024-01-09 01:50:00'),
(130, 1, 10180, 101, 'Savage Love - Jason Derulo', '2024-01-09 01:55:00'),
(131, 1, 7656, 88, 'Sucker - Jonas Brothers', '2024-01-09 02:00:00'),
(132, 1, 15032, 76, 'Despacito - Luis Fonsi', '2024-01-09 02:05:00'),
(133, 1, 4318, 74, 'Starboy - The Weeknd', '2024-01-09 02:10:00'),
(134, 1, 12201, 106, 'Believer - Imagine Dragons', '2024-01-09 02:15:00'),
(135, 1, 9565, 64, 'All of Me - John Legend', '2024-01-09 02:20:00'),
(136, 1, 11694, 60, 'Sunflower - Post Malone', '2024-01-09 02:25:00'),
(137, 1, 6846, 63, 'Havana - Camila Cabello', '2024-01-09 02:30:00'),
(138, 1, 16606, 105, 'Lucid Dreams - Juice WRLD', '2024-01-09 02:35:00'),
(139, 1, 8977, 94, 'Sunflower - Post Malone', '2024-01-09 02:40:00'),
(140, 1, 16677, 84, 'Someone Like You - Adele', '2024-01-09 02:45:00'),
(141, 1, 5619, 80, 'Blurred Lines - Robin Thicke', '2024-01-09 02:50:00'),
(142, 1, 13967, 77, 'Faded - Alan Walker', '2024-01-09 02:55:00'),
(143, 1, 13900, 88, 'Watermelon Sugar - Harry Styles', '2024-01-09 03:00:00'),
(144, 1, 3304, 81, 'Thank U, Next - Ariana Grande', '2024-01-09 03:05:00'),
(145, 1, 595, 109, 'Sucker - Jonas Brothers', '2024-01-09 03:10:00'),
(146, 1, 14678, 81, 'Closer - The Chainsmokers', '2024-01-09 03:15:00'),
(147, 1, 14695, 80, 'Without Me - Halsey', '2024-01-09 03:20:00'),
(148, 1, 13397, 66, 'Shape of You - Ed Sheeran', '2024-01-09 03:25:00'),
(149, 1, 19435, 97, 'Mood - 24kGoldn', '2024-01-09 03:30:00'),
(150, 1, 9665, 87, 'Sicko Mode - Travis Scott', '2024-01-09 03:35:00'),
(151, 1, 2480, 65, 'Bad Guy - Billie Eilish', '2024-01-09 03:40:00'),
(152, 1, 6085, 106, 'Old Town Road - Lil Nas X', '2024-01-09 03:45:00'),
(153, 1, 11154, 66, 'Thinking Out Loud - Ed Sheeran', '2024-01-09 03:50:00'),
(154, 1, 14346, 76, 'Blurred Lines - Robin Thicke', '2024-01-09 03:55:00'),
(155, 1, 10274, 107, 'Roses - SAINt JHN', '2024-01-09 04:00:00'),
(156, 1, 12371, 83, 'Memories - Maroon 5', '2024-01-09 04:05:00'),
(157, 1, 2617, 74, 'Lucid Dreams - Juice WRLD', '2024-01-09 04:10:00'),
(158, 1, 9258, 99, 'Bad Guy - Billie Eilish', '2024-01-09 04:15:00'),
(159, 1, 19746, 73, 'Believer - Imagine Dragons', '2024-01-09 04:20:00'),
(160, 1, 18824, 103, 'Believer - Imagine Dragons', '2024-01-09 04:25:00'),
(161, 1, 13579, 104, 'Goosebumps - Travis Scott', '2024-01-09 04:30:00'),
(162, 1, 19685, 104, 'Thank U, Next - Ariana Grande', '2024-01-09 04:35:00'),
(163, 1, 14117, 107, 'Perfect - Ed Sheeran', '2024-01-09 04:40:00'),
(164, 1, 7679, 66, 'Girls Like You - Maroon 5', '2024-01-09 04:45:00'),
(165, 1, 1669, 63, 'Radioactive - Imagine Dragons', '2024-01-09 04:50:00'),
(166, 1, 11665, 101, 'Someone Like You - Adele', '2024-01-09 04:55:00'),
(167, 2, 5294, 71, 'Rockstar - Post Malone', '2024-01-08 23:00:00'),
(168, 2, 8340, 95, 'Without Me - Halsey', '2024-01-08 23:05:00'),
(169, 2, 15141, 76, 'Shallow - Lady Gaga', '2024-01-08 23:10:00'),
(170, 2, 4586, 94, 'Roses - SAINt JHN', '2024-01-08 23:15:00'),
(171, 2, 17502, 104, 'Havana - Camila Cabello', '2024-01-08 23:20:00'),
(172, 2, 11245, 87, 'Sicko Mode - Travis Scott', '2024-01-08 23:25:00'),
(173, 2, 15380, 101, 'Shallow - Lady Gaga', '2024-01-08 23:30:00'),
(174, 2, 1118, 70, 'Rockstar - Post Malone', '2024-01-08 23:35:00'),
(175, 2, 4506, 78, 'Starboy - The Weeknd', '2024-01-08 23:40:00'),
(176, 2, 18551, 88, 'Someone You Loved - Lewis Capaldi', '2024-01-08 23:45:00'),
(177, 2, 19979, 61, 'Mood - 24kGoldn', '2024-01-08 23:50:00'),
(178, 2, 4047, 81, 'Despacito - Luis Fonsi', '2024-01-08 23:55:00'),
(179, 2, 14780, 104, 'Shallow - Lady Gaga', '2024-01-09 00:00:00'),
(180, 2, 5570, 78, 'Closer - The Chainsmokers', '2024-01-09 00:05:00'),
(181, 2, 19200, 96, 'Lucid Dreams - Juice WRLD', '2024-01-09 00:10:00'),
(182, 2, 11364, 93, 'WAP - Cardi B', '2024-01-09 00:15:00'),
(183, 2, 1630, 64, 'Perfect - Ed Sheeran', '2024-01-09 00:20:00'),
(184, 2, 19371, 69, 'Someone You Loved - Lewis Capaldi', '2024-01-09 00:25:00'),
(185, 2, 19470, 80, 'Old Town Road - Lil Nas X', '2024-01-09 00:30:00'),
(186, 2, 3933, 60, 'Perfect - Ed Sheeran', '2024-01-09 00:35:00'),
(187, 2, 4711, 101, 'Shallow - Lady Gaga', '2024-01-09 00:40:00'),
(188, 2, 4955, 75, 'I Don t Care - Ed Sheeran', '2024-01-09 00:45:00'),
(189, 2, 17114, 103, 'Bad Guy - Billie Eilish', '2024-01-09 00:50:00'),
(190, 2, 12846, 72, 'Blinding Lights - The Weeknd', '2024-01-09 00:55:00'),
(191, 2, 19222, 68, 'Say So - Doja Cat', '2024-01-09 01:00:00'),
(192, 2, 11973, 109, 'Can t Stop the Feeling - Justin Timberlake', '2024-01-09 01:05:00'),
(193, 2, 10714, 67, 'Closer - The Chainsmokers', '2024-01-09 01:10:00'),
(194, 2, 6413, 97, 'Yummy - Justin Bieber', '2024-01-09 01:15:00'),
(195, 2, 1316, 76, 'Bohemian Rhapsody - Queen', '2024-01-09 01:20:00'),
(196, 2, 16404, 93, 'Blurred Lines - Robin Thicke', '2024-01-09 01:25:00'),
(197, 2, 9242, 64, 'Closer - The Chainsmokers', '2024-01-09 01:30:00'),
(198, 2, 19811, 60, 'Shape of You - Ed Sheeran', '2024-01-09 01:35:00'),
(199, 2, 13656, 95, 'Havana - Camila Cabello', '2024-01-09 01:40:00'),
(200, 2, 4332, 88, 'Someone Like You - Adele', '2024-01-09 01:45:00'),
(201, 2, 13361, 97, 'Shape of You - Ed Sheeran', '2024-01-09 01:50:00'),
(202, 2, 16287, 91, 'Closer - The Chainsmokers', '2024-01-09 01:55:00'),
(203, 2, 19416, 96, 'Wonderwall - Oasis', '2024-01-09 02:00:00'),
(204, 2, 12367, 65, 'Circles - Post Malone', '2024-01-09 02:05:00'),
(205, 2, 7910, 77, 'Shape of You - Ed Sheeran', '2024-01-09 02:10:00'),
(206, 2, 5307, 62, 'Thunder - Imagine Dragons', '2024-01-09 02:15:00'),
(207, 2, 10852, 87, 'Rockstar - Post Malone', '2024-01-09 02:20:00'),
(208, 2, 8634, 63, 'WAP - Cardi B', '2024-01-09 02:25:00'),
(209, 2, 5109, 74, 'Radioactive - Imagine Dragons', '2024-01-09 02:30:00'),
(210, 2, 13567, 75, 'I Don t Care - Ed Sheeran', '2024-01-09 02:35:00'),
(211, 2, 8743, 94, 'Sucker - Jonas Brothers', '2024-01-09 02:40:00'),
(212, 2, 6248, 86, 'Sucker - Jonas Brothers', '2024-01-09 02:45:00'),
(213, 2, 13909, 100, 'I Don t Care - Ed Sheeran', '2024-01-09 02:50:00'),
(214, 2, 8055, 81, 'All of Me - John Legend', '2024-01-09 02:55:00'),
(215, 2, 7276, 86, 'Thinking Out Loud - Ed Sheeran', '2024-01-09 03:00:00'),
(216, 2, 19921, 108, 'Bohemian Rhapsody - Queen', '2024-01-09 03:05:00'),
(217, 2, 12433, 96, 'Shape of You - Ed Sheeran', '2024-01-09 03:10:00'),
(218, 2, 11917, 85, 'Old Town Road - Lil Nas X', '2024-01-09 03:15:00'),
(219, 2, 14279, 80, 'Havana - Camila Cabello', '2024-01-09 03:20:00'),
(220, 2, 15428, 74, 'Roses - SAINt JHN', '2024-01-09 03:25:00'),
(221, 2, 12277, 80, 'Shape of You - Ed Sheeran', '2024-01-09 03:30:00'),
(222, 2, 14960, 103, 'Circles - Post Malone', '2024-01-09 03:35:00'),
(223, 2, 11299, 101, 'I Don t Care - Ed Sheeran', '2024-01-09 03:40:00'),
(224, 2, 14423, 105, 'I Don t Care - Ed Sheeran', '2024-01-09 03:45:00'),
(225, 2, 15212, 66, 'Without Me - Halsey', '2024-01-09 03:50:00'),
(226, 2, 14270, 76, 'Blurred Lines - Robin Thicke', '2024-01-09 03:55:00'),
(227, 2, 16697, 84, 'Perfect - Ed Sheeran', '2024-01-09 04:00:00'),
(228, 2, 1651, 62, 'Bohemian Rhapsody - Queen', '2024-01-09 04:05:00'),
(229, 2, 16322, 76, 'Dance Monkey - Tones and I', '2024-01-09 04:10:00'),
(230, 2, 2011, 92, 'Lucid Dreams - Juice WRLD', '2024-01-09 04:15:00'),
(231, 2, 568, 75, 'Radioactive - Imagine Dragons', '2024-01-09 04:20:00'),
(232, 2, 7934, 70, 'Someone Like You - Adele', '2024-01-09 04:25:00'),
(233, 2, 16018, 80, 'Levitating - Dua Lipa', '2024-01-09 04:30:00'),
(234, 2, 17971, 102, 'Señorita - Shawn Mendes', '2024-01-09 04:35:00'),
(235, 2, 7675, 101, 'Lucid Dreams - Juice WRLD', '2024-01-09 04:40:00'),
(236, 2, 182, 66, 'Girls Like You - Maroon 5', '2024-01-09 04:45:00'),
(237, 2, 14469, 102, 'Blinding Lights - The Weeknd', '2024-01-09 04:50:00'),
(238, 2, 13633, 71, 'Blurred Lines - Robin Thicke', '2024-01-09 04:55:00'),
(239, 3, 3889, 106, 'Despacito - Luis Fonsi', '2024-01-08 23:00:00'),
(240, 3, 8299, 66, 'Girls Like You - Maroon 5', '2024-01-08 23:05:00'),
(241, 3, 1544, 70, 'Sunflower - Post Malone', '2024-01-08 23:10:00'),
(242, 3, 4836, 88, 'Believer - Imagine Dragons', '2024-01-08 23:15:00'),
(243, 3, 2796, 109, 'Thinking Out Loud - Ed Sheeran', '2024-01-08 23:20:00'),
(244, 3, 2748, 103, 'Sicko Mode - Travis Scott', '2024-01-08 23:25:00'),
(245, 3, 16614, 67, 'Rockstar - Post Malone', '2024-01-08 23:30:00'),
(246, 3, 982, 63, 'Say So - Doja Cat', '2024-01-08 23:35:00'),
(247, 3, 15616, 86, 'Thank U, Next - Ariana Grande', '2024-01-08 23:40:00'),
(248, 3, 11042, 71, 'Circles - Post Malone', '2024-01-08 23:45:00'),
(249, 3, 1971, 93, 'Sunflower - Post Malone', '2024-01-08 23:50:00'),
(250, 3, 14960, 76, 'Starboy - The Weeknd', '2024-01-08 23:55:00'),
(251, 3, 9701, 90, 'God s Plan - Drake', '2024-01-09 00:00:00'),
(252, 3, 14510, 101, 'Someone Like You - Adele', '2024-01-09 00:05:00'),
(253, 3, 16504, 96, 'Thinking Out Loud - Ed Sheeran', '2024-01-09 00:10:00'),
(254, 3, 18018, 108, 'I Don t Care - Ed Sheeran', '2024-01-09 00:15:00'),
(255, 3, 325, 89, 'Lose Yourself - Eminem', '2024-01-09 00:20:00'),
(256, 3, 10159, 80, 'Havana - Camila Cabello', '2024-01-09 00:25:00'),
(257, 3, 5697, 104, 'Closer - The Chainsmokers', '2024-01-09 00:30:00'),
(258, 3, 6645, 84, 'Roses - SAINt JHN', '2024-01-09 00:35:00'),
(259, 3, 2854, 95, 'Blurred Lines - Robin Thicke', '2024-01-09 00:40:00'),
(260, 3, 17233, 95, 'Dance Monkey - Tones and I', '2024-01-09 00:45:00'),
(261, 3, 9899, 88, 'Closer - The Chainsmokers', '2024-01-09 00:50:00'),
(262, 3, 16528, 63, 'Savage Love - Jason Derulo', '2024-01-09 00:55:00'),
(263, 3, 16077, 100, 'Sicko Mode - Travis Scott', '2024-01-09 01:00:00'),
(264, 3, 12203, 78, 'Wonderwall - Oasis', '2024-01-09 01:05:00'),
(265, 3, 3018, 60, 'High Hopes - Panic! At The Disco', '2024-01-09 01:10:00'),
(266, 3, 5429, 76, 'Wonderwall - Oasis', '2024-01-09 01:15:00'),
(267, 3, 10823, 110, 'Shallow - Lady Gaga', '2024-01-09 01:20:00'),
(268, 3, 1328, 80, 'Closer - The Chainsmokers', '2024-01-09 01:25:00'),
(269, 3, 7745, 98, '7 Rings - Ariana Grande', '2024-01-09 01:30:00'),
(270, 3, 10990, 81, 'Closer - The Chainsmokers', '2024-01-09 01:35:00'),
(271, 3, 17461, 78, 'Say So - Doja Cat', '2024-01-09 01:40:00'),
(272, 3, 15246, 73, 'Circles - Post Malone', '2024-01-09 01:45:00'),
(273, 3, 18516, 104, 'Uptown Funk - Mark Ronson', '2024-01-09 01:50:00'),
(274, 3, 364, 96, 'Say So - Doja Cat', '2024-01-09 01:55:00'),
(275, 3, 4887, 86, 'High Hopes - Panic! At The Disco', '2024-01-09 02:00:00'),
(276, 3, 2940, 82, 'Starboy - The Weeknd', '2024-01-09 02:05:00'),
(277, 3, 14464, 94, 'Mood - 24kGoldn', '2024-01-09 02:10:00'),
(278, 3, 11694, 62, 'Roses - SAINt JHN', '2024-01-09 02:15:00'),
(279, 3, 856, 110, 'Savage Love - Jason Derulo', '2024-01-09 02:20:00'),
(280, 3, 19090, 66, 'Watermelon Sugar - Harry Styles', '2024-01-09 02:25:00'),
(281, 3, 850, 106, 'Blinding Lights - The Weeknd', '2024-01-09 02:30:00'),
(282, 3, 18201, 75, 'Closer - The Chainsmokers', '2024-01-09 02:35:00'),
(283, 3, 1624, 74, 'Goosebumps - Travis Scott', '2024-01-09 02:40:00'),
(284, 3, 8717, 77, 'Radioactive - Imagine Dragons', '2024-01-09 02:45:00'),
(285, 3, 18058, 91, 'God s Plan - Drake', '2024-01-09 02:50:00'),
(286, 3, 14835, 105, '7 Rings - Ariana Grande', '2024-01-09 02:55:00'),
(287, 3, 8040, 93, 'Lucid Dreams - Juice WRLD', '2024-01-09 03:00:00'),
(288, 3, 9158, 71, 'God s Plan - Drake', '2024-01-09 03:05:00'),
(289, 3, 12604, 63, 'Can t Stop the Feeling - Justin Timberlake', '2024-01-09 03:10:00'),
(290, 3, 17260, 103, 'One Dance - Drake', '2024-01-09 03:15:00'),
(291, 3, 17221, 90, 'Circles - Post Malone', '2024-01-09 03:20:00'),
(292, 3, 18523, 66, 'Rockstar - Post Malone', '2024-01-09 03:25:00'),
(293, 3, 16643, 105, 'Thinking Out Loud - Ed Sheeran', '2024-01-09 03:30:00'),
(294, 3, 9681, 67, 'I Don t Care - Ed Sheeran', '2024-01-09 03:35:00'),
(295, 3, 10900, 91, 'Sunflower - Post Malone', '2024-01-09 03:40:00'),
(296, 3, 3524, 67, 'Sucker - Jonas Brothers', '2024-01-09 03:45:00'),
(297, 3, 15623, 75, 'Blinding Lights - The Weeknd', '2024-01-09 03:50:00'),
(298, 3, 4222, 72, 'Roses - SAINt JHN', '2024-01-09 03:55:00'),
(299, 3, 12918, 110, 'Levitating - Dua Lipa', '2024-01-09 04:00:00'),
(300, 3, 599, 94, 'Wonderwall - Oasis', '2024-01-09 04:05:00'),
(301, 3, 14412, 64, 'Memories - Maroon 5', '2024-01-09 04:10:00'),
(302, 3, 9242, 105, 'Without Me - Halsey', '2024-01-09 04:15:00'),
(303, 3, 9161, 68, 'Circles - Post Malone', '2024-01-09 04:20:00'),
(304, 3, 16778, 110, 'Shape of You - Ed Sheeran', '2024-01-09 04:25:00'),
(305, 3, 258, 80, 'Someone You Loved - Lewis Capaldi', '2024-01-09 04:30:00'),
(306, 3, 18261, 98, 'Thank U, Next - Ariana Grande', '2024-01-09 04:35:00'),
(307, 3, 5530, 96, 'Lucid Dreams - Juice WRLD', '2024-01-09 04:40:00'),
(308, 3, 7688, 64, 'One Dance - Drake', '2024-01-09 04:45:00'),
(309, 3, 19191, 73, 'Savage Love - Jason Derulo', '2024-01-09 04:50:00'),
(310, 3, 9567, 60, 'Perfect - Ed Sheeran', '2024-01-09 04:55:00');

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id_etablissement` int(11) NOT NULL,
  `capacite_max` int(11) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id_etablissement`, `capacite_max`, `adresse`) VALUES
(1, 500, '2 bis Avenue Foch, 75016 Paris'),
(2, 300, '11 Quai François Mauriac, 75013 Paris');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id_evenement` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `capacite_max` varchar(50) DEFAULT NULL,
  `date_evenement` date DEFAULT NULL,
  `id_etablissement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id_evenement`, `nom`, `capacite_max`, `date_evenement`, `id_etablissement`) VALUES
(1, 'Nuit Electro au Duplex', '450', '2024-01-08', 1),
(2, 'Soirée Pop au Duplex', '400', '2024-01-08', 1),
(3, 'Festival Techno au Batofar', '250', '2024-01-08', 2);

-- --------------------------------------------------------

--
-- Structure de la table `faq`
--

CREATE TABLE `faq` (
  `id_faq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `forum`
--

CREATE TABLE `forum` (
  `id_forum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `contenu` varchar(50) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_sujet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `id_participation` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_evenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id_question` int(11) NOT NULL,
  `contenu` varchar(1000) DEFAULT NULL,
  `reponse` varchar(1000) DEFAULT NULL,
  `id_faq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

CREATE TABLE `sujet` (
  `id_sujet` int(11) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `id_forum` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `age_` int(11) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `estAdmin` tinyint(1) DEFAULT NULL,
  `mot_de_passe` varchar(200) NOT NULL,
  `estSuperAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `mail`, `nom`, `prenom`, `age_`, `sexe`, `ville`, `estAdmin`, `mot_de_passe`, `estSuperAdmin`) VALUES
(19, 'gabriel95@gmail.com', 'Esteves', 'Gabriel', 20, '', '', 0, '$2y$10$vWwgaiTnDb8fdfRA2csvYep30hZ91.py499BAcB8YF0BLcNYdOvja', 0),
(20, 'mr.estevesgabriel@hotmail.fr', 'Esteves', 'Gabriel', 20, '', 'Bezons', 0, '$2y$10$ViFY.qgA8BVuicB6aoXKOeqRFDaZjIff1LHSGEbFNemH.tbkeQ1Ga', 1),
(21, 'estevesnicolas95@gmail.com', 'Esteves', 'Gabriel', 20, '', 'Bezons', 0, '$2y$10$WAyhJHM90DaHSpUXh4C7O.ogN1Y7UIshOzWpkQV3vmyZZeU8982qC', 1),
(22, 'existepas@gmail.com', 'Esteves', 'Gabriel', 20, '', '', 0, '$2y$10$Zg5D2Ww4bQrvPz8BvXv8..guPim5sEI08cWvv4ZKot2qiYl81JFgy', 1),
(23, 'test@gmail.com', 'Esteves', 'Gabriel', 20, '', 'Bezons', 0, '$2y$10$j6VaHPfQP/77O0lDi7/e4.CkFVghZ86wXsOILJC8cDFbh.1MYKYG6', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD PRIMARY KEY (`id_capteur`),
  ADD KEY `capteur_ibfk_1` (`id_evenement`);

--
-- Index pour la table `capteur_data`
--
ALTER TABLE `capteur_data`
  ADD PRIMARY KEY (`id_capteur_data`),
  ADD KEY `id_capteur` (`id_capteur`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id_evenement`),
  ADD KEY `evenement_ibfk_1` (`id_etablissement`);

--
-- Index pour la table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id_faq`);

--
-- Index pour la table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id_forum`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `message_ibfk_1` (`id_utilisateur`),
  ADD KEY `message_ibfk_2` (`id_sujet`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`id_participation`),
  ADD KEY `participer_ibfk_1` (`id_utilisateur`),
  ADD KEY `participer_ibfk_2` (`id_evenement`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `question_ibfk_1` (`id_faq`);

--
-- Index pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD PRIMARY KEY (`id_sujet`),
  ADD KEY `sujet_ibfk_1` (`id_forum`),
  ADD KEY `sujet_ibfk_2` (`id_utilisateur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `capteur`
--
ALTER TABLE `capteur`
  MODIFY `id_capteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `capteur_data`
--
ALTER TABLE `capteur_data`
  MODIFY `id_capteur_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_evenement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `faq`
--
ALTER TABLE `faq`
  MODIFY `id_faq` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `forum`
--
ALTER TABLE `forum`
  MODIFY `id_forum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `participer`
--
ALTER TABLE `participer`
  MODIFY `id_participation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `id_sujet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `capteur_ibfk_1` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`);

--
-- Contraintes pour la table `capteur_data`
--
ALTER TABLE `capteur_data`
  ADD CONSTRAINT `capteur_data_ibfk_1` FOREIGN KEY (`id_capteur`) REFERENCES `capteur` (`id_capteur`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_ibfk_1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`id_sujet`) REFERENCES `sujet` (`id_sujet`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id_faq`) REFERENCES `faq` (`id_faq`);

--
-- Contraintes pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD CONSTRAINT `sujet_ibfk_1` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id_forum`),
  ADD CONSTRAINT `sujet_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
