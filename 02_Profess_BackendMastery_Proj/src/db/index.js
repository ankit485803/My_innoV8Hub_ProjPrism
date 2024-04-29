
import mongoose from "mongoose";
import { DB_NAME } from "../constants.js";




const connectDB = async () => {
    try {
        const connectionInstance = await mongoose.connect(`${process.env.MONGODB_URI}/${DB_NAME}`)
        console.log(`\n MongoDB IS CONNECTED succesfully ANKIT KUMAR OKKKK JIII!! DB HOST: ${connectionInstance.connection.host}`);

    } catch (error) {
        console.log("MongoDB CONNECTION ERROR happen Ankit solve it quickly :", error);
        process.exit(1)
    }
}


export default connectDB