from config import koneksi

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
    nilai=0.0
    max_hadir= 14.0
    simbol = ""
    bobot = 0
    total = 0
    data = ()
    nilai = (tugas * tgs)+(uts*ut)+(uas*ua)+(kehadiran / max_hadir * 100.0 * khdran)
    nilai = "{0:.2f}".format(nilai)
    nil = float(nilai)

    if nil >= 80 :
        simbol = "A"
        bobot = 4
    elif nil >= 60:
        simbol = "B"
        bobot = 3
    elif nil >= 40:
        simbol = "C"
        bobot = 2
    elif nil >= 20:
        simbol = "D"
        bobot = 1
    elif nil >= 1:
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

def get_info(nm_tabel, kolom_tgl):
    terbaru=()
    jumlah=()
    hasil=()
    cursor = koneksi.cursor()
    query = """SELECT COUNT(%s) FROM %s""" % (kolom_tgl, nm_tabel)
    cursor.execute(query)
    data1 = cursor.fetchall()
    query = """SELECT * FROM %s ORDER BY %s DESC""" % (nm_tabel, kolom_tgl)
    cursor.execute(query)
    data2 = cursor.fetchall()
    cursor.close()

    for i in data1:
        jumlah = jumlah + (i)
        break
    for i in data2:
        terbaru = jumlah + (i)
        break
    hasil = hasil + (terbaru)
    return hasil

def get_id_user(idd):
    cursor = koneksi.cursor()
    print "1"
    print "SELECT usr_1 from tb_user WHERE usr_2='%s'" % (str(idd))
    query = "SELECT usr_1 from tb_user WHERE usr_2='%s'" % (str(idd))
    cursor.execute(query)
    temp = cursor.fetchall()
    cursor.close()
    print "2"
    for d in temp:
        print "3"
        data = d[0]
        break
    print "get user id"
    print data
    return data

def get_id_mhs(idd):
    cursor = koneksi.cursor()
    query = """SELECT mhs_1 from tb_mhs WHERE usr_1=%s""" % (idd)
    cursor.execute(query)
    temp = cursor.fetchall()
    cursor.close()

    for t in temp:
        data = t[0]
        break
    return data

def get_id_dsn(idd):
    cursor = koneksi.cursor()
    query = """SELECT dsn_1 from tb_dosen WHERE usr_1=%s""" % (idd)
    cursor.execute(query)
    temp = cursor.fetchall()
    cursor.close()

    for t in temp:
        data = t[0]
        break
    return data
