#! usr/bin/env python3

from flask import Flask, render_template, request
from lists import files

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/swing')
def swing():
    return render_template('swing.html')

@app.route('/latin')
def latin():
    return render_template('latin.html')

@app.route('/musette')
def musette():
    return render_template('musette.html')

@app.route('/reels')
def reels():
    return render_template('reels.html')

@app.route('/jigs')
def jigs():
    return render_template('jigs.html')

@app.route('/hornpipes')
def hornpipes():
    return render_template('hornpipes.html')

@app.route('/strathspeys')
def strathspeys():
    return render_template('strathspeys.html')

@app.route('/page', methods=['GET', 'POST'])
def page():
    return render_template('page.html', files=files)


