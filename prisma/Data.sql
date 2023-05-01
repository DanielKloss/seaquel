INSERT INTO studio_scene ("id", "name", "scene_number") VALUES (1, "SHIT", 101);
INSERT INTO studio_scene ("id", "name", "scene_number") VALUES (2, "FUCK", 201);

INSERT INTO scene ("id", "name", "location", "context") VALUES (1, 'Sci Fi', 'Wing Sitting Room', 'Aliens have invaded. The invasion has been raging for years. Humanity are on the brink of defeat. Only decrypting the alien language will allow   humanity to make a plan to stop the invasion. Once you have cracked the code, record your actors reading the script below');
INSERT INTO role ("id", "name") VALUES (1, 'Scientist');
INSERT INTO role ("id", "name") VALUES (2, 'Alpha Man');
INSERT INTO scene_role ("scene_id", "role_id", "line") VALUES (1, 1, 'Ive got it! The message reads [INSERT MESSAGE HERE]');
INSERT INTO scene_role ("scene_id", "role_id", "line") VALUES (1, 2, 'Finally, the poindexters have got it. Give me that message, Ive got a world to save...');