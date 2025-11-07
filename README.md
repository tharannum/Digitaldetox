
# 🧠 Digital Addiction Score Project  

## 📋 Overview  
The **Digital Detox Score** project is an interactive web application designed to help users evaluate their digital dependency levels.  
It provides personalized insights based on their responses to behavioral questions and visualizes the results through engaging data analytics.  

---

## ⚙️ Tech Stack  

| Tool | Purpose |
|------|----------|
| **MySQL Workbench (SQL)** | Stores questions, user responses, and calculated scores |
| **Python (FastAPI / Backend)** | Manages quiz logic, API routes, and communication between frontend and database |
| **Pandas** | Handles score calculation, data aggregation, and statistical insights |
| **Streamlit** | Builds an intuitive and responsive frontend interface for users |
| **Streamlit** | Generates interactive visualizations and charts for result interpretation |

---

## 🏗️ Project Architecture  

```

Digital-Detox-Score/
│
├── backend/
│   ├── main.py               # FastAPI backend logic
│   ├── db_connection.py      # MySQL connection setup
│   ├── models.py             # Database models (tables: questions, participants, responses)
│   └── utils.py              # Scoring and calculation helpers
│
├── frontend/
│   ├── app.py                # Streamlit UI
│   ├── components/           # UI sections (quiz page, results page)
│   └── visuals.py            # Plotly chart functions
│
├── data/
│   ├── questions.sql         # SQL file for all quiz questions
│   └── responses.csv         # (Optional) exported response data for analysis
│
├── requirements.txt          # All dependencies
└── README.md                 # Project documentation

````

---

## 💾 Database Design  

### Tables:
**👤 users**
| Column     | Type         | Description          |
| ---------- | ------------ | -------------------- |
| user_id    | INT (PK, AI) | Unique user ID       |
| user_email | VARCHAR(100) | Unique email address |
| user_name  | VARCHAR(100) | Unique username      |
 

**❓ questions**
| Column        | Type         | Description                                  |
| ------------- | ------------ | -------------------------------------------- |
| question_id   | INT (PK, AI) | Unique question ID                           |
| question_text | VARCHAR(400) | Text of the question                         |
| weightage     | INT          | Importance or scoring weight of the question |


**🧩 question_options**
| Column          | Type                             | Description                                  |
| --------------- | -------------------------------- | -------------------------------------------- |
| question_id     | INT (FK → questions.question_id) | Links to the question this option belongs to |
| option_label    | CHAR(1)                          | Option label (A, B, C, D, etc.)              |
| option_text     | VARCHAR(255)                     | Text of the answer choice                    |
| **Primary Key** | *(question_id, option_label)*    | Ensures each option per question is unique   |


**📝 user_responses**
| Column          | Type                             | Description                                  |
| --------------- | -------------------------------- | -------------------------------------------- |
| user_id         | INT (FK → users.user_id)         | User who answered                            |
| question_id     | INT (FK → questions.question_id) | Question being answered                      |
| selected_option | CHAR(1)                          | Option chosen by the user (A, B, C, D, etc.) |
| **Primary Key** | *(user_id, question_id)*         | Ensures one response per question per user   |


---

## 🚀 How It Works  

1. **User takes quiz**  
   - Streamlit interface displays questions fetched from MySQL.  
   - Each answer carries a predefined score.

2. **Score calculation (Pandas)**  
   - Total and percentage scores are computed dynamically.  
   - Categorization:  
     - **0–30% → Light Dependency**  
     - **31–70% → Moderate Dependency**  
     - **71–100% → High Dependency**

3. **Result Visualization (Streamlit)**  
   - Interactive pie chart, gauge, or bar chart displays user’s digital dependency level.  

4. **Data storage (SQL)**  
   - All user responses and final scores are saved in MySQL Workbench.

---

## 🧩 Setup Instructions  

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/tharannum/digitaldetox.git
cd digitaldetox
````

### 2️⃣ Create Virtual Environment & Install Dependencies

```bash
python -m venv venv
source venv/bin/activate   # (for Mac/Linux)
venv\Scripts\activate      # (for Windows)
pip install -r requirements.txt
```

### 3️⃣ Configure Database

* Create a MySQL database (e.g., `digital_detox`)
* Run `questions.sql` to populate the question set
* Update your database credentials in `db_connection.py`

### 4️⃣ Run Backend

```bash
uvicorn backend.main:app --reload
```

### 5️⃣ Launch Frontend (Streamlit)

```bash
streamlit run frontend/app.py
```

---

## 📊 Example Visualization

* **Bar chart:** score distribution across categories
* **Gauge chart:** user’s digital dependency percentage
* **Pie chart:** time usage across device types

---

## 🧠 Future Enhancements

* Personalized digital detox plans
* User login and history tracking
* Weekly email progress updates
* AI-powered digital habit recommendations

---

## 🪄 Author

Developed using **Python, FastAPI, MySQL, Streamlit, Plotly, and Pandas**
by Tharannum and Team ✨

---
 
