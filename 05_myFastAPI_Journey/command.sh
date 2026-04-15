
# create and activate venv locally
python -m venv venv

.\venv\Scripts\Activate


# install dependencies 
(venv) PS C:\Users\sanja\Desktop\GitProj\My_innoV8Hub_ProjPrism> pip install fastapi uvicorn 

# GENERATE the reqFile jo automatic mana deta hai best part learn from chaiAurCodeHiteshSir
pip freeze > requirements.txt

# to run the app server
uvicorn main:app --reload


# stop venv
(venv) PS C:\Users\sanja\Desktop\GitProj\My_innoV8Hub_ProjPrism\05_myFastAPI_Journey> deactivate
PS C:\Users\sanja\Desktop\GitProj\My_innoV8Hub_ProjPrism\05_myFastAPI_Journey>