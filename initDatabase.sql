drop database DeweyTest;
create database DeweyTest;
use DeweyTest;




-- uhhh child PKs are not always going to be unique? :( 
-- probably could just add another column,
-- but I think keeping the PKs as the actual numbers in the entity would be very preferred


CREATE TABLE Classes (
    id SMALLINT PRIMARY KEY,
    name VARCHAR(121) NOT NULL,
    description VARCHAR(408),
    embedding BLOB,
    fullName VARCHAR(135) GENERATED ALWAYS AS (CONCAT(id, '00 - ', name)) STORED

);

CREATE TABLE Divisions (
    id SMALLINT PRIMARY KEY,
    name VARCHAR(121) NOT NULL,
    description VARCHAR(408),
    embedding BLOB,
    fullName VARCHAR(135) GENERATED ALWAYS AS (CONCAT(classId, id, '0 - ', name)) STORED,
    --
    classId SMALLINT NOT NULL,
    FOREIGN KEY (classId) REFERENCES Classes(id)
);

CREATE TABLE Sections (
    id SMALLINT PRIMARY KEY,
    name VARCHAR(121) NOT NULL,
    description VARCHAR(408),
    embedding BLOB,
    fullName VARCHAR(135) GENERATED ALWAYS AS (CONCAT(classId, divisionId, id, ' - ', name)) STORED,
    --
    classId SMALLINT NOT NULL,
    FOREIGN KEY (classId) REFERENCES Classes(id),

    divisionId SMALLINT NOT NULL,
    FOREIGN KEY (divisionId) REFERENCES Divisions(id)
);

CREATE TABLE CallNumbers (
    id SMALLINT PRIMARY KEY,
    name VARCHAR(121) NOT NULL,
    description VARCHAR(408),
    embedding BLOB,
    fullName VARCHAR(135) GENERATED ALWAYS AS (CONCAT(classId, divisionId, secionId, '.', id ,' - ', name)) STORED,
    --
    classId SMALLINT NOT NULL,
    FOREIGN KEY (classId) REFERENCES Classes(id),
    
    divisionId SMALLINT NOT NULL,
    FOREIGN KEY (divisionId) REFERENCES Divisions(id),

    secionId SMALLINT NOT NULL,
    FOREIGN KEY (secionId) REFERENCES Sections(id)
);













-- Insert Classes
INSERT INTO Classes (id, name, description, embedding) VALUES
(1, 'Philosophy and Psychology', 'Philosophy and psychology', NULL),
(2, 'Religion', 'Religion', NULL),
(3, 'Social Sciences', 'Social Sciences', NULL);

-- Insert Divisions
INSERT INTO Divisions (id, name, description, embedding, classId) VALUES
(1, 'Philosophy', 'Philosophy', NULL, 1),
(2, 'Psychology', 'Psychology', NULL, 1),
(3, 'Theology', 'Theology', NULL, 2),
(4, 'Religious Ethics', 'Religious Ethics', NULL, 2),
(5, 'Religious Orders', 'Religious Orders', NULL, 2),
(6, 'Religious History', 'Religious History', NULL, 2),
(7, 'Economics', 'Economics', NULL, 3),
(8, 'Political Science', 'Political Science', NULL, 3);

-- Insert Sections
INSERT INTO Sections (id, name, description, embedding, classId, divisionId) VALUES
(1, 'Epistemology, Causation, Humankind', 'Epistemology, Causation, Humankind', NULL, 1, 1),
(2, 'Metaphysics', 'Metaphysics', NULL, 1, 1),
(3, 'Logic', 'Logic', NULL, 1, 1),
(4, 'Developmental, Differential, Personality, and Abnormal Psychology', 'Developmental, Differential, Personality, and Abnormal Psychology', NULL, 1, 2),
(5, 'Psychology of Emotion, Motivation, and Affect', 'Psychology of Emotion, Motivation, and Affect', NULL, 1, 2),
(6, 'Psychology of Consciousness, Perception, and Attention', 'Psychology of Consciousness, Perception, and Attention', NULL, 1, 2),
(7, 'Natural Theology', 'Natural Theology', NULL, 2, 3),
(8, 'Doctrinal Theology', 'Doctrinal Theology', NULL, 2, 3),
(9, 'Moral Theology', 'Moral Theology', NULL, 2, 3),
(10, 'Moral Theology', 'Moral Theology', NULL, 2, 4),
(11, 'Religious Orders', 'Religious Orders', NULL, 2, 5),
(12, 'Religious Orders', 'Religious Orders', NULL, 2, 5),
(13, 'Religious Orders', 'Religious Orders', NULL, 2, 5),
(14, 'General History of Christianity', 'General History of Christianity', NULL, 2, 6),
(15, 'History of Christianity in Europe', 'History of Christianity in Europe', NULL, 2, 6),
(16, 'History of Christianity in Asia', 'History of Christianity in Asia', NULL, 2, 6),
(17, 'History of Christianity in Africa', 'History of Christianity in Africa', NULL, 2, 6),
(18, 'History of Christianity in North America', 'History of Christianity in North America', NULL, 2, 6),
(19, 'History of Christianity in South America', 'History of Christianity in South America', NULL, 2, 6),
(20, 'Microeconomics', 'Microeconomics', NULL, 3, 7),
(21, 'Macroeconomics', 'Macroeconomics', NULL, 3, 7),
(22, 'International Economics', 'International Economics', NULL, 3, 7),
(23, 'Political Theory', 'Political Theory', NULL, 3, 8),
(24, 'Comparative Politics', 'Comparative Politics', NULL, 3, 8),
(25, 'International Relations', 'International Relations', NULL, 3, 8);

-- Insert CallNumbers
INSERT INTO CallNumbers (id, name, description, embedding, classId, divisionId, secionId) VALUES
(1, '121', 'Epistemology, Causation, Humankind', NULL, 1, 1, 1),
(2, '122', 'Metaphysics', NULL, 1, 1, 2),
(3, '123', 'Logic', NULL, 1, 1, 3),
(4, '150', 'Developmental, Differential, Personality, and Abnormal Psychology', NULL, 1, 2, 4),
(5, '152', 'Psychology of Emotion, Motivation, and Affect', NULL, 1, 2, 5),
(6, '154', 'Psychology of Consciousness, Perception, and Attention', NULL, 1, 2, 6),
(7, '231', 'Natural Theology', NULL, 2, 3, 7),
(8, '232', 'Doctrinal Theology', NULL, 2, 3, 8),
(9, '233', 'Moral Theology', NULL, 2, 3, 9),
(10, '234', 'Moral Theology', NULL, 2, 4, 10),
(11, '271', 'Religious Orders', NULL, 2, 5, 11),
(12, '272', 'Religious Orders', NULL, 2, 5, 12),
(13, '273', 'Religious Orders', NULL, 2, 5, 13),
(14, '270', 'General History of Christianity', NULL, 2, 6, 14),
(15, '271', 'History of Christianity in Europe', NULL, 2, 6, 15),
(16, '272', 'History of Christianity in Asia', NULL, 2, 6, 16),
(17, '273', 'History of Christianity in Africa', NULL, 2, 6, 17),
(18, '274', 'History of Christianity in North America', NULL, 2, 6, 18),
(19, '275', 'History of Christianity in South America', NULL, 2, 6, 19),
(20, '330', 'Microeconomics', NULL, 3, 7, 20),
(21, '331', 'Macroeconomics', NULL, 3, 7, 21),
(22, '332', 'International Economics', NULL, 3, 7, 22),
(23, '320', 'Political Theory', NULL, 3, 8, 23),
(24, '321', 'Comparative Politics', NULL, 3, 8, 24),
(25, '322', 'International Relations', NULL, 3, 8, 25);






select * from Classes;
select * from Divisions;
select * from Sections;
select * from CallNumbers;
