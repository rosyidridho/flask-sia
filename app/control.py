from config import *

aktiv = 1

def nm_univ():
    univ = ""
    cursor = koneksi.cursor()
    query = """SELECT set_2 FROM tb_setting WHERE set_5=%s""" % (aktiv)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    for d in data:
        univ = d[0]
    return univ

def thn_ajaran():
    thn = ""
    cursor = koneksi.cursor()
    query = """SELECT set_3 FROM tb_setting WHERE set_5=%s""" % (aktiv)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    for d in data:
        thn = d[0]
    return thn

def smstr():
    sem = ""
    cursor = koneksi.cursor()
    query = """SELECT set_4 FROM tb_setting WHERE set_5=%s""" % (aktiv)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    for d in data:
        sem = d[0]
    return sem

def logo():
    image = ""
    cursor = koneksi.cursor()
    query = """SELECT set_7 FROM tb_setting WHERE set_5=%s""" % (aktiv)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    for d in data:
        image = d[0]
    return image

def status_krs():
    status = 0
    cursor = koneksi.cursor()
    query = """SELECT set_8 FROM tb_setting WHERE set_5=%s""" % (aktiv)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    for d in data:
        status = d[0]
    return status

def prodi_mhs(idd):
    prodi_id = 0
    cursor = koneksi.cursor()
    query = """SELECT prodi_1 FROM tb_mhs WHERE mhs_1=%s""" % (idd)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    for d in data:
        prodi_id = d[0]
    return prodi_id

def profil_mhs(idd):
    data=()
    cursor = koneksi.cursor()
    query = """SELECT * FROM profil_mhs WHERE mhs_1=%s""" % (idd)
    cursor.execute(query)
    temp = cursor.fetchall()
    cursor.close()

    for i in temp:
        data = data + i

    return data

def profil_dsn(idd):
    data=()
    cursor = koneksi.cursor()
    query = """SELECT * FROM tb_dosen WHERE dsn_1=%s""" % (idd)
    cursor.execute(query)
    temp = cursor.fetchall()
    cursor.close()

    for i in temp:
        data = data + i

    return data

def info_pilih_kelas(idd):
    data=()
    cursor = koneksi.cursor()
    query = """SELECT * FROM pilih_kelas WHERE kls_1=%s""" % (idd)
    cursor.execute(query)
    temp = cursor.fetchall()
    cursor.close()

    for i in temp:
        data = data + i

    return data

def hitung_nilai_mhs(tugas, uts, uas, kehadiran, sks):
    tgs = 0.2
    ut = 0.35
    ua = 0.35
    khdran = 0.1
    nilai=0
    simbol = ""
    bobot = 0
    total = 0
    data = ()
    nilai = (tugas * tgs)+(uts*ut)+(uas*ua)+(kehadiran/14*100*khdran)

    print "nilai="+str(nilai)
    if nilai >= 80:
        simbol = "A"
        bobot = 4
    elif nilai >= 60:
        simbol = "B"
        bobot = 3
    elif nilai >= 40:
        simbol = "C"
        bobot = 2
    elif nilai >= 20:
        simbol = "D"
        bobot = 1
    elif nilai >= 1:
        simbol = "E"
        bobot = 0
    else:
        simbol = ""
        bobot = 0

    total = bobot*sks
    data = data + (nilai, simbol, bobot, total)
    return data

def hitung_ipk(data):
    sks=0.0
    total =0.0
    ipk =0.0
    hasil=()
    for d in data:
        sks = sks+int(d[3])
        total = total+int(d[13])

    ipk=total/sks
    hasil=hasil=(sks, total, ipk)
    return hasil
