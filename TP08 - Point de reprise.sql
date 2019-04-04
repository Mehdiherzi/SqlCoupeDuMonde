---------------------------------------------------------
-- TP03 Point de reprise
---------------------------------------------------------

DROP TABLE Survenir;
DROP TABLE Composer;
DROP TABLE Action;
DROP TABLE Match;
DROP TABLE Joueur;
DROP TABLE Equipe;

CREATE TABLE Equipe
(
   ne   CHAR(3),
   nome VARCHAR(30),
   CONSTRAINT pk_equipe PRIMARY KEY (ne)
);

CREATE TABLE Joueur
(
   nj       DECIMAL(5), 
   nmaillot DECIMAL(2), 
   prenom   VARCHAR(30), 
   nom      VARCHAR(30), 
   poste    VARCHAR(30), 
   age      DECIMAL(2),
   ne       CHAR(3),
   CONSTRAINT pk_joueur          PRIMARY KEY (nj),
   CONSTRAINT uk_joueur          UNIQUE (nmaillot, ne),
   CONSTRAINT fk_joueur_equipe   FOREIGN KEY (ne) REFERENCES Equipe(ne)
);

CREATE TABLE Match
(
   nm          DECIMAL(5),
   dtm         DATE,
   poule       VARCHAR(30),
   stade       VARCHAR(30),
   ville       VARCHAR(30),
   ne1         CHAR(3),
   ne2         CHAR(3),
   score1      DECIMAL(2),
   score2      DECIMAL(2),
   sc1_penalty DECIMAL(2),
   sc2_penalty DECIMAL(2),
   CONSTRAINT pk_match             PRIMARY KEY (nm),
   CONSTRAINT fk_match_equipe1     FOREIGN KEY (ne1) REFERENCES Equipe(ne),
   CONSTRAINT fk_match_equipe2     FOREIGN KEY (ne2) REFERENCES Equipe(ne)
);

CREATE TABLE Composer 
(
   nm  DECIMAL(5),
   nj  DECIMAL(5),
   cap CHAR(1),
   CONSTRAINT pk_composer        PRIMARY KEY (nm, nj),
   CONSTRAINT fk_composer_match  FOREIGN KEY (nm) REFERENCES Match(nm),
   CONSTRAINT fk_composer_joueur FOREIGN KEY (nj) REFERENCES Joueur(nj)  
);

CREATE TABLE Action
(
   na    CHAR(3),
   typea VARCHAR(30),
   CONSTRAINT pk_action        PRIMARY KEY (na)
);

CREATE TABLE Survenir
(
   nm  DECIMAL(5),
   tps VARCHAR(4),
   nj  DECIMAL(5),
   na  CHAR(3),
   CONSTRAINT pk_survenir        PRIMARY KEY (nm, tps, nj, na),
   CONSTRAINT fk_survenir_action FOREIGN KEY (na) REFERENCES Action(na),
   CONSTRAINT fk_survenir_match  FOREIGN KEY (nm) REFERENCES Match(nm),
   CONSTRAINT fk_survenir_joueur FOREIGN KEY (nj) REFERENCES Joueur(nj)
);

DROP SEQUENCE seq_joueur;
DROP SEQUENCE seq_match;
DROP SEQUENCE seq_action;

DELETE FROM Survenir;
DELETE FROM Composer;
DELETE FROM Action;
DELETE FROM Match;
DELETE FROM Joueur;
DELETE FROM Equipe;

INSERT INTO Equipe (ne, nome) VALUES ('GER', 'ALLEMAGNE');
INSERT INTO Equipe (ne, nome) VALUES ('ENG', 'ANGLETERRE');
INSERT INTO Equipe (ne, nome) VALUES ('KSA', 'ARABIE SAOUDITE');
INSERT INTO Equipe (ne, nome) VALUES ('ARG', 'ARGENTINE');
INSERT INTO Equipe (ne, nome) VALUES ('AUS', 'AUSTRALIE');
INSERT INTO Equipe (ne, nome) VALUES ('BEL', 'BELGIQUE');
INSERT INTO Equipe (ne, nome) VALUES ('BRA', 'BRÉSIL');
INSERT INTO Equipe (ne, nome) VALUES ('COL', 'COLOMBIE');
INSERT INTO Equipe (ne, nome) VALUES ('CRC', 'COSTA RICA');
INSERT INTO Equipe (ne, nome) VALUES ('CRO', 'CROATIE');
INSERT INTO Equipe (ne, nome) VALUES ('DEN', 'DANEMARK');
INSERT INTO Equipe (ne, nome) VALUES ('EGY', 'EGYPTE');
INSERT INTO Equipe (ne, nome) VALUES ('ESP', 'ESPAGNE');
INSERT INTO Equipe (ne, nome) VALUES ('FRA', 'FRANCE');
INSERT INTO Equipe (ne, nome) VALUES ('ISL', 'ISLANDE');
INSERT INTO Equipe (ne, nome) VALUES ('JPN', 'JAPON');
INSERT INTO Equipe (ne, nome) VALUES ('MAR', 'MAROC');
INSERT INTO Equipe (ne, nome) VALUES ('MEX', 'MEXIQUE');
INSERT INTO Equipe (ne, nome) VALUES ('NGA', 'NIGERIA');
INSERT INTO Equipe (ne, nome) VALUES ('PAN', 'PANAMA');
INSERT INTO Equipe (ne, nome) VALUES ('PER', 'PÉROU');
INSERT INTO Equipe (ne, nome) VALUES ('POL', 'POLOGNE');
INSERT INTO Equipe (ne, nome) VALUES ('POR', 'PORTUGAL');
INSERT INTO Equipe (ne, nome) VALUES ('KOR', 'RÉPUBLIQUE DE CORÉE');
INSERT INTO Equipe (ne, nome) VALUES ('IRN', 'IRAN');
INSERT INTO Equipe (ne, nome) VALUES ('RUS', 'RUSSIE');
INSERT INTO Equipe (ne, nome) VALUES ('SEN', 'SÉNÉGAL');
INSERT INTO Equipe (ne, nome) VALUES ('SRB', 'SERBIE');
INSERT INTO Equipe (ne, nome) VALUES ('SWE', 'SUÈDE');
INSERT INTO Equipe (ne, nome) VALUES ('SUI', 'SUISSE');
INSERT INTO Equipe (ne, nome) VALUES ('TUN', 'TUNISIE');
INSERT INTO Equipe (ne, nome) VALUES ('URU', 'URUGUAY');
COMMIT;



