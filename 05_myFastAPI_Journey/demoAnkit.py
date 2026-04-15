
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


# takeEg
teas: List[Tea] = []


# homeRoute api
@app.get("/")
def read_root():
    return {"message": "welcome to chai aur code"}


# take second route
@app.get("/teas")
def get_teas():
    return teas


@app.put("/teas/{tea_id}")
def update_tea(tea_id: int, update_tea: Tea):
    for index, tea in enumerate(teas):
        if tea.id == tea_id:
            teas[index] = update_tea
            return update_tea
    return {"error": "Tea not found"}


@app.delete("/teas/{tea_id}")
def delete_tea(tea_id: int):
    for index, tea in enumerate(teas):
        if tea_id == tea_id:
            deleted = teas.pop(index)
            return deleted
    return {"error": "Tea not found"}         