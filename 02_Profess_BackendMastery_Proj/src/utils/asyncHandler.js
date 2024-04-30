

const asyncHandler = (requestHandler) => {
    (req, res, next) => [
        Promise.resolve(requestHandler(req, res, next )).catch((err) => next(err))
    ]
}











export {asyncHandler}




/*
concept clear Ankit jiiii
const asyncHandler = () => {}
const asyncHandler = (funct) => () => {}
const asyncHandler = (funct) => async () => {}
*/


// HIGHER ORDER FUNCTION

/* TRY CATCH WALA CONCEPT
const asyncHandler = (fn) => async (req, res, next) => {
    try {
        await fn(req, res, next)


    } catch (error) {
        res.status(err.code  || 500).json({
            success: false,
            message: err.message
        })
    }
}

*/