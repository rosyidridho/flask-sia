CREATE VIEW form_prodi
AS
SELECT tb_prodi.prodi_1, tb_prodi.prodi_2, tb_prodi.fklts_1, tb_fakultas.fklts_2, tb_prodi.prodi_3
FROM tb_prodi inner join tb_fakultas ON tb_prodi.fklts_1=tb_fakultas.fklts_1;

CREATE VIEW form_mhs
AS
SELECT tb_mhs.mhs_1, tb_mhs.mhs_2, tb_mhs.mhs_3, tb_fakultas.fklts_2, tb_mhs.prodi_1, tb_prodi.prodi_2, tb_mhs.mhs_4, tb_mhs.mhs_5, tb_mhs.mhs_6, tb_mhs.mhs_8
FROM tb_mhs inner join tb_prodi ON tb_mhs.prodi_1=tb_prodi.prodi_1
INNER JOIN tb_fakultas ON tb_prodi.fklts_1=tb_fakultas.fklts_1;

CREATE VIEW fklts_prodi
AS
SELECT tb_prodi.prodi_1, tb_fakultas.fklts_2, tb_prodi.prodi_2
FROM tb_prodi INNER JOIN tb_fakultas ON tb_prodi.fklts_1=tb_fakultas.fklts_1;

CREATE VIEW form_makul
AS
SELECT tb_makul.mkl_1, tb_makul.mkl_2, tb_fakultas.fklts_1, tb_fakultas.fklts_2, tb_makul.prodi_1, tb_prodi.prodi_2, tb_makul.mkl_3, tb_makul.mkl_4, tb_makul.mkl_5
FROM tb_makul INNER JOIN tb_prodi ON tb_makul.prodi_1=tb_prodi.prodi_1
INNER JOIN tb_fakultas ON tb_prodi.fklts_1=tb_fakultas.fklts_1;

CREATE VIEW form_kelas
AS
SELECT tb_kelas.kls_1, tb_kelas.kls_2, tb_kelas.mkl_1, tb_makul.mkl_2, tb_prodi.prodi_2, tb_kelas.kls_3, tb_kelas.kls_4, tb_kelas.kls_6
FROM tb_kelas INNER JOIN tb_makul ON tb_kelas.mkl_1=tb_makul.mkl_1
INNER JOIN tb_prodi ON tb_makul.prodi_1=tb_prodi.prodi_1;

CREATE VIEW prodi_makul
AS
SELECT tb_makul.mkl_1, tb_prodi.prodi_2, tb_makul.mkl_2
FROM tb_makul INNER JOIN tb_prodi ON tb_makul.prodi_1=tb_prodi.prodi_1;

CREATE VIEW kelas_dosen
AS
SELECT tb_pengampu.ampu_1, tb_kelas.kls_2, tb_makul.mkl_2, tb_prodi.prodi_2, tb_makul.mkl_3, tb_makul.mkl_4, tb_kelas.kls_3, tb_kelas.kls_4, tb_pengampu.dsn_1, tb_pengampu.kls_1
FROM  tb_pengampu INNER JOIN tb_kelas ON tb_pengampu.kls_1=tb_kelas.kls_1
INNER JOIN tb_makul ON tb_kelas.mkl_1=tb_makul.mkl_1
INNER JOIN tb_prodi ON tb_makul.prodi_1=tb_prodi.prodi_1;

CREATE VIEW tambah_kelas #dosen page
AS
SELECT tb_kelas.kls_1, tb_kelas.kls_2, tb_makul.mkl_2, tb_prodi.prodi_2, tb_makul.mkl_3, tb_makul.mkl_4, tb_kelas.kls_3, tb_kelas.kls_4, tb_kelas.kls_6
FROM tb_kelas INNER JOIN tb_makul ON tb_kelas.mkl_1=tb_makul.mkl_1
INNER JOIN tb_prodi ON tb_makul.prodi_1=tb_prodi.prodi_1;

