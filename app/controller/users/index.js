const express = require('express');

const { appMiddleware } = require("../../middleware/app.middleware");
// const { authMiddleware } = require("../../middleware/auth.middleware");
const ValidationMiddleware = require("../../middleware/validation.middleware")
const usersController = require("./user.controller");
const usersRouter = express.Router();
const validation = new ValidationMiddleware();


usersRouter.post("/register",
    validation.validateUserRegistration(),
    usersController.register,
);

usersRouter.post("/signin",
    validation.validateUserLogin(),
    usersController.login,
);

usersRouter.post("/verify",
    validation.validateUserVerifyJoi(),
    usersController.verify,
);

usersRouter.post("/forgetPassword",
    validation.validateForgetPasswordJoi(),
    usersController.forgetPassword,
);

usersRouter.post("/resetPassword",
    validation.validateResetPasswordJoi(),
    usersController.resetPassword,
);

usersRouter.delete("/authDel/:id",
    usersController.authDel,
);

usersRouter.delete("/phoneDel/:id",
    usersController.deletePhone,
);

usersRouter.post("/profileImage",
    // authMiddleware.isAuthenticated(),
    // validation.validateUserByIdCheckDB(),
    appMiddleware.upload(),
    usersController.uploadImage,
);

// usersRouter.post("/changePassword",
//     authMiddleware.isAuthenticated(),
//     validation.validateUserByIdCheckDB(),
//     validation.validateUserChangePassword(),
//     usersController.changePassword,
// );

module.exports = usersRouter;