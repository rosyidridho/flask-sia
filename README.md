#SIA (Sistem Informasi Akademik) dengan Flask (micro web framework Python)
---
![image](https://photos-4.dropbox.com/t/2/AAALYa_Qgil6n9PKnhO5B5hFMFV2aQpR56ZuN3H5HSw3Iw/12/538547643/png/32x32/3/1489849200/0/2/screencapture-localhost-admin-1489830381901.png/EI6pwKcEGM0jIAIoAg/sOTsYS2b4qO0puClGr0saI8GzR5p1htfor_x_G7bbYs?dl=0&size=1280x960&size_mode=3)

# Cara Install SIA
---
**Requirement**

1. Flask==0.12

2. Jinja2==2.9.5

3. MySQL-python==1.2.5

4. Werkzeug==0.11.15



# Install SIA ke localhost
---

**Copy Source Code**

`git clone https://github.com/rosyidridho/flask-sia.git`

**Intall Vitualenv**

`$ virtualenv venv`

`$ source venv/bin/activate`

**Install packages yang dibutuhkan**

`(venv)$ pip install -r requirements.txt`

**Setup**

1. Buat Database Baru

2. Ubah koneksi database pada file config.json

3. Eksekusi query database pada file query.txt (Manual) atau import 'Dump20170318.sql'

**Menjalankan SIA di localhost**

`(venv)$ python run.py`
