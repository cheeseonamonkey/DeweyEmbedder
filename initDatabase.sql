


CREATE TABLE Classes (
    id SMALLINT PRIMARY KEY,
    name VARCHAR(121) NOT NULL,
    description VARCHAR(408),
    embedding BLOB
);

CREATE TABLE Divisions (
    id SMALLINT PRIMARY KEY,
    name VARCHAR(121) NOT NULL,
    description VARCHAR(408),
    embedding BLOB,
    --
    classId SMALLINT NOT NULL,
    FOREIGN KEY (classId) REFERENCES Classes(id)
);

CREATE TABLE Sections (
    id SMALLINT PRIMARY KEY,
    name VARCHAR(121) NOT NULL,
    description VARCHAR(408),
    embedding BLOB,
    --
    classId SMALLINT NOT NULL,
    FOREIGN KEY (classId) REFERENCES Classes(id),

    divisionId SMALLINT NOT NULL,
    FOREIGN KEY (divisionId) REFERENCES Divisions(id)
);

CREATE TABLE CallNumbers (
    PRIMARY KEY (sectionId, category),

    category INT NOT NULL,
    name VARCHAR(121) NOT NULL,
    description VARCHAR(408),
    embedding BLOB,
    --
    classId SMALLINT NOT NULL,
    FOREIGN KEY (classId) REFERENCES Classes(id),
    
    divisionId SMALLINT NOT NULL,
    FOREIGN KEY (divisionId) REFERENCES Divisions(id),

    sectionId SMALLINT NOT NULL,
    FOREIGN KEY (sectionId) REFERENCES Sections(id)
);






-- Classes
INSERT INTO Classes (id, name, description, embedding) VALUES
(100, 'Philosophy and Psychology', 'Philosophy and psychology', NULL),
(200, 'Religion', 'Religion', NULL),
(300, 'Social Sciences', 'Social Sciences', NULL);


-- Divisions
INSERT INTO Divisions (id, name, description, embedding, classId) VALUES
(110, 'Metaphysics', 'Metaphysics', NULL, 100),
(120, 'Epistemology', 'Epistemology', NULL, 100),
(130, 'Logic', 'Logic', NULL, 100),
(140, 'Moral Philosophy', 'Moral Philosophy', NULL, 100),
(150, 'Psychology', 'Psychology', NULL, 100),
(160, 'Philosophical Systems', 'Philosophical Systems', NULL, 100),
(170, 'Ethics', 'Ethics', NULL, 100),
(180, 'Ancient, Medieval, and Eastern Philosophy', 'Ancient, Medieval, and Eastern Philosophy', NULL, 100),
(190, 'Modern Western Philosophy', 'Modern Western Philosophy', NULL, 100),
(210, 'Natural Theology', 'Natural Theology', NULL, 200),
(220, 'Bible', 'Bible', NULL, 200),
(230, 'Christian Theology', 'Christian Theology', NULL, 200),
(240, 'Christian Moral and Devotional Theology', 'Christian Moral and Devotional Theology', NULL, 200),
(250, 'Christian Orders and Local Church', 'Christian Orders and Local Church', NULL, 200),
(260, 'Christian Social Theology', 'Christian Social Theology', NULL, 200),
(270, 'History, Geography, and Biography', 'History, Geography, and Biography', NULL, 200),
(280, 'Christian Denominations', 'Christian Denominations', NULL, 200),
(290, 'Other and Comparative Religions', 'Other and Comparative Religions', NULL, 200),
(310, 'Statistics', 'Statistics', NULL, 300),
(320, 'Political Science', 'Political Science', NULL, 300),
(330, 'Economics', 'Economics', NULL, 300),
(340, 'Law', 'Law', NULL, 300),
(350, 'Public Administration', 'Public Administration', NULL, 300),
(360, 'Social Problems and Social Services', 'Social Problems and Social Services', NULL, 300),
(370, 'Education', 'Education', NULL, 300),
(380, 'Commerce, Communications, and Transportation', 'Commerce, Communications, and Transportation', NULL, 300),
(390, 'Customs, Etiquette, and Folklore', 'Customs, Etiquette, and Folklore', NULL, 300);

