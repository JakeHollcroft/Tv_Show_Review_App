-- Challenge 1
SELECT 
    title, 
    rating 
FROM series
JOIN reviews 
    ON series.id = reviews.series_id;
    
-- Challenge 2 AVG rating
SELECT 
    title,
    AVG(rating) AS avg_rating
FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating asc;

-- Challenge 3 
SELECT
    first_name,
    last_name,
    rating 
FROM reviewers
JOIN reviews
    ON reviewers.id = reviews.reviewer_id;
    
-- Challenge 4 unreviewed series
SELECT
    title AS unreviewed_series
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
WHERE rating IS NULL;
    
-- Challenge 5 AVG rating per genre
SELECT
    genre,
    ROUND(AVG(rating),2) AS avg_rating
FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY genre;

-- Challenge 6 analytics
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0), 2) AS AVGERAGE,
    IF(COUNT(rating) >=1, 'ACTIVE', 'INACTIVE') AS STATUS
FROM reviewers
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

-- Challenge 7 - all 3 tables
SELECT 
    title,
    rating,
    CONCAT(first_name, " ", last_name) AS reviewer
FROM reviewers
JOIN reviews 
    ON reviewers.id = reviews.reviewer_id
JOIN series
    ON series.id = reviews.series_id
ORDER BY title;



    