from fastapi import FastAPI
import db_helper
from pydantic import BaseModel
from typing import List

class AnswerItem(BaseModel):
    question_id: int
    selected_option: str

class AnswerSubmission(BaseModel):
    answers: List[AnswerItem]

app = FastAPI()

@app.post("/submit_answers", response_model=int)
async def submit_answers(data: AnswerSubmission):
    # Step 1: Create a new user in DB
    user_id = db_helper.create_new_user()

    print(data.answers)


    # Step 2: Save answers with this user_id
    for ans in data.answers:
        db_helper.save_user_answer(
            user_id=user_id,
            question_id=ans.question_id,
            selected_option=ans.selected_option
        )

    # Step 3: Calculate score
    score = db_helper.fetch_user_total_score(user_id)
    score = int(score['weighted_score'])

    # Step 4: Return the score
    return score