CREATE SEQUENCE seq_joueur
   START WITH 1
   INCREMENT BY 1;
   
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Manuel', 'NEUER', 'GARDIEN DE BUT', 32, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Kevin', 'TRAPP', 'GARDIEN DE BUT', 28, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Marc-Andre', 'TER STEGEN', 'GARDIEN DE BUT', 26, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Marvin', 'PLATTENHARDT', 'DÉFENSEUR', 26, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Jonas', 'HECTOR', 'DÉFENSEUR', 28, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Matthias', 'GINTER', 'DÉFENSEUR', 24, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Mats', 'HUMMELS', 'DÉFENSEUR', 29, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Niklas', 'SUELE', 'DÉFENSEUR', 23, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Antonio', 'RUEDIGER', 'DÉFENSEUR', 25, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Jerome', 'BOATENG', 'DÉFENSEUR', 30, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Joshua', 'KIMMICH', 'DÉFENSEUR', 23, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Sami', 'KHEDIRA', 'MILIEU DE TERRAIN', 31, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Julian', 'DRAXLER', 'MILIEU DE TERRAIN', 24, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Toni', 'KROOS', 'MILIEU DE TERRAIN', 28, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Mesut', 'OEZIL', 'MILIEU DE TERRAIN', 29, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Thomas', 'MUELLER', 'MILIEU DE TERRAIN', 28, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Leon', 'GORETZKA', 'MILIEU DE TERRAIN', 23, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Sebastian', 'RUDY', 'MILIEU DE TERRAIN', 28, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Julian', 'BRANDT', 'MILIEU DE TERRAIN', 22, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Ilkay', 'GUENDOGAN', 'MILIEU DE TERRAIN', 27, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Timo', 'WERNER', 'ATTAQUANT', 22, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Marco', 'REUS', 'ATTAQUANT', 29, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Mario', 'GOMEZ', 'ATTAQUANT', 33, 'GER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Joachim', 'LÖW', 'ENTRAÎNEUR', 58, 'GER');

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Jordan', 'PICKFORD', 'GARDIEN DE BUT', 24, 'ENG'); 
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Jack', 'BUTLAND', 'GARDIEN DE BUT', 25, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Nick', 'POPE', 'GARDIEN DE BUT', 26, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Kyle', 'WALKER', 'DÉFENSEUR', 28, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Danny', 'ROSE', 'DÉFENSEUR', 28, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'John', 'STONES', 'DÉFENSEUR', 24, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Harry', 'MAGUIRE', 'DÉFENSEUR', 25, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Kieran', 'TRIPPIER', 'DÉFENSEUR', 27, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Gary', 'CAHILL', 'DÉFENSEUR', 32, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Phil', 'JONES', 'DÉFENSEUR', 26, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Fabian', 'DELPH', 'DÉFENSEUR', 28, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Ashley', 'YOUNG', 'DÉFENSEUR', 33, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Trent', 'ALEXANDER-ARNOLD', 'DÉFENSEUR', 19, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Eric', 'DIER', 'MILIEU DE TERRAIN', 24, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Jesse', 'LINGARD', 'MILIEU DE TERRAIN', 25, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Jordan', 'HENDERSON', 'MILIEU DE TERRAIN', 28, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Dele', 'ALLI', 'MILIEU DE TERRAIN', 22, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Ruben', 'LOFTUS-CHEEK', 'MILIEU DE TERRAIN', 22, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Harry', 'KANE', 'ATTAQUANT', 25, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Raheem', 'STERLING', 'ATTAQUANT', 23, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Jamie', 'VARDY', 'ATTAQUANT', 31, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Danny', 'WELBECK', 'ATTAQUANT', 27, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Marcus', 'RASHFORD', 'ATTAQUANT', 20, 'ENG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Gareth', 'SOUTHGATE', 'ENTRAÎNEUR', 48, 'ENG');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'ABDULLAH', 'ALMUAIOUF', 'GARDIEN DE BUT', 31, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'YASSER', 'ALMOSAILEM', 'GARDIEN DE BUT', 34, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'MOHAMMED', 'ALOWAIS', 'GARDIEN DE BUT', 26, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'MANSOUR', 'ALHARBI', 'DÉFENSEUR', 30, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'OSAMA', 'HAWSAWI', 'DÉFENSEUR', 34, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'ALI', 'ALBULAYHI', 'DÉFENSEUR', 28, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'OMAR', 'HAWSAWI', 'DÉFENSEUR', 32, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'MOHAMMED', 'ALBURAYK', 'DÉFENSEUR', 25, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'YASSER', 'ALSHAHRANI', 'DÉFENSEUR', 26, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'MOTAZ', 'HAWSAWI', 'DÉFENSEUR', 26, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'SALMAN', 'ALFARAJ', 'MILIEU DE TERRAIN', 29, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'YAHIA', 'ALSHEHRI', 'MILIEU DE TERRAIN', 28, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'HATAN', 'BAHBRI', 'MILIEU DE TERRAIN', 26, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'ABDULMALEK', 'ALKHAIBRI', 'MILIEU DE TERRAIN', 32, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'MOHAMED', 'KANNO', 'MILIEU DE TERRAIN', 23, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'ABDULLAH', 'OTAYF', 'MILIEU DE TERRAIN', 26, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'ABDULLAH', 'ALKHAIBARI', 'MILIEU DE TERRAIN', 22, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'HUSSAIN', 'ALMOQAHWI', 'MILIEU DE TERRAIN', 30, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'TAISEER', 'ALJASSAM', 'MILIEU DE TERRAIN', 34, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'SALEM', 'ALDAWSARI', 'MILIEU DE TERRAIN', 27, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'MOHAMMED', 'ALSAHLAWI', 'ATTAQUANT', 31, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'FAHAD', 'ALMUWALLAD', 'ATTAQUANT', 23, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'MUHANNAD', 'ASIRI', 'ATTAQUANT', 31, 'KSA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Juan Antonio', 'PIZZI', 'ENTRAÎNEUR', 50, 'KSA');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Nahuel', 'GUZMAN', 'GARDIEN DE BUT', 32, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Franco', 'ARMANI', 'GARDIEN DE BUT', 31, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Wilfredo', 'CABALLERO', 'GARDIEN DE BUT', 36, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Gabriel', 'MERCADO', 'DÉFENSEUR', 31, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Nicolas', 'TAGLIAFICO', 'DÉFENSEUR', 26, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Cristian', 'ANSALDI', 'DÉFENSEUR', 31, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Federico', 'FAZIO', 'DÉFENSEUR', 31, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Marcos', 'ACUNA', 'DÉFENSEUR', 26, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Javier', 'MASCHERANO', 'DÉFENSEUR', 34, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Marcos', 'ROJO', 'DÉFENSEUR', 28, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Nicolas', 'OTAMENDI', 'DÉFENSEUR', 30, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Eduardo', 'SALVIO', 'DÉFENSEUR', 28, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Lucas', 'BIGLIA', 'MILIEU DE TERRAIN', 32, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Ever', 'BANEGA', 'MILIEU DE TERRAIN', 30, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Angel', 'DI MARIA', 'MILIEU DE TERRAIN', 30, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Maximiliano', 'MEZA', 'MILIEU DE TERRAIN', 25, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Enzo', 'PEREZ', 'MILIEU DE TERRAIN', 32, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Giovani', 'LO CELSO', 'MILIEU DE TERRAIN', 22, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Cristian', 'PAVON', 'MILIEU DE TERRAIN', 22, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Gonzalo', 'HIGUAIN', 'ATTAQUANT', 30, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Lionel', 'MESSI', 'ATTAQUANT', 31, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Sergio', 'AGUERO', 'ATTAQUANT', 30, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Paulo', 'DYBALA', 'ATTAQUANT', 24, 'ARG');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Jorge', 'SAMPAOLI', 'ENTRAÎNEUR', 58, 'ARG');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Mathew', 'RYAN', 'GARDIEN DE BUT', 26, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Brad', 'JONES', 'GARDIEN DE BUT', 36, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Danny', 'VUKOVIC', 'GARDIEN DE BUT', 33, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Milos', 'DEGENEK', 'DÉFENSEUR', 24, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'James', 'MEREDITH', 'DÉFENSEUR', 30, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Mark', 'MILLIGAN', 'DÉFENSEUR', 33, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Matthew', 'JURMAN', 'DÉFENSEUR', 28, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Aziz', 'BEHICH', 'DÉFENSEUR', 27, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Joshua', 'RISDON', 'DÉFENSEUR', 26, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Trent', 'SAINSBURY', 'DÉFENSEUR', 26, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Massimo', 'LUONGO', 'MILIEU DE TERRAIN', 25, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Aaron', 'MOOY', 'MILIEU DE TERRAIN', 27, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Mile', 'JEDINAK', 'MILIEU DE TERRAIN', 34, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Jackson', 'IRVINE', 'MILIEU DE TERRAIN', 25, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Tom', 'ROGIC', 'MILIEU DE TERRAIN', 25, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Tim', 'CAHILL', 'ATTAQUANT', 38, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Mathew', 'LECKIE', 'ATTAQUANT', 27, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Tomi', 'JURIC', 'ATTAQUANT', 27, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Robbie', 'KRUSE', 'ATTAQUANT', 29, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Andrew', 'NABBOUT', 'ATTAQUANT', 25, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Jamie', 'MacLAREN', 'ATTAQUANT', 25, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Daniel', 'ARZANI', 'ATTAQUANT', 19, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Dimitrios', 'PETRATOS', 'ATTAQUANT', 25, 'AUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Bert', 'VAN MARWIJK', 'ENTRAÎNEUR', 66, 'AUS');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Thibaut', 'COURTOIS', 'GARDIEN DE BUT', 26, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Simon', 'MIGNOLET', 'GARDIEN DE BUT', 30, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Koen', 'CASTEELS', 'GARDIEN DE BUT', 26, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Toby', 'ALDERWEIRELD', 'DÉFENSEUR', 29, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Thomas', 'VERMAELEN', 'DÉFENSEUR', 32, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Vincent', 'KOMPANY', 'DÉFENSEUR', 32, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Jan', 'VERTONGHEN', 'DÉFENSEUR', 31, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Thomas', 'MEUNIER', 'DÉFENSEUR', 26, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Dedryck', 'BOYATA', 'DÉFENSEUR', 27, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Leander', 'DENDONCKER', 'DÉFENSEUR', 23, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Axel', 'WITSEL', 'MILIEU DE TERRAIN', 29, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Kevin', 'DE BRUYNE', 'MILIEU DE TERRAIN', 27, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Marouane', 'FELLAINI', 'MILIEU DE TERRAIN', 30, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Yannick', 'CARRASCO', 'MILIEU DE TERRAIN', 24, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Thorgan', 'HAZARD', 'MILIEU DE TERRAIN', 25, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Youri', 'TIELEMANS', 'MILIEU DE TERRAIN', 21, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Moussa', 'DEMBELE', 'MILIEU DE TERRAIN', 31, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Nacer', 'CHADLI', 'MILIEU DE TERRAIN', 29, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Romelu', 'LUKAKU', 'ATTAQUANT', 25, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Eden', 'HAZARD', 'ATTAQUANT', 27, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Dries', 'MERTENS', 'ATTAQUANT', 31, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Adnan', 'JANUZAJ', 'ATTAQUANT', 23, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Michy', 'BATSHUAYI', 'ATTAQUANT', 24, 'BEL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Roberto', 'MARTINEZ', 'ENTRAÎNEUR', 45, 'BEL');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, NULL, 'ALISSON', 'GARDIEN DE BUT', 25, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, NULL, 'CASSIO', 'GARDIEN DE BUT', 31, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, NULL, 'EDERSON', 'GARDIEN DE BUT', 25, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'THIAGO', 'SILVA', 'DÉFENSEUR', 33, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, NULL, 'MIRANDA', 'DÉFENSEUR', 33, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, NULL, 'GEROMEL', 'DÉFENSEUR', 32, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, NULL, 'FILIPE LUIS', 'DÉFENSEUR', 33, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, NULL, 'MARCELO', 'DÉFENSEUR', 30, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, NULL, 'MARQUINHOS', 'DÉFENSEUR', 24, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, NULL, 'DANILO', 'DÉFENSEUR', 27, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, NULL, 'FAGNER', 'DÉFENSEUR', 29, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, NULL, 'CASEMIRO', 'MILIEU DE TERRAIN', 26, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8 , NULL, 'RENATO AUGUSTO', 'MILIEU DE TERRAIN', 30, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'PHILIPPE', 'COUTINHO', 'MILIEU DE TERRAIN', 26, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, NULL, 'PAULINHO', 'MILIEU DE TERRAIN', 30, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, NULL, 'FERNANDINHO', 'MILIEU DE TERRAIN', 33, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, NULL, 'FRED', 'MILIEU DE TERRAIN', 25, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, NULL, 'WILLIAN', 'MILIEU DE TERRAIN', 30, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'DOUGLAS', 'COSTA', 'ATTAQUANT', 27, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, NULL, 'GABRIEL JESUS', 'ATTAQUANT', 21, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, NULL, 'NEYMAR', 'ATTAQUANT', 26, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, NULL, 'ROBERTO FIRMINO', 'ATTAQUANT', 26, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, NULL, 'TAISON', 'ATTAQUANT', 30, 'BRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, NULL, 'TITE', 'ENTRAÎNEUR', 57, 'BRA');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'David', 'OSPINA', 'GARDIEN DE BUT', 30, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Camilo', 'VARGAS', 'GARDIEN DE BUT', 29, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Jose', 'CUADRADO', 'GARDIEN DE BUT', 33, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Cristian', 'ZAPATA', 'DÉFENSEUR', 31, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Oscar', 'MURILLO', 'DÉFENSEUR', 30, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Santiago', 'ARIAS', 'DÉFENSEUR', 26, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Yerry', 'MINA', 'DÉFENSEUR', 23, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Johan', 'MOJICA', 'DÉFENSEUR', 26, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Farid', 'DIAZ', 'DÉFENSEUR', 35, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Davinson', 'SANCHEZ', 'DÉFENSEUR', 22, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Wilmar', 'BARRIOS', 'MILIEU DE TERRAIN', 24, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Carlos', 'SANCHEZ', 'MILIEU DE TERRAIN', 32, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Abel', 'AGUILAR', 'MILIEU DE TERRAIN', 33, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'James', 'RODRIGUEZ', 'MILIEU DE TERRAIN', 27, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Juan', 'CUADRADO', 'MILIEU DE TERRAIN', 30, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Mateus', 'URIBE', 'MILIEU DE TERRAIN', 27, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Jefferson', 'LERMA', 'MILIEU DE TERRAIN', 23, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Juan', 'QUINTERO', 'MILIEU DE TERRAIN', 25, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Carlos', 'BACCA', 'ATTAQUANT', 31, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Radamel', 'FALCAO', 'ATTAQUANT', 32, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Luis', 'MURIEL', 'ATTAQUANT', 27, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Miguel', 'BORJA', 'ATTAQUANT', 25, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Jose', 'IZQUIERDO', 'ATTAQUANT', 26, 'COL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Jose', 'PEKERMAN', 'ENTRAÎNEUR', 69, 'COL');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Keylor', 'NAVAS', 'GARDIEN DE BUT', 31, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Patrick', 'PEMBERTON', 'GARDIEN DE BUT', 36, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Leonel', 'MOREIRA', 'GARDIEN DE BUT', 28, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Johnny', 'ACOSTA', 'DÉFENSEUR', 35, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Giancarlo', 'GONZALEZ', 'DÉFENSEUR', 30, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Ian', 'SMITH', 'DÉFENSEUR', 20, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Oscar', 'DUARTE', 'DÉFENSEUR', 29, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Bryan', 'OVIEDO', 'DÉFENSEUR', 28, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Francisco', 'CALVO', 'DÉFENSEUR', 26, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Cristian', 'GAMBOA', 'DÉFENSEUR', 28, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Kendall', 'WASTON', 'DÉFENSEUR', 30, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Kenner', 'GUTIERREZ', 'DÉFENSEUR', 29, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Celso', 'BORGES', 'MILIEU DE TERRAIN', 30, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Christian', 'BOLANOS', 'MILIEU DE TERRAIN', 34, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Daniel', 'COLINDRES', 'MILIEU DE TERRAIN', 33, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Bryan', 'RUIZ', 'MILIEU DE TERRAIN', 33, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Rodney', 'WALLACE', 'MILIEU DE TERRAIN', 30, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Randall', 'AZOFEIFA', 'MILIEU DE TERRAIN', 33, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Yeltsin', 'TEJEDA', 'MILIEU DE TERRAIN', 26, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'David', 'GUZMAN', 'MILIEU DE TERRAIN', 28, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Johan', 'VENEGAS', 'ATTAQUANT', 29, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Joel', 'CAMPBELL', 'ATTAQUANT', 26, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Marcos', 'URENA', 'ATTAQUANT', 28, 'CRC');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Oscar', 'RAMIREZ', 'ENTRAÎNEUR', 53, 'CRC');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Dominik', 'LIVAKOVIC', 'GARDIEN DE BUT', 23, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Lovre', 'KALINIC', 'GARDIEN DE BUT', 28, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Danijel', 'SUBASIC', 'GARDIEN DE BUT', 33, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Sime', 'VRSALJKO', 'DÉFENSEUR', 26, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Ivan', 'STRINIC', 'DÉFENSEUR', 31, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Vedran', 'CORLUKA', 'DÉFENSEUR', 32, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Dejan', 'LOVREN', 'DÉFENSEUR', 29, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Tin', 'JEDVAJ', 'DÉFENSEUR', 22, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Duje', 'CALETA-CAR', 'DÉFENSEUR', 21, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Domagoj', 'VIDA', 'DÉFENSEUR', 29, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Josip', 'PIVARIC', 'DÉFENSEUR', 29, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Ivan', 'RAKITIC', 'MILIEU DE TERRAIN', 30, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Mateo', 'KOVACIC', 'MILIEU DE TERRAIN', 24, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Luka', 'MODRIC', 'MILIEU DE TERRAIN', 32, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Marcelo', 'BROZOVIC', 'MILIEU DE TERRAIN', 25, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Filip', 'BRADARIC', 'MILIEU DE TERRAIN', 26, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Milan', 'BADELJ', 'MILIEU DE TERRAIN', 29, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Ivan', 'PERISIC', 'ATTAQUANT', 29, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Andrej', 'KRAMARIC', 'ATTAQUANT', 27, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Nikola', 'KALINIC', 'ATTAQUANT', 30, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Mario', 'MANDZUKIC', 'ATTAQUANT', 32, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Ante', 'REBIC', 'ATTAQUANT', 24, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Marko', 'PJACA', 'ATTAQUANT', 23, 'CRO');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Zlatko', 'DALIC', 'ENTRAÎNEUR', 51, 'CRO');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Kasper', 'SCHMEICHEL', 'GARDIEN DE BUT', 31, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Jonas', 'LOSSL', 'GARDIEN DE BUT', 29, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Frederik', 'RONNOW', 'GARDIEN DE BUT', 26, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Jannik', 'VESTERGAARD', 'DÉFENSEUR', 26, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Simon', 'KJAER', 'DÉFENSEUR', 29, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Jonas', 'KNUDSEN', 'DÉFENSEUR', 25, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Andreas', 'CHRISTENSEN', 'DÉFENSEUR', 22, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Mathias', 'JORGENSEN', 'DÉFENSEUR', 28, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Henrik', 'DALSGAARD', 'DÉFENSEUR', 29, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Jens', 'Stryger LARSEN', 'DÉFENSEUR', 27, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Michael', 'KROHN-DEHLI', 'MILIEU DE TERRAIN', 35, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'William', 'KVIST', 'MILIEU DE TERRAIN', 33, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Thomas', 'DELANEY', 'MILIEU DE TERRAIN', 27, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Christian', 'ERIKSEN', 'MILIEU DE TERRAIN', 26, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Lukas', 'LERAGER', 'MILIEU DE TERRAIN', 25, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Lasse', 'SCHONE', 'MILIEU DE TERRAIN', 32, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Nicolai', 'JORGENSEN', 'ATTAQUANT', 27, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Martin', 'BRAITHWAITE', 'ATTAQUANT', 27, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Kasper', 'DOLBERG', 'ATTAQUANT', 20, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Viktor', 'FISCHER', 'ATTAQUANT', 24, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Yussuf Yurary', 'POULSEN', 'ATTAQUANT', 24, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Andreas', 'CORNELIUS', 'ATTAQUANT', 25, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Pione', 'SISTO', 'ATTAQUANT', 23, 'DEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Age', 'HAREIDE', 'ENTRAÎNEUR', 64, 'DEN');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'ESSAM', 'ELHADARY', 'GARDIEN DE BUT', 45, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'SHERIF', 'EKRAMY', 'GARDIEN DE BUT', 35, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'MOHAMED', 'ELSHENAWY', 'GARDIEN DE BUT', 29, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'ALI', 'GABR', 'DÉFENSEUR', 29, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'AHMED', 'ELMOHAMADY', 'DÉFENSEUR', 30, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'AHMED', 'HEGAZY', 'DÉFENSEUR', 27, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'AHMED', 'FATHI', 'DÉFENSEUR', 33, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'AYMAN', 'ASHRAF', 'DÉFENSEUR', 27, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'MOHAMED', 'ABDELSHAFY', 'DÉFENSEUR', 33, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'MAHMOUD', 'HAMDY', 'DÉFENSEUR', 23, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'SAMIR', 'SAAD', 'DÉFENSEUR', 29, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'OMAR', 'GABER', 'MILIEU DE TERRAIN', 26, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'SAM', 'MORSY', 'MILIEU DE TERRAIN', 26, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'TAREK', 'HAMED', 'MILIEU DE TERRAIN', 29, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'MOHAMED', 'ELNENY', 'MILIEU DE TERRAIN', 26, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'ABDALLA', 'SAID', 'MILIEU DE TERRAIN', 33, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, NULL, 'TREZIGUET', 'MILIEU DE TERRAIN', 23, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'MARWAN', 'MOHSEN', 'ATTAQUANT', 29, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'MOHAMED', 'SALAH', 'ATTAQUANT', 26, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, NULL, 'KAHRABA', 'ATTAQUANT', 24, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'RAMADAN', 'SOBHY', 'ATTAQUANT', 21, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, NULL, 'SHIKABALA', 'ATTAQUANT', 32, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'AMR', 'WARDA', 'ATTAQUANT', 24, 'EGY');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Hector', 'CUPER', 'ENTRAÎNEUR', 62, 'EGY');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'David', 'DE GEA', 'GARDIEN DE BUT', 27, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Kepa', 'ARRIZABALAGA', 'GARDIEN DE BUT', 23, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Pepe', 'REINA', 'GARDIEN DE BUT', 36, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Dani', 'CARVAJAL', 'DÉFENSEUR', 26, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Gerard', 'PIQUE', 'DÉFENSEUR', 31, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, NULL, 'NACHO', 'DÉFENSEUR', 28, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Alvaro', 'ODRIOZOLA', 'DÉFENSEUR', 22, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Cesar', 'AZPILICUETA', 'DÉFENSEUR', 29, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Sergio', 'RAMOS', 'DÉFENSEUR', 32, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Nacho', 'MONREAL', 'DÉFENSEUR', 32, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Jordi', 'ALBA', 'DÉFENSEUR', 29, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Sergio', 'BUSQUETS', 'MILIEU DE TERRAIN', 30, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Andres', 'INIESTA', 'MILIEU DE TERRAIN', 34, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, NULL, 'SAUL', 'MILIEU DE TERRAIN', 23, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, NULL, 'KOKE', 'MILIEU DE TERRAIN', 26, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, NULL, 'THIAGO', 'MILIEU DE TERRAIN', 27, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Marco', 'ASENSIO', 'MILIEU DE TERRAIN', 22, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, NULL, 'ISCO', 'MILIEU DE TERRAIN', 26, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, NULL, 'RODRIGO', 'ATTAQUANT', 27, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Lucas', 'VAZQUEZ', 'ATTAQUANT', 27, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Iago', 'ASPAS', 'ATTAQUANT', 31, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Diego', 'COSTA', 'ATTAQUANT', 29, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'David', 'SILVA', 'ATTAQUANT', 32, 'ESP');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Fernando', 'HIERRO', 'ENTRAÎNEUR', 50, 'ESP');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Hugo', 'LLORIS', 'GARDIEN DE BUT', 31, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Steve', 'MANDANDA', 'GARDIEN DE BUT', 33, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Alphonse', 'AREOLA', 'GARDIEN DE BUT', 25, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Benjamin', 'PAVARD', 'DÉFENSEUR', 22, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Presnel', 'KIMPEMBE', 'DÉFENSEUR', 23, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Raphael', 'VARANE', 'DÉFENSEUR', 25, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Samuel', 'UMTITI', 'DÉFENSEUR', 24, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Adil', 'RAMI', 'DÉFENSEUR', 32, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Djibril', 'SIDIBE', 'DÉFENSEUR', 26, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Lucas', 'HERNANDEZ', 'DÉFENSEUR', 22, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Benjamin', 'MENDY', 'DÉFENSEUR', 24, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Paul', 'POGBA', 'MILIEU DE TERRAIN', 25, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Corentin', 'TOLISSO', 'MILIEU DE TERRAIN', 24, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Ngolo', 'KANTE', 'MILIEU DE TERRAIN', 27, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Blaise', 'MATUIDI', 'MILIEU DE TERRAIN', 31, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Steven', 'NZONZI', 'MILIEU DE TERRAIN', 29, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Antoine', 'GRIEZMANN', 'ATTAQUANT', 27, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Thomas', 'LEMAR', 'ATTAQUANT', 22, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Olivier', 'GIROUD', 'ATTAQUANT', 31, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Kylian', 'MBAPPE', 'ATTAQUANT', 19, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Ousmane', 'DEMBELE', 'ATTAQUANT', 21, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Nabil', 'FEKIR', 'ATTAQUANT', 25, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Florian', 'THAUVIN', 'ATTAQUANT', 25, 'FRA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Didier', 'DESCHAMPS', 'ENTRAÎNEUR', 49, 'FRA');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Hannes', 'HALLDORSSON', 'GARDIEN DE BUT', 34, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Frederik', 'SCHRAM', 'GARDIEN DE BUT', 23, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Runar', 'RUNARSSON', 'GARDIEN DE BUT', 23, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Birkir', 'SAEVARSSON', 'DÉFENSEUR', 33, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Sverrir', 'INGASON', 'DÉFENSEUR', 25, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Ragnar', 'SIGURDSSON', 'DÉFENSEUR', 32, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Kari', 'ARNASON', 'DÉFENSEUR', 35, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Holmar', 'EYJOLFSSON', 'DÉFENSEUR', 28, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Hordur', 'MAGNUSSON', 'DÉFENSEUR', 25, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Ari', 'SKULASON', 'DÉFENSEUR', 31, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Samuel', 'FRIDJONSSON', 'MILIEU DE TERRAIN', 22, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Albert', 'GUDMUNDSSON', 'MILIEU DE TERRAIN', 21, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Johann', 'GUDMUNDSSON', 'MILIEU DE TERRAIN', 27, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Birkir', 'BJARNASON', 'MILIEU DE TERRAIN', 30, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Gylfi', 'SIGURDSSON', 'MILIEU DE TERRAIN', 28, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Olafur', 'SKULASON', 'MILIEU DE TERRAIN', 35, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Aron', 'GUNNARSSON', 'MILIEU DE TERRAIN', 29, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Rurik', 'GISLASON', 'MILIEU DE TERRAIN', 30, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Emil', 'HALLFREDSSON', 'MILIEU DE TERRAIN', 34, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Arnor', 'TRAUSTASON', 'MILIEU DE TERRAIN', 25, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Bjorn', 'SIGURDARSON', 'ATTAQUANT', 27, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Alfred', 'FINNBOGASON', 'ATTAQUANT', 29, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Jon', 'BODVARSSON', 'ATTAQUANT', 26, 'ISL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Heimir', 'HALLGRIMSSON', 'ENTRAÎNEUR', 51, 'ISL');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Eiji', 'KAWASHIMA', 'GARDIEN DE BUT', 35, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Masaaki', 'HIGASHIGUCHI', 'GARDIEN DE BUT', 32, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Kosuke', 'NAKAMURA', 'GARDIEN DE BUT', 23, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Naomichi', 'UEDA', 'DÉFENSEUR', 23, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Gen', 'SHOJI', 'DÉFENSEUR', 25, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Yuto', 'NAGATOMO', 'DÉFENSEUR', 31, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Wataru', 'ENDO', 'DÉFENSEUR', 25, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Hiroki', 'SAKAI', 'DÉFENSEUR', 28, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Tomoaki', 'MAKINO', 'DÉFENSEUR', 31, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Gotoku', 'SAKAI', 'DÉFENSEUR', 27, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Maya', 'YOSHIDA', 'DÉFENSEUR', 30, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Keisuke', 'HONDA', 'MILIEU DE TERRAIN', 32, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Gaku', 'SHIBASAKI', 'MILIEU DE TERRAIN', 26, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Genki', 'HARAGUCHI', 'MILIEU DE TERRAIN', 27, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Shinji', 'KAGAWA', 'MILIEU DE TERRAIN', 29, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Takashi', 'USAMI', 'MILIEU DE TERRAIN', 26, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Takashi', 'INUI', 'MILIEU DE TERRAIN', 30, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Hotaru', 'YAMAGUCHI', 'MILIEU DE TERRAIN', 27, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Makoto', 'HASEBE', 'MILIEU DE TERRAIN', 34, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Ryota', 'OHSHIMA', 'MILIEU DE TERRAIN', 25, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Shinji', 'OKAZAKI', 'ATTAQUANT', 32, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Yoshinori', 'MUTO', 'ATTAQUANT', 26, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Yuya', 'OSAKO', 'ATTAQUANT', 28, 'JPN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Akira', 'NISHINO', 'ENTRAÎNEUR', 63, 'JPN');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Yassine', 'BOUNOU', 'GARDIEN DE BUT', 27, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Monir', 'EL KAJOUI', 'GARDIEN DE BUT', 29, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Ahmed', 'TAGNAOUTI', 'GARDIEN DE BUT', 22, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Achraf', 'HAKIMI', 'DÉFENSEUR', 19, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Hamza', 'MENDYL', 'DÉFENSEUR', 20, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Manuel', 'DA COSTA', 'DÉFENSEUR', 32, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Mehdi', 'BENATIA', 'DÉFENSEUR', 31, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Ghanem', 'SAISS', 'DÉFENSEUR', 28, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Nabil', 'DIRAR', 'DÉFENSEUR', 32, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Hakim', 'ZIYACH', 'MILIEU DE TERRAIN', 25, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Karim', 'EL AHMADI', 'MILIEU DE TERRAIN', 33, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Younes', 'BELHANDA', 'MILIEU DE TERRAIN', 28, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Faycal', 'FAJR', 'MILIEU DE TERRAIN', 30, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Mbark', 'BOUSSOUFA', 'MILIEU DE TERRAIN', 34, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Youssef', 'AIT BENNASSER', 'MILIEU DE TERRAIN', 22, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Noureddine', 'AMRABAT', 'MILIEU DE TERRAIN', 31, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Amine', 'HARIT', 'MILIEU DE TERRAIN', 21, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Sofyan', 'AMRABAT', 'MILIEU DE TERRAIN', 22, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Mehdi', 'CARCELA', 'MILIEU DE TERRAIN', 29, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Ayoub', 'EL KAABI', 'ATTAQUANT', 25, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Khalid', 'BOUTAIB', 'ATTAQUANT', 31, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Youssef', 'EN NESYRI', 'ATTAQUANT', 21, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Aziz', 'BOUHADDOUZ', 'ATTAQUANT', 31, 'MAR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Herve', 'RENARD', 'ENTRAÎNEUR', 49, 'MAR');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Jose', 'CORONA', 'GARDIEN DE BUT', 37, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Alfredo', 'TALAVERA', 'GARDIEN DE BUT', 35, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Guillermo', 'OCHOA', 'GARDIEN DE BUT', 33, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Hugo', 'AYALA', 'DÉFENSEUR', 31, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Carlos', 'SALCEDO', 'DÉFENSEUR', 24, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Rafael', 'MARQUEZ', 'DÉFENSEUR', 39, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Hector', 'MORENO', 'DÉFENSEUR', 30, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Hector', 'HERRERA', 'DÉFENSEUR', 28, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Edson', 'ALVAREZ', 'DÉFENSEUR', 20, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Erick', 'GUTIERREZ', 'MILIEU DE TERRAIN', 23, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Jonathan', 'DOS SANTOS', 'MILIEU DE TERRAIN', 28, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Miguel', 'LAYUN', 'MILIEU DE TERRAIN', 30, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Giovani', 'DOS SANTOS', 'MILIEU DE TERRAIN', 29, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Jesus', 'CORONA', 'MILIEU DE TERRAIN', 25, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Andres', 'GUARDADO', 'MILIEU DE TERRAIN', 31, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Javier', 'AQUINO', 'MILIEU DE TERRAIN', 28, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Jesus', 'GALLARDO', 'MILIEU DE TERRAIN', 24, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Marco', 'FABIAN', 'ATTAQUANT', 29, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Raul', 'JIMENEZ', 'ATTAQUANT', 27, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Carlos', 'VELA', 'ATTAQUANT', 29, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Javier', 'HERNANDEZ', 'ATTAQUANT', 30, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Oribe', 'PERALTA', 'ATTAQUANT', 34, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Hirving', 'LOZANO', 'ATTAQUANT', 23, 'MEX');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Juan', 'Carlos OSORIO', 'ENTRAÎNEUR', 57, 'MEX');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Ikechukwu', 'EZENWA', 'GARDIEN DE BUT', 29, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Daniel', 'AKPEYI', 'GARDIEN DE BUT', 32, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Francis', 'UZOHO', 'GARDIEN DE BUT', 19, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Bryan', 'IDOWU', 'DÉFENSEUR', 26, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Elderson', 'ECHIEJILE', 'DÉFENSEUR', 30, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'William', 'EKONG', 'DÉFENSEUR', 25, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Leon', 'BALOGUN', 'DÉFENSEUR', 30, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Abdullahi', 'SHEHU', 'DÉFENSEUR', 25, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Chidozie', 'AWAZIEM', 'DÉFENSEUR', 21, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Tyronne', 'EBUEHI', 'DÉFENSEUR', 22, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Kenneth', 'OMERUO', 'DÉFENSEUR', 24, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Wilfred', 'NDIDI', 'MILIEU DE TERRAIN', 21, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Oghenekaro', 'ETEBO', 'MILIEU DE TERRAIN', 22, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'John', 'Obi MIKEL', 'MILIEU DE TERRAIN', 31, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Joel', 'OBI', 'MILIEU DE TERRAIN', 27, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Ogenyi', 'ONAZI', 'MILIEU DE TERRAIN', 25, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'John', 'OGU', 'MILIEU DE TERRAIN', 30, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Ahmed', 'MUSA', 'ATTAQUANT', 25, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Odion', 'IGHALO', 'ATTAQUANT', 29, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Victor', 'MOSES', 'ATTAQUANT', 27, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Simeon', 'NWANKWO', 'ATTAQUANT', 26, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Kelechi', 'IHEANACHO', 'ATTAQUANT', 22, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Alex', 'IWOBI', 'ATTAQUANT', 22, 'NGA');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Gernot', 'ROHR', 'ENTRAÎNEUR', 65, 'NGA');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Jaime', 'PENEDO', 'GARDIEN DE BUT', 36, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Jose', 'CALDERON', 'GARDIEN DE BUT', 33, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Alex', 'RODRIGUEZ', 'GARDIEN DE BUT', 28, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Michael', 'MURILLO', 'DÉFENSEUR', 22, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Harold', 'CUMMINGS', 'DÉFENSEUR', 26, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Fidel', 'ESCOBAR', 'DÉFENSEUR', 23, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Roman', 'TORRES', 'DÉFENSEUR', 32, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Adolfo', 'MACHADO', 'DÉFENSEUR', 33, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Eric', 'DAVIS', 'DÉFENSEUR', 27, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Luis', 'OVALLE', 'DÉFENSEUR', 29, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Felipe', 'BALOY', 'DÉFENSEUR', 37, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Gabriel', 'GOMEZ', 'MILIEU DE TERRAIN', 34, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Edgar', 'BARCENAS', 'MILIEU DE TERRAIN', 24, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Armando', 'COOPER', 'MILIEU DE TERRAIN', 30, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Valentin', 'PIMENTEL', 'MILIEU DE TERRAIN', 27, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Ricardo', 'AVILA', 'MILIEU DE TERRAIN', 21, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Anibal', 'GODOY', 'MILIEU DE TERRAIN', 28, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Jose Luis', 'RODRIGUEZ', 'MILIEU DE TERRAIN', 20, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Blas', 'PEREZ', 'ATTAQUANT', 37, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Gabriel', 'TORRES', 'ATTAQUANT', 29, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Ismael', 'DIAZ', 'ATTAQUANT', 21, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Abdiel', 'ARROYO', 'ATTAQUANT', 24, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Luis', 'TEJADA', 'ATTAQUANT', 36, 'PAN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Hernan', 'GOMEZ', 'ENTRAÎNEUR', 62, 'PAN');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Pedro', 'GALLESE', 'GARDIEN DE BUT', 28, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Carlos', 'CACEDA', 'GARDIEN DE BUT', 26, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Jose', 'CARVALLO', 'GARDIEN DE BUT', 32, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Alberto', 'RODRIGUEZ', 'DÉFENSEUR', 34, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Aldo', 'CORZO', 'DÉFENSEUR', 29, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Anderson', 'SANTAMARIA', 'DÉFENSEUR', 26, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Miguel', 'ARAUJO', 'DÉFENSEUR', 23, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Miguel', 'TRAUCO', 'DÉFENSEUR', 26, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Christian', 'RAMOS', 'DÉFENSEUR', 29, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Luis', 'ADVINCULA', 'DÉFENSEUR', 28, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Nilson', 'LOYOLA', 'DÉFENSEUR', 23, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Paolo', 'HURTADO', 'MILIEU DE TERRAIN', 28, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Christian', 'CUEVA', 'MILIEU DE TERRAIN', 26, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Renato', 'TAPIA', 'MILIEU DE TERRAIN', 23, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Andy', 'POLO', 'MILIEU DE TERRAIN', 23, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Wilder', 'CARTAGENA', 'MILIEU DE TERRAIN', 23, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Yoshimar', 'YOTUN', 'MILIEU DE TERRAIN', 28, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Pedro', 'AQUINO', 'MILIEU DE TERRAIN', 23, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Paolo', 'GUERRERO', 'ATTAQUANT', 34, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Jefferson', 'FARFAN', 'ATTAQUANT', 33, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Raul', 'RUIDIAZ', 'ATTAQUANT', 28, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Andre', 'CARRILLO', 'ATTAQUANT', 27, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Edison', 'FLORES', 'ATTAQUANT', 24, 'PER');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Ricardo', 'GARECA', 'ENTRAÎNEUR', 60, 'PER');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Wojciech', 'SZCZESNY', 'GARDIEN DE BUT', 28, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Bartosz', 'BIALKOWSKI', 'GARDIEN DE BUT', 31, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Lukasz', 'FABIANSKI', 'GARDIEN DE BUT', 33, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Michal', 'PAZDAN', 'DÉFENSEUR', 30, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Artur', 'JEDRZEJCZYK', 'DÉFENSEUR', 30, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Thiago', 'CIONEK', 'DÉFENSEUR', 32, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Jan', 'BEDNAREK', 'DÉFENSEUR', 22, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Kamil', 'GLIK', 'DÉFENSEUR', 30, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Bartosz', 'BERESZYNSKI', 'DÉFENSEUR', 26, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Lukasz', 'PISZCZEK', 'DÉFENSEUR', 33, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Jacek', 'GORALSKI', 'MILIEU DE TERRAIN', 25, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Karol', 'LINETTY', 'MILIEU DE TERRAIN', 23, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Grzegorz', 'KRYCHOWIAK', 'MILIEU DE TERRAIN', 28, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Kamil', 'GROSICKI', 'MILIEU DE TERRAIN', 30, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Maciej', 'RYBUS', 'MILIEU DE TERRAIN', 29, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Jakub', 'BLASZCZYKOWSKI', 'MILIEU DE TERRAIN', 32, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Slawomir', 'PESZKO', 'MILIEU DE TERRAIN', 33, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Piotr', 'ZIELINSKI', 'MILIEU DE TERRAIN', 24, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Rafal', 'KURZAWA', 'MILIEU DE TERRAIN', 25, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Arkadiusz', 'MILIK', 'ATTAQUANT', 24, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Robert', 'LEWANDOWSKI', 'ATTAQUANT', 30, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Lukasz', 'TEODORCZYK', 'ATTAQUANT', 27, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Dawid', 'KOWNACKI', 'ATTAQUANT', 21, 'POL');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Adam', 'NAWALKA', 'ENTRAÎNEUR', 60, 'POL');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'RUI', 'PATRICIO', 'GARDIEN DE BUT', 30, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'ANTHONY', 'LOPES', 'GARDIEN DE BUT', 27, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, NULL, 'BETO', 'GARDIEN DE BUT', 36, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'BRUNO', 'ALVES', 'DÉFENSEUR', 36, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, NULL, 'PEPE', 'DÉFENSEUR', 35, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'RAPHAEL', 'GUERREIRO', 'DÉFENSEUR', 24, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'JOSE', 'FONTE', 'DÉFENSEUR', 34, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'RUBEN', 'DIAS', 'DÉFENSEUR', 21, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, NULL, 'RICARDO', 'DÉFENSEUR', 24, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'MARIO', 'RUI', 'DÉFENSEUR', 27, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, NULL, 'CEDRIC', 'DÉFENSEUR', 27, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'MANUEL', 'FERNANDES', 'MILIEU DE TERRAIN', 32, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'JOAO', 'MOUTINHO', 'MILIEU DE TERRAIN', 31, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'JOAO', 'MARIO', 'MILIEU DE TERRAIN', 25, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'BERNARDO', 'SILVA', 'MILIEU DE TERRAIN', 24, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, NULL, 'WILLIAM', 'MILIEU DE TERRAIN', 26, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'BRUNO', 'FERNANDES', 'MILIEU DE TERRAIN', 23, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'ADRIEN', 'SILVA', 'MILIEU DE TERRAIN', 29, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'CRISTIANO', 'RONALDO', 'ATTAQUANT', 33, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'ANDRE', 'SILVA', 'ATTAQUANT', 22, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'GONCALO', 'GUEDES', 'ATTAQUANT', 21, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'GELSON', 'MARTINS', 'ATTAQUANT', 23, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'RICARDO', 'QUARESMA', 'ATTAQUANT', 34, 'POR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Fernando', 'SANTOS', 'ENTRAÎNEUR', 63, 'POR');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'KIM', 'Seunggyu', 'GARDIEN DE BUT', 27, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'KIM', 'Jinhyeon', 'GARDIEN DE BUT', 31, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'JO', 'Hyeonwoo', 'GARDIEN DE BUT', 26, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'LEE', 'Yong', 'DÉFENSEUR', 31, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'JUNG', 'Seunghyun', 'DÉFENSEUR', 24, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'OH', 'Bansuk', 'DÉFENSEUR', 30, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'YUN', 'Youngsun', 'DÉFENSEUR', 29, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'PARK', 'Jooho', 'DÉFENSEUR', 31, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'KIM', 'Minwoo', 'DÉFENSEUR', 28, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'HONG', 'Chul', 'DÉFENSEUR', 27, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'KIM', 'Younggwon', 'DÉFENSEUR', 28, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'JANG', 'Hyunsoo', 'DÉFENSEUR', 26, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'GO', 'Yohan', 'DÉFENSEUR', 30, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'JU', 'Sejong', 'MILIEU DE TERRAIN', 27, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'LEE', 'Seungwoo', 'MILIEU DE TERRAIN', 20, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'KOO', 'Jacheol', 'MILIEU DE TERRAIN', 29, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'JUNG', 'Wooyoung', 'MILIEU DE TERRAIN', 28, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'KI', 'Sungyueng', 'MILIEU DE TERRAIN', 29, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'LEE', 'Jaesung', 'MILIEU DE TERRAIN', 26, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'MOON', 'Seonmin', 'MILIEU DE TERRAIN', 26, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'SON', 'Heungmin', 'ATTAQUANT', 26, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'KIM', 'Shinwook', 'ATTAQUANT', 30, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'HWANG', 'Heechan', 'ATTAQUANT', 22, 'KOR');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'SHIN', 'Taeyong', 'ENTRAÎNEUR', 47, 'KOR');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Ali', 'BEIRANVAND', 'GARDIEN DE BUT', 25, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Rashid', 'MAZAHERI', 'GARDIEN DE BUT', 29, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Amir', 'ABEDZADEH', 'GARDIEN DE BUT', 25, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Ehsan', 'HAJI SAFI', 'DÉFENSEUR', 28, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Roozbeh', 'CHESHMI', 'DÉFENSEUR', 25, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Milad', 'MOHAMMADI', 'DÉFENSEUR', 24, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Morteza', 'POURALIGANJI', 'DÉFENSEUR', 26, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Mohammad Reza', 'KHANZADEH', 'DÉFENSEUR', 27, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Pejman', 'MONTAZERI', 'DÉFENSEUR', 34, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Majid', 'HOSSEINI', 'DÉFENSEUR', 22, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Ramin', 'REZAEIAN', 'DÉFENSEUR', 28, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Mahdi', 'TORABI', 'MILIEU DE TERRAIN', 23, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Saeid', 'EZATOLAHI', 'MILIEU DE TERRAIN', 21, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Masoud', 'SHOJAEI', 'MILIEU DE TERRAIN', 34, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Omid', 'EBRAHIMI', 'MILIEU DE TERRAIN', 30, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Vahid', 'AMIRI', 'MILIEU DE TERRAIN', 30, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Karim', 'ANSARIFARD', 'ATTAQUANT', 28, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Saman', 'GHODDOS', 'ATTAQUANT', 24, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Reza', 'GHOOCHANNEJHAD', 'ATTAQUANT', 30, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Mehdi', 'TAREMI', 'ATTAQUANT', 26, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Alireza', 'JAHANBAKHSH', 'ATTAQUANT', 25, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Sardar', 'AZMOUN', 'ATTAQUANT', 23, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Ashkan', 'DEJAGAH', 'ATTAQUANT', 32, 'IRN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Carlos', 'QUEIROZ', 'ENTRAÎNEUR', 65, 'IRN');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Igor', 'AKINFEEV', 'GARDIEN DE BUT', 32, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Andrei', 'LUNEV', 'GARDIEN DE BUT', 26, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Vladimir', 'GABULOV', 'GARDIEN DE BUT', 34, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'MARIO', 'FERNANDES', 'DÉFENSEUR', 27, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Ilya', 'KUTEPOV', 'DÉFENSEUR', 25, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Sergey', 'IGNASHEVICH', 'DÉFENSEUR', 39, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Andrey', 'SEMENOV', 'DÉFENSEUR', 29, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Fedor', 'KUDRIASHOV', 'DÉFENSEUR', 31, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Vladimir', 'GRANAT', 'DÉFENSEUR', 31, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Igor', 'SMOLNIKOV', 'DÉFENSEUR', 30, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Denis', 'CHERYSHEV', 'MILIEU DE TERRAIN', 27, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Daler', 'KUZIAEV', 'MILIEU DE TERRAIN', 25, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Iury', 'GAZINSKY', 'MILIEU DE TERRAIN', 29, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Alan', 'DZAGOEV', 'MILIEU DE TERRAIN', 28, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Roman', 'ZOBNIN', 'MILIEU DE TERRAIN', 24, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Alexey', 'MIRANCHUK', 'MILIEU DE TERRAIN', 22, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Anton', 'MIRANCHUK', 'MILIEU DE TERRAIN', 22, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Aleksandr', 'GOLOVIN', 'MILIEU DE TERRAIN', 22, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Yury', 'ZHIRKOV', 'MILIEU DE TERRAIN', 35, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Alexander', 'SAMEDOV', 'MILIEU DE TERRAIN', 34, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Aleksandr', 'EROKHIN', 'MILIEU DE TERRAIN', 28, 'RUS'); 
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Fedor', 'SMOLOV', 'ATTAQUANT', 28, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Artem', 'DZYUBA', 'ATTAQUANT', 30, 'RUS');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Stanislav', 'CHERCHESOV', 'ENTRAÎNEUR', 55, 'RUS');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Abdoulaye', 'DIALLO', 'GARDIEN DE BUT', 26, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Khadim', 'NDIAYE', 'GARDIEN DE BUT', 33, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Alfred', 'GOMIS', 'GARDIEN DE BUT', 24, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Adama', 'MBENGUE', 'DÉFENSEUR', 24, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Kalidou', 'KOULIBALY', 'DÉFENSEUR', 27, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Kara', 'MBODJI', 'DÉFENSEUR', 28, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Youssouf', 'SABALY', 'DÉFENSEUR', 25, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Lamine', 'GASSAMA', 'DÉFENSEUR', 28, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Moussa', 'WAGUE', 'DÉFENSEUR', 19, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Idrissa', 'Gana GUEYE', 'MILIEU DE TERRAIN', 28, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Salif', 'SANE', 'MILIEU DE TERRAIN', 28, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Cheikhou', 'KOUYATE', 'MILIEU DE TERRAIN', 28, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Cheikh', 'NDOYE', 'MILIEU DE TERRAIN', 32, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Alfred', 'NDIAYE', 'MILIEU DE TERRAIN', 28, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Pape Alioune', 'NDIAYE', 'MILIEU DE TERRAIN', 27, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Moussa', 'SOW', 'ATTAQUANT', 32, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Mame', 'DIOUF', 'ATTAQUANT', 30, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Sadio', 'MANE', 'ATTAQUANT', 26, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Moussa', 'KONATE', 'ATTAQUANT', 25, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Diafra', 'SAKHO', 'ATTAQUANT', 28, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Ismaila', 'SARR', 'ATTAQUANT', 20, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Mbaye', 'NIANG', 'ATTAQUANT', 23, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Keita', 'BALDE', 'ATTAQUANT', 23, 'SEN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Aliou', 'CISSE', 'ENTRAÎNEUR', 42, 'SEN');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Vladimir', 'STOJKOVIC', 'GARDIEN DE BUT', 35, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Predrag', 'RAJKOVIC', 'GARDIEN DE BUT', 22, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Marko', 'DMITROVIC', 'GARDIEN DE BUT', 26, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Antonio', 'RUKAVINA', 'DÉFENSEUR', 34, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Dusko', 'TOSIC', 'DÉFENSEUR', 33, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Uros', 'SPAJIC', 'DÉFENSEUR', 25, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Branislav', 'IVANOVIC', 'DÉFENSEUR', 34, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Aleksandar', 'KOLAROV', 'DÉFENSEUR', 32, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Milos', 'VELJKOVIC', 'DÉFENSEUR', 22, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Milan', 'RODIC', 'DÉFENSEUR', 27, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Nikola', 'MILENKOVIC', 'DÉFENSEUR', 20, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Luka', 'MILIVOJEVIC', 'MILIEU DE TERRAIN', 27, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Andrija', 'ZIVKOVIC', 'MILIEU DE TERRAIN', 22, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Dusan', 'TADIC', 'MILIEU DE TERRAIN', 29, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Marko', 'GRUJIC', 'MILIEU DE TERRAIN', 22, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Filip', 'KOSTIC', 'MILIEU DE TERRAIN', 25, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Sergej', 'MILINKOVIC-SAVIC', 'MILIEU DE TERRAIN', 23, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Nemanja', 'MATIC', 'MILIEU DE TERRAIN', 30, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Adem', 'LJAJIC', 'MILIEU DE TERRAIN', 26, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Aleksandar', 'PRIJOVIC', 'ATTAQUANT', 28, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Aleksandar', 'MITROVIC', 'ATTAQUANT', 23, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Nemanja', 'RADONJIC', 'ATTAQUANT', 22, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Luka', 'JOVIC', 'ATTAQUANT', 20, 'SRB');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Mladen', 'KRSTAJIC', 'ENTRAÎNEUR', 44, 'SRB');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Robin', 'OLSEN', 'GARDIEN DE BUT', 28, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Karl-Johan', 'JOHNSSON', 'GARDIEN DE BUT', 28, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Kristoffer', 'NORDFELDT', 'GARDIEN DE BUT', 29, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Mikael', 'LUSTIG', 'DÉFENSEUR', 31, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Victor', 'LINDELOF', 'DÉFENSEUR', 24, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Andreas', 'GRANQVIST', 'DÉFENSEUR', 33, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Martin', 'OLSSON', 'DÉFENSEUR', 30, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Ludwig', 'AUGUSTINSSON', 'DÉFENSEUR', 24, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Filip', 'HELANDER', 'DÉFENSEUR', 25, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Emil', 'KRAFTH', 'DÉFENSEUR', 24, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Pontus', 'JANSSON', 'DÉFENSEUR', 27, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Sebastian', 'LARSSON', 'MILIEU DE TERRAIN', 33, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Albin', 'EKDAL', 'MILIEU DE TERRAIN', 29, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Emil', 'FORSBERG', 'MILIEU DE TERRAIN', 26, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Gustav', 'SVENSSON', 'MILIEU DE TERRAIN', 31, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Oscar', 'HILJEMARK', 'MILIEU DE TERRAIN', 26, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Viktor', 'CLAESSON', 'MILIEU DE TERRAIN', 26, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Marcus', 'ROHDEN', 'MILIEU DE TERRAIN', 27, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Jimmy', 'DURMAZ', 'MILIEU DE TERRAIN', 29, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Marcus', 'BERG', 'ATTAQUANT', 32, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'John', 'GUIDETTI', 'ATTAQUANT', 26, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Ola', 'TOIVONEN', 'ATTAQUANT', 32, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Isaac Kiese', 'THELIN', 'ATTAQUANT', 26, 'SWE');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Janne', 'ANDERSSON', 'ENTRAÎNEUR', 55, 'SWE');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Yann', 'SOMMER', 'GARDIEN DE BUT', 29, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Yvon', 'MVOGO', 'GARDIEN DE BUT', 24, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Roman', 'BUERKI', 'GARDIEN DE BUT', 27, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Stephan', 'LICHTSTEINER', 'DÉFENSEUR', 34, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Francois', 'MOUBANDJE', 'DÉFENSEUR', 28, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Nico', 'ELVEDI', 'DÉFENSEUR', 21, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Manuel', 'AKANJI', 'DÉFENSEUR', 23, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Michael', 'LANG', 'DÉFENSEUR', 27, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Ricardo', 'RODRIGUEZ', 'DÉFENSEUR', 26, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Johan', 'DJOUROU', 'DÉFENSEUR', 31, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Fabian', 'SCHAER', 'DÉFENSEUR', 26, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Remo', 'FREULER', 'MILIEU DE TERRAIN', 26, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Granit', 'XHAKA', 'MILIEU DE TERRAIN', 25, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Valon', 'BEHRAMI', 'MILIEU DE TERRAIN', 33, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Steven', 'ZUBER', 'MILIEU DE TERRAIN', 27, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Blerim', 'DZEMAILI', 'MILIEU DE TERRAIN', 32, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Gelson', 'FERNANDES', 'MILIEU DE TERRAIN', 32, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Denis', 'ZAKARIA', 'MILIEU DE TERRAIN', 21, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Xherdan', 'SHAQIRI', 'MILIEU DE TERRAIN', 26, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Breel', 'EMBOLO', 'ATTAQUANT', 21, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Haris', 'SEFEROVIC', 'ATTAQUANT', 26, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Mario', 'GAVRANOVIC', 'ATTAQUANT', 28, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Josip', 'DRMIC', 'ATTAQUANT', 26, 'SUI');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Vladimir', 'PETKOVIC', 'ENTRAÎNEUR', 55, 'SUI');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Farouk', 'BEN MUSTAPHA', 'GARDIEN DE BUT', 29, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Aymen', 'MATHLOUTHI', 'GARDIEN DE BUT', 33, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Mouez', 'HASSEN', 'GARDIEN DE BUT', 23, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Syam', 'BEN YOUSSEF', 'DÉFENSEUR', 29, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Yohan', 'BEN ALOUANE', 'DÉFENSEUR', 31, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Yassine', 'MERIAH', 'DÉFENSEUR', 25, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Oussama', 'HADDADI', 'DÉFENSEUR', 26, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Rami', 'BEDOUI', 'DÉFENSEUR', 28, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Dylan', 'BRONN', 'DÉFENSEUR', 23, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Ali', 'MAALOUL', 'DÉFENSEUR', 28, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Hamdi', 'NAGUEZ', 'DÉFENSEUR', 25, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Anice', 'BADRI', 'MILIEU DE TERRAIN', 27, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Ferjani', 'SASSI', 'MILIEU DE TERRAIN', 26, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Mohamed', 'BEN AMOR', 'MILIEU DE TERRAIN', 26, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Ellyes', 'SKHIRI', 'MILIEU DE TERRAIN', 23, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Saifeddine', 'KHAOUI', 'ATTAQUANT', 23, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Fakhreddine', 'BEN YOUSSEF', 'ATTAQUANT', 27, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Wahbi', 'KHAZRI', 'ATTAQUANT', 27, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Ahmed', 'KHALIL', 'ATTAQUANT', 23, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Bassem', 'SRARFI', 'ATTAQUANT', 21, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Saber', 'KHALIFA', 'ATTAQUANT', 31, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Ghaylen', 'CHAALELI', 'ATTAQUANT', 24, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Naim', 'SLITI', 'ATTAQUANT', 26, 'TUN');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Nabil', 'MAALOUL', 'ENTRAÎNEUR', 55, 'TUN');
COMMIT;

INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 1, 'Fernando', 'MUSLERA', 'GARDIEN DE BUT', 32, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 12, 'Martin', 'CAMPANA', 'GARDIEN DE BUT', 29, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 23, 'Martin', 'SILVA', 'GARDIEN DE BUT', 35, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 2, 'Jose', 'GIMENEZ', 'DÉFENSEUR', 23, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 3, 'Diego', 'GODIN', 'DÉFENSEUR', 32, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 4, 'Guillermo', 'VARELA', 'DÉFENSEUR', 25, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 13, 'Gaston', 'SILVA', 'DÉFENSEUR', 24, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 16, 'Maximiliano', 'PEREIRA', 'DÉFENSEUR', 34, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 19, 'Sebastian', 'COATES', 'DÉFENSEUR', 27, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 22, 'Martin', 'CACERES', 'DÉFENSEUR', 31, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 5, 'Carlos', 'SANCHEZ', 'MILIEU DE TERRAIN', 33, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 6, 'Rodrigo', 'BENTANCUR', 'MILIEU DE TERRAIN', 21, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 7, 'Cristian', 'RODRIGUEZ', 'MILIEU DE TERRAIN', 32, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 8, 'Nahitan', 'NANDEZ', 'MILIEU DE TERRAIN', 22, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 14, 'Lucas', 'TORREIRA', 'MILIEU DE TERRAIN', 22, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 15, 'Matias', 'VECINO', 'MILIEU DE TERRAIN', 27, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 17, 'Diego', 'LAXALT', 'MILIEU DE TERRAIN', 25, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 9, 'Luis', 'SUAREZ', 'ATTAQUANT', 31, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 10, 'Giorgian', 'DE ARRASCAETA', 'ATTAQUANT', 24, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 11, 'Cristhian', 'STUANI', 'ATTAQUANT', 31, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 18, 'Maximiliano', 'GOMEZ', 'ATTAQUANT', 22, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Jonathan', 'URRETAVISCAYA', 'ATTAQUANT', 28, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 21, 'Edinson', 'CAVANI', 'ATTAQUANT', 31, 'URU');
INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, NULL, 'Oscar', 'TABAREZ', 'ENTRAÎNEUR', 71, 'URU');
COMMIT;



