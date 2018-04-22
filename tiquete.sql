DROP DATABASE IF EXISTS GBD_tiquet;
CREATE DATABASE IF NOT EXISTS GBD_tiquet /*!40100 DEFAULT CHARACTER SET utf8 */;
USE GBD_tiquet;

DROP TABLE IF EXISTS tiquets;
CREATE TABLE IF NOT EXISTS tiquets(
  id_tiquet int(11) NOT NULL AUTO_INCREMENT,
  fecha_init DATETIME NOT NULL,
  fecha_end DATETIME,
  plate VARCHAR (25) NOT NULL,
  state boolean NOT NULL,
  e_emisor VARCHAR (25),
  PRIMARY KEY (id_tiquet)
);

DROP TABLE IF EXISTS aud_tiquets;
CREATE TABLE IF NOT EXISTS aud_tiquets(
  id_reg INT(11) NOT NULL AUTO_INCREMENT,
  id_tiquet INT(11) NOT NULL,
  date_change DATETIME NOT NULL,
  user VARCHAR(25) NOT NULL,
  descript VARCHAR (50) NOT NULL,
  ant_state boolean NOT NULL,
  new_state boolean NOT NULL,
  PRIMARY KEY (id_reg,id_tiquet)
);

INSERT INTO tiquets (fecha_init,plate,state,e_emisor) VALUES (
  (SELECT NOW()),'ABC123',false,'E001'
);

--defino usuarios.
CREATE USER 'E001'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'tpa'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'userP'@'localhost' IDENTIFIED BY '1234';

--permisos usuario TPA

GRANT SELECT ON GBD_tiquet.tiquets TO 'tpa'@'localhost';
GRANT UPDATE ON GBD_tiquet.tiquets TO 'tpa'@'localhost';

--permisos usuario entrada

GRANT INSERT ON GBD_tiquet.tiquets TO 'E001'@'localhost';

--permisos userP

GRANT SELECT ON GBD_tiquet.tiquets TO 'userP'@'localhost';
GRANT UPDATE ON GBD_tiquet.tiquets TO 'userP'@'localhost';
GRANT INSERT ON GBD_tiquet.tiquets TO 'userP'@'localhost';
