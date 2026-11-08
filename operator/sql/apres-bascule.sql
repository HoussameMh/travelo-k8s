SELECT @@hostname AS nouveau_primary;
INSERT IGNORE INTO travelo_db.flight VALUES (3, 'Rabat', 'Grenoble', 'Transavia');
SELECT * FROM travelo_db.flight;