INSERT INTO Action (na, typea) VALUES ('BUT', 'But');
INSERT INTO Action (na, typea) VALUES ('BCC', 'But contre son camp');
INSERT INTO Action (na, typea) VALUES ('SRT', 'Sortie par remplacement');
INSERT INTO Action (na, typea) VALUES ('ENT', 'Entrée en cours de match');
INSERT INTO Action (na, typea) VALUES ('JNE', 'Avertissement par carton jaune');
INSERT INTO Action (na, typea) VALUES ('RGE', 'Expulsion par carton rouge');
COMMIT;




CREATE SEQUENCE seq_match
   START WITH 1
   INCREMENT BY 1;

CREATE SEQUENCE seq_action
   START WITH 1
   INCREMENT BY 1;
   
INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('14 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe A', 'Luzhniki Stadium', 'Moscou', 'RUS', 5, 0, 'KSA');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('15 juin 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe A', 'Ekaterinburg Arena', 'Ekaterinbourg', 'EGY',0, 1, 'URU');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('15 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe B', 'Stade de Saint-Pétersbourg', 'Saint-Pétersbourg', 'MAR', 0, 1, 'IRN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('15 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe B', 'Fisht Stadium', 'Sotchi', 'POR', 3, 3, 'ESP');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('16 juin 2018 - 13:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe C', 'Kazan Arena', 'Kazan', 'FRA', 2, 1, 'AUS');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('16 juin 2018 - 16:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe D', 'Spartak Stadium', 'Moscou', 'ARG', 1, 1, 'ISL');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('16 juin 2018 - 19:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe C', 'Mordovia Arena', 'Saransk', 'PER', 0, 1, 'DEN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('16 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe D', 'Kaliningrad Stadium', 'Kaliningrad', 'CRO', 2, 0, 'NGA');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('17 juin 2018 - 16:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe E', 'Samara Arena', 'Samara', 'CRC', 0, 1, 'SRB');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('17 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe F', 'Luzhniki Stadium', 'Moscou', 'GER', 0, 1, 'MEX');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('17 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe E', 'Rostov Arena', 'Rostov-sur-le-Don', 'BRA', 1, 1, 'SUI');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('18 juin 2018 - 15:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe F', 'Nizhny Novgorod Stadium', 'Nijni-Novgorod', 'SWE', 1, 0, 'KOR');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('18 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe G', 'Fisht Stadium', 'Sotchi', 'BEL', 3, 0, 'PAN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('18 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe G', 'Volgograd Arena', 'Volgograd', 'TUN', 1, 2, 'ENG');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('19 juin 2018 - 15:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe H', 'Mordovia Arena', 'Saransk', 'COL', 1, 2, 'JPN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('19 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe H', 'Spartak Stadium', 'Moscou', 'POL', 1, 2, 'SEN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('19 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe A', 'Stade de Saint-Pétersbourg', 'Saint-Pétersbourg', 'RUS', 3, 1, 'EGY');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('20 juin 2018 - 15:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe B', 'Luzhniki Stadium', 'Moscou', 'POR', 1, 0, 'MAR');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('20 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe A', 'Rostov Arena', 'Rostov-sur-le-Don', 'URU', 1, 0, 'KSA');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('20 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe B', 'Kazan Arena', 'Kazan', 'IRN', 0, 1, 'ESP');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('21 juin 2018 - 16:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe C', 'Samara Arena', 'Samara', 'DEN', 1, 1, 'AUS');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('21 juin 2018 - 20:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe C', 'Ekaterinburg Arena', 'Ekaterinbourg', 'FRA', 1, 0, 'PER');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('21 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe D', 'Nizhny Novgorod Stadium', 'Nijni-Novgorod', 'ARG', 0, 3, 'CRO');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('22 juin 2018 - 15:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe E', 'Stade de Saint-Pétersbourg', 'Saint-Pétersbourg', 'BRA', 2, 0, 'CRC');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('22 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe D', 'Volgograd Arena', 'Volgograd', 'NGA', 2, 0, 'ISL');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('22 juin 2018 - 20:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe E', 'Kaliningrad Stadium', 'Kaliningrad', 'SRB', 1, 2, 'SUI');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('23 juin 2018 - 15:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe G', 'Spartak Stadium', 'Moscou', 'BEL', 5, 2, 'TUN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('23 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe F', 'Rostov Arena', 'Rostov-sur-le-Don', 'KOR', 1, 2, 'MEX');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('23 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe F', 'Fisht Stadium', 'Sotchi', 'GER', 2, 1, 'SWE');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('24 juin 2018 - 15:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe G', 'Nizhny Novgorod Stadium', 'Nijni-Novgorod', 'ENG', 6, 1, 'PAN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('24 juin 2018 - 20:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe H', 'Ekaterinburg Arena', 'Ekaterinbourg', 'JPN', 2, 2, 'SEN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('24 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe H', 'Kazan Arena', 'Kazan', 'POL', 0, 3, 'COL');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('25 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe A', 'Samara Arena', 'Samara', 'URU', 3, 0, 'RUS');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('25 juin 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe A', 'Volgograd Arena', 'Volgograd', 'KSA', 2, 1, 'EGY');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('25 juin 2018 - 20:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe B', 'Stade de Kaliningrad', 'Kaliningrad', 'ESP', 2, 2, 'MAR');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('25 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe B', 'Stade de Mordovie', 'Saransk', 'IRN', 1, 1, 'POR');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('26 juin 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe C', 'Stade Ficht', 'Sotchi', 'AUS', 0, 2, 'PER');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('26 juin 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe C', 'Stade Loujniki', 'Moscou', 'DEN', 0, 0, 'FRA');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('26 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe D', 'Stade de Saint-Pétersbourg', 'Saint-Pétersbourg', 'NGA', 1, 2, 'ARG');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('26 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe D', 'Rostov Arena', 'Rostov-sur-le-Don', 'ISL', 1, 2, 'CRO');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('27 juin 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe F', 'Kazan Arena', 'Kazan', 'KOR', 2, 0, 'GER');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('27 juin 2018 - 19:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe F', 'Iekaterinbourg Arena', 'Ekaterinbourg', 'MEX', 0, 3, 'SWE');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('27 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe E', 'Stade du Spartak', 'Moscou', 'SRB', 0, 2, 'BRA');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('27 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe E', 'Stade de Nijni-Novgorod', 'Nijni-Novgorod', 'SUI', 2, 2, 'CRC');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('28 juin 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe H', 'Volgograd Arena', 'Volgograd', 'JPN', 0, 1, 'POL');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('28 juin 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe H', 'Samara Arena', 'Samara', 'SEN', 0, 1, 'COL');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('28 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe G', 'Stade de Mordovie', 'Saransk', 'PAN', 1, 2, 'TUN');

INSERT INTO Match (nm, dtm, poule, stade, ville, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('28 juin 2018 - 20:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Groupe G', 'Stade de Kaliningrad', 'Kaliningrad', 'ENG', 0, 1, 'BEL');

-- Huitième de Finale

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('30 juin 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Kazan Arena', 'Kazan', 'Huitième de finale', 'FRA', 4, 3, 'ARG');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'FRA'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'FRA'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ARG'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'ARG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'ARG'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '11', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'ARG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '13', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '19', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'ARG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '41', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'ARG'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '43', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'ARG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'ARG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ARG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '48', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ARG'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '50', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'ARG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '57', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '64', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '66', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'ARG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '66', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'ARG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '68', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '72', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '75', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '75', (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '75', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'ARG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '75', (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'ARG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '83', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '83', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '89', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '89', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'ARG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'ARG'), 'BUT');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('30 juin 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade Ficht', 'Sotchi', 'Huitième de finale', 'URU', 2, 1, 'POR');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'URU'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'URU'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'POR'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'POR'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'POR'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '7', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'URU'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '55', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'POR'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '62', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'URU'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '63', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'URU'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '63', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'URU'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'POR'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'POR'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'URU'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'URU'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'POR'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'POR'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'URU'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'URU'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '84', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'POR'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '84', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'POR'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'POR'), 'JNE');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2, sc1_penalty, sc2_penalty)
VALUES (seq_match.NEXTVAL, TO_DATE('01 juil. 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade Loujniki', 'Moscou', 'Huitième de finale', 'ESP', 1, 1, 'RUS', 3, 4);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'ESP'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'ESP'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'ESP'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'RUS'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'RUS'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '12', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'RUS'), 'BCC');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '40', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'ESP'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '41', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'RUS'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'RUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'RUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '54', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'RUS'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '61', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'RUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '61', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'RUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'RUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'RUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '67', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'ESP'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '67', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ESP'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '70', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'ESP'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '70', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ESP'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '71', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'RUS'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '80', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'ESP'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '80', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'ESP'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '97', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'RUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '97', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'RUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '104', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ESP'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '104', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'ESP'), 'ENT');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2, sc1_penalty, sc2_penalty)
VALUES (seq_match.NEXTVAL, TO_DATE('01 juil. 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade de Nijni-Novgorod', 'Nijni-Novgorod', 'Huitième de finale', 'CRO', 1, 1, 'DEN', 3, 2);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'CRO'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'CRO'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'DEN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'DEN'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '1', (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'DEN'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '4', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'DEN'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'DEN'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '66', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'DEN'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '66', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'DEN'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '71', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '71', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '97', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '97', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '98', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'DEN'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '98', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'DEN'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '106', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'DEN'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '106', (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'DEN'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '108', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '108', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '115', (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'DEN'), 'JNE');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('02 juil. 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Samara Arena', 'Samara', 'Huitième de finale', 'BRA', 2, 0, 'MEX');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'BRA'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BRA'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'MEX'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'MEX'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'MEX'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '38', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'MEX'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '43', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'BRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'MEX'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'MEX'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '51', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '55', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'MEX'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '55', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'MEX'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '55', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'MEX'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '59', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'BRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '60', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'MEX'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '60', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'MEX'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '77', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'MEX'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '80', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '80', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'BRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '86', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'BRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '86', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'BRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'BRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+1', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'BRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+1', (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'BRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+2', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'MEX'), 'JNE');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('02 juil. 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Rostov Arena', 'Rostov-sur-le-Don', 'Huitième de finale', 'BEL', 3, 2, 'JPN');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BEL'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BEL'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'JPN'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'JPN'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'JPN'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '48', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'JPN'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '52', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'JPN'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '69', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'BEL'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'BEL'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'JPN'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'JPN'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'JPN'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'JPN'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+4', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BEL'), 'BUT');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('03 juil. 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade de Saint-Pétersbourg', 'Saint-Pétersbourg', 'Huitième de finale', 'SWE', 1, 0, 'SUI');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'SWE'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'SWE'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'SUI'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'SUI'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'SUI'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '31', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'SWE'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '66', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'SWE'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '61', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'SUI'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '68', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'SUI'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'SUI'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'SUI'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'SUI'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'SUI'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '82', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'SWE'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '82', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'SWE'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '82', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'SWE'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '82', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'SWE'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+1', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'SWE'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+1', (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'SWE'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+4', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'SUI'), 'RGE');
COMMIT;


INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2, sc1_penalty, sc2_penalty)
VALUES (seq_match.NEXTVAL, TO_DATE('03 juil. 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade du Spartak', 'Moscou', 'Huitième de finale', 'COL', 1, 1, 'ENG', 3, 4);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'COL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'COL'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ENG'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '41', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'COL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '52', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'COL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '54', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'COL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '56', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'ENG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '61', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'COL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '61', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'COL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '63', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'COL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '64', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'COL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '69', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'ENG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '79', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'COL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '79', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'COL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'COL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'COL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'COL'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '102', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '102', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '113', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '113', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '116', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'COL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '116', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'COL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '118', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'COL'), 'JNE');
COMMIT;

-- Quart de Finale

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('06 juil. 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade de Nijni-Novgorod', 'Nijni-Novgorod', 'Quart de finale', 'URU', 0, 2, 'FRA');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'FRA'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'FRA'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'URU'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'URU'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'URU'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '33', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '38', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'URU'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '41', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '59', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'URU'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '59', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'URU'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '59', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'URU'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '59', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'URU'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '61', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '69', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '69', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'URU'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'URU'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'URU'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '80', (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '80', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'FRA'), 'ENT');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('06 juil. 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Kazan Arena', 'Kazan', 'Quart de finale', 'BRA', 1, 2, 'BEL');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'BRA'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'BRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BRA'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BEL'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BEL'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '13', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'BRA'), 'BCC');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '31', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'BEL'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'BRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'BRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '47', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'BEL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '58', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '58', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'BRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '71', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BEL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'BRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '76', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'BRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '83', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '83', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '85', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'BRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '87', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '87', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'BEL'), 'ENT');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('07 juil. 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Samara Arena', 'Samara', 'Quart de finale', 'SWE', 0, 2, 'ENG');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'SWE'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'SWE'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'SWE'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'ENG'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ENG'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '6', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ENG'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '59', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ENG'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'SWE'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'SWE'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'SWE'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'SWE'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '77', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '77', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '85', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '85', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '85', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'SWE'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '85', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'SWE'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '87', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ENG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+1', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+1', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+4', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'SWE'), 'JNE');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2, sc1_penalty, sc2_penalty)
VALUES (seq_match.NEXTVAL, TO_DATE('07 juil. 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade Ficht', 'Sotchi', 'Quart de finale', 'RUS', 2, 2, 'CRO', 3, 4);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'RUS'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'RUS'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'RUS'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'CRO'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'CRO'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '31', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'RUS'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '35', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'CRO'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '38', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '39', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'CRO'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '54', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'RUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '54', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'RUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '63', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '63', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '67', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'RUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '67', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'RUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '79', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'RUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '79', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'RUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '88', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '97', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '97', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '101', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'CRO'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '101', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'CRO'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '102', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'RUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '102', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'RUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '109', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'RUS'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '114', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'CRO'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '115', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'RUS'), 'BUT');
COMMIT;

