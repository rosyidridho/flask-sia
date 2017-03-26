from flask import Flask, request, render_template, url_for, redirect, flash, session
from functools import wraps
from app import *
from datetime import datetime
from werkzeug import secure_filename
from werkzeug.security import generate_password_hash, check_password_hash
from config import koneksi, ALLOWED_EXTENSIONS, UPLOAD_FOLDER
import os
from control import *

conn = koneksi

mhs_direktori = os.path.join(UPLOAD_FOLDER, "mhs")
dsn_direktori = os.path.join(UPLOAD_FOLDER,"dsn")
logo_direktori = os.path.join(UPLOAD_FOLDER,"logo")

def datetime_now():
    return datetime.utcnow()

def year_now():
    now = datetime.utcnow()
    year = now.year
    return str(year)

def allowed_file(filename):
    print ALLOWED_EXTENSIONS
    return '.' in filename and filename.rsplit('.',1)[1] in ALLOWED_EXTENSIONS

def read_session(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        session.permanent = True
        try:
            if session['id_user'] is False:
                flash('Username or Password is invalid')
                return redirect(url_for('login'))
            return f(*args, **kwargs)
        except KeyError:
            flash('Your Session is time out, login first')
            return redirect(url_for('login'))
    return wrap

def admin_role(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if cek_level(session['id_user']) != 1:
            return render_template('blank.html')
        return f(*args, **kwargs)
    return wrap

def mhs_role(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if cek_level(session['id_user']) != 2:
            return render_template('blank.html')
        return f(*args, **kwargs)
    return wrap

def dosen_role(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if cek_level(session['id_user']) != 3:
            return render_template('blank.html')
        return f(*args, **kwargs)
    return wrap

def cek_level(idd):
    cursor = conn.cursor()
    query = """SELECT usr_4 FROM tb_user WHERE usr_1=%s""" % (idd)
    cursor.execute(query)
    user_data = cursor.fetchall()
    cursor.close()
    for d in user_data:
        level = d[0]
    return level

def cek_pass_lama(idd, pass_lama):
    cursor = conn.cursor()
    query = """SELECT usr_3 FROM tb_user WHERE usr_1=%s""" % (idd)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    for d in data:
        hasil = check_password_hash(d[0], pass_lama)
        break
    return hasil

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        cursor = conn.cursor()
        query = """SELECT * FROM tb_user WHERE usr_2='%s' """ % (username)
        cursor.execute(query)
        data = cursor.fetchall()
        cursor.close()
        if len(data) is 0:
            flash ('Username Belum Terdaftar')
        else:
            for d in data:
                cek = check_password_hash(d[2], password)
                if cek:
                    if d[4] == 1:
                        if d[3] == 1:
                            session['id_user'] = d[0]
                            return redirect(url_for('admin'))
                        elif d[3] == 2:
                            session['id_user'] = d[0]
                            return redirect(url_for('dash_mhs'))
                        elif d[3] == 3:
                            session['id_user'] = d[0]
                            return redirect(url_for('dash_dosen'))
                        else:
                            flash ('Error Role of User')
                    else:
                        flash ('Silahkan Hubungi Admin Untuk Mengaktifkan Akun Anda')
                else:
                    flash ('Password Salah!')

    session.pop('id_user', None)
    session.pop('id_mahas', None)
    session.pop('id_dosen', None)
    universitas = nm_univ()
    log=logo()
    return render_template('login.html', logo=log, univ=universitas)

@app.route('/logout')
def loguot():
    session.pop('id_user', None)
    session.pop('id_mahas', None)
    session.pop('id_dosen', None)
    return redirect(url_for('login'))

@app.route('/admin')
@read_session
@admin_role
def admin():

    fakultas =  get_info('tb_fakultas', 'fklts_3')
    prodi = get_info('tb_prodi', 'prodi_3')
    mahasiswa = get_info('tb_mhs', 'mhs_8')
    dosen = get_info('tb_dosen', 'dsn_8')
    makul = get_info('tb_makul', 'mkl_5')
    kelas = get_info('tb_kelas', 'kls_5')
    universitas = nm_univ()
    log = logo()
    return render_template('admin/home.html', univ=universitas, logo=log, fakultas=fakultas, prodi=prodi, mhs=mahasiswa, dosen=dosen, makul=makul, kelas=kelas)

@app.route('/admin/setting', methods=['GET', 'POST'])
@read_session
@admin_role
def setting():
    if request.method == 'POST':
        id_set = request.form['id_set']
        nama_universitas = request.form['nm_univ']
        ajaran = request.form['ajaran']
        smstr = request.form['smstr']
        krs = request.form['krs']
        log = logo()

        if id_set != "kosong":
            cursor = conn.cursor()
            query = """UPDATE tb_setting SET set_5=0 WHERE set_1=%s""" % (id_set)
            cursor.execute(query)
            conn.commit()
            cursor.close()

        cursor = conn.cursor()
        query = """INSERT INTO tb_setting (set_2, set_3, set_4, set_5, set_6, set_7, set_8) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
        cursor.execute(query, (nama_universitas, ajaran, smstr, 1, datetime_now(), log, krs))
        conn.commit()
        cursor.close()
        flash ('Setting Berhasil Disimpan!')
        return redirect(url_for('setting'))

    cursor = conn.cursor()
    query = """SELECT * FROM tb_setting WHERE set_5=%s""" % (1)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()
    log = logo()
    universitas = nm_univ()
    return render_template('admin/setting.html', setting=data, univ=universitas, logo=log)

@app.route('/admin/setting-logo', methods={'POST'})
@read_session
@admin_role
def setting_logo():
    if request.method == 'POST':
        file = request.files['logo']
        id_set = request.form['id_set']
        if file and allowed_file(file.filename):
            img_name = secure_filename(file.filename)
            file.save(os.path.join(logo_direktori, img_name))

            cursor = conn.cursor()
            query = """UPDATE tb_setting SET set_7=%s WHERE set_1=%s"""
            cursor.execute(query, (img_name, id_set))
            conn.commit()
            cursor.close()

            flash('Logo Berhasil Upload!')
            return redirect(url_for('setting'))
        else:
            flash ('Ekstensi gambar tidak diperbolehkan!')
            return redirect(url_for('setting'))

@app.route('/admin/fakultas', methods=['GET', 'POST'])
@read_session
@admin_role
def fakultas():
    #tambah data fakultas
    if request.method == 'POST':
        nama_fklts = request.form['nama_fklts']

        cursor = conn.cursor()
        query = """INSERT INTO tb_fakultas (fklts_2, fklts_3) VALUES (%s, %s)"""
        cursor.execute(query, (nama_fklts, datetime_now()))
        conn.commit()
        cursor.close()

        flash('Data Fakultas Berhasil Ditambah!')
        return redirect(url_for('fakultas'))

    cursor = conn.cursor()
    query = """SELECT * FROM tb_fakultas"""
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()
    log = logo()
    universitas = nm_univ()
    return render_template('admin/fakultas.html', fakultas=data, univ=universitas, logo=log)

@app.route('/admin/edit-fakultas', methods=['POST'])
@read_session
@admin_role
def edit_fklts():
    if request.method == 'POST':
        nama_fklts = request.form['nama_fklts']
        data_id = request.form['id_fklts']

        cursor = conn.cursor()
        query = """UPDATE tb_fakultas SET fklts_2=%s, fklts_3=%s WHERE fklts_1=%s"""
        cursor.execute(query, (nama_fklts, datetime_now(), data_id))
        conn.commit()
        cursor.close()

        flash ('Data Fakultas Berhasil Diperbarui!')
    return redirect(url_for('fakultas'))

@app.route('/admin/delete-fakultas', methods=['POST'])
@read_session
@admin_role
def delete_fklts():
    if request.method == 'POST':
        data_id = request.form['id_fklts']

        cursor = conn.cursor()
        query = """DELETE FROM tb_fakultas WHERE fklts_1=%s""" % (data_id)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data Fakultas Berhasil Dihapus!')
    return redirect(url_for('fakultas'))

@app.route('/admin/prodi', methods=['GET', 'POST'])
@read_session
@admin_role
def prodi():
    if request.method == 'POST':
        #tambah data prodi
        id_fklts = request.form['id_fklts']
        nama_prodi = request.form['nama_prodi']

        cursor = conn.cursor()
        query = """INSERT INTO tb_prodi (fklts_1, prodi_2, prodi_3) VALUES (%s, %s, %s)"""
        cursor.execute(query, (id_fklts, nama_prodi, datetime_now()))
        conn.commit()
        cursor.close()

        flash('Data Prodi Berhasil Ditambah!')
        return redirect(url_for('prodi'))

    cursor = conn.cursor()
    #data untuk form Prodi
    query = """SELECT * FROM form_prodi"""
    cursor.execute(query)
    data1 = cursor.fetchall()
    #Data Fakultas
    query = """SELECT * FROM tb_fakultas"""
    cursor.execute(query)
    data2 = cursor.fetchall()
    cursor.close()

    log = logo()
    universitas = nm_univ()
    return render_template('admin/prodi.html', prodi=data1, fakultas=data2, univ=universitas, logo=log)

@app.route('/admin/edit-prodi', methods=['POST'])
@read_session
@admin_role
def edit_prd():
    if request.method == 'POST':
        id_prodi = int(request.form['id_prodi'])
        id_fklts = int(request.form['id_fklts'])
        nama_prodi = request.form['nama_prodi']

        cursor = conn.cursor()
        query = """UPDATE tb_prodi SET fklts_1=%s, prodi_2=%s, prodi_3=%s WHERE prodi_1=%s"""
        cursor.execute(query, (id_fklts, nama_prodi, datetime_now(), id_prodi))
        conn.commit()
        cursor.close()

        flash('Data Prodi Berhasil Diperbarui!')
        return redirect(url_for('prodi'))

@app.route('/admin/delete-prodi', methods=['POST'])
@read_session
@admin_role
def delete_prd():
    if request.method == 'POST':
        id_prodi = request.form['id_prodi']

        cursor = conn.cursor()
        query = """DELETE FROM tb_prodi WHERE prodi_1=%s""" % (id_prodi)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash('Data Prodi Berhasil Dihapus!')
        return redirect(url_for('prodi'))

@app.route('/admin/mhs', methods=['GET', 'POST', 'PUT'])
@read_session
@admin_role
def mhs():
    if request.method == 'POST':
        nim = request.form['nim']
        nama = request.form['nama']
        id_prodi = request.form['id_prodi']
        tmpt_lhr = request.form['tmpt_lhr']
        tgl_lhr = request.form['tgl_lhr']
        alamat = request.form['alamat']
        file = request.files['foto']

        ins_mhs(nim=nim, nama=nama, id_prodi=id_prodi, tmpt_lhr=tmpt_lhr, tgl_lhr=tgl_lhr, alamat=alamat, file=file)

    cursor = conn.cursor()
    query = """SELECT * FROM form_mhs ORDER BY mhs_1"""
    cursor.execute(query)
    data = cursor.fetchall()

    query = """SELECT * FROM fklts_prodi ORDER BY fklts_2"""
    cursor.execute(query)
    data1 = cursor.fetchall()
    cursor.close()

    #Membuat NIM
    nim=""
    if data:
        for d in data:
            nim = year_now()+""+str(d[0]+1)
    else:
        nim = year_now()+"1"

    log = logo()
    universitas = nm_univ()
    return render_template('admin/mhs.html', mhs=data, fklts_prodi=data1, nim=nim, univ=universitas, logo=log)

def ins_mhs(nim, nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, file):
    try:
        if file.filename == "":
            img_name="None"
            cursor = conn.cursor()
            query = """INSERT INTO tb_user (usr_2, usr_3, usr_4, usr_5, usr_6) VALUES (%s, %s, 2, 1, %s)"""
            cursor.execute(query, (nim, generate_password_hash(nim), datetime_now()))
            conn.commit()
            iduser = get_id_user(nim)
            query = """INSERT INTO tb_mhs (mhs_2, mhs_3, prodi_1, mhs_4, mhs_5, mhs_6, mhs_7, mhs_8, usr_1) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            cursor.execute(query, (nim, nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now(), iduser))
            conn.commit()
            cursor.close()

            flash ('Data Mahasiswa '+nim+' Berhasil Ditambah!')
            return redirect(url_for('mhs'))
        else:
            if file and allowed_file(file.filename):
                img_name = secure_filename(file.filename)
                file.save(os.path.join(mhs_direktori, img_name))

                cursor = conn.cursor()
                query = """INSERT INTO tb_user (usr_2, usr_3, usr_4, usr_5, usr_6) VALUES (%s, %s, 2, 1, %s)"""
                cursor.execute(query, (nim, generate_password_hash(nim), datetime_now()))
                conn.commit()
                iduser = get_id_user(nim)
                query = """INSERT INTO tb_mhs (mhs_2, mhs_3, prodi_1, mhs_4, mhs_5, mhs_6, mhs_7, mhs_8, usr_1) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
                cursor.execute(query, (nim, nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now(), iduser))
                conn.commit()
                cursor.close()

                flash ('Data Mahasiswa '+nim+' Berhasil Ditambah!')
                return redirect(url_for('mhs'))
            else:
                flash ('Ekstensi gambar tidak diperbolehkan!')
                return redirect(url_for('mhs'))
    except Exception as e:
        print e

@app.route('/admin/edit-mhs', methods=['POST'])
@read_session
@admin_role
def edit_mhs():
    if request.method == 'POST':
        id_mhs = request.form['id_mhs']
        nim = request.form['nim']
        nama = request.form['nama']
        id_prodi = request.form['id_prodi']
        tmpt_lhr = request.form['tmpt_lhr']
        tgl_lhr = request.form['tgl_lhr']
        alamat = request.form['alamat']
        file = request.files['foto']

        return edt_mhs(id_mhs=id_mhs, nim=nim, nama=nama, id_prodi=id_prodi, tmpt_lhr=tmpt_lhr, tgl_lhr=tgl_lhr, alamat=alamat, file=file)

    flash ('Terjadi Kesalahan')
    return redirect(url_for('mhs'))

def edt_mhs(id_mhs, nim, nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, file):
    try:
        if file.filename == "":
            cursor = conn.cursor()
            query = """UPDATE tb_mhs SET mhs_3=%s, prodi_1=%s, mhs_4=%s, mhs_5=%s, mhs_6=%s, mhs_8=%s WHERE mhs_1=%s"""
            cursor.execute(query, (nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, datetime_now(), id_mhs))
            conn.commit()
            cursor.close()

            flash('Data Mahasiswa '+nim+' Berhasil Diperbarui!')
            return redirect(url_for('mhs'))
        else:
            if file and allowed_file(file.filename):
                img_name = secure_filename(file.filename)
                file_dir = os.path.join(mhs_direktori, img_name)
                file.save(file_dir)

                cursor = conn.cursor()
                query = """UPDATE tb_mhs SET mhs_3=%s, prodi_1=%s, mhs_4=%s, mhs_5=%s, mhs_6=%s, mhs_7=%s, mhs_8=%s WHERE mhs_1=%s"""
                cursor.execute(query, (nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now(), id_mhs))
                conn.commit()
                cursor.close()

                flash('Data Mahasiswa '+nim+' Berhasil Diperbarui!')
                return redirect(url_for('mhs'))
            else:
                flash ('Ekstensi gambar tidak diperbolehkan!')
                return redirect(url_for('mhs'))
    except Exception as e:
        return {'error': str(e)}

@app.route('/admin/delete-mhs', methods=['POST'])
@read_session
@admin_role
def delete_mhs():
    if request.method == 'POST':
        id_mhs = request.form['id_mhs']

        cursor = conn.cursor()
        query = """DELETE FROM tb_mhs WHERE mhs_1 =%s """ % (id_mhs)
        cursor.execute(query)
        conn.commit()
        query = """CALL delete_mhs_usr(%s)""" % (id_mhs)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data Mahasiswa '+id_mhs+' Berhasi Dihapus!')
        return redirect(url_for('mhs'))

@app.route('/admin/dosen', methods=['GET', 'POST'])
@read_session
@admin_role
def dosen():
    if request.method == 'POST':
        nid = request.form['nid']
        nama = request.form['nama']
        tmpt_lhr = request.form['tmpt_lhr']
        tgl_lhr = request.form['tgl_lhr']
        alamat = request.form['alamat']
        file = request.files['foto']

        ins_dsn(nid=nid, nama=nama, tmpt_lhr=tmpt_lhr, tgl_lhr=tgl_lhr, alamat=alamat, file=file)

    cursor = conn.cursor()
    query = """SELECT * FROM tb_dosen ORDER BY dsn_1"""
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    #Membuat NIM
    nid=""
    if data:
        for d in data:
            nid = "DSN"+year_now()+""+str(d[0]+1)
    else:
        nid = "DSN"+year_now()+"1"

    log = logo()
    universitas = nm_univ()
    return render_template('admin/dosen.html', dosen=data, nid=nid, univ=universitas, logo=log)

def ins_dsn(nid, nama, tmpt_lhr, tgl_lhr, alamat, file):
    try:
        if file.filename == "":
            img_name="None"
            cursor = conn.cursor()
            query = """INSERT INTO tb_user (usr_2, usr_3, usr_4, usr_5, usr_6) VALUES (%s, %s, 3, 1, %s)"""
            cursor.execute(query, (nid, generate_password_hash(nid), datetime_now()))
            conn.commit()
            iduser = get_id_user(nid)
            query = """INSERT INTO tb_dosen (dsn_2, dsn_3, dsn_4, dsn_5, dsn_6, dsn_7, dsn_8, usr_1) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
            cursor.execute(query, (nid, nama, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now(), iduser))
            conn.commit()
            cursor.close()

            flash ('Data Dosen '+nid+' Berhasil Ditambah!')
            return redirect(url_for('dosen'))
        else:
            if file and allowed_file(file.filename):
                img_name = secure_filename(file.filename)
                file.save(os.path.join(dsn_direktori, img_name))

                cursor = conn.cursor()
                query = """INSERT INTO tb_user (usr_2, usr_3, usr_4, usr_5, usr_6) VALUES (%s, %s, 3, 1, %s)"""
                cursor.execute(query, (nid, generate_password_hash(nid), datetime_now()))
                conn.commit()
                iduser = get_id_user(str(nid))
                cursor = conn.cursor()
                query = """INSERT INTO tb_dosen (dsn_2, dsn_3, dsn_4, dsn_5, dsn_6, dsn_7, dsn_8, usr_1) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
                cursor.execute(query, (nid, nama, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now(), iduser))
                conn.commit()
                cursor.close()

                flash ('Data Dosen '+nid+' Berhasil Ditambah!')
                return redirect(url_for('dosen'))
            else:
                flash ('Ekstensi gambar tidak diperbolehkan!')
                return redirect(url_for('mhs'))
    except Exception as e:
        return {'error': str(e)}

@app.route('/admin/edit-dsn', methods=['POST'])
@read_session
@admin_role
def edit_dsn():
    if request.method == 'POST':
        id_dsn = request.form['id_dsn']
        nid = request.form['nid']
        nama = request.form['nama']
        tmpt_lhr = request.form['tmpt_lhr']
        tgl_lhr = request.form['tgl_lhr']
        alamat = request.form['alamat']
        file = request.files['foto']

        return edt_dsn(id_dsn=id_dsn, nid=nid, nama=nama, tmpt_lhr=tmpt_lhr, tgl_lhr=tgl_lhr, alamat=alamat, file=file)

    flash ('Terjadi Kesalahan')
    return redirect(url_for('dosen'))

def edt_dsn(id_dsn, nid, nama, tmpt_lhr, tgl_lhr, alamat, file):
    try:
        if file.filename == "":
            cursor = conn.cursor()
            query = """UPDATE tb_dosen SET dsn_3=%s, dsn_4=%s, dsn_5=%s, dsn_6=%s, dsn_8=%s WHERE dsn_1=%s"""
            cursor.execute(query, (nama, tmpt_lhr, tgl_lhr, alamat, datetime_now(), id_dsn))
            conn.commit()
            cursor.close()

            flash('Data Dosen '+nid+' Berhasil Diperbarui!')
            return redirect(url_for('dosen'))
        else:
            if file and allowed_file(file.filename):
                img_name = secure_filename(file.filename)
                file.save(os.path.join(dsn_direktori, img_name))

                cursor = conn.cursor()
                query = """UPDATE tb_dosen SET dsn_3=%s, dsn_4=%s, dsn_5=%s, dsn_6=%s, dsn_7=%s, dsn_8=%s WHERE dsn_1=%s"""
                cursor.execute(query, (nama, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now(), id_dsn))
                conn.commit()
                cursor.close()

                flash('Data Dosen '+nid+' Berhasil Diperbarui!')
                return redirect(url_for('dosen'))
            else:
                flash ('Ekstensi gambar tidak diperbolehkan!')
                return redirect(url_for('mhs'))
    except Exception as e:
        return {'error': str(e)}

@app.route('/admin/delete-dsn', methods=['POST'])
@read_session
@admin_role
def delete_dsn():
    if request.method == 'POST':
        id_dsn = request.form['id_dsn']

        cursor = conn.cursor()
        query = """DELETE FROM tb_dosen WHERE dsn_1 =%s """ % (id_dsn)
        cursor.execute(query)
        conn.commit()
        query = """CALL delete_dsn_usr(%s)""" % (id_dsn)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data Dosen '+id_dsn+' Berhasi Dihapus!')
        return redirect(url_for('dosen'))

@app.route('/admin/makul', methods=['GET', 'POST'])
@read_session
@admin_role
def makul():
    if request.method == 'POST':
        nama = request.form['nama']
        id_prodi = request.form['id_prodi']
        sks = request.form['sks']
        smstr = request.form['smstr']

        cursor = conn.cursor()
        query = """INSERT INTO tb_makul (prodi_1, mkl_2, mkl_3, mkl_4, mkl_5) VALUES (%s, %s, %s, %s, %s)"""
        cursor.execute(query, (id_prodi, nama, sks, smstr, datetime_now()))
        conn.commit()
        cursor.close()

        flash ('Data Mata Kuliah Berhasil Ditambah!')
        return redirect(url_for('makul'))

    cursor = conn.cursor()
    query = """SELECT * FROM form_makul"""
    cursor.execute(query)
    data = cursor.fetchall()
    query = """SELECT * FROM fklts_prodi ORDER BY fklts_2"""
    cursor.execute(query)
    data1 = cursor.fetchall()
    cursor.close()

    log = logo()
    universitas = nm_univ()
    return render_template('admin/makul.html', makul=data, fklts_prodi=data1, univ=universitas, logo=log)

@app.route('/admin/edit-makul', methods=['POST'])
@read_session
@admin_role
def edit_mkl():
    if request.method == 'POST':
        id_mkl = request.form['id_mkl']
        nama = request.form['nama']
        id_prodi = request.form['id_prodi']
        sks = request.form['sks']
        smstr = request.form['smstr']

        cursor = conn.cursor()
        query = """UPDATE tb_makul SET prodi_1=%s, mkl_2=%s, mkl_3=%s, mkl_4=%s, mkl_5=%s WHERE mkl_1=%s"""
        cursor.execute(query, (id_prodi, nama, sks, smstr, datetime_now(), id_mkl))
        conn.commit()
        cursor.close()

        flash ('Data Mata Kuliah '+id_mkl+' Berhasil Diubah!')
        return redirect(url_for('makul'))

@app.route('/admin/delete-makul', methods=['POST'])
@read_session
@admin_role
def delete_mkl():
    if request.method == 'POST':
        id_mkl = request.form['id_mkl']

        cursor = conn.cursor()
        query = """DELETE FROM tb_makul WHERE mkl_1=%s""" % (id_mkl)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data Mata Kuliah '+id_mkl+' Berhasil Dihapus!')
        return redirect(url_for('makul'))

@app.route('/admin/kelas', methods=['GET', 'POST'])
@read_session
@admin_role
def kelas():
    if request.method == 'POST':
        nm_kls = request.form['nm_kls']
        id_mkl = request.form['id_mkl']
        kuota = request.form['kuota']

        cursor = conn.cursor()
        query = """INSERT INTO tb_kelas (kls_2, mkl_1, kls_3, kls_4, kls_5, kls_6) VALUES (%s, %s, %s, %s, %s, %s)"""
        cursor.execute(query, (nm_kls, id_mkl, kuota, kuota, datetime_now(), 0))
        conn.commit()
        cursor.close()

        flash ('Data Kelas Berhasil Ditambah!')
        return redirect(url_for('kelas'))

    cursor = conn.cursor()
    query = """SELECT * FROM form_kelas"""
    cursor.execute(query)
    data =cursor.fetchall()
    query = """SELECT * FROM prodi_makul ORDER BY prodi_2"""
    cursor.execute(query)
    data1 = cursor.fetchall()
    cursor.close()

    log = logo()
    universitas = nm_univ()
    return render_template('admin/kelas.html', kelas=data, prodi_makul=data1, univ=universitas, logo=log)

@app.route('/admin/edit-kelas', methods=['POST'])
@read_session
@admin_role
def edit_kls():
    if request.method == 'POST':
        id_kls = request.form['id_kls']
        nm_kls = request.form['nm_kls']
        id_mkl = request.form['id_mkl']
        kuota = request.form['kuota']
        ss_kuota = request.form['ss_kuota']

        cursor = conn.cursor()
        query = """UPDATE tb_kelas SET kls_2=%s, mkl_1=%s, kls_3=%s, kls_4=%s, kls_5=%s WHERE kls_1=%s"""
        cursor.execute(query, (nm_kls, id_mkl, kuota, ss_kuota, datetime_now(), id_kls))
        conn.commit()
        cursor.close()

        flash ('Data Kelas '+id_kls+' Berhasil Diperbarui!')
        return redirect(url_for('kelas'))

@app.route('/admin/delete-kls', methods=['POST'])
@read_session
@admin_role
def delete_kls():
    if request.method == 'POST':
        id_kls = request.form['id_kls']

        cursor = conn.cursor()
        query = """DELETE FROM tb_kelas WHERE kls_1=%s""" % (id_kls)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data Kelas '+id_kls+' Berhasil Dihapus!')
        return redirect(url_for('kelas'))

@app.route('/admin/ganti-password', methods=['GET', 'POST'])
@read_session
@admin_role
def ganti_pass_admin():
    if request.method == 'POST':
        pass_lama = request.form['pass_lama']
        pass_baru = request.form['pass_baru']
        u_pass_baru = request.form['u_pass_baru']

        if cek_pass_lama(session['id_user'], pass_lama) == ():
            flash ('Password Lama Anda Salah, Silahkan Masukkan Password Lama Anda Dengan Benar.')
        else:
            if pass_baru != u_pass_baru:
                flash ('Password Baru Anda Tidak Sama, Silahkan Ulangi.')
            else:
                cursor = conn.cursor()
                query = """UPDATE tb_user SET usr_3=%s WHERE usr_1=%s"""
                cursor.execute(query, (pass_baru, session['id_user']))
                conn.commit()
                cursor.close()

                flash ('Password Anda Telah Diperbarui!')
        return redirect(url_for('ganti_pass_admin'))

    log = logo()
    universitas = nm_univ()
    return render_template('admin/ganti-password.html', univ=universitas, logo=log)

@app.route('/mhs')
@read_session
@mhs_role
def dash_mhs():

    data = profil_mhs(get_id_mhs(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('mhs/home.html', univ=universitas, mhs=data, logo=log)

@app.route('/mhs/profil')
@read_session
@mhs_role
def profil_mahasiswa():
    data = profil_mhs(get_id_mhs(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('mhs/profil.html', univ=universitas, mhs=data, logo=log)

@app.route('/mhs/khs')
@read_session
@mhs_role
def khs():
    data2=()
    cursor= conn.cursor()
    query = """SELECT * FROM khs WHERE mhs_1=%s""" % (get_id_mhs(session['id_user']))
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()
    if data == ():
        data2=()
    else:
        data2=hitung_ipk(data)

    data1 = profil_mhs(get_id_mhs(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('mhs/khs.html', univ=universitas, khs=data, mhs=data1, info_ipk=data2, logo=log)

@app.route('/mhs/krs', methods=['GET', 'POST'])
@read_session
@mhs_role
def krs():
    if request.method == 'POST':
        id_abl_kls = request.form['id_abl_kls']
        id_kls = request.form['id_kls']

        cursor = conn.cursor()
        query = """DELETE FROM tb_ambil_kls WHERE abl_kls_1=%s""" % (id_abl_kls)
        cursor.execute(query)
        conn.commit()
        query = """UPDATE tb_kelas SET kls_4=(kls_4+1) WHERE kls_1=%s""" % (id_kls)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data '+id_abl_kls+' Berhasil Dihapus!')
        return redirect(url_for('krs'))

    universitas = nm_univ()
    log = logo()
    data1 = profil_mhs(get_id_mhs(session['id_user']))
    if status_krs() == 1:
        cursor = conn.cursor()
        query = """SELECT * FROM krs WHERE mhs_1=%s AND abl_kls_2=%s AND abl_kls_3=%s"""
        cursor.execute(query, (get_id_mhs(session['id_user']), thn_ajaran(), smstr()))
        data = cursor.fetchall()
        cursor.close()

        return render_template('mhs/krs.html', univ=universitas, krs=data, mhs=data1, logo=log)
    else:
        return render_template('mhs/krs-tutup.html', univ=universitas, mhs=data1, logo=log)

@app.route('/mhs/add-krs', methods=['GET', 'POST'])
@read_session
@mhs_role
def add_krs():
    if request.method == 'POST':
        id_mhs = get_id_mhs(session['id_user'])
        id_kls = request.form['id_kls']
        tahun_ajaran = thn_ajaran()
        semester = smstr()

        if check_ambil_kls_ganda(id_kls, id_mhs) == False:
            cursor = conn.cursor()
            query = """INSERT INTO tb_ambil_kls (mhs_1, kls_1, abl_kls_2, abl_kls_3, abl_kls_4) VALUES (%s, %s, %s, %s, %s)"""
            cursor.execute(query, (id_mhs, id_kls, tahun_ajaran, semester, datetime_now()))
            conn.commit()
            query = """UPDATE tb_kelas SET kls_4=(kls_4-1) WHERE kls_1=%s""" % (id_kls)
            cursor.execute(query)
            conn.commit()
            id_abl_kls = get_id_abl_kls(id_mhs, id_kls, tahun_ajaran, semester)
            query = """INSERT INTO tb_nilai (abl_kls_1, nil_2, nil_3, nil_4, nil_5, nil_6, nil_7, nil_8, nil_9) VALUES (%s, 0, 0, 0, 0, "0", "0", 0, "0")""" % (id_abl_kls)
            cursor.execute(query)
            conn.commit()
            cursor.close()

            flash ('Data KRS Berhasil Ditambah!')
        else:
            flash ('Data '+id_kls+' Sudah Ada! Pilih Kelas yang Lain.')

        return redirect(url_for('add_krs'))

    universitas = nm_univ()
    log = logo()
    data2 = profil_mhs(get_id_mhs(session['id_user']))
    if status_krs() == 1:
        cursor = conn.cursor()
        query = """SELECT * FROM add_krs WHERE prodi_1=%s""" % (prodi_mhs(get_id_mhs(session['id_user'])))
        cursor.execute(query)
        data = cursor.fetchall()
        cursor.close()

        data1=()

        if smstr() == "GANJIL":
            for d in data:
                if (int(d[5]) % 2) == 1:
                    data1 = data1 + (d,)
        elif smstr() == 'GENAP':
            for d in data:
                if (int(d[5]) % 2) == 0:
                    data1 = data1 + (d,)
        return render_template('mhs/add-krs.html', univ=universitas, krs=data1, mhs=data2, logo=log)
    else:
        return render_template('mhs/krs-tutup.html', univ=universitas, mhs=data2)

def check_ambil_kls_ganda(id_kls, id_mhs):
    tahun_ajaran = thn_ajaran()
    cursor = conn.cursor()
    query = """SELECT * FROM tb_ambil_kls WHERE mhs_1=%s AND kls_1=%s AND abl_kls_2=%s"""
    cursor.execute(query, (id_mhs, id_kls, tahun_ajaran))
    data = cursor.fetchall()
    cursor.close()

    if data == ():
        cek = False
    else:
        cek = True
    return cek

@app.route('/mhs/ganti-password', methods=['GET', 'POST'])
@read_session
@mhs_role
def ganti_pass_mhs():
    if request.method == 'POST':
        pass_lama = request.form['pass_lama']
        pass_baru = request.form['pass_baru']
        ulang_pass_baru = request.form['u_pass_baru']
        print
        if cek_pass_lama(session['id_user'], pass_lama) is False:
            flash ('Password Lama Anda Salah, Silahkan Masukkan Password Lama Anda Dengan Benar.')
        else:
            if pass_baru != ulang_pass_baru:
                flash ('Password Anda Tidak Sama, Silahkan Ulangi.')
            else:
                cursor = conn.cursor()
                query = """UPDATE tb_user SET usr_3=%s WHERE usr_1=%s"""
                cursor.execute(query, (generate_password_hash(pass_baru), session['id_user']))
                conn.commit()
                cursor.close()

                flash ('Password Anda Telah Diperbarui!')
        return redirect(url_for('ganti_pass_mhs'))

    data = profil_mhs(get_id_mhs(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('mhs/ganti-password.html', univ=universitas, mhs=data, logo=log)

@app.route('/dosen')
@read_session
@dosen_role
def dash_dosen():
    data = profil_dsn(get_id_dsn(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('dosen/home.html', univ=universitas, dsn=data, logo=log)

@app.route('/dosen/profil')
@read_session
@dosen_role
def profil_dosen():
    data = profil_dsn(get_id_dsn(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('dosen/profil.html', univ=universitas, dsn=data, logo=log)

@app.route('/dosen/kelas-dosen')
@read_session
@dosen_role
def kelas_dosen():

    cursor = conn.cursor()
    query = """SELECT * FROM kelas_dosen WHERE dsn_1=%s""" % (get_id_dsn(session['id_user']))
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    data1 = profil_dsn(get_id_dsn(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('dosen/kelas-dosen.html', kelas_dosen=data, univ=universitas, dsn=data1, logo=log)

@app.route('/dosen/tambah-kelas', methods=['GET', 'POST'])
@read_session
@dosen_role
def tambah_kelas():
    if request.method == 'POST':
        id_dosen = get_id_dsn(session['id_user'])
        id_kls = request.form['id_kls']

        if check_kelas_ganda(id_kls) is True:
            flash ('Aktifitas Mencurigakan, Akun Ini Akan Ditandai')

            cursor = conn.cursor()
            query = """UPDATE tb_user SET usr_5=0 WHERE usr_1=%s""" % (session['id_user'])
            cursor.execute(query)
            conn.commit()
            cursor.close()

            session.pop('id_user', None)
        else:
            cursor = conn.cursor()
            query = """INSERT INTO tb_pengampu (dsn_1, kls_1, ampu_2) VALUES (%s, %s, %s)"""
            cursor.execute(query, (id_dosen, id_kls, datetime_now()))
            conn.commit()
            cursor.close()

            cursor = conn.cursor()
            query = """UPDATE tb_kelas SET kls_6=%s WHERE kls_1=%s""" % (id_dosen, id_kls)
            cursor.execute(query)
            conn.commit()
            cursor.close()

            flash ('Kelas (id: '+id_kls+') Berhasil Ditambah Pada Data Kelas Anda')
        return redirect(url_for('tambah_kelas'))


    cursor = conn.cursor()
    query = """SELECT * FROM tambah_kelas"""
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    data1 = profil_dsn(get_id_dsn(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('dosen/tambah-kelas.html', tambah_kelas=data, univ=universitas, dsn=data1, logo=log)

def check_kelas_ganda(idd):
    cursor = conn.cursor()
    query = """SELECT * FROM tb_pengampu WHERE kls_1=%s""" % (idd)
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()
    flag = True
    if data == ():
        flag = False
    else:
        flag = True
    return flag

@app.route('/dosen/hapus-kelas', methods=['POST'])
@read_session
@dosen_role
def hapus_kelas():
    if request.method == 'POST':
        id_ampu = request.form['id_ampu']
        id_kls = request.form['id_kls']

        cursor = conn.cursor()
        query = """DELETE FROM tb_pengampu WHERE ampu_1=%s""" % (id_ampu)
        cursor.execute(query)
        conn.commit()
        query = """UPDATE tb_kelas SET kls_6=0 WHERE kls_1=%s""" % (id_kls)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data Kelas Anda '+id_ampu+' Berhasil Dihapus!')
        return redirect(url_for('kelas_dosen'))

@app.route('/dosen/input-nilai')
@read_session
@dosen_role
def pilih_kelas():

    cursor = conn.cursor()
    query = """SELECT * FROM pilih_kelas WHERE dsn_1=%s""" % (get_id_dsn(session['id_user']))
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    data1 = profil_dsn(get_id_dsn(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('dosen/pilih-kelas.html', pilih_kelas=data, dsn=data1, univ=universitas, logo=log)

@app.route('/dosen/input-nilai/<kls>', methods=['GET', 'POST'])
@read_session
@dosen_role
def input_nilai(kls):
    if request.method == 'POST':
        id_kls = request.form['id_kls']
        id_nil = request.form['id_nil']
        sks = int(request.form['sks'])
        tugas = int(request.form['tugas'])
        uts = int(request.form['uts'])
        uas = int(request.form['uas'])
        kehadiran = int(request.form['kehadiran'])

        hasil = hitung_nilai_mhs(tugas, uts, uas, kehadiran, sks)
        nilai = hasil[0]
        simbol = hasil[1]
        bobot = hasil[2]
        total = hasil[3]

        print hasil

        cursor = conn.cursor()
        query = """UPDATE tb_nilai SET nil_4=%s, nil_2=%s, nil_3=%s, nil_5=%s, nil_6=%s, nil_7=%s, nil_8=%s, nil_9=%s WHERE nil_1=%s"""
        cursor.execute(query, (tugas, uts, uas, kehadiran, nilai, simbol, total, bobot, id_nil))
        conn.commit()
        cursor.close()

        return redirect(url_for('input_nilai', kls=id_kls))

    data2=()
    cursor = conn.cursor()
    query = """SELECT * FROM input_nilai WHERE kls_1=%s AND abl_kls_2=%s AND abl_kls_3=%s"""
    cursor.execute(query, (kls, thn_ajaran(), smstr()))
    data2 = cursor.fetchall()
    cursor.close()

    data3 = info_pilih_kelas(kls)
    data1 = profil_dsn(get_id_dsn(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('dosen/input-nilai.html', dsn=data1, mhs=data2, univ=universitas, kls=kls, info_kelas=data3, logo=log)

@app.route('/dosen/ganti-password', methods=['GET', 'POST'])
@read_session
@dosen_role
def ganti_pass_dsn():
    if request.method == 'POST':
        pass_lama = request.form['pass_lama']
        pass_baru = request.form['pass_baru']
        ulang_pass_baru = request.form['u_pass_baru']

        if cek_pass_lama(session['id_user'], pass_lama) is False:
            flash ('Password Lama Anda Salah, Silahkan Masukkan Password Lama Anda Dengan Benar.')
        else:
            if pass_baru != ulang_pass_baru:
                flash ('Password Baru Anda Tidak Sama, Silahkan Ulangi.')
            else:
                cursor = conn.cursor()
                query = """UPDATE tb_user SET usr_3=%s WHERE usr_1=%s"""
                cursor.execute(query, (generate_password_hash(pass_baru), session['id_user']))
                conn.commit()
                cursor.close()

                flash ('Password Anda Telah Diperbarui!')
        return redirect(url_for('ganti_pass_dsn'))

    data = profil_dsn(get_id_dsn(session['id_user']))
    log = logo()
    universitas = nm_univ()
    return render_template('dosen/ganti-password.html', univ=universitas, dsn=data, logo=log)
