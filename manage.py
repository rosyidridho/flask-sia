from flask_script import Manager
from werkzeug.security import generate_password_hash
from app import app
from app.config import koneksi
import getpass
import sys

manager = Manager(app)
@manager.command
def create_admin():
    while True:
        u = raw_input("Username: ")
        if not u:
            print "Masukkan Username!"
            continue
        break
    while True:
        p = getpass.getpass(stream=sys.stderr)
        if not p:
            print "Masukkan Password!"
            continue
        else:
            p2 = getpass.getpass('Ulangi Password: ')
            if str(p2) != str(p):
                print "Password Tidak Sama, Ulangi."
                continue
            break

    cursor = koneksi.cursor()
    query = """insert into tb_user (usr_2, usr_3, usr_4, usr_5, usr_6) VALUES (%s, %s, 1, 1, CURRENT_TIMESTAMP())"""
    cursor.execute(query, (u, generate_password_hash(p)))
    koneksi.commit()
    cursor.close()

    print "Berhasil!"

if __name__ == '__main__':
    manager.run()
