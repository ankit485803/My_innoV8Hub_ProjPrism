

# call reqModule
from fastapi import FastAPI
from pydantic import BaseModel
from typing import List


# assign
app = FastAPI()

class Tea(BaseModel):
    id: int
    name: str
    origin: str


# takeEg - in-memory storage
teas: List[Tea] = []


# homeRoute api
@app.get("/")
def read_root():
    return {"message": "welcome to chai aur code"}


# GET all teas
@app.get("/teas")
def get_teas():
    return teas


# GET single tea by id
@app.get("/teas/{tea_id}")
def get_tea(tea_id: int):
    for tea in teas:
        if tea.id == tea_id:
            return tea
    return {"error": "Tea not found"}


# POST - Create new tea
@app.post("/teas")
def add_tea(tea: Tea):
    teas.append(tea)
    return tea


# PUT - Update tea
@app.put("/teas/{tea_id}")
def update_tea(tea_id: int, updated_tea: Tea):
    for index, tea in enumerate(teas):
        if tea.id == tea_id:  # Fixed: was using = instead of ==
            teas[index] = updated_tea
            return updated_tea
    return {"error": "Tea not found"}


# DELETE - Remove tea
@app.delete("/teas/{tea_id}")
def delete_tea(tea_id: int):
    for index, tea in enumerate(teas):
        if tea.id == tea_id:  # Fixed: was comparing tea_id == tea_id (always true!)
            deleted = teas.pop(index)
            return deleted
    return {"error": "Tea not found"}