CREATE VIEW add_krs #mhs page
AS
SELECT tb_kelas.kls_1, tb_kelas.kls_2, tb_makul.mkl_2, tb_dosen.dsn_3, tb_makul.mkl_3, tb_makul.mkl_4, tb_kelas.kls_3, tb_kelas.kls_4, tb_kelas.kls_6, tb_prodi.prodi_1
FROM tb_kelas INNER JOIN tb_makul ON tb_kelas.mkl_1=tb_makul.mkl_1
INNER JOIN tb_prodi ON tb_makul.prodi_1=tb_prodi.prodi_1
INNER JOIN tb_dosen WHERE tb_kelas.kls_6 = tb_dosen.dsn_1;

CREATE VIEW krs
AS
SELECT tb_ambil_kls.abl_kls_1, tb_makul.mkl_2, tb_dosen.dsn_3, tb_kelas.kls_2, tb_makul.mkl_3, tb_makul.mkl_4, tb_ambil_kls.mhs_1, tb_kelas.kls_1, tb_ambil_kls.abl_kls_2, tb_ambil_kls.abl_kls_3
FROM tb_ambil_kls INNER JOIN tb_kelas ON tb_ambil_kls.kls_1=tb_kelas.kls_1
INNER JOIN tb_makul ON tb_kelas.mkl_1=tb_makul.mkl_1
INNER JOIN tb_dosen ON tb_kelas.kls_6=tb_dosen.dsn_1;

CREATE VIEW khs
AS
SELECT tb_nilai.nil_1, tb_makul.mkl_1, tb_makul.mkl_2, tb_makul.mkl_3, tb_makul.mkl_4, tb_kelas.kls_2, tb_nilai.nil_4, tb_nilai.nil_2, tb_nilai.nil_3, tb_nilai.nil_5, tb_nilai.nil_6, tb_nilai.nil_7, tb_nilai.nil_9, tb_nilai.nil_8, tb_ambil_kls.mhs_1, tb_ambil_kls.abl_kls_2, tb_ambil_kls.abl_kls_3
FROM tb_nilai INNER JOIN tb_ambil_kls ON tb_nilai.abl_kls_1=tb_ambil_kls.abl_kls_1
INNER JOIN tb_kelas ON tb_ambil_kls.kls_1=tb_kelas.kls_1
INNER JOIN tb_makul ON tb_kelas.mkl_1=tb_makul.mkl_1;

CREATE VIEW pilih_kelas
AS
SELECT tb_pengampu.dsn_1, tb_kelas.kls_2, tb_makul.mkl_2, tb_prodi.prodi_2, tb_kelas.kls_1, tb_makul.mkl_3, tb_makul.mkl_4
FROM tb_pengampu INNER JOIN tb_kelas ON tb_pengampu.kls_1=tb_kelas.kls_1
INNER JOIN tb_makul ON tb_kelas.mkl_1=tb_makul.mkl_1
INNER JOIN tb_prodi ON tb_makul.prodi_1=tb_prodi.prodi_1 order by tb_makul.mkl_2;

CREATE VIEW input_nilai
AS
SELECT tb_mhs.mhs_2, tb_mhs.mhs_3, tb_nilai.nil_4, tb_nilai.nil_2, tb_nilai.nil_3, tb_nilai.nil_5, tb_nilai.nil_6, tb_nilai.nil_7, tb_nilai.nil_9, tb_nilai.nil_8, tb_nilai.nil_1, tb_ambil_kls.mhs_1, tb_ambil_kls.kls_1, tb_ambil_kls.abl_kls_2, tb_ambil_kls.abl_kls_3
FROM tb_nilai INNER JOIN tb_ambil_kls ON tb_nilai.abl_kls_1=tb_ambil_kls.abl_kls_1
INNER JOIN tb_mhs ON tb_ambil_kls.mhs_1=tb_mhs.mhs_1;

CREATE VIEW profil_mhs
AS
SELECT tb_mhs.mhs_1, tb_mhs.mhs_2, tb_mhs.mhs_3, tb_fakultas.fklts_2, tb_prodi.prodi_2, tb_mhs.mhs_4, tb_mhs.mhs_5, tb_mhs.mhs_6, tb_mhs.mhs_7
from tb_mhs INNER JOIN tb_prodi ON tb_mhs.prodi_1=tb_prodi.prodi_1
INNER JOIN tb_fakultas ON tb_prodi.fklts_1=tb_fakultas.fklts_1
