import MySQLdb as mysql

UPLOAD_FOLDER = 'app/static/uploads/'
ALLOWED_EXTENSIONS = set(['jpg', 'JPG', 'png', 'PNG'])

koneksi = mysql.connect("localhost","root","20022013","sia" )
