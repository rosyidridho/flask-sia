from flask import Flask, request, render_template, url_for, redirect, flash
from app import *
from datetime import datetime
from werkzeug import secure_filename
from config import *
import os

conn = koneksi
mhs_direktori = app.config['UPLOAD_FOLDER']+"mhs/"
dsn_direktori = app.config['UPLOAD_FOLDER']+"dsn/"

def datetime_now():
    return datetime.utcnow()

def year_now():
    now = datetime.utcnow()
    year = now.year
    return str(year)

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.',1)[1] in app.config['ALLOWED_EXTENSIONS']

@app.route('/admin')
def index():
    return render_template('admin/blank.html')

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/admin/fakultas', methods=['GET', 'POST'])
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

    return render_template('admin/fakultas.html', fakultas=data)

@app.route('/admin/edit-fakultas', methods=['POST'])
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
def delete_fklts():
    if request.method == 'POST':
        data_id = request.form['id_fklts']

        cursor = conn.cursor()
        query = """DELETE FROM tb_fakultas WHERE fklts_1=%s"""
        cursor.execute(query, (data_id))
        conn.commit()
        cursor.close()

        flash ('Data Fakultas Berhasil Dihapus!')
    return redirect(url_for('fakultas'))

@app.route('/admin/prodi', methods=['GET', 'POST'])
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
    return render_template('admin/prodi.html', prodi=data1, fakultas=data2)

@app.route('/admin/edit-prodi', methods=['POST'])
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
    query = """SELECT * FROM form_mhs"""
    cursor.execute(query)
    data = cursor.fetchall()
    query = """SELECT * FROM fklts_prodi"""
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

    return render_template('admin/mhs.html', mhs=data, fklts_prodi=data1, nim=nim)

def ins_mhs(nim, nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, file):
    try:
        if file.filename == "":
            img_name="None"
            cursor = conn.cursor()
            query = """INSERT INTO tb_mhs (mhs_2, mhs_3, prodi_1, mhs_4, mhs_5, mhs_6, mhs_7, mhs_8) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
            cursor.execute(query, (nim, nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now()))
            conn.commit()
            cursor.close()

            flash ('Data Mahasiswa '+nim+' Berhasil Ditambah!')
            return redirect(url_for('mhs'))
        else:
            if file and allowed_file(file.filename):
                img_name = secure_filename(file.filename)
                file.save(os.path.join(mhs_direktori, img_name))

                cursor = conn.cursor()
                query = """INSERT INTO tb_mhs (mhs_2, mhs_3, prodi_1, mhs_4, mhs_5, mhs_6, mhs_7, mhs_8) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
                cursor.execute(query, (nim, nama, id_prodi, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now()))
                conn.commit()
                cursor.close()

                flash ('Data Mahasiswa '+nim+' Berhasil Ditambah!')
                return redirect(url_for('mhs'))
            else:
                flash ('Ekstensi gambar tidak diperbolehkan!')
                return redirect(url_for('mhs'))
    except Exception as e:
        return {'error': str(e)}

@app.route('/admin/edit-mhs', methods=['POST'])
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
                file.save(os.path.join(mhs_direktori, img_name))

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
def delete_mhs():
    if request.method == 'POST':
        id_mhs = request.form['id_mhs']

        cursor = conn.cursor()
        query = """DELETE FROM tb_mhs WHERE mhs_1 =%s """ % (id_mhs)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data Mahasiswa '+id_mhs+' Berhasi Dihapus!')
        return redirect(url_for('mhs'))

@app.route('/admin/dosen', methods=['GET', 'POST'])
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
    query = """SELECT * FROM tb_dosen"""
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

    return render_template('admin/dosen.html', dosen=data, nid=nid)

def ins_dsn(nid, nama, tmpt_lhr, tgl_lhr, alamat, file):
    try:
        if file.filename == "":
            img_name="None"
            cursor = conn.cursor()
            query = """INSERT INTO tb_dosen (dsn_2, dsn_3,dsn_4, dsn_5, dsn_6, dsn_7, dsn_8) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
            cursor.execute(query, (nid, nama, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now()))
            conn.commit()
            cursor.close()

            flash ('Data Dosen '+nim+' Berhasil Ditambah!')
            return redirect(url_for('dosen'))
        else:
            if file and allowed_file(file.filename):
                img_name = secure_filename(file.filename)
                file.save(os.path.join(dsn_direktori, img_name))

                cursor = conn.cursor()
                query = """INSERT INTO tb_dosen (dsn_2, dsn_3,dsn_4, dsn_5, dsn_6, dsn_7, dsn_8) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
                cursor.execute(query, (nid, nama, tmpt_lhr, tgl_lhr, alamat, img_name, datetime_now()))
                conn.commit()
                cursor.close()

                flash ('Data Dosen '+nim+' Berhasil Ditambah!')
                return redirect(url_for('dosen'))
            else:
                flash ('Ekstensi gambar tidak diperbolehkan!')
                return redirect(url_for('mhs'))
    except Exception as e:
        return {'error': str(e)}

@app.route('/admin/edit-dsn', methods=['POST'])
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
def delete_dsn():
    if request.method == 'POST':
        id_dsn = request.form['id_dsn']

        cursor = conn.cursor()
        query = """DELETE FROM tb_dosen WHERE dsn_1 =%s """ % (id_dsn)
        cursor.execute(query)
        conn.commit()
        cursor.close()

        flash ('Data Dosen '+id_dsn+' Berhasi Dihapus!')
        return redirect(url_for('dosen'))

@app.route('/admin/makul', methods=['GET', 'POST'])
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
    query = """SELECT * FROM fklts_prodi"""
    cursor.execute(query)
    data1 = cursor.fetchall()
    cursor.close()
    return render_template('admin/makul.html', makul=data, fklts_prodi=data1)

@app.route('/admin/edit-makul', methods=['POST'])
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
def kelas():
    if request.method == 'POST':
        nm_kls = request.form['nm_kls']
        id_mkl = request.form['id_mkl']
        kuota = request.form['kuota']

        cursor = conn.cursor()
        query = """INSERT INTO tb_kelas (kls_2, mkl_1, kls_3, kls_4, kls_5) VALUES (%s, %s, %s, %s, %s)"""
        cursor.execute(query, (nm_kls, id_mkl, kuota, kuota, datetime_now()))
        conn.commit()
        cursor.close()

        flash ('Data Kelas Berhasil Ditambah!')
        return redirect(url_for('kelas'))

    cursor = conn.cursor()
    query = """SELECT * FROM form_kelas"""
    cursor.execute(query)
    data =cursor.fetchall()
    query = """SELECT * FROM prodi_makul"""
    cursor.execute(query)
    data1 = cursor.fetchall()
    cursor.close()
    return render_template('admin/kelas.html', kelas=data, prodi_makul=data1)

@app.route('/admin/edit-kelas', methods=['POST'])
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
