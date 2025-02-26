DROP TABLE IF EXISTS sae_etudiants;
DROP TABLE IF EXISTS co_responsables;
DROP TABLE IF EXISTS saes;
DROP TABLE IF EXISTS semestres;
DROP TABLE IF EXISTS groupes_users;
DROP TABLE IF EXISTS groupes;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    role VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    alias VARCHAR(255) GENERATED ALWAYS AS (LOWER(LEFT(firstname, 1) || lastname)) STORED,
    password VARCHAR(255) NOT NULL, -- Prévu pour stocker un mot de passe hashé
    role_id INTEGER NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE semestres (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE saes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    sujet TEXT NOT NULL,
    responsable_id INTEGER NOT NULL,
    semestre_id INTEGER NOT NULL,
    FOREIGN KEY (responsable_id) REFERENCES users(id),
    FOREIGN KEY (semestre_id) REFERENCES semestres(id)
);

CREATE TABLE co_responsables (
    sae_id INTEGER NOT NULL,
    responsable_id INTEGER NOT NULL,
    PRIMARY KEY (sae_id, responsable_id),
    FOREIGN KEY (sae_id) REFERENCES saes(id) ON DELETE CASCADE,
    FOREIGN KEY (responsable_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE sae_etudiants (
    sae_id INTEGER NOT NULL,
    etudiant_id INTEGER NOT NULL,
    PRIMARY KEY (sae_id, etudiant_id),
    FOREIGN KEY (sae_id) REFERENCES saes(id) ON DELETE CASCADE,
    FOREIGN KEY (etudiant_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE groupes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE groupes_users (
    groupe_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    PRIMARY KEY (groupe_id, user_id),
    FOREIGN KEY (groupe_id) REFERENCES groupes(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO roles (role) VALUES ('Etudiant'), ('Responsable');

INSERT INTO semestres (nom) VALUES 
    ('Semestre 1'), ('Semestre 2'), ('Semestre 3'), 
    ('Semestre 4'), ('Semestre 5'), ('Semestre 6');

INSERT INTO users (firstname, lastname, password, role_id) VALUES 
    ('Alice', 'Dupont', 'hashed_password_1', 1), ('Bob', 'Martin', 'hashed_password_2', 1), ('Charlie', 'Lemoine', 'hashed_password_3', 1),
    ('David', 'Bernard', 'hashed_password_4', 1), ('Emma', 'Richard', 'hashed_password_5', 1), ('Fanny', 'Dubois', 'hashed_password_6', 1),
    ('Gabriel', 'Morel', 'hashed_password_7', 1), ('Hugo', 'Simon', 'hashed_password_8', 1), ('Inès', 'Lefevre', 'hashed_password_9', 1),
    ('Jules', 'Gauthier', 'hashed_password_10', 1), ('Kevin', 'Rousseau', 'hashed_password_11', 1), ('Laura', 'Girard', 'hashed_password_12', 1),
    ('Maxime', 'Andre', 'hashed_password_13', 1), ('Nina', 'Mercier', 'hashed_password_14', 1), ('Oscar', 'Blanc', 'hashed_password_15', 1),
    ('Paul', 'Dupuis', 'hashed_password_16', 1), ('Quentin', 'Moulin', 'hashed_password_17', 1), ('Romain', 'Lemoine', 'hashed_password_18', 1),
    ('Sarah', 'Giraud', 'hashed_password_19', 1), ('Thomas', 'Fabre', 'hashed_password_20', 1), ('Ugo', 'Regnier', 'hashed_password_21', 1),
    ('Victor', 'Chevalier', 'hashed_password_22', 1), ('Wendy', 'Perrot', 'hashed_password_23', 1), ('Xavier', 'Lopez', 'hashed_password_24', 1),
    ('Yasmine', 'Fernandez', 'hashed_password_25', 1), ('Zoe', 'Noel', 'hashed_password_26', 1), ('Alex', 'Leclerc', 'hashed_password_27', 2),
    ('Bruno', 'Barbier', 'hashed_password_28', 2), ('Celine', 'Jacquet', 'hashed_password_29', 2), ('Denis', 'Menard', 'hashed_password_30', 2);

INSERT INTO saes (nom, sujet, responsable_id, semestre_id) VALUES 
    ('Projet Web', 'Création d''une application web', 27, 1),
    ('Jeu Vidéo', 'Développement d''un jeu en Unity', 28, 2),
    ('Système Embarqué', 'Développement sur Raspberry Pi', 29, 3),
    ('IA et Machine Learning', 'Projet en intelligence artificielle', 30, 4);

INSERT INTO groupes (nom) VALUES ('Groupe A'), ('Groupe B'), ('Groupe C');

INSERT INTO groupes_users (groupe_id, user_id) VALUES
    (1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (2, 6), (3, 7), (3, 8), (3, 9);
