from .get_text import (
    get_eng_q1_body1,
    get_eng_q2_body2,
    get_eng_q3_body3,
    get_eng_q4_body4,
    get_grading_criteria1,
    get_grading_criteria2,
    get_grading_criteria3,
    get_grading_criteria4,
    get_kor_q1_body1,
    get_kor_q2_body2,
    get_kor_q3_body3,
    get_kor_q4_body4,
    get_answer_1_1,
    get_answer_1_2,
    get_answer_1_3,
    get_answer_1_4,
    get_answer_2_1,
    get_answer_2_2,
    get_answer_2_3,
    get_answer_2_4,
    get_answer_3_1,
    get_answer_3_2,
    get_answer_3_3,
    get_answer_3_4,
)
from dotenv import load_dotenv
from openai import OpenAI

import os

load_dotenv()

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def ask_question(question):
    try:
        response = client.chat.completions.create(
            temperature=0, # 답변 고정
            model="gpt-4o",
            messages=[
                {"role": "system", "content": "너는 논술 답안을 평가하는 채점자야"},
                {"role": "user", "content": question}
            ]
        )
        
        # 응답에서 텍스트 추출
        answer = response.choices[0].message.content
        return answer
    
    except Exception as e:
        return f"An error occurred: {str(e)}"


if __name__ == "__main__":
    user_question = f"""
    다음의 논술문제가 있다.

    {get_kor_q4_body4()} 
    ----------  

    논술 문제에 대한 답안은 다음과 같다. 

    {get_answer_3_4()}
    ----------

    논술 답안을 평가하는 평가 기준은 다음과 같다.

    {get_grading_criteria4()}
    ----------

    각 평가기준을 만족하면 O 만족하지 못하면 X 표시하고 이유를 설명해라.
    """
    response = ask_question(user_question)
    print(f"답변: {response}")

    with open('files/q4_grading_3_4.txt', 'w') as file:
        file.write(response)

