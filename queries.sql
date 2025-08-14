SELECT tree_id, COUNT(*) AS apple_count
FROM apples
GROUP BY tree_id
ORDER BY apple_count DESC
LIMIT 1;

SELECT tree_id, COUNT(*) AS apple_count
FROM apples
GROUP BY tree_id
ORDER BY apple_count DESC;

WITH RECURSIVE tree_chain AS (
    SELECT id, parent_tree_id, 1 AS DEPTH
    FROM apple_trees
    WHERE parent_tree_id IS NULL

    UNION ALL

    SELECT t.id, at.parent_tree_id, tc.depth + 1
    FROM apple_trees t
    INNER JOIN tree_chain tc ON t.parent_tree_id = tc.id
)

SELECT MAX(depth) AS longest_chain
FROM tree_chain;