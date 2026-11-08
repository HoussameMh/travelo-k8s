SELECT @@hostname AS serveur_ecriture;
CREATE DATABASE IF NOT EXISTS travelo_db;
CREATE TABLE IF NOT EXISTS travelo_db.flight (id_flight INT PRIMARY KEY, departure_city VARCHAR(40), arrival_city VARCHAR(40), company VARCHAR(40));
INSERT IGNORE INTO travelo_db.flight VALUES (1, 'Rabat', 'Grenoble', 'Royal Air Maroc'), (2, 'Grenoble', 'Rabat', 'Air Arabia');
