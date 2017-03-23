import MySQLdb as mysql
import os
import json

def open_file(dir):

    try:
        if dir.split('.')[1] == 'json':
            with open(dir) as config:
                data_conf = json.loads(config.read())
        else:
            with open(dir) as config:
                data_conf = config.read()
    except Exception as e:
        raise e
    return data_conf

DIR = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
FILE_CONFIG = os.path.join(DIR, 'config.json')
data = open_file(FILE_CONFIG)

def create_database():
    kon = mysql.connect(
        host = data['db']['db_host'],
        user = data['db']['db_user'],
        passwd = data['db']['db_password']
    )

    cursor = kon.cursor()
    query = """CREATE DATABASE %s""" % (data['db']['db_name'])
    cursor.execute(query)
    kon.commit()
    cursor.close()
    kon.close()

def create_table():
    DIR = os.path.dirname(os.path.realpath(__file__))
    FILE_TABLE = os.path.join(DIR, 'tabel.sql')
    table_conf = open_file(FILE_TABLE)

    kon = mysql.connect(
        host = data['db']['db_host'],
        user = data['db']['db_user'],
        passwd = data['db']['db_password'],
        db = data['db']['db_name']
    )
    for t in table_conf.split(';'):
        cursor = kon.cursor()
        cursor.execute(t)
        kon.commit()
        cursor.close()
    kon.close()

def create_view():
    DIR =os.path.dirname(os.path.realpath(__file__))
    FILE_VIEW = os.path.join(DIR, 'view.sql')
    view_conf = open_file(FILE_VIEW)

    kon = mysql.connect(
        host = data['db']['db_host'],
        user = data['db']['db_user'],
        passwd = data['db']['db_password'],
        db = data['db']['db_name']
    )
    for v in view_conf.split(';'):
        cursor = kon.cursor()
        cursor.execute(v)
        kon.commit()
        cursor.close()
    kon.close()


def create_prosedur():
    DIR = os.path.dirname(os.path.realpath(__file__))
    FILE_PROS = os.path.join(DIR, 'prosedur.sql')
    queries = []
    delimiter = ';'
    query = ''

    kon = mysql.connect(
        host = data['db']['db_host'],
        user = data['db']['db_user'],
        passwd = data['db']['db_password'],
        db = data['db']['db_name']
    )

    cursor = kon.cursor()

    with open(FILE_PROS, 'r') as f:
        for line in f.readlines():
            line = line.strip()
            if line.startswith('DELIMITER'):
                delimiter = line[10:]
            else:
                query += line+'\n'
                if line.endswith(delimiter):
                    # Get rid of the delimiter, remove any blank lines and add this query to our list
                    queries.append(query.strip().strip(delimiter))
                    query = ''
    for query in queries:
        if not query.strip():
            continue
        cursor.execute(query)
    cursor.close()

if __name__ =='__main__':
    try:
        print "Creating database..."
        create_database()
        print "Done."
        print "Creating table..."
        create_table()
        print "Done."
        print "Creating view..."
        create_view()
        print "Done."
        print "Creating procedure..."
        create_prosedur()
        print "Done."
    except Exception as e:
        print e
    finally:
        print "Database Berhasil Dibuat!"
