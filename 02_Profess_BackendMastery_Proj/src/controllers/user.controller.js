

import { asyncHandler } from "../utils/asyncHandler.js";


const registerUser = asyncHandler(async (req, res) => {
    res.status(200).json({
        message: "Okkk, all right ankit boss apka postman ka concept clear hai "
    })
})







//exporting not as DEFAULTS
export { registerUser }
