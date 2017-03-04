from flask import Flask, url_for, render_template
from app import *

@app.route('/')
def index():
    return render_template('blank.html')
