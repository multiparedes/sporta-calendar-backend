const express = require("express");
const app = express();

require("dotenv").config();

app.set("port", process.env.PORT || 8000);

// Healtcheck route
app.get("/health", (_, res) => {
  const health = {
    uptime: process.uptime(),
    message: "API is up",
  };

  try {
    res.send(health);
  } catch (e) {
    res.status(503).send(e);
  }
});

// Import routes

// Define routes

// Start app to listen
app.listen(app.get("port"), async () => {
  console.log(`Server listening on port ${app.get("port")}.`);
});
