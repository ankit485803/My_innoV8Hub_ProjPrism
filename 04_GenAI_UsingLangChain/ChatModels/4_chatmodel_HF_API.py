

from langchain_huggingface import ChatHuggingFace, HuggingFaceEndpoint
from dotenv import load_dotenv

load_dotenv()


# https://huggingface.co/TinyLlama/TinyLlama-1.1B-Chat-v1.0

llm = HuggingFaceEndpoint (
    repo_id="TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    task="text-generation"
)


# yaha se main part hota hai bhai
model = ChatHuggingFace(llm=llm)

result = model.invoke("What is the capital of India")

print(result.content)