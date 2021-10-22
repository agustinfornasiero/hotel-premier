--Inserts Tabla pais
INSERT INTO pais (nombre)
VALUES
	('Argentina'),
	('Bolivia'),
	('Brasil'),
	('Chile'),
	('Ecuador'),
	('Perú'),
	('Uruguay'),
	('Paraguay');

--Inserts Tabla provincia
INSERT INTO provincia (nombre, id_pais)
VALUES
	('Buenos Aires',1),
	('Catamarca',1),
	('Chaco',1),
	('Chubut',1),
	('Córdoba',1),
	('Corrientes',1),
	('Entre Ríos',1),
	('Formosa',1),
	('Jujuy',1),
	('La Pampa',1),
	('La Rioja',1),
	('Mendoza',1),
	('Misiones',1),
	('Neuquén',1),
	('Río Negro',1),
	('Salta',1),
	('San Juan',1),
	('San Luis',1),
	('Santa Cruz',1),
	('Santa Fe',1),
	('Santiago del Estero',1),
	('Tierra del Fuego',1),
	('Tucumán',1),
	('Arica',4),
	('Santiago',4);

--Inserts tabla localidad
INSERT INTO localidad (nombre, codigo_postal, id_provincia)
VALUES
	('Santiago','8320000',25),
	('San Marcos de Arica','1000000',24),
	('22 de Mayo', '2124', 20),
	('4 de Febrero', '2732', 20),
	('Acebal', '2109', 20),
	('Adolfo Alsina', '2109', 20),
	('Aguara Grande', '3071', 20),
	('Aldao', '2214', 20),
	('Alvarez', '2107', 20),
	('Ambrosetti', '2352', 20),
	('Arequito', '2183', 20),
	('Arroyo Seco', '2128', 20),
	('Esperanza', '3080', 20),
	('Santo Tomé', '3016', 20),
	('San Carlos Centro', '3016', 20),
	('San Carlos Norte', '3009', 20),
	('San Carlos Sud', '3013', 20),
	('San Carlos', '6106', 20),
	('Galvez', '2252', 20),
	('Gobernador Crespo', '3044', 20),
	('Rosario', '2000', 20),
	('Santa Fe', '3000', 20),
	('1 de Mayo', '3263', 7),
	('Achiras', '3246', 7),
	('Aldea San Juan', '2826', 7),
	('Aldea San Rafael', '3116', 7),
	('Aldea Santafecina', '3103', 7),
	('Aldea Santa María', '3150', 7),
	('Aldea Protestante', '3101', 7),
	('Aldea María Luisa', '3114', 7),
	('Aranguren', '3162', 7),
	('Camps', '3150', 7),
	('Carrizal', '3101', 7),
	('Cerrito', '3122', 7),
	('Chajarí', '3228', 7),
	('Libertador San Martín', '3103', 7),
	('Villaguay', '3240', 7),
	('Crespo', '3116', 7),
	('General Ramírez', '3164', 7),
	('Paraná', '3100', 7),
	('Tupungato', '5561', 12),
	('Lujan de Cuyo', '5507', 12),
	('Godoy Cruz', '5501', 12),
	('Mendoza', '5500', 12),
	('San Carlos', '5212', 5),
	('Villa Carlos Paz', '5112', 5),
	('Santa Rosa de Calamuchita', '5196', 5),
	('Córdoba', '5000', 5),
	('Malvinas Argentinas', '1846', 1),
	('Banfield', '1828', 1),
	('Alamos', '6437', 1),
	('Hurlingham', '1686', 1),
	('Vicente Lopez', '1638', 1),
	('La Plata', '1900', 1),
	('Achalco', '4235', 2),
	('Aconquija', '4740', 2),
	('Adolfo E Carranza', '5263', 2),
	('Balungasta', '5340', 2),
	('Chiflón', '4718', 2),
	('Choya', '4741', 2),
	('San Fernando del Valle de Catamarca', '4700', 2); 

-- Inserts Tabla tipo_documento
INSERT INTO tipo_documento (nombre)
VALUES
	('Libreta Civica'),
	('Lib. de Enrolamiento'),
	('Pasaporte'),
	('Cedula de identidad'),
	('DNI');

--Inserts en Tabla posicion_frente_iva
INSERT INTO posicion_frente_iva (nombre)
VALUES
	('Monotributista'),
	('Responsable Inscripto'),
	('Excento'),
	('Consumidor Final');

-- Insert en Tabla profesion
INSERT INTO profesion (nombre)
VALUES
	('Abogado'),
	('Escribano'),
	('Doctor'),
	('Veterinario'),
	('Ingeniero'),
	('Profesor'),
	('Bioquímico'),
	('Dentista'),
	('Programador'),
	('Carpintero'),
	('Cerrajero'),
	('Mecánico'),
	('Plomero'),
	('Escritor'),
	('Periodista'),
	('Locutor');