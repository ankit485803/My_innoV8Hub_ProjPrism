
# 


from langchain_openai import OpenAIEmbeddings
from dotenv import load_dotenv
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np

load_dotenv()

embedding = OpenAIEmbeddings(model='text-embedding-3-large', dimensions=300)

document = [
    "Virat Kohli is an Indian cricketer known for his aggressive batting and leadership.",
    "MS Dhoni is a former Indian caption famous for his calm demeaor and finishing skills."
    "Sachin Tendulkar, is also known as the 'God of Cricket', hold many batting records. "
    "Rohit Sharma is known for his elegant batting and record-breaking double centuries. "
    "Jasprit Bumrah is an Indian fast bowler known for his unorthodox action and yorker. "
]



query = 'Tell me about Virat Kohli'

doc_embeddings = embedding.embed_documents(document)
query_embedding = embedding.embed_query(query)

scores = cosine_similarity([query_embedding], doc_embeddings)[0]

# print(list(enumerate(scores)))

# print(sorted(list(enumerate(scores))), key=lambda x:x[1][-1])


index, score = sorted(list(enumerate(scores))), key=lambda x:x[1][-1]
print(query)
print(document[index])
print("Similarity score is:", score)