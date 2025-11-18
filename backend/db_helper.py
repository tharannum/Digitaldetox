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

def create_new_user():
    with get_cursor(commit=True) as cursor:
        cursor.execute("INSERT INTO users () VALUES ()")
        return cursor.lastrowid  # auto-incremented ID


def save_user_answer(user_id, question_id, selected_option):
    with get_cursor(commit=True) as cursor:
        cursor.execute("""
            INSERT INTO user_responses (user_id, question_id, selected_option)
            VALUES (%s, %s, %s)
        """, (user_id, question_id, selected_option))

def fetch_user_total_score(user_id):
    with get_cursor() as cursor:
        cursor.execute("""
            SELECT 
                SUM(
                    q.weightage * 
                    CASE
                        WHEN ur.selected_option = 'A' THEN 1
                        WHEN ur.selected_option = 'B' THEN 2
                        WHEN ur.selected_option = 'C' THEN 3
                        WHEN ur.selected_option = 'D' THEN 4
                    END
                ) AS weighted_score
            FROM questions q
            JOIN user_responses ur
                ON ur.question_id = q.question_id
            WHERE ur.user_id = %s
            GROUP BY ur.user_id;
        """, (user_id,))
        
        result = cursor.fetchone()
        return result if result else 0


if __name__ == "__main__":
    print(fetch_user_total_score(1))