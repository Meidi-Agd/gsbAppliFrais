--
-- Database: `gsbmvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `comptable`
--

CREATE TABLE `comptable` (
  `id` int NOT NULL,
  `nom` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mdp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cp` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ville` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comptable`
--

INSERT INTO `comptable` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`) VALUES
(1, 'augendre', 'meidi', 'maugendre', '$2y$10$zyQPVQ6.YNkLecol8Be9N.yaTBrTaiWY.s09gMGgwoD/mVkccpcUO', '01 rue de ma ville', '58000', 'Nevers', '2023-04-19'),
(2, 'Testeur', 'Root', 'root', '$2y$10$ozpIF4xXljC2Nr/2oKSFpuTvl.uu9QRMHCDerZBEV7t4miYWFRqVS', '11 rue du test', '58667', 'Nevers le Banlay', '2023-04-03');

-- --------------------------------------------------------

--
-- Table structure for table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) COLLATE utf8mb4_general_ci NOT NULL,
  `libelle` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Table structure for table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idVisiteur` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `mois` char(6) COLLATE utf8mb4_general_ci NOT NULL,
  `nbJustificatifs` int DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) COLLATE utf8mb4_general_ci DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('a17', '202304', 0, '461.82', '2023-04-19', 'CR');

-- --------------------------------------------------------

--
-- Table structure for table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `libelle` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idVisiteur` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `mois` char(6) COLLATE utf8mb4_general_ci NOT NULL,
  `idFraisForfait` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `quantite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`) VALUES
('a17', '202304', 'ETP', 2),
('a17', '202304', 'KM', 11),
('a17', '202304', 'NUI', 2),
('a17', '202304', 'REP', 3);

-- --------------------------------------------------------

--
-- Table structure for table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int NOT NULL,
  `idVisiteur` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `mois` char(6) COLLATE utf8mb4_general_ci NOT NULL,
  `libelle` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateFrais` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mdp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cp` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ville` char(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', '$2y$10$ZjiXudfqOiTkKWrPa2qDROE.B2QjF6MEnMAUubU3sp3jkZ9HO4hqq', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21'),
