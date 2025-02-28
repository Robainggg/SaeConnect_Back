INSERT INTO roles (nom) VALUES ('ETUDIANT'), ('RESPONSABLE'), ('ADMIN');

INSERT INTO semestres (nom) VALUES
                                ('Semestre 1'), ('Semestre 2'), ('Semestre 3'),
                                ('Semestre 4'), ('Semestre 5'), ('Semestre 6');

INSERT INTO users (firstname, lastname, password, role_id) VALUES
       ('Robin', 'Castel', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 3), ('Bob', 'Martin', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Charlie', 'Durand', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('David', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Eve', 'Bernard', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Fay', 'Carre', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('George', 'Delacroix', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), ('Hannah', 'Fournier', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Iris', 'Gauthier', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Jack', 'Hebert', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Kara', 'Ibrahim', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Louis', 'Jacques', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Mona', 'Klein', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Nina', 'Lefevre', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Omar', 'Leclerc', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Paul', 'Michel', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Quinn', 'Nicolas', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Riley', 'Olivier', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Sophie', 'Perrot', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Tom', 'Quentin', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Ursula', 'Renard', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), ('Victor', 'Sartre', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Wendy', 'Tanguy', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Xander', 'Urbain', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Yasmine', 'Vasseur', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), ('Zoe', 'Wagner', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Aaron', 'Ximenez', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), ('Bella', 'Yves', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Carmen', 'Zimmer', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), ('Daniel', 'Berger', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Elise', 'Dubois', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 3), ('Fabien', 'Gaillard', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Giselle', 'Hermant', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Henry', 'Isidore', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Ines', 'Joly', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Julien', 'Keller', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Kimberly', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Lenny', 'Meyer', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Marion', 'Nouvel', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Nathan', 'Pires', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Olivia', 'Quenard', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Pierre', 'Raoul', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Quentin', 'Sauvage', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Romain', 'Tesson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),
       ('Salma', 'Urrutia', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Teddy', 'Vignal', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('Ursula', 'West', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Victor', 'Xenakis', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
       ('William', 'Zennou', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), ('Xenia', 'Abadie', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1);


INSERT INTO saes (nom, sujet, responsable_id, semestre_id) VALUES
                                                               ('Projet A', 'Développement d''une application mobile pour la gestion de tâches', 2, 1),
                                                               ('Projet B', 'Étude de marché pour un nouveau produit électronique', 6, 1),
                                                               ('Projet C', 'Création d''une plateforme de gestion d''événements', 7, 2),
                                                               ('Projet D', 'Analyse des performances énergétiques d''un bâtiment', 10, 2),
                                                               ('Projet E', 'Mise en place d''un système de gestion des stocks', 12, 3),
                                                               ('Projet F', 'Création d''un site web pour une ONG', 16, 3),
                                                               ('Projet G', 'Développement d''un jeu vidéo interactif', 18, 4),
                                                               ('Projet H', 'Création d''un logiciel de gestion de projet', 19, 4),
                                                               ('Projet I', 'Étude de la cybersécurité et mise en place de mesures de protection', 23, 5),
                                                               ('Projet J', 'Développement d''une application de gestion de finances personnelles', 27, 5);


INSERT INTO co_responsables (sae_id, responsable_id) VALUES
                                                         (1, 2), (1, 6),
                                                         (2, 7), (2, 8),
                                                         (3, 10), (3, 12),
                                                         (4, 14), (4, 18),
                                                         (5, 20), (5, 21),
                                                         (6, 22), (6, 25),
                                                         (7, 27), (7, 29),
                                                         (8, 38), (8, 44),
                                                         (9, 2), (9, 6),
                                                         (10, 7), (10, 8);

INSERT INTO sae_etudiants (sae_id, etudiant_id) VALUES
                                                    (1, 3), (1, 4), (1, 5), (1, 9), (1, 11), (1, 13), (1, 15), (1, 16), (1, 17), (1, 19),
                                                    (2, 23), (2, 24), (2, 26), (2, 28), (2, 30), (2, 32), (2, 33), (2, 34), (2, 35), (2, 36),
                                                    (3, 37), (3, 39), (3, 40), (3, 41), (3, 42), (3, 43), (3, 45), (3, 46), (3, 47), (3, 48),
                                                    (4, 49), (4, 50), (4, 3), (4, 4), (4, 5), (4, 9), (4, 11), (4, 13), (4, 15), (4, 16),
                                                    (5, 17), (5, 19), (5, 23), (5, 24), (5, 26), (5, 28), (5, 30), (5, 32), (5, 33), (5, 34),
                                                    (6, 35), (6, 36), (6, 37), (6, 39), (6, 40), (6, 41), (6, 42), (6, 43), (6, 45), (6, 46),
                                                    (7, 47), (7, 48), (7, 49), (7, 50), (7, 3), (7, 4), (7, 5), (7, 9), (7, 11), (7, 13),
                                                    (8, 15), (8, 16), (8, 17), (8, 19), (8, 23), (8, 24), (8, 26), (8, 28), (8, 30), (8, 32),
                                                    (9, 33), (9, 34), (9, 35), (9, 36), (9, 37), (9, 39), (9, 40), (9, 41), (9, 42), (9, 43),
                                                    (10, 45), (10, 46), (10, 47), (10, 48), (10, 49), (10, 50);

INSERT INTO groupes (nom) VALUES
                              ('Groupe A'),
                              ('Groupe B'),
                              ('Groupe C'),
                              ('Groupe D'),
                              ('Groupe E'),
                              ('Groupe F'),
                              ('Groupe G'),
                              ('Groupe H');

INSERT INTO groupes_users (groupe_id, user_id) VALUES
                                                   (1, 3), (1, 4), (1, 5), (1, 9), (1, 11),
                                                   (2, 13), (2, 15), (2, 16), (2, 17), (2, 19),
                                                   (3, 23), (3, 24), (3, 26), (3, 28), (3, 30),
                                                   (4, 32), (4, 33), (4, 34), (4, 35), (4, 36),
                                                   (5, 37), (5, 39), (5, 40), (5, 41), (5, 42),
                                                   (6, 43), (6, 45), (6, 46), (6, 47), (6, 48),
                                                   (7, 49), (7, 50), (7, 3), (7, 4), (7, 5),
                                                   (8, 9), (8, 11), (8, 13), (8, 15), (8, 16);


INSERT INTO rendus (sae_id, intitule, date_limite) VALUES
           (1, 'Rendu 1 - Analyse des données', '2025-03-15 23:59:59'),
           (1, 'Rendu 2 - Présentation du projet', '2025-03-22 23:59:59'),
           (2, 'Rendu 1 - Rapport de recherche', '2025-03-20 23:59:59'),
           (2, 'Rendu 2 - Développement d''une application', '2025-03-25 23:59:59'),
           (3, 'Rendu 1 - Etude de marché', '2025-03-18 23:59:59'),
           (3, 'Rendu 2 - Plan de communication', '2025-03-23 23:59:59'),
           (4, 'Rendu 1 - Création d''un prototype', '2025-03-19 23:59:59'),
           (4, 'Rendu 2 - Tests et validation', '2025-03-27 23:59:59'),
           (5, 'Rendu 1 - Préparation de la présentation', '2025-03-24 23:59:59'),
           (5, 'Rendu 2 - Rédaction du dossier technique', '2025-03-29 23:59:59'),
           (6, 'Rendu 1 - Analyse SWOT', '2025-03-21 23:59:59'),
           (7, 'Rendu 1 - Planification du projet', '2025-03-25 23:59:59'),
           (8, 'Rendu 1 - Etude de faisabilité', '2025-03-22 23:59:59'),
           (8, 'Rendu 2 - Simulation des résultats', '2025-03-28 23:59:59'),
           (9, 'Rendu 1 - Préparation du budget', '2025-03-20 23:59:59'),
           (9, 'Rendu 2 - Suivi des progrès', '2025-03-26 23:59:59'),
           (10, 'Rendu 1 - Développement du modèle', '2025-03-17 23:59:59'),
           (10, 'Rendu 2 - Rédaction du rapport final', '2025-03-30 23:59:59');