const express = require('express');

const api = express();

const routes = require('./routes');
api.use(express.json());
api.use(routes)

app.listen(3000);