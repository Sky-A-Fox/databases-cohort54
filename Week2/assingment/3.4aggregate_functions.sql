SELECT 
    rp.paper_title,
    COUNT(ap.author_id) AS author_count
FROM research_papers rp
LEFT JOIN author_papers ap ON rp.paper_id = ap.paper_id
GROUP BY rp.paper_id, rp.paper_title;


SELECT COUNT(*) AS women_papers
FROM author_papers ap
JOIN authors a ON ap.author_id = a.author_id
WHERE a.gender = 'F';


SELECT 
    university,
    AVG(h_index) AS avg_h_index
FROM authors
GROUP BY university;


SELECT
    a.university,
    COUNT(ap.paper_id) AS paper_count
FROM authors a
LEFT JOIN author_papers ap ON a.author_id = ap.author_id
GROUP BY a.university;


SELECT
    university,
    MIN(h_index) AS min_h_index,
    MAX(h_index) AS max_h_index
FROM authors
GROUP BY university;
