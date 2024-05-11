

import { v2 as cloudinary } from "cloudinary"
import fs from "fs"




cloudinary.config({
    cloud_name: process.env.CLUDINARY_CLOUD_NAME,
    api_key: process.env.CLUDINARY_API_KEY,
    api_secret: process.env.CLUDINARY_API_SECRETE
});


const uploadOnCloudinary = async (localFilePath) => {
    try {
        if (!localFilePath) return null
        //upload file on cloudinary
        const response = await cloudinary.uploader.upload(localFilePath, {
            resource_type: "auto"
        })

        //file have been uploaded successfully
        console.log("File is uploaded on cloudinary",
        response.url);
        return response;
        fs.unlinkSync()


    } catch (error) {
        fs.unlinkSync(localFilePath)  //remove locally saved temp file
        return null;
    }
}









//exporting
export { uploadOnCloudinary }

