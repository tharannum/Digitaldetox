import mysql.connector
from dotenv import load_dotenv
import os
from contextlib import contextmanager

load_dotenv()

DATABASE_HOST = os.getenv('DATABASE_HOST')
PORT = os.getenv('PORT')
USERNAME = os.getenv('DB_USERNAME')
PASSWORD = os.getenv('PASSWORD')
DATABASE = os.getenv('DATABASE')

@contextmanager
def get_cursor(commit=False):
    try:
        connection = mysql.connector.connect(
            host=DATABASE_HOST,
            port=PORT,
            user=USERNAME,
            password=PASSWORD,
            database=DATABASE
        )
        cursor = connection.cursor(dictionary=True)
        yield cursor

        if commit:
            connection.commit()

        print("Closing connection...")
        cursor.close()
        connection.close()
    except Exception as e:
        print(e)
        yield None

def calculate_total(user_id):
    with get_cursor() as cursor:
        cursor.execute('SELECT * FROM user_responses WHERE user_id=%s', (user_id,))
        user_responses = cursor.fetchall()
        print(user_responses)

if __name__ == "__main__":
    calculate_total(1)