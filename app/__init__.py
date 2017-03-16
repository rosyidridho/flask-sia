from flask import Flask
#from flaskext.mysql import MySQL
import MySQLdb as mysql

app = Flask(__name__, static_folder='static')
#mysql = MySQL()
#mysql.init_app(app)
app.secret_key = 'some_secret'
app.config.from_object('config')

from app import views
