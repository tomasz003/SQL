DROP TABLE IF EXISTS ZMIANY, PRACOWNICY, LOKALIZACJA, GODZINY_ZMIAN, PLCIE ;

CREATE TABLE PLCIE (
    Imie VARCHAR(15) PRIMARY KEY,
    Plec CHAR(1)
);

CREATE TABLE PRACOWNICY (
	ID_pracownika TINYINT PRIMARY KEY,
	Imie VARCHAR(15),
	Nazwisko VARCHAR(20),
	Rok_urodzenia SMALLINT,
	Numer_telefonu VARCHAR(9),
	Narodowosc CHAR(2),
	Student CHAR(1),
	FOREIGN KEY (Imie) REFERENCES PLCIE(Imie)
);

CREATE TABLE LOKALIZACJA (
	Ulica VARCHAR(25) PRIMARY KEY,
	Miejsce_rozdawania VARCHAR(5)
);

CREATE TABLE GODZINY_ZMIAN (
    Godzina_rozpoczecia VARCHAR(5) PRIMARY KEY,
    Godzina_zakonczenia VARCHAR(5)
);

CREATE TABLE ZMIANY (
	ID_pracownika TINYINT,
	Godzina_rozpoczecia VARCHAR(5),
	Ulica VARCHAR(30),
	Materialy TINYINT,
	Ocena1 INT,
	Ocena2 INT,
	Ocena3 INT,
	PRIMARY KEY (ID_pracownika, Godzina_rozpoczecia),
	FOREIGN KEY (ID_pracownika) REFERENCES PRACOWNICY(ID_pracownika),
	FOREIGN KEY (Ulica) REFERENCES LOKALIZACJA(Ulica),
	FOREIGN KEY (Godzina_rozpoczecia) REFERENCES GODZINY_ZMIAN(Godzina_rozpoczecia)
);

INSERT INTO PLCIE VALUES
('Tomasz', 'M'),
('Ewa', 'K'),
('Michael', 'M'),
('Augustin', 'M'),
('Ivan', 'M'),
('Gabriela', 'K'),
('Patrycja', 'K'),
('Filip', 'M');

INSERT INTO PRACOWNICY VALUES
(1, 'Tomasz', 'Niechcial', 2003, '534213701', 'UA', 'T'),
(2, 'Ewa', 'Piekna', 2002, '532123302', 'PL', 'T'),
(3, 'Michael', 'Galois', 2003, '504553903', 'UK', 'T'),
(4, 'Augustin', 'Cauchy', 2000, '567178204', 'PL', 'T'),
(5, 'Ivan', 'Grzaniec', 2002, '538327305', 'UA', 'N'),
(6, 'Gabriela', 'Gancarz', 1998, '534898906', 'PL', 'N'),
(7, 'Patrycja', 'Gola', 1997, '546789707', 'PL', 'N'),
(8, 'Filip', 'Szczesniak', 2005, '589221808', 'PL', 'T');

INSERT INTO LOKALIZACJA VALUES
('Czarnowiejska', 'AGH'),
('Kawiory', 'AGH'),
('Ruczaj', 'UJ'),
('Norymberska', 'UJ'),
('Dziedziniec', 'UEK'),
('Czysta', 'AGH')
;

INSERT INTO GODZINY_ZMIAN VALUES
('09:00', '13:00'),
('14:00', '18:00');

INSERT INTO ZMIANY VALUES
(1, '09:00', 'Czarnowiejska', 15, 4, 5, 5),
(2, '09:00', 'Kawiory',      10, 4, 5, 4),
(3, '09:00', 'Ruczaj',        10, 5, 3, 5),
(4, '09:00', 'Czysta',         5, 3, 3, 4),
(5, '09:00', 'Dziedziniec',   10, 3, 2, 4),
(6, '09:00', 'Norymberska',    8, 2, 3, 4),
(7, '09:00', 'Czarnowiejska', 12, 3, 2, 1),
(8, '09:00', 'Ruczaj',        10, 4, 4, 5),
(1, '14:00', 'Dziedziniec',    8, 2, 3, 2),
(2, '14:00', 'Czarnowiejska', 10, 5, 4, 4),
(3, '14:00', 'Kawiory',       9, 3, 3, 4),
(4, '14:00', 'Ruczaj',         9, 2, 2, 3),
(5, '14:00', 'Czysta',         8, 3, 4, 4),
(6, '14:00', 'Ruczaj',        10, 3, 4, 4),
(7, '14:00', 'Norymberska',   15, 3, 3, 2),
(8, '14:00', 'Czarnowiejska', 12, 4, 4, 4);


