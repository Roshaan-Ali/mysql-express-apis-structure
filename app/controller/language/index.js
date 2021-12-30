const express = require('express');
const languagesController = require("./language.controller");

const { authMiddleware } = require("../../middleware/auth.middleware");
const { roleMiddleware } = require("../../middleware/role.middleware");
const ValidationMiddleware = require("../../middleware/validation.middleware")

const validation = new ValidationMiddleware();

const languagesRouter = express.Router();

// languagesRouter.use(
//     authMiddleware.isAuthenticated(),
//     validation.validateUserByIdCheckDB(),
//     roleMiddleware.isAdmin()
// );

// languagesRouter.post("/create",
//     validation.validateCreateLanguageJoi(),
//     languagesController.create
// );

// languagesRouter.get("/get/:id",
//     rolesController.get
// );

// languagesRouter.get("/gets",
//     languagesController.gets
// );

// languagesRouter.delete("/delete/:id",
//     validation.validateLanguageByIDDB(),
//     languagesController.delete
// );

// languagesRouter.put("/update/:id",
//     validation.validateLanguageByIDDB(),
//     validation.validateCreateLanguageJoi(),
//     languagesController.update
// );

module.exports = languagesRouter;