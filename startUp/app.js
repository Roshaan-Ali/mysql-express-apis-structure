'use strict';
const express = require("express");
const path = require("path");
const bodyParser = require("body-parser");

const cors = require("cors");
global.ROOTPATH = __dirname;
var app = express();

app.use(cors());

// Express TCP requests parsing
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: true
}))

// Static rendering
app.use(express.static(path.join(__dirname, "views")));
app.set("view engine", "ejs");

// Route definitions
app.use("/api", require("../routes/api"));

module.exports = app;