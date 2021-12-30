const userService = require("../../service/user.service");
const twilio = require("../../constants/towilo")
const { authMiddleware } = require("../../middleware/auth.middleware");
const bcrypt = require("bcrypt")

class Users {

    async register(req, res) {
        try {
            req.body.password = await bcrypt.hash(req.body.password, 10)
            delete req.body.confirmPassword
            if (req.user) {
                await userService.update(req.user.id, req.body);
                await twilio.sendTwilosms(req.body.phone)
            } else {
                await userService.create(req);
                await twilio.sendTwilosms(req.body.phone)
            }
            res.status(200).send({
                success: true,
                status: 200,
                msg: "Verification Code Send To Your Mobile",
            });
        } catch (error) {
            res.status(500).send({ success: false, status: 500, msg: error.message });
        }
    };

    async login(req, res) {
        try {
            req.user.token = authMiddleware.authGenrateToken(req.user.id, req.user.role_id);
            delete req.user.password;
            res.status(200).send({
                success: true,
                status: 200,
                msg: "Login successfully",
                user: req.user,
            });
        } catch (error) {
            res.status(500).send({ success: false, status: 500, msg: error.message });
        }
    };

    async verify(req, res) {
        try {
            const verify = await twilio.verifySms(req.body)
            if (!verify) return res.status(400).send({
                success: false,
                status: 400,
                msg: "Given Code Is Invalid",
            });
            let user = await userService.findByPhone(req.body.phone);
            delete user.password
            user[0].token = authMiddleware.authGenrateToken(user.id, user.role_id);
            res.status(200).send({
                success: true,
                status: 200,
                msg: "verify",
                data: user[0]
            });
        } catch (error) {
            res.status(500).send({ success: false, status: 500, msg: error.message });
        }
    };

    async forgetPassword(req, res) {
        try {
            const { id } = req.user
            res.status(200).send({
                success: true,
                status: 200,
                msg: "Verify Successfully",
                data: {
                    auth: true,
                    userId: id
                }
            });
        } catch (error) {
            res.status(500).send({ success: false, status: 500, msg: error.message });
        }
    };

    async resetPassword(req, res) {
        try {
            const { userId, password } = req.body
            const hashPassword = await bcrypt.hash(password, 10)
            const user = await userService.update(userId, { password: hashPassword });
            if (!user) return res.status(400).send({
                success: true,
                status: 200,
                msg: "Password Is Not Reset",
                data: false
            })
            res.status(200).send({
                success: true,
                status: 200,
                msg: "Password Reset Successfully",
                data: {
                    reset: true,
                }
            });
        } catch (error) {
            res.status(500).send({ success: false, status: 500, msg: error.message });
        }
    };

    async authDel(req, res) {
        try {
            const user = await userService.delete(req.params.id);
            res.status(200).send({
                success: true,
                status: 200,
                msg: "Delete Successfully",
            });
        } catch (error) {
            res.status(500).send({ success: false, status: 500, msg: error.message });
        }
    };

    async deletePhone(req, res) {
        try {
            const user = await userService.deletePhone(req.params.id);
            res.status(200).send({
                success: true,
                status: 200,
                msg: "Delete Successfully",
            });
        } catch (error) {
            res.status(500).send({ success: false, status: 500, msg: error.message });
        }
    };

    async uploadImage(req, res) {
        try {
            if (!req.file) return res.status(500).send({ success: false, status: 500, msg: "Image Field Connot Be Empty" });
            const user = await userService.uploadProfileImage(60, { profile_image: req.file.path });
            res.status(200).send({
                success: true,
                status: 200,
                msg: " Successfully",
            });
        } catch (error) {
            res.status(500).send({ success: false, status: 500, msg: error.message });
        }
    };
}

const usersController = new Users();
module.exports = usersController;