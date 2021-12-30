const compose = require("composable-middleware");
const { Validator } = require("../../utils/validationSchema");
const Service = require("../service")
const bcrypt = require("bcrypt")

module.exports = class ValidationMiddleware extends Validator {
    constructor() {
        super();
    }

    //********************** JOI VALIDATION ************************************* */

    //********************** User Register Validate Joi************************************* */
    validateUserRegistration() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateUserRegisterJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                status: 400,
                                msg: error.details[0].message,
                            };
                            res.status(400).send(errors);
                            return;
                        });
                })
                .use((req, res, next) => {
                    if (req.body.password == req.body.confirmPassword) {
                        next();
                    } else {
                        res.status(400).send({ success: false, status: 400, msg: "Both Password Must Be Same" })
                    }
                })
                .use(this.validateUserVerificationDB())
                .use(this.validateVerifyEmailCheckDB())
                .use(this.validateVerifyPhoneCheckDB())
                .use(this.validateEmailAndPhoneDB())

        )
    }

    //********************** User Login Validate Joi************************************* */
    validateUserLogin() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateUserLoginJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                status: 400,
                                msg: error.details[0].message,
                                data: error.name,
                            };
                            return res.status(400).send(errors);
                        });
                })
        )
            .use(this.validateUserEmailAuthCheckDB())
            .use(async (req, res, next) => {
                const passwordChecked = await bcrypt.compare(req.body.password, req.user.password)
                if (passwordChecked) next()
                else return res.status(400).send({ success: false, status: 400, msg: "Password Is Invalid" });
            })
    }

    //********************** User Verify Validate Joi************************************* */
    validateUserVerifyJoi() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateUserVerifyJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                status: 400,
                                msg: error.details[0].message,
                                data: error.name,
                            };
                            return res.status(400).send(errors);
                        });
                })
        )
    }

    //********************** User Verify Validate Joi************************************* */
    validateCreatePackageJoi() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateCreatePackageJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                status: 400,
                                msg: error.details[0].message,
                                data: error.name,
                            };
                            return res.status(400).send(errors);
                        });
                })
        )
    }

    //********************** User ForgetPassword Validate Joi************************************* */
    validateForgetPasswordJoi() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateForgetPasswordJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                msg: error.details[0].message,
                                data: error.name,
                            };
                            return res.status(400).send(errors);
                        });
                })
                .use(this.validateUserByEmailDB())
        )
    }

    //********************** User ResetPassword Validate Joi************************************* */
    validateResetPasswordJoi() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateResetPasswordJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                msg: error.details[0].message,
                                data: error.name,
                            };
                            return res.status(400).send(errors);
                        });
                })
                .use((req, res, next) => {
                    if (req.body.password == req.body.confirmPassword) {
                        next();
                    } else {
                        res.status(400).send({ success: false, status: 400, msg: "Both Password Must Be Same" })
                    }
                })
        )
    }

    //********************** ROLE Validate Joi************************************* */
    validateCreateRoleJoi() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateCreateRoleJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                msg: error.details[0].message,
                                data: error.name,
                            };
                            return res.status(400).send(errors);
                        });
                })
                .use(this.validateCheckRoleNameDB())
        )
    }

    //********************** CATEGORY Validate Joi************************************* */
    validateCreateCategoryJoi() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateCreateCategoryJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                msg: error.details[0].message,
                                data: error.name,
                            };
                            return res.status(400).send(errors);
                        });
                })
                .use(this.validateCheckCategoryNameDB())
        )
    }

    //********************** LANGUAGE Validate Joi************************************* */
    validateCreateLanguageJoi() {
        return (
            compose()
                .use((req, res, next) => {
                    super.validateCreateLanguageJoi(req.body)
                        .then(data => {
                            next();
                        }).catch(error => {
                            var errors = {
                                success: false,
                                msg: error.details[0].message,
                                data: error.name,
                            };
                            return res.status(400).send(errors);
                        });
                })
                .use(this.validateCheckLanguageNameDB())
        )
    }

    //********************** DATABASE VALIDATION *************************************************************************************************************************************************************** */
    //********************** DATABASE VALIDATION *************************************************************************************************************************************************************** */

    //********************** DATABASE User Email All Ready Exist Checked ************************************* */
    validateVerifyEmailCheckDB() {
        return (
            compose().use(async (req, res, next) => {
                let [RowDataPacket] = await Service.userService.findVerifyEmail(req.body.email);
                if (RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "This Email Is Already Registered"
                    };
                    return res.status(400).send(errors);
                } else {
                    next();
                }
            })
        )
    }

    //********************** DATABASE User Email AUTHENTICATE Checked ************************************* */
    validateUserEmailAuthCheckDB() {
        return (
            compose().use(async (req, res, next) => {
                const [RowDataPacket] = await Service.userService.findByEmail(req.body.email);
                console.log(RowDataPacket)
                if (!RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "No Data Was Found With The Given Email"
                    };
                    return res.status(400).send(errors);
                } else {
                    req.user = RowDataPacket
                    next();
                }
            })
        )
    }

    //********************** DATABASE User PHONE NO Al Ready Exist Checked ************************************* */
    validateVerifyPhoneCheckDB() {
        return (
            compose().use(async (req, res, next) => {
                let [RowDataPacket] = await Service.userService.findVerifyPhone(req.body.phone);
                if (RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "This Phone No Is Already Registered"
                    };
                    return res.status(400).send(errors);
                } else {
                    next();
                }
            })
        )
    }

    //********************** DATABASE User PHONE NO Al Ready Exist Checked ************************************* */
    validateUserByIdCheckDB() {
        return (
            compose().use(async (req, res, next) => {
                let [RowDataPacket] = await Service.userService.findById(req.user.id);
                if (!RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "No User Found With Given Id"
                    };
                    return res.status(400).send(errors);
                } else {
                    req.user = RowDataPacket;
                    next();
                }
            })
        )
    }

    //********************** DATABASE User PHONE NO Al Ready Exist Checked ************************************* */
    validateEmailAndPhoneDB() {
        return (
            compose().use(async (req, res, next) => {
                let [RowDataPacket] = await Service.userService.verifyPhoneAndEmail(req.body.phone, req.body.email);
                if (RowDataPacket) {
                    req.user = RowDataPacket;
                    next();
                } else {
                    next();
                }
            })
        )
    }

    //********************** DATABASE User PHONE NO Al Ready Exist Checked ************************************* */
    validateUserVerificationDB() {
        return (
            compose().use(async (req, res, next) => {
                const { phone, email } = req.body;
                let [RowDataPacket] = await Service.userService.checkedUserVerification(phone, email);
                if (RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "This email or phone is already register"
                    };
                    return res.status(400).send(errors);
                } else {
                    next();
                }
            })
        )
    }

    //********************** DATABASE User Email Varefication ************************************* */
    validateUserByEmailDB() {
        return (
            compose().use(async (req, res, next) => {
                const [RowDataPacket] = await Service.userService.findByEmail(req.body.email);
                delete RowDataPacket.password;
                if (!RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "This Email Was Not Register"
                    };
                    return res.status(400).send(errors);
                } else {
                    req.user = RowDataPacket
                    next();
                }
            })
        )
    }

    //********************** DATABASE PACKAGE ID CHECK Varefication ************************************* */
    validateCheckRoleNameDB() {
        return (
            compose().use(async (req, res, next) => {
                const [RowDataPacket] = await Service.roleService.findByName(req.body.role_name);
                console.log(RowDataPacket)
                if (RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "Role Name Is Already Existed"
                    };
                    return res.status(400).send(errors);
                } else {
                    next();
                }
            })
        )
    }

    //********************** DATABASE ROLE BY ID CHECK Varefication ************************************* */
    validateRoleByIDDB() {
        return (
            compose().use(async (req, res, next) => {
                const [RowDataPacket] = await Service.roleService.findById(req.params.id);
                if (!RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "No Role Is Found With Given Id"
                    };
                    return res.status(400).send(errors);
                } else {
                    req.user = RowDataPacket;
                    next();
                }
            })
        )
    }

    //********************** DATABASE CATEGORY NAME CHECK Varefication ************************************* */
    validateCheckCategoryNameDB() {
        return (
            compose().use(async (req, res, next) => {
                const [RowDataPacket] = await Service.categoryService.findByName(req.body.category_name);
                console.log(RowDataPacket)
                if (RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "Category Name Is Already Existed"
                    };
                    return res.status(400).send(errors);
                } else {
                    next();
                }
            })
        )
    }

    //********************** DATABASE CATEGORY BY ID CHECK Varefication ************************************* */
    validateCategoryByIDDB() {
        return (
            compose().use(async (req, res, next) => {
                const [RowDataPacket] = await Service.categoryService.findById(req.params.id);
                if (!RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "No Category Is Found With Given Id"
                    };
                    return res.status(400).send(errors);
                } else {
                    req.user = RowDataPacket;
                    next();
                }
            })
        )
    }

    //********************** DATABASE LANGEUAGE NAME CHECK Varefication ************************************* */
    validateCheckLanguageNameDB() {
        return (
            compose().use(async (req, res, next) => {
                const [RowDataPacket] = await Service.languageService.findByName(req.body.language_name);
                console.log(RowDataPacket)
                if (RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "Language Name Is Already Existed"
                    };
                    return res.status(400).send(errors);
                } else {
                    next();
                }
            })
        )
    }

    //********************** DATABASE PACKAGE BY ID CHECK Verification ************************************* */
    validatePackageByIDDB() {
        return (
            compose().use(async (req, res, next) => {
                const [RowDataPacket] = await Service.packageService.findById(req.params.id);
                if (!RowDataPacket) {
                    var errors = {
                        success: false,
                        status: 400,
                        msg: "No Package Is Found With Given Id"
                    };
                    return res.status(400).send(errors);
                } else {
                    req.user = RowDataPacket;
                    next();
                }
            })
        )
    }
}