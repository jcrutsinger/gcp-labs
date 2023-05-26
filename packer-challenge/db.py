	
import sqlite3
 
conn = sqlite3.connect('/home/example.db')
c = conn.cursor()
 
c.execute('''CREATE TABLE students
             (name text)''')
 
conn.commit()
conn.close()