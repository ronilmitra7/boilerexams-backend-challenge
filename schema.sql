CREATE TABLE apple_trees (
    id SERIAL PRIMARY KEY,
    parent_tree_id INT REFERENCES apple_trees(id)
);

CREATE TABLE apples (
    id SERIAL PRIMARY KEY,
    tree_id INT REFERENCES apple_trees(id)
);