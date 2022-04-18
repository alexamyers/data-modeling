CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    email TEXT NOT NULL, 
    passward TEXT NOT NULL, 
    info TEXT NOT NULL
);

CREATE TABLE posts(
    post_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    content TEXT NOT NULL
);

CREATE TABLE groups(
    group_id SERIAL PRIMARY KEY, 
    post_id INT NOT NULL REFERENCES posts(post_id),
    group_info TEXT NOT NULL, 
    content TEXT NOT NULL
);

CREATE TABLE comments(
    comment_id SERIAL PRIMARY KEY, 
    user_id INT NOT NULL REFERENCES users(user_id),
    content TEXT NOT NULL
);

CREATE TABLE share(
    share_id SERIAL PRIMARY KEY, 
    user_id INT NOT NULL REFERENCES users(user_id),
    post_id INT NOT NULL REFERENCES posts(post_id)
);

CREATE TABLE groups_users_join(
    id SERIAL PRIMARY KEY, 
    user_id INT NOT NULL REFERENCES users(user_id),
    group_id INT NOT NULL REFERENCES groups(group_id)
);

CREATE TABLE comments_posts_join(
    id SERIAL PRIMARY KEY, 
    comment_id INT NOT NULL REFERENCES comments(comment_id),
    post_id INT NOT NULL REFERENCES posts(post_id)
);

CREATE TABLE recipes(
    recipe_id SERIAL PRIMARY KEY, 
    user_id INT NOT NULL REFERENCES users(user_id),
    post_id INT NOT NULL REFERENCES posts(post_id),
    prep_time INT NOT NULL, 
    cook_time INT NOT NULL, 
    instructions TEXT NOT NULL
);

CREATE TABLE ingredients(
    ingredients_id SERIAL PRIMARY KEY, 
    protein TEXT NOT NULL, 
    fat TEXT NOT NULL, 
    carbs TEXT NOT NULL, 
    herb_spice TEXT NOT NULL
);

CREATE TABLE recipes_ingredients_join(
    id SERIAL PRIMARY KEY, 
    recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
    ingredients_id INT NOT NULL REFERENCES ingredients(ingredients_id)
);

CREATE TABLE grocery_list(
    grocery_id SERIAL PRIMARY KEY, 
    ingredients_id INT NOT NULL REFERENCES ingredients(ingredients_id), 
    protein TEXT NOT NULL, 
    fat TEXT NOT NULL, 
    carbs TEXT NOT NULL, 
    herb_spice TEXT NOT NULL
);

CREATE TABLE occasions(
    occasion_id SERIAL PRIMARY KEY, 
    holiday TEXT NOT NULL, 
    special_occasion TEXT NOT NULL
);

CREATE TABLE kitchen_items(
    items_id SERIAL PRIMARY KEY, 
    cookware TEXT NOT NULL, 
    utensil TEXT NOT NULL, 
    other_item TEXT NOT NULL
);

CREATE TABLE  recipes_kitchen_items_join(
    id SERIAL PRIMARY KEY, 
    recipe_id INT NOT NULL REFERENCES recipes(recipe_id), 
    items_id INT NOT NULL REFERENCES kitchen_items(items_id)
);

CREATE TABLE recipes_occasions_join(
    id SERIAL PRIMARY KEY, 
    recipes_id INT NOT NULL REFERENCES recipes(recipe_id),
    occasions_id INT NOT NULL REFERENCES occasions(occasion_id)
);