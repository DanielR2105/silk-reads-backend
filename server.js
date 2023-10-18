// DEPENDENCIES
const express = require("express");
const app = express();
const cors = require("cors");

// CONFIGURATION
require("dotenv").config();
const PORT = process.env.PORT;

// LISTEN
const server = app.listen("8080", () => {
  console.log(S`erver Running on Port ${PORT}`);
});

// ROUTES
