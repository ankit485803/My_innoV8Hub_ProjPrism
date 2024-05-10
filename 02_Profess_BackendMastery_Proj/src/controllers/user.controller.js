

import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/ApiError.js";
import { User } from "../models/user.models.js";
import { uploadOnCloudinary } from "../utils/cloudinary.js";
import { ApiResponse } from "../utils/ApiResponse.js";



const registerUser = asyncHandler(async (req, res) => {
    // step to follow Ankit, algorithms : 

    // step1:  GET USER DETAILS FROM FRONTEND
    // step2:  validation - not empty
    // step3:  check if user already exists: username, email
    // step4:  check for images , check for avatar
    // step5:  upload them to cloudinary, avatar
    // step6:   create user object - create entry in db
    // step7:  remove password and refresh token field from response
    // step8:  check for user creation
    // step9:  return  res


    const { fullName, email, username, password } = req.body
    console.log("email", email);

    if (
        [fullName, email, username, password].some((field) =>
            field?.trim() === "")
    ) {
        throw new ApiError(400, "All fields are required")

    }

    const existedUser = User.findOne({
        $or: [{ username }, { email }]
    })

    if (existedUser) {
        throw new ApiError(409, "User with email or username already exist")
    }

    const avatarLocalPath = req.body.files?.avatar[0]?.path;
    const coverImageLocalPath = req.files?.coverImage[0]?.path;

    if (!avatarLocalPath) {
        throw new ApiError(400, "Avatar file is required")
    }

    const avatar = await uploadOnCloudinary(avatarLocalPath)
    const coverImage = await uploadOnCloudinary(coverImageLocalPath)

    if (!avatar) {
        throw new ApiError(409, "User with email or username already exist")

    }

    //storing on db 
    const user = await User.create({
        fullName,
        avatar: avatar.url,
        coverImage: coverImage?.url || "",
        email,
        password,
        username: username.toLowerCase()
    })

    //checking user created successfully or not using moongose db id
    const createdUser = await User.findById(user._id).select(
        "-password -refreshToken"
    )

    if (!createdUser) {
        throw new ApiError(500, "something went wrong while registering the user")
    }

    //final returning res
    return res.status(201).json(
        new ApiResponse(200, createdUser, "User is registered successfully")
    )




})




//exporting not as DEFAULTS
export { registerUser }
