

from langchain_anthropic import ChatAnthropic
from dotenv import load_dotenv

load_dotenv()


# https://docs.anthropic.com/en/api/overview

model = ChatAnthropic(model='claude-3-5-sonnet-20241022')

result = model.invoke('What is the capital of India')


print(result.content)