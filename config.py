import MySQLdb as mysql

"""MYSQL_DATABASE_USER = 'root'
MYSQL_DATABASE_PASSWORD = '20022013'
MYSQL_DATABASE_DB = 'db_sia'
MYSQL_DATABASE_HOST = 'localhost'"""

UPLOAD_FOLDER = 'app/uploads/'
ALLOWED_EXTENSIONS = set(['jpg', 'JPG', 'png', 'PNG'])

koneksi = mysql.connect("localhost","root","20022013","db_sia" )
