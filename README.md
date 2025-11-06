
# 🧠 Digital Detox Score Project  

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
**1️⃣ participants**
| Column | Type | Description |
|--------|------|--------------|
| id | INT (PK, AI) | Unique participant ID |
| name | VARCHAR(100) | Participant name |
| email | VARCHAR(100) | Email address |
| age | INT | Participant age |
| score | INT | Final score |
 

**2️⃣ questions**
| Column | Type | Description |
|--------|------|--------------|
| id | INT (PK, AI) | Question ID |
| option_a | VARCHAR(255) | Option A |
| option_b | VARCHAR(255) | Option B |
| option_c | VARCHAR(255) | Option C |
| option_d | VARCHAR(255) | Option D |
| score_a | INT | Score for Option A |
| score_b | INT | Score for Option B |
| score_c | INT | Score for Option C |
| score_d | INT | Score for Option D |
| weightage | INT| Total Score |

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
git clone https://github.com/tharannum/digital-Addiction-score.git
cd digital-Addiction-score
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
 
