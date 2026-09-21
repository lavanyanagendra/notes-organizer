-- Notes Organizer System - Analytical Queries

-- QUERY 1: Most popular notes by views and shares
SELECT
    n.title,
    n.subject,
    n.tag,
    n.views,
    COUNT(ns.share_id) AS shares,
    u.name AS author
FROM notes n
JOIN nb_users u ON n.user_id = u.user_id
LEFT JOIN note_shares ns ON n.note_id = ns.note_id
GROUP BY n.note_id, n.title, n.subject, n.tag, n.views, u.name
ORDER BY n.views DESC
LIMIT 20;

-- QUERY 2: Subject-wise doubt resolution rate
SELECT
    subject,
    COUNT(*) AS total_doubts,
    SUM(CASE WHEN status = 'Answered' THEN 1 ELSE 0 END) AS answered,
    ROUND(100.0 * SUM(CASE WHEN status = 'Answered' THEN 1 ELSE 0 END) / COUNT(*), 2) AS resolution_pct,
    ROUND(AVG(CASE WHEN status = 'Answered' THEN DATEDIFF(answered_on, asked_on) END), 2) AS avg_response_days
FROM doubts
GROUP BY subject
ORDER BY resolution_pct DESC;

-- QUERY 3: Most active note creators
SELECT
    u.dept,
    u.name,
    COUNT(n.note_id) AS notes_created,
    SUM(n.views) AS total_views,
    SUM(n.is_shared) AS shared_notes
FROM nb_users u
JOIN notes n ON u.user_id = n.user_id
GROUP BY u.user_id, u.dept, u.name
ORDER BY notes_created DESC
LIMIT 20;

-- QUERY 4: Tag distribution and popularity
SELECT
    tag,
    COUNT(*) AS notes,
    SUM(views) AS total_views,
    ROUND(AVG(views), 2) AS avg_views
FROM notes
GROUP BY tag
ORDER BY total_views DESC;
