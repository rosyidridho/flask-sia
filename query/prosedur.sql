DELIMITER //
CREATE PROCEDURE delete_mhs_usr (IN id_mhs INT)
BEGIN
DECLARE id_user int;
SELECT tb_mhs.usr_1 INTO id_user FROM tb_mhs WHERE mhs_1=id_mhs;
DELETE FROM tb_user WHERE usr_1=id_user;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE delete_dsn_usr (IN id_dosen INT)
BEGIN
DECLARE id_user int;
SELECT tb_dosen.usr_1 INTO id_user FROM tb_dosen WHERE dsn_1=id_dosen;
DELETE FROM tb_user WHERE usr_1=id_user;
END//
DELIMITER;
