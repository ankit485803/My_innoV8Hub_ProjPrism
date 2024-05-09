
import express from "express"
import cors from "cors"
import cookieParser from "cookie-parser"

const app = express()


//cors doing
app.use(cors({
    origin: process.env.CORS_ORIGIN,
    credentials: true
}))

app.use(express.json({limit: "16kb"}))
//url se data comming
app.use(express.urlencoded({extended: true, limit: "16kb"}))

app.use(express.static("public"))
app.use(cookieParser())


// routes importing

import userRouter from './routes/user.routes.js'


//routes declaration , middleware need hai yaha
// app.use("/users", userRouter)
app.use("/api/v1/users", userRouter)



//    http://localhost:8000/users/register
//    http://localhost:8000/users/login
//    http://localhost:8000/api/v1/users/register


//exporting app as not DEFAULT
export { app }