const compose = require("composable-middleware");

class RoleMiddleware {
    isAdmin() {
        return (
            compose()
                // Attach user to request
                .use((req, res, next) => {
                    if (req.user.role_id == 1) {
                        next();
                    } else {
                        res.status(400).send({ success: false, status: 400, msg: "Insufficient privileges." });
                        return
                    }
                })
        )
    }
    isUser() {
        return (
            compose()
                // Attach user to request
                .use((req, res, next) => {
                    if (req.user.role_id == 2 || req.user.role_id == 1) {
                        next();
                    } else {
                        res.status(400).send({ success: false, status: 400, msg: "Insufficient privileges." });
                        return
                    }
                })
        )
    }
}

module.exports.roleMiddleware = new RoleMiddleware();