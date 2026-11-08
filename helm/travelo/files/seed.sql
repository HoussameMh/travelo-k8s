INSERT IGNORE INTO flight
  (id_flight, departure_city, departure_airport, arrival_city, arrival_airport, date, departure_time, arrival_time, company, price)
VALUES
  (1, 'Rabat',    'RBA', 'Grenoble', 'GNB', '2026-11-20', '07:30:00', '10:20:00', 'Royal Air Maroc', 1290.00),
  (2, 'Rabat',    'RBA', 'Grenoble', 'GNB', '2026-11-20', '12:15:00', '15:05:00', 'Air Arabia',       980.00),
  (3, 'Rabat',    'RBA', 'Grenoble', 'GNB', '2026-11-20', '18:40:00', '21:30:00', 'Transavia',       1150.00),
  (4, 'Rabat',    'RBA', 'Grenoble', 'GNB', '2026-11-22', '09:00:00', '11:50:00', 'Royal Air Maroc', 1340.00),
  (5, 'Grenoble', 'GNB', 'Rabat',    'RBA', '2026-11-27', '11:00:00', '13:50:00', 'Royal Air Maroc', 1310.00),
  (6, 'Grenoble', 'GNB', 'Rabat',    'RBA', '2026-11-27', '16:30:00', '19:20:00', 'Air Arabia',       950.00);

INSERT IGNORE INTO seats (id, id_flight) VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6);
UPDATE seats SET
  a1='empty', b1='empty', c1='empty', d1='empty',
  a2='empty', b2='empty', c2='empty', d2='empty',
  a3='empty', b3='empty', c3='empty', d3='empty',
  a4='empty', b4='empty', c4='empty', d4='empty',
  a5='empty', b5='empty', c5='empty', d5='empty',
  a6='empty', b6='empty', c6='empty', d6='empty',
  a7='empty', b7='empty', c7='empty', d7='empty',
  a8='empty', b8='empty', c8='empty', d8='empty',
  a9='empty', b9='empty', c9='empty', d9='empty'
WHERE a1 IS NULL;
