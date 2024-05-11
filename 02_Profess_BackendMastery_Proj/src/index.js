
// require('dotenv').config({path: './env'})
import dotenv from "dotenv"
import connectDB from "./db/index.js";
import { app } from "./app.js";

dotenv.config({
    path: './.env'
})

connectDB()
    .then(() => {
        app.listen(process.env.PORT || 8000, () => {
            console.log(`Server is running at port : ${process.env.PORT}`);
        })
    })
    .catch((err) => {
        console.log("MONGO DB CONNECTION FAILED ITTT !!");
    })















/* method: 1
import express from "express"
const app = express()

    // or by IFE
    (async () => {
        try {

            await mongoose.connect(`${process.env.MONGODB_URI}/$
        {DB_NAME}`)

            app.on("error", (error) => {
                console.log("Our apps is not able to talk to database:", error)
                throw error
            })

            app.listen(process.env.PORT, () => {
                console.log(`App is listening on port $
            {process.env.PORT}`);
            })

        } catch (error) {
            console.error("ERROR", error)
            throw err
        }
    })()

*/