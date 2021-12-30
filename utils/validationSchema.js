const Joi = require("joi");

exports.Validator = class Validator {
    constructor() { }

    //********************** User Register Validate************************************* */
    validateUserRegisterJoi(data) {
        const schema = Joi.object({
            first_name: Joi.string().required(),
            last_name: Joi.string().required(),
            email: Joi.string().required(),
            phone: Joi.string().required(),
            password: Joi.string().required(),
            confirmPassword: Joi.string().required(),
            language: Joi.string().required(),
            service_type: Joi.string().required(),
        });
        return schema.validateAsync(data);
    }

    //********************** User Login Validate************************************* */
    validateUserLoginJoi(data) {
        const schema = Joi.object({
            email: Joi.string().email().required(),
            password: Joi.string().required(),
        });
        return schema.validateAsync(data);
    }

    //********************** User Verification Validate************************************* */
    validateUserVerifyJoi(data) {
        const schema = Joi.object({
            phone: Joi.string().required(),
            code: Joi.number().required().min(4),
        });
        return schema.validateAsync(data);
    }

    //********************** User Forget Password Validate************************************* */
    validateForgetPasswordJoi(data) {
        const schema = Joi.object({
            email: Joi.string().email().required(),
        });
        return schema.validateAsync(data);
    }

    //********************** User Forget Password Validate************************************* */
    validateResetPasswordJoi(data) {
        const schema = Joi.object({
            password: Joi.string().required(),
            confirmPassword: Joi.string().required(),
            userId: Joi.number(),
        });
        return schema.validateAsync(data);
    }

    //********************** Role Validate************************************* */
    validateCreateRoleJoi(data) {
        const schema = Joi.object({
            role_name: Joi.string().required(),
        });
        return schema.validateAsync(data);
    }

    //********************** Category Validate************************************* */
    validateCreateCategoryJoi(data) {
        const schema = Joi.object({
            category_name: Joi.string().required(),
        });
        return schema.validateAsync(data);
    }

    //********************** Language Validate************************************* */
    validateCreateLanguageJoi(data) {
        const schema = Joi.object({
            language_name: Joi.string().required(),
        });
        return schema.validateAsync(data);
    }
    
    //********************** Package Validate************************************* */
    validateCreatePackageJoi(data) {
        const schema = Joi.object({
            name: Joi.string().required(),
            price: Joi.number().required(),
            description: Joi.string(),
            package_limit: Joi.number().required(),
        });
        return schema.validateAsync(data);
    }
}
