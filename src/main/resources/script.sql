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
    nom VARCHAR(255) NOT NULL
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

INSERT INTO roles (nom) VALUES ('ETUDIANT'), ('RESPONSABLE'), ('ADMIN');

INSERT INTO semestres (nom) VALUES 
    ('Semestre 1'), ('Semestre 2'), ('Semestre 3'), 
    ('Semestre 4'), ('Semestre 5'), ('Semestre 6');

INSERT INTO users (firstname, lastname, password, role_id) VALUES
                                                               ('Alice', 'Dupont', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Bob', 'Martin', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Charlie', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('David', 'Durand', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Eva', 'Leclerc', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Fay', 'Meyer', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Gabriel', 'Moreau', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Hélène', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Isabelle', 'Benoit', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Jérôme', 'Dufresne', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Kévin', 'Perrin', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Léa', 'Charbonneau', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Marc', 'Girard', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Nina', 'Boucher', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Olivier', 'Tanguay', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Paul', 'Vidal', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Quentin', 'Langlois', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Rita', 'Clement', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Sophie', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Théo', 'Roux', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Ursula', 'Joly', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Victor', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Wendy', 'Blanchard', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Xavier', 'Martel', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Yannick', 'Fournier', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Zoé', 'Marchand', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Amandine', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Benjamin', 'Roussel', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Céline', 'Vasseur', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Damien', 'Petit', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Elise', 'Guerin', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Florian', 'Henri', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Géraldine', 'Boucher', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Hugo', 'Chauvin', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Inès', 'Gagnon', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Jules', 'Michel', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Kassandra', 'Deschamps', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Louis', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Mélanie', 'Duval', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Nicolas', 'Rivière', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Océane', 'Girault', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Perrine', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Quentin', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Romain', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Sébastien', 'Poiret', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Thomas', 'Martin', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Ursule', 'Legrand', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Véronique', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('William', 'Favier', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Xena', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Alice', 'Johnson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Bob', 'Smith', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Charlie', 'Brown', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('David', 'Jones', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Eva', 'Williams', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Frank', 'Taylor', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('George', 'Davis', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Helen', 'Miller', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Irene', 'Wilson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Jack', 'Moore', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Kate', 'Anderson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Luke', 'Thomas', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Mary', 'Jackson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Nathan', 'White', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Olivia', 'Harris', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Paul', 'Clark', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Quinn', 'Lewis', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Rachel', 'Roberts', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Sam', 'Walker', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Tina', 'Young', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Uma', 'King', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Victor', 'Scott', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Wendy', 'Adams', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Xander', 'Baker', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Yvonne', 'Carter', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Zachary', 'Graham', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Amelia', 'Morris', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Ben', 'Evans', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Chloe', 'Wright', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Daniel', 'Hall', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Ella', 'Allen', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Freddie', 'King', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Grace', 'Lee', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Henry', 'Parker', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Ivy', 'Collins', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('James', 'Sanchez', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Kara', 'Morris', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Liam', 'Rodriguez', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Megan', 'Reed', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Noah', 'Peterson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Olivia', 'Morgan', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Penny', 'Cook', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Quincy', 'Bell', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Ryan', 'Murphy', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Sophie', 'Garcia', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Tyler', 'Rodgers', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Ursula', 'Wagner', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Vince', 'Fisher', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Will', 'Powell', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),
                                                               ('Robin', 'Castel', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 3), -- Admin
                                                               ('Ayesha', 'Khan', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),  -- Responsable
                                                               ('Carlos', 'Santos', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), -- Responsable
                                                               ('Dai', 'Nguyen', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Elena', 'Garcia', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),  -- Responsable
                                                               ('Farhan', 'Ali', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Gabriela', 'López', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), -- Responsable
                                                               ('Hiroshi', 'Tanaka', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), -- Responsable
                                                               ('Imani', 'Johnson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), -- Responsable
                                                               ('Jin', 'Kim', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),       -- Responsable
                                                               ('Kofi', 'Owusu', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Lina', 'Zhang', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Mikhail', 'Petrov', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), -- Responsable
                                                               ('Nina', 'Gómez', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Omar', 'Youssef', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),  -- Responsable
                                                               ('Pablo', 'Rodríguez', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2), -- Responsable
                                                               ('Qasim', 'Shah', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Ranya', 'Ahmed', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),   -- Responsable
                                                               ('Sami', 'Ben Ali', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),  -- Responsable
                                                               ('Tariq', 'Khan', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Umar', 'Iqbal', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Vera', 'Dubois', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),   -- Responsable
                                                               ('Wang', 'Li', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),       -- Responsable
                                                               ('Xia', 'Wang', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),      -- Responsable
                                                               ('Yasmin', 'Saleh', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),  -- Responsable
                                                               ('Zara', 'Ahmed', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 2),    -- Responsable
                                                               ('Amina', 'Musa', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),    -- Etudiant
                                                               ('Bashir', 'Rahman', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), -- Etudiant
                                                               ('Clara', 'Martin', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),  -- Etudiant
                                                               ('Diego', 'Rodriguez', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), -- Etudiant
                                                               ('Elsa', 'Schmidt', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),  -- Etudiant
                                                               ('Faiz', 'Khan', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),     -- Etudiant
                                                               ('Gian', 'Rossi', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),    -- Etudiant
                                                               ('Hana', 'Jafari', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),   -- Etudiant
                                                               ('Ismail', 'Omar', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),   -- Etudiant
                                                               ('Jada', 'Jackson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),  -- Etudiant
                                                               ('Karan', 'Singh', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),   -- Etudiant
                                                               ('Leila', 'Musa', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),    -- Etudiant
                                                               ('Mohamed', 'Al Farsi', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), -- Etudiant
                                                               ('Nadine', 'Bakker', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), -- Etudiant
                                                               ('Oscar', 'Pérez', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),   -- Etudiant
                                                               ('Priti', 'Sharma', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),  -- Etudiant
                                                               ('Quentin', 'Lemoine', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1), -- Etudiant
                                                               ('Ravi', 'Patel', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),    -- Etudiant
                                                               ('Siti', 'Rahim', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),    -- Etudiant
                                                               ('Tariq', 'Mehdi', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),   -- Etudiant
                                                               ('Umaira', 'Zafar', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),  -- Etudiant
                                                               ('Vivek', 'Reddy', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),   -- Etudiant
                                                               ('Wafa', 'Ahmed', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),    -- Etudiant
                                                               ('Xander', 'Brown', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),  -- Etudiant
                                                               ('Yasmin', 'Davis', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1),  -- Etudiant
                                                               ('Zoe', 'Thompson', '$2a$10$U0dyOsON9HY3l8KR4w434.oQcPid.pM47k9CMwUY5CNCxhD1yKZ5C', 1);





INSERT INTO saes (nom, sujet, responsable_id, semestre_id) VALUES 
    ('Projet Web', 'Création d''une application web', 27, 1),
    ('Jeu Vidéo', 'Développement d''un jeu en Unity', 28, 2),
    ('Système Embarqué', 'Développement sur Raspberry Pi', 29, 3),
    ('IA et Machine Learning', 'Projet en intelligence artificielle', 30, 4),
    ('Projet Alpha', 'Développement d''une application mobile', 101, 1),
    ('Projet Beta', 'Création d''un site web dynamique', 102, 2),
    ('Projet Gamma', 'Analyse de données pour la gestion de la production', 103, 3),
    ('Projet Delta', 'Design d''une interface utilisateur', 104, 4),
    ('Projet Epsilon', 'Sécurité informatique et tests de pénétration', 105, 5),
    ('Projet Zeta', 'Machine learning pour la reconnaissance d''images', 106, 6),
    ('Projet Eta', 'Développement d''un chatbot intelligent', 107, 1),
    ('Projet Theta', 'Optimisation des bases de données relationnelles', 108, 2),
    ('Projet Iota', 'Virtualisation d''environnements de travail', 109, 3),
    ('Projet Kappa', 'Modélisation 3D pour des animations interactives', 110, 4),
    ('Projet Lambda', 'Blockchain et applications distribuées', 111, 5),
    ('Projet Mu', 'Création d''une application de gestion de projet', 112, 6),
    ('Projet Nu', 'Intelligence artificielle pour la prédiction des tendances', 113, 1),
    ('Projet Xi', 'Gestion de l''identité et des accès dans le cloud', 114, 2),
    ('Projet Omicron', 'Application mobile de suivi de santé', 115, 3),
    ('Projet Pi', 'Conception d''un système de recommandation', 116, 4),
    ('Projet Rho', 'Développement d''un système de gestion de contenu', 117, 5),
    ('Projet Sigma', 'Sécurité des applications web', 118, 6),
    ('Projet Tau', 'Application de gestion des stocks avec RFID', 119, 1),
    ('Projet Upsilon', 'Systèmes embarqués et IoT', 120, 2),
    ('Projet Phi', 'Réalité virtuelle et son application dans le e-learning', 121, 3),
    ('Projet Chi', 'Système de détection d''anomalies dans les bases de données', 122, 4),
    ('Projet Psi', 'Réseaux sociaux et analyse de sentiments', 123, 5),
    ('Projet Omega', 'Technologies de conteneurs et orchestration avec Kubernetes', 124, 6),
    ('Projet A1', 'Création d''une application de réalité augmentée', 105, 1),
    ('Projet B1', 'Développement d''un moteur de recherche', 106, 2),
    ('Projet C1', 'Automatisation des processus métier avec RPA', 107, 3),
    ('Projet D1', 'Création d''un jeu vidéo mobile', 108, 4),
    ('Projet E1', 'Gestion de projet agile et outils associés', 109, 5),
    ('Projet F1', 'Développement d''une application de e-commerce', 110, 6),
    ('Projet G1', 'Création d''une application de finance personnelle', 111, 1),
    ('Projet H1', 'Création d''un système de gestion de documents', 112, 2),
    ('Projet I1', 'Développement d''une plateforme de streaming', 113, 3),
    ('Projet J1', 'Blockchain pour la gestion des contrats intelligents', 114, 4),
    ('Projet K1', 'Développement d''une application de gestion de temps', 115, 5),
    ('Projet L1', 'Big Data et analyse des données en temps réel', 116, 6),
    ('Projet M1', 'Optimisation des systèmes de production avec l''IoT', 117, 1),
    ('Projet N1', 'Conception d''un moteur d''intelligence artificielle', 118, 2),
    ('Projet O1', 'Création d''une application de livraison de nourriture', 119, 3),
    ('Projet P1', 'Système de gestion de bases de données NoSQL', 120, 4),
    ('Projet Q1', 'Design et développement d''une application de réservation', 121, 5),
    ('Projet R1', 'Analyse des données du marché avec des outils d''intelligence artificielle', 122, 6),
    ('Projet S1', 'Création d''un moteur de jeux en 3D', 123, 1),
    ('Projet T1', 'Développement d''une application de réalité virtuelle', 124, 2),
    ('Projet U1', 'Systèmes d''information géographique et leur application', 101, 3),
    ('Projet V1', 'Système de gestion de la relation client', 102, 4),
    ('Projet W1', 'Conception d''une plateforme d''échange de crypto-monnaies', 103, 5),
    ('Projet X1', 'Réseau de neurones pour la reconnaissance de textes manuscrits', 104, 6),
    ('Projet Y1', 'Création d''un outil de gestion des données de santé', 105, 1),
    ('Projet Z1', 'Application de gestion des ressources humaines', 106, 2);


INSERT INTO groupes (nom) VALUES ('Groupe A'), ('Groupe B'), ('Groupe C');

INSERT INTO groupes_users (groupe_id, user_id) VALUES
    (1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (2, 6), (3, 7), (3, 8), (3, 9);
