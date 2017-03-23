CREATE TABLE tb_user(
usr_1 int auto_increment primary key,
usr_2 varchar(30) UNIQUE,
usr_3 varchar(100),
usr_4 int,
usr_5 int,
usr_6 datetime
);

create table tb_fakultas(
fklts_1 int auto_increment primary key,
fklts_2 varchar(50),
fklts_3 datetime
);

create table tb_prodi(
prodi_1 int auto_increment primary key,
fklts_1 int,
prodi_2 varchar(50),
prodi_3 datetime,
foreign key (fklts_1) references tb_fakultas(fklts_1) on delete cascade on update cascade
);

create table tb_mhs(
mhs_1 int auto_increment primary key,
mhs_2 varchar(30),
mhs_3 varchar(100),
prodi_1 int,
mhs_4 varchar(30),
mhs_5 date,
mhs_6 varchar(200),
mhs_7 varchar(100),
mhs_8 datetime,
usr_1 int,
foreign key (prodi_1) references tb_prodi(prodi_1) on delete cascade on update cascade,
foreign key (usr_1) references tb_user(usr_1) on delete cascade on update cascade
);

create table tb_dosen(
dsn_1 int auto_increment primary key,
dsn_2 varchar(30),
dsn_3 varchar(100),
dsn_4 varchar(30),
dsn_5 date,
dsn_6 varchar(200),
dsn_7 varchar(100),
dsn_8 datetime,
usr_1 int,
foreign key (usr_1) references tb_user(usr_1) on delete cascade on update cascade
);

create table tb_makul(
mkl_1 int auto_increment primary key,
prodi_1 int,
mkl_2 varchar(100),
mkl_3 int,
mkl_4 varchar(10),
mkl_5 datetime,
foreign key (prodi_1) references tb_prodi(prodi_1) on delete cascade on update cascade
);

create table tb_kelas(
kls_1 int auto_increment primary key,
kls_2 varchar(20),
mkl_1 int,
kls_3 int,
kls_4 int,
kls_5 datetime,
kls_6 int,
foreign key (mkl_1) references tb_makul(mkl_1) on delete cascade on update  cascade
);

create table tb_pengampu(
ampu_1 int auto_increment primary key,
dsn_1 int,
kls_1 int,
ampu_2 datetime,
foreign key (dsn_1) references tb_dosen(dsn_1) on delete cascade on update cascade,
foreign key (kls_1) references tb_kelas(kls_1) on delete cascade on update cascade
);

create table tb_ambil_kls(
abl_kls_1 int auto_increment primary key,
mhs_1 int,
kls_1 int,
abl_kls_2 varchar(10),
abl_kls_3 varchar(10),
abl_kls_4 datetime,
foreign key (mhs_1) references tb_mhs(mhs_1) on delete cascade on update cascade,
foreign key (kls_1) references tb_kelas(kls_1) on delete cascade on update cascade
);

create table tb_nilai(
nil_1 int auto_increment primary key,
abl_kls_1 int,
nil_2 int,
nil_3 int,
nil_4 int,
nil_5 int,
nil_6 varchar(10),
nil_7 varchar(5),
nil_8 int,
nil_9 varchar(5),
foreign key (abl_kls_1) references tb_ambil_kls(abl_kls_1) on delete cascade on update cascade
);

create table tb_setting(
set_1 int auto_increment primary key,
set_2 varchar(100),
set_3 varchar(10),
set_4 varchar(10),
set_5 int,
set_6 datetime,
set_7 varchar(150),
set_8 int
)
