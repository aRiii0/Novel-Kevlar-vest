ALTER TABLE users
ADD armour int NOT NULL DEFAULT(0)

INSERT INTO `items` (`name`, `label`) VALUES
	('kevlar', 'Kevlar'),
	('kevlar_m', 'kevlar_m'),
	('kevlar_s', 'kevlar_s'),
	('kevlar_p', 'kevlar_p')
;
