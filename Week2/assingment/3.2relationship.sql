CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255),
    university VARCHAR(255),
    date_of_birth DATE,
    h_index INT,
    gender VARCHAR(20),
    mentor INT,
    CONSTRAINT fk_author_mentor
        FOREIGN KEY (mentor) REFERENCES authors(author_id)
);


CREATE TABLE research_papers (
    paper_id INT PRIMARY KEY,
    paper_title VARCHAR(255),
    conference VARCHAR(255),
    publish_date DATE
);

CREATE TABLE author_papers (
    author_id INT,
    paper_id INT,
    PRIMARY KEY (author_id, paper_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (paper_id) REFERENCES research_papers(paper_id)
);

INSERT INTO authors (author_id, author_name, university, date_of_birth, h_index, gender, mentor) VALUES
(1, 'Alice Johnson', 'MIT', '1980-05-12', 40, 'F', NULL),
(2, 'Bob Smith', 'Harvard', '1975-09-22', 55, 'M', 1),
(3, 'Clara Lee', 'Stanford', '1988-03-10', 32, 'F', 1),
(4, 'David Brown', 'Oxford', '1982-12-01', 29, 'M', 2),
(5, 'Eva Green', 'Cambridge', '1990-07-16', 27, 'F', 3),
(6, 'Frank Moore', 'ETH Zurich', '1979-11-05', 48, 'M', 2),
(7, 'Grace Kim', 'Seoul University', '1987-04-21', 35, 'F', 3),
(8, 'Henry Wilson', 'TU Delft', '1983-06-14', 38, 'M', 1),
(9, 'Isabella Garcia', 'UPenn', '1992-08-13', 20, 'F', 5),
(10,'Jack Miller', 'Carnegie Mellon', '1986-01-19', 30, 'M', 6),
(11,'Karen Adams', 'UCLA', '1984-02-28', 42, 'F', 2),
(12,'Leo Turner', 'Toronto University', '1991-09-30', 25, 'M', 7),
(13,'Mia Scott', 'NYU', '1985-10-25', 39, 'F', 11),
(14,'Noah Bennett', 'Columbia', '1989-12-12', 33, 'M', 3),
(15,'Olivia Clark', 'Princeton', '1993-03-09', 18, 'F', 5);

INSERT INTO research_papers (paper_id, paper_title, conference, publish_date) VALUES
(1, 'Deep Learning in Robotics', 'ICRA', '2020-05-10'),
(2, 'Quantum Computing Advances', 'QIP', '2021-01-15'),
(3, 'Neural Networks Optimization', 'NeurIPS', '2019-12-05'),
(4, 'AI in Healthcare', 'AAAI', '2020-02-10'),
(5, 'Reinforcement Learning Methods', 'ICML', '2021-07-18'),
(6, 'Graph Neural Networks', 'ICLR', '2022-04-25'),
(7, 'Computer Vision Trends', 'CVPR', '2018-06-22'),
(8, 'Natural Language Processing Models', 'ACL', '2022-05-13'),
(9, 'Autonomous Systems', 'RSS', '2019-06-10'),
(10,'Distributed Machine Learning', 'KDD', '2020-08-24'),
(11,'Brain-Inspired Computing', 'CogSci', '2018-07-18'),
(12,'Ethics in AI', 'AIES', '2021-03-12'),
(13,'Robotics Path Planning', 'ICRA', '2022-05-11'),
(14,'Federated Learning', 'NeurIPS', '2021-12-03'),
(15,'Sparse Neural Nets', 'ICML', '2020-07-20'),
(16,'Speech Recognition Models', 'INTERSPEECH', '2019-09-15'),
(17,'Cryptography with AI', 'Crypto', '2022-08-07'),
(18,'Machine Learning Security', 'USENIX', '2021-08-02'),
(19,'Vision Transformers', 'CVPR', '2021-06-15'),
(20,'Probabilistic Models', 'UAI', '2020-07-30'),
(21,'Bio-informatics and ML', 'ISMB', '2022-07-12'),
(22,'Large-Scale Datasets', 'BigData', '2019-12-20'),
(23,'AI for Climate Science', 'AGU', '2021-12-10'),
(24,'Neuroscience + AI', 'COSYNE', '2020-03-05'),
(25,'Robust ML Models', 'ICML', '2022-07-25'),
(26,'Explainable AI', 'IJCAI', '2020-07-12'),
(27,'GANs Advances', 'ECCV', '2018-10-08'),
(28,'Meta Learning', 'ICLR', '2019-04-10'),
(29,'Hybrid Quantum AI', 'QIP', '2022-01-22'),
(30,'AI-Driven Optimization', 'GECCO', '2020-07-11');

INSERT INTO author_papers (author_id, paper_id) VALUES
(1,1),(1,3),(1,10),
(2,2),(2,14),(2,18),
(3,3),(3,6),(3,25),
(4,4),(4,11),
(5,5),(5,21),
(6,6),(6,18),(6,29),
(7,7),(7,8),
(8,9),(8,20),
(9,12),(9,23),
(10,10),(10,24),
(11,11),(11,14),(11,26),
(12,13),(12,28),
(13,15),(13,19),
(14,16),(14,27),
(15,17),(15,30);
