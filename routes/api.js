const express = require("express");
const app = express();

// App Routes
app.use("/users", require("../app/controller/users"));
app.use("/package", require("../app/controller/package"));

// ADMIN ROUTES
app.use("/admin/roles", require("../app/controller/roles"));
app.use("/admin/categories", require("../app/controller/categories"));
app.use("/admin/language", require("../app/controller/language"));

module.exports = app;