-- Sections
INSERT INTO Sections (id, name, description, embedding, classId, divisionId) VALUES
(111, 'Ontology', 'Ontology', NULL, 100, 110),
(112, 'Methodology', 'Methodology', NULL, 100, 120),
(113, 'Dialectic', 'Dialectic', NULL, 100, 130),
(114, 'Space', 'Space', NULL, 100, 140),
(115, 'Time', 'Time', NULL, 100, 140),
(116, 'Causation', 'Causation', NULL, 100, 140),
(117, 'Comprehensive Works', 'Comprehensive Works', NULL, 100, 160),
(118, 'Ancient, Medieval, and Eastern', 'Ancient, Medieval, and Eastern', NULL, 100, 180),
(119, 'Modern', 'Modern', NULL, 100, 190),
(221, 'Old Testament', 'Old Testament', NULL, 200, 220),
(222, 'Historical Books of Old Testament', 'Historical Books of Old Testament', NULL, 200, 220),
(223, 'Poetic Books of Old Testament', 'Poetic Books of Old Testament', NULL, 200, 220),
(224, 'Prophetic Books of Old Testament', 'Prophetic Books of Old Testament', NULL, 200, 220),
(225, 'New Testament', 'New Testament', NULL, 200, 220),
(226, 'Gospels and Acts', 'Gospels and Acts', NULL, 200, 220),
(227, 'Epistles', 'Epistles', NULL, 200, 220),
(228, 'Revelation', 'Revelation', NULL, 200, 220),
(229, 'Apocrypha and Pseudepigrapha', 'Apocrypha and Pseudepigrapha', NULL, 200, 220),
(331, 'Labor Economics', 'Labor Economics', NULL, 300, 330),
(332, 'Financial Economics', 'Financial Economics', NULL, 300, 330),
(333, 'Economics of Land, Energy, and Environment', 'Economics of Land, Energy, and Environment', NULL, 300, 330),
(334, 'Cooperatives', 'Cooperatives', NULL, 300, 330),
(335, 'Socialism and Related Systems', 'Socialism and Related Systems', NULL, 300, 330),
(336, 'Public Finance', 'Public Finance', NULL, 300, 330),
(337, 'International Economics', 'International Economics', NULL, 300, 330),
(338, 'Production', 'Production', NULL, 300, 330),
(339, 'Macroeconomics and Related Topics', 'Macroeconomics and Related Topics', NULL, 300, 330);


