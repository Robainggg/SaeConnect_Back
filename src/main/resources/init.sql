DROP TABLE IF EXISTS fichiers_rendus CASCADE;
DROP TABLE IF EXISTS rendus_etudiants CASCADE;
DROP TABLE IF EXISTS rendus CASCADE;
DROP TABLE IF EXISTS groupes_users CASCADE;
DROP TABLE IF EXISTS groupes CASCADE;
DROP TABLE IF EXISTS sae_etudiants CASCADE;
DROP TABLE IF EXISTS co_responsables CASCADE;
DROP TABLE IF EXISTS saes CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS semestres CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TRIGGER IF EXISTS trigger_insertion_rendu ON rendus;
DROP FUNCTION IF EXISTS inserer_rendus_etudiants_fichiers;

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

CREATE TABLE rendus (
        id SERIAL PRIMARY KEY,
        sae_id INTEGER NOT NULL,
        intitule VARCHAR(255) NOT NULL,
        date_limite TIMESTAMP NOT NULL,
        FOREIGN KEY (sae_id) REFERENCES saes(id) ON DELETE CASCADE
);

CREATE TABLE rendus_etudiants (
      id SERIAL PRIMARY KEY,
      etudiant_id INTEGER NOT NULL,
      rendu_id INTEGER NOT NULL,
      statut_rendu BOOLEAN NOT NULL,
      date_rendu TIMESTAMP,
      FOREIGN KEY (etudiant_id) REFERENCES users(id) ON DELETE CASCADE,
      FOREIGN KEY (rendu_id) REFERENCES rendus(id) ON DELETE CASCADE,
      UNIQUE (etudiant_id, rendu_id)
);

CREATE TABLE fichiers_rendus (
                                 rendu_etudiant_id INTEGER NOT NULL,
                                 chemin_fichier TEXT NOT NULL,
                                 nom_fichier VARCHAR(255) NOT NULL,
                                 date_upload TIMESTAMP DEFAULT NOW() ,
                                 PRIMARY KEY(rendu_etudiant_id),
                                 FOREIGN KEY (rendu_etudiant_id) REFERENCES rendus_etudiants(id) ON DELETE CASCADE
);


CREATE OR REPLACE FUNCTION inserer_rendus_etudiants_fichiers()
RETURNS TRIGGER AS
$$
BEGIN
INSERT INTO rendus_etudiants (etudiant_id, rendu_id, statut_rendu, date_rendu)
SELECT etudiant_id, NEW.id, FALSE, NULL
FROM sae_etudiants
WHERE sae_id = NEW.sae_id;

RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_insertion_rendu
    AFTER INSERT ON rendus
    FOR EACH ROW
    EXECUTE FUNCTION inserer_rendus_etudiants_fichiers();

CREATE OR REPLACE FUNCTION mettre_a_jour_statut_rendu()
RETURNS TRIGGER AS
$$
BEGIN
UPDATE rendus_etudiants
SET statut_rendu = TRUE
WHERE id = NEW.rendu_etudiant_id;

RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_mise_a_jour_statut_rendu
    AFTER INSERT ON fichiers_rendus
    FOR EACH ROW
    EXECUTE FUNCTION mettre_a_jour_statut_rendu();