('a17', 'Andre', 'David', 'dandre', '$2y$10$wwZNCqb81k5rmkCuZZd6A.fzag0MsjKjDBBs5kh9I3CzbwuEOQfNq', '1 rue Petit', '46200', 'Lalbenque', '2016-11-23'),
('a55', 'Bedos', 'Christian', 'cbedos', '$2y$10$miCr9sLSaVqfqGOZOrRzl.WuRADHTjtkuf1YlwYdEZzrbXrg7JvLS', '1 rue Peranud', '46250', 'Montcuq', '2017-01-12'),
('a93', 'Tusseau', 'Louis', 'ltusseau', '$2y$10$YmfGF4d/wGgec16VAVQ0zeEN7fQIQ1gEfGcVbtzuOrZhy5udCqkB.', '22 rue des Ternes', '46123', 'Gramat', '2015-05-01'),
('b13', 'Bentot', 'Pascal', 'pbentot', '$2y$10$nFkthVpIfMuX5mkRul/uO.z0dWKeTCpiL8zR31VZh3TRd/S4312wq', '11 allée des Cerises', '46512', 'Bessines', '2017-07-09'),
('b16', 'Bioret', 'Luc', 'lbioret', '$2y$10$Y7LTS2ssAUdYFOI68qCJyOJu62sv.N3uANJNBKi.oyftyumZbASV2', '1 Avenue gambetta', '46000', 'Cahors', '2010-05-11'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '$2y$10$dz1H5ABkf9twOB164OzmiuTnO93/OY8JyWRW4MOcJG.JjHiDiuV8y', '10 rue des Perles', '93100', 'Montreuil', '2009-10-21'),
('b25', 'Bunisset', 'Denise', 'dbunisset', '$2y$10$JauI..0q7HpI4eoscxj5su3U9ymcH7tJhNZwHZBxqFlaFFcgQumGy', '23 rue Manin', '75019', 'paris', '2010-12-05'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', '$2y$10$DJ7aCtzw0dUJ.fNmSO29XeevWlq9ooDm1BlIqbNSdvgLZ.U27pfqm', '114 rue Blanche', '75017', 'Paris', '2015-11-12'),
('b34', 'Cadic', 'Eric', 'ecadic', '$2y$10$RqqEFojXiT46DB/Dl1sHSuOWQEoWENW9U4eZj9jxSzCkQ0rUBYbfu', '123 avenue de la République', '75011', 'Paris', '2008-09-23'),
('b4', 'Charoze', 'Catherine', 'ccharoze', '$2y$10$Wp2jL3J0OHiMDloi6VU5ZOk7IJKkNwK9Ye.KKePYkOTm1dtWMacj6', '100 rue Petit', '75019', 'Paris', '2005-11-12'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', '$2y$10$jizOjVwO1vjmrHoTnVUFMevvgidA0rKMYxVGOn9t3ph7Vgwsn.Vqu', '12 allée des Anges', '93230', 'Romainville', '2014-08-11'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '$2y$10$DoAFH5Zre0vtVjNb6XLtF.fJ9/BQ2wVxeOENcCF4Z7rWoCI3aCcGK', '36 rue Des Roches', '93100', 'Monteuil', '2011-11-18'),
('c14', 'Daburon', 'François', 'fdaburon', '$2y$10$hDWF22K3fRt70mxmC13lRukx8xhBqPviJq1JxNvMk0hLR5qRCJYZm', '13 rue de Chanzy', '94000', 'Créteil', '2012-02-11'),
('c3', 'De', 'Philippe', 'pde', '$2y$10$X4/kKRfgiapOad5jyyDFs.jYq8wUjNTaRU2oQU3CYp1Ie8mpI1zeO', '13 rue Barthes', '94000', 'Créteil', '2010-12-14'),
('c54', 'Debelle', 'Michel', 'mdebelle', '$2y$10$CeJqLy.gYLMe8c/vRU6ydebcIWFuDccd4cMQ5ErHyYRCfkdfuJNNC', '181 avenue Barbusse', '93210', 'Rosny', '2016-11-23'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', '$2y$10$RykpJM/9EOZnnhQ6XDjsm.XtN1XTct/jasxWrJVCp9xWkMmePzQNu', '134 allée des Joncs', '44000', 'Nantes', '2010-05-11'),
('d51', 'Debroise', 'Michel', 'mdebroise', '$2y$10$IOrCe4L60KbKss3rGdRZWOwLKQXABFybXlnlD0IyUw40nqT6Fa.52', '2 Bld Jourdain', '44000', 'Nantes', '2011-04-17'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', '$2y$10$wBCFyDGkedi5EPUkWxuW4ew29S.hgtidRBaT4UD2iemNpjh15DoKu', '14 Place d Arc', '45000', 'Orléans', '2015-11-12'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '$2y$10$Nd3eyQOxszfwhn2ZiXFkA.odOLKzsdv3/YojenHF5qT6qClEtZzIy', '16 avenue des Cèdres', '23200', 'Guéret', '2017-02-05'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '$2y$10$4OgEkIhUXBT77PZCS5ceBOFD2V.o.wCQ2C4.Nbq3Ws52YXAGvVCmO', '18 rue de l église', '23120', 'GrandBourg', '2010-08-01'),
('e49', 'Duncombe', 'Claude', 'cduncombe', '$2y$10$K1tK0/6FWnrS7xHorXWRQOZA4vTKzJDDye0IW7gaE6j.8qlYk1d5W', '19 rue de la tour', '23100', 'La souteraine', '2015-10-10'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', '$2y$10$GXGDmU5IXmjm.X3Pj6BpXOn6TfnMSuIdOBk8UrwGVqgLzVvJT3c5W', '25 place de la gare', '23200', 'Gueret', '2018-09-01'),
('e52', 'Eynde', 'Valérie', 'veynde', '$2y$10$VZtgfeGAnHnIVOK5u7Nrn.tgaRQ4Ar1sJgz42h4eyuzGfsfpsHBq2', '3 Grand Place', '13015', 'Marseille', '2016-11-01'),
('f21', 'Finck', 'Jacques', 'jfinck', '$2y$10$Z0EEzHz.FAop9Y6gwZhzZ.3OVyP88LWSewaq/mdkoNQOUAdFXDT4C', '10 avenue du Prado', '13002', 'Marseille', '2019-11-10'),
('f39', 'Frémont', 'Fernande', 'ffremont', '$2y$10$FFgHnLDWNNs25PJ4cqbtnujKH.6tb8J1lTjw7E.t20V9ZRrSRMj7q', '4 route de la mer', '13012', 'Allauh', '2014-10-01'),
('f4', 'Gest', 'Alain', 'agest', '$2y$10$cRGJtd17igso8/IKCL455.Mc47e6KupeGg97kSFCObF8LXCf.a9JG', '30 avenue de la mer', '13025', 'Berre', '2018-11-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idVisiteur`,`mois`),
  ADD KEY `idEtat` (`idEtat`);

--
-- Indexes for table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  ADD KEY `idFraisForfait` (`idFraisForfait`);

--
-- Indexes for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVisiteur` (`idVisiteur`,`mois`);

--
-- Indexes for table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Constraints for table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Constraints for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);
COMMIT;
