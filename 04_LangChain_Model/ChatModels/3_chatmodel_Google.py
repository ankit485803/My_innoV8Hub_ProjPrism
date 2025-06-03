

from langchain_google_genai import ChatGoogleGenerativeAI
from dotenv import load_dotenv

load_dotenv()

model = ChatGoogleGenerativeAI(model = 'germin-1.5-pro')

result = model.invoke('what is capital of India')

print(result.content)