// import from packages
const express = require('express');
const mongoose = require('mongoose');
// import other files(services)
const authRouter = require('./routes/auth');
// init
const PORT = 3000;
const app = express();
const DB = 'mongodb+srv://lastoned:Albertobalsam101@cluster0.4mrgmvb.mongodb.net/?retryWrites=true&w=majority';

// middleware (client -> middleware -> server -> client)
app.use(express.json());
app.use(authRouter);

// connections
mongoose.connect(DB).then(() => { // we pass 'then()' here because this is a promise function
  console.log("Connection successful");
}).catch((e) => {
  console.log(e);
})

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at PORT ${PORT}`);
});