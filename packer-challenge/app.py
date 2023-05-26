from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/submit', methods = ['POST'])
def submit():
    name = request.form['name']
    conn = sqlite3.connect('/home/example.db')
    c = conn.cursor()
    c.execute("INSERT INTO students (name) VALUES (?)", (name,))
    conn.commit()
    conn.close()
    return 'Success!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
