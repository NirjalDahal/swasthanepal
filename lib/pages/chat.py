import os 
import google.generativeai as genai 
from dotenv import load_dotenv
from fastapi import FastAPI
from pydantic import BaseModel


load_dotenv()
api_key = os.getenv('API_KEY')

genai.configure(
    api_key=api_key
)

sys_instruct='''
You are a helpful and reassuring Virtual Health Assistant within a medical application. Provide users with basic medical information, answer common health questions, and offer general wellness advice.  Guide users to *only* those resources and features that are *actually available* within the app. Do NOT suggest or imply the existence of services that are not implemented (e.g., if there's no appointment booking feature, do not mention it).  You are NOT a doctor. Do NOT diagnose, prescribe, or give specific medical advice. If a user describes symptoms or concerns, advise them to consult a healthcare professional. Maintain a friendly, empathetic, and professional tone. Keep responses brief (3-5 sentences). No markdown.
'''

model = genai.GenerativeModel(
    "models/gemini-2.0-flash", 
    system_instruction=sys_instruct
)

app = FastAPI() 
class PromptRequest(BaseModel):
    prompt: str 

@app.get("/")
async def get_response():
    return {
        "hello": "World"
    }

@app.post('/chatAPI')
async def generate_response(
    request: PromptRequest
):
    response = model.generate_content(
        contents=request.prompt
    )
    return {"response": response.text}


if __name__ == "__main__":
    import uvicorn 
    uvicorn.run(
        app, host="127.0.0.1", port=8000
    )