-- Demi-Finale

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('10 juil. 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade de Saint-Pétersbourg', 'Saint-Pétersbourg', 'Demi-finale', 'FRA', 1, 0, 'BEL');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'FRA'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'FRA'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BEL'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BEL'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '51', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '60', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '60', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '63', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BEL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '71', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'BEL'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '80', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '80', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '85', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '85', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '86', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '86', (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '87', (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+1', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+1', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+4', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'BEL'), 'JNE');
COMMIT;

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('11 juil. 2018 - 21:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade Loujniki', 'Moscou', 'Demi-finale', 'CRO', 2, 1, 'ENG');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'CRO'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'CRO'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'ENG'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ENG'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '5', (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'ENG'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '48', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '54', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ENG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '68', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'CRO'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '74', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '91', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '91', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '95', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '95', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '96', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'CRO'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '97', (SELECT nj FROM Joueur WHERE nmaillot = 8 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '97', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '101', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '101', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '109', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '112', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '112', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '115', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '115', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '119', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '119', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'CRO'), 'ENT');
COMMIT;

-- Finale pour la troisième place

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('14 juil. 2018 - 17:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade de Saint-Pétersbourg', 'Saint-Pétersbourg', 'Finale pour la troisième place', 'BEL', 2, 0, 'ENG');

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BEL'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'BEL'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BEL'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'ENG'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'ENG'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'ENG'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '4', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'BEL'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '39', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '39', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '46', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '52', (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'ENG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '60', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '60', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '76', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'ENG'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '78', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'BEL'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '78', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'BEL'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '82', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'BEL'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '84', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'ENG'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '84', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'ENG'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+3', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'BEL'), 'JNE');
COMMIT;

-- Finale

INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
VALUES (seq_match.NEXTVAL, TO_DATE('15 juil. 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade Loujniki', 'Moscou', 'Finale', 'FRA', 4, 2, 'CRO');
COMMIT;

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'FRA'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'FRA'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'FRA'), NULL);

INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'CRO'), 'C');
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'CRO'), NULL);
INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'CRO'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '18', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), 'BCC');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '27', (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '28', (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'CRO'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '38', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '41', (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '55', (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '55', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '59', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '65', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '69', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'CRO'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '71', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '71', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '73', (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 3 AND ne = 'CRO'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '81', (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'CRO'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '90+2', (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'CRO'), 'JNE');
COMMIT;

-- TP4

ALTER TABLE Equipe
MODIFY nome VARCHAR(20);

ALTER TABLE Joueur
MODIFY (
   nom    VARCHAR(20), 
   prenom VARCHAR(20)
   );

ALTER TABLE Joueur
ADD (
    CONSTRAINT ck_joueur_nmaillot   CHECK (nmaillot BETWEEN 1 AND 23),
    CONSTRAINT ck_joueur_age        CHECK (age > 0)
    );

ALTER TABLE Match
ADD (
    CONSTRAINT ck_match_dtm         CHECK (TO_CHAR(dtm,'YYYY') = '2018'),
    CONSTRAINT ck_match_score1      CHECK (score1 >= 0),
    CONSTRAINT ck_match_score2      CHECK (score1 >= 0),
    CONSTRAINT ck_match_sc1_penalty CHECK (sc1_penalty >= 0),
    CONSTRAINT ck_match_sc2_penalty CHECK (sc2_penalty >= 0),
    CONSTRAINT ck_match_ne1_ne2     CHECK (ne1 <> ne2)
    );

ALTER TABLE Composer
ADD CONSTRAINT ck_composer_cap      CHECK (cap = 'C');

ALTER TABLE Action
ADD CONSTRAINT ck_action_cat        CHECK (na IN ('BUT', 'BCC', 'SRT', 'ENT', 'JNE', 'RGE'));

-- TP5

INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'FRA'), 'C');
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 2 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 4 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'FRA'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 21 AND ne = 'FRA'), NULL);

INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 5 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 13 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'AUS'), 'C');
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 20 AND ne = 'AUS'), NULL);
INSERT INTO Composer VALUES (5, (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'AUS'), NULL);
COMMIT;

INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '13', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'AUS'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '13', (SELECT nj FROM Joueur WHERE nmaillot = 19 AND ne = 'AUS'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '58', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '62', (SELECT nj FROM Joueur WHERE nmaillot = 15 AND ne = 'AUS'), 'BUT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '64', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'AUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '64', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'AUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '70', (SELECT nj FROM Joueur WHERE nmaillot = 7 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '70', (SELECT nj FROM Joueur WHERE nmaillot = 18 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '70', (SELECT nj FROM Joueur WHERE nmaillot = 11 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '70', (SELECT nj FROM Joueur WHERE nmaillot = 9 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '72', (SELECT nj FROM Joueur WHERE nmaillot = 23 AND ne = 'AUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '72', (SELECT nj FROM Joueur WHERE nmaillot = 22 AND ne = 'AUS'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '76', (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'FRA'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '78', (SELECT nj FROM Joueur WHERE nmaillot = 12 AND ne = 'FRA'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '78', (SELECT nj FROM Joueur WHERE nmaillot = 14 AND ne = 'FRA'), 'ENT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '81', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'AUS'), 'BCC');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '87', (SELECT nj FROM Joueur WHERE nmaillot = 16 AND ne = 'AUS'), 'JNE');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '84', (SELECT nj FROM Joueur WHERE nmaillot = 10 AND ne = 'AUS'), 'SRT');
INSERT INTO Survenir (nm, tps, nj, na) VALUES (5, '84', (SELECT nj FROM Joueur WHERE nmaillot = 17 AND ne = 'AUS'), 'ENT');
COMMIT;

UPDATE Equipe
SET nome = 'CORÉE DU SUD'
WHERE ne = 'KOR';

UPDATE Equipe
SET nome = UPPER(SUBSTR(nome,1,1)) || LOWER(SUBSTR(nome,2));

UPDATE Joueur
SET prenom = UPPER(SUBSTR(prenom,1,1)) || LOWER(SUBSTR(prenom,2))
WHERE ne = 'BRA';
COMMIT;
