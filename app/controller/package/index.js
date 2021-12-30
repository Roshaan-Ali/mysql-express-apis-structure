const express = require("express");
const packageController = require("./package.controller");

// const { authMiddleware } = require("../../middleware/auth.middleware");
// const { roleMiddleware } = require("../../middleware/role.middleware");
const ValidationMiddleware = require("../../middleware/validation.middleware");

const validation = new ValidationMiddleware();

const packageRouter = express.Router();

// languagesRouter.use(
//     authMiddleware.isAuthenticated(),
//     validation.validateUserByIdCheckDB(),
//     roleMiddleware.isAdmin()
// );

packageRouter.post(
  "/create",
  validation.validateCreatePackageJoi(),
  packageController.create
);

packageRouter.get("/get/:id", packageController.get);

packageRouter.get("/get_all_package",
    packageController.gets
);

packageRouter.delete("/delete/:id",
    validation.validatePackageByIDDB(),
    packageController.delete
);

// languagesRouter.put("/update/:id",
//     validation.validateLanguageByIDDB(),
//     validation.validateCreateLanguageJoi(),
//     packageController.update
// );

module.exports = packageRouter;