-- Call Numbers; bottom leaf category - i.e. 123.45
INSERT INTO CallNumbers (sectionId, category, name, description, embedding, classId, divisionId)
VALUES
(111, 1, 'Ontology for Beginners', 'Introduction to ontology', NULL, 100, 110),
(112, 1, 'Epistemology 101', 'Introduction to epistemology', NULL, 100, 120),
(112, 2, 'Epistemology 201', 'Advanced epistemology concepts', NULL, 100, 120),
(113, 1, 'Dialectic 101', 'Introduction to dialectic', NULL, 100, 130),
(113, 2, 'Dialectic 201', 'Advanced dialectic concepts', NULL, 100, 130),
(114, 1, 'Space and Ethics', 'The ethical implications of space exploration', NULL, 100, 140),
(115, 1, 'Time and Philosophy', 'The philosophy of time', NULL, 100, 140),
(116, 1, 'Causation 101', 'Introduction to causation', NULL, 100, 140),
(117, 1, 'Comprehensive Works 1', 'Comprehensive Works 1', NULL, 100, 160),
(118, 1, 'Ancient, Medieval, and Eastern 1', 'Ancient, Medieval, and Eastern 1', NULL, 100, 180),
(119, 1, 'Modern 1', 'Modern 1', NULL, 100, 190),
(119, 2, 'Modern 2', 'Modern 2', NULL, 100, 190),
(221, 1, 'Old Testament 1', 'Old Testament 1', NULL, 200, 220),
(221, 2, 'Old Testament 2', 'Old Testament 2', NULL, 200, 220),
(222, 1, 'Historical Books 1', 'Historical Books 1', NULL, 200, 220),
(222, 2, 'Historical Books 2', 'Historical Books 2', NULL, 200, 220),
(223, 1, 'Poetic Books 1', 'Poetic Books 1', NULL, 200, 220),
(223, 2, 'Poetic Books 2', 'Poetic Books 2', NULL, 200, 220),
(224, 1, 'Prophetic Books 1', 'Prophetic Books 1', NULL, 200, 220),
(225, 1, 'New Testament 1', 'New Testament 1', NULL, 200, 220),
(226, 1, 'Gospels and Acts 1', 'Gospels and Acts 1', NULL, 200, 220),
(227, 1, 'Epistles 1', 'Epistles 1', NULL, 200, 220),
(227, 2, 'Epistles 2', 'Epistles 2', NULL, 200, 220),
(228, 1, 'Revelation 1', 'Revelation 1', NULL, 200, 220),
(229, 1, 'Apocrypha 1', 'Apocrypha 1', NULL, 200, 220),
(229, 2, 'Apocrypha 2', 'Apocrypha 2', NULL, 200, 220),
(331, 1, 'Labor Economics 1', 'Labor Economics 1', NULL, 300, 330),
(332, 1, 'Financial Economics 1', 'Financial Economics 1', NULL, 300, 330),
(332, 2, 'Financial Economics 2', 'Financial Economics 2', NULL, 300, 330),
(333, 1, 'Economics of Land 1', 'Economics of Land 1', NULL, 300, 330),
(334, 1, 'Cooperatives 1', 'Cooperatives 1', NULL, 300, 330),
(334, 2, 'Cooperatives 2', 'Cooperatives 2', NULL, 300, 330),
(335, 1, 'Socialism 1', 'Socialism 1', NULL, 300, 330),
(335, 2, 'Socialism 2', 'Socialism 2', NULL, 300, 330),
(336, 1, 'Public Finance 1', 'Public Finance 1', NULL, 300, 330),
(336, 2, 'Public Finance 2', 'Public Finance 2', NULL, 300, 330),
(337, 1, 'International Economics 1', 'International Economics 1', NULL, 300, 330),
(337, 2, 'International Economics 2', 'International Economics 2', NULL, 300, 330),
(338, 1, 'Production 1', 'Production 1', NULL, 300, 330),
(338, 2, 'Production 2', 'Production 2', NULL, 300, 330),
(339, 1, 'Macroeconomics 1', 'Macroeconomics 1', NULL, 300, 330),
(339, 2, 'Macroeconomics 2', 'Macroeconomics 2', NULL, 300, 330),
(111, 3, 'Ontology and Ethics', 'The ethical implications of ontology', NULL, 100, 110),
(116, 2, 'Causation 201', 'Advanced causation concepts', NULL, 100, 140),
(222, 3, 'Historical Books 3', 'Historical Books 3', NULL, 200, 220),
(223, 3, 'Poetic Books 3', 'Poetic Books 3', NULL, 200, 220),
(224, 2, 'Prophetic Books 2', 'Prophetic Books 2', NULL, 200, 220),
(225, 2, 'New Testament 2', 'New Testament 2', NULL, 200, 220),
(227, 3, 'Epistles 3', 'Epistles 3', NULL, 200, 220),
(228, 2, 'Revelation 2', 'Revelation 2', NULL, 200, 220),
(229, 3, 'Apocrypha 3', 'Apocrypha 3', NULL, 200, 220),
(331, 2, 'Labor Economics 2', 'Labor Economics 2', NULL, 300, 330),
(332, 3, 'Financial Economics 3', 'Financial Economics 3', NULL, 300, 330),
(333, 2, 'Economics of Land 2', 'Economics of Land 2', NULL, 300, 330),
(334, 3, 'Cooperatives 3', 'Cooperatives 3', NULL, 300, 330),
(335, 3, 'Socialism 3', 'Socialism 3', NULL, 300, 330),
(338, 3, 'Production 3', 'Production 3', NULL, 300, 330),
(339, 3, 'Macroeconomics 3', 'Macroeconomics 3', NULL, 300, 330);



select * from Classes;
select * from Divisions;
select * from Sections;
select * from CallNumbers;
