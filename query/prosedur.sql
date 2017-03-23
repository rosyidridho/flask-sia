DELIMITER //
CREATE PROCEDURE delete_mhs_usr (IN id_mhs INT)
BEGIN
DECLARE id_user int;
SELECT tb_user.usr_1 INTO id_user FROM tb_user WHERE usr_6=id_mhs AND usr_4=2;
DELETE FROM tb_user WHERE usr_1=id_user;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE delete_dsn_usr (IN id_dosen INT)
BEGIN
DECLARE id_user int;
SELECT tb_user.usr_1 INTO id_user FROM tb_user WHERE usr_6=id_dosen AND usr_4=3;
DELETE FROM tb_user WHERE usr_1=id_user;
END//
DELIMITER;

DELIMITER //
CREATE TRIGGER after_ins_tb_ambil_kls
AFTER INSERT ON tb_ambil_kls
FOR EACH ROW
BEGIN
	UPDATE tb_kelas SET kls_4=(kls_4-1) WHERE kls_1=new.kls_1;
    INSERT INTO tb_nilai (abl_kls_1, nil_2, nil_3, nil_4, nil_5, nil_6, nil_7, nil_8, nil_9) VALUES (new.abl_kls_1, 0, 0, 0, 0, "0", "0", 0, "0");
END//
DELIMITER;
