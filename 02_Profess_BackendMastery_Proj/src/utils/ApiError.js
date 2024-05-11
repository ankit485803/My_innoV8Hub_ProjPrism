

class ApiError extends Error {
    constructor(
        statusCode,
        message = "Something wend wrong okkk ",
        error = [],
        stack = ""
    ) {
        super(message)
        this.statusCode = statusCode
        this.data = null
        this.message = message
        this.success = false;
        this.error = error

        if (stack) {
            this.stack = stack
        } else {
            Error.captureStackTrace(this, this.constructor)
        }
    }
}



// exporting at last , to kis liye kiye h kam
export {ApiError}