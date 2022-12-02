const express = require('express');
const User = require('../models/user');
const auth = require('../middlewares/auth');
const bcryptjs = require('bcryptjs');
const authRouter = express.Router();
const jwt = require('jsonwebtoken');

// SIGN UP ROUTE
authRouter.post('/api/signup', async (req, res) => {
  try {
    // 1) get the data from client
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: 'User with same email already exists!' });
    };

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      name,
    })
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// SIGN IN ROUTE
authRouter.post('/api/signin', async (req, res) => {
  try {
    const { email, password } = req.body;

    // primarily we need to check if that user even exists with that email
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: 'User with this email does not exist!' });
    }

    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: 'Incorrect password.' });
    }

    const token = jwt.sign({ id: user._id }, 'passwordKey');
    res.json({ token, ...user._doc })
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// api for user token
authRouter.post('/tokenIsValid', async (req, res) => {
  try {
    const token = req.header('x-auth-token');
    if (!token) return res.json(false);
    const verified = jwt.verify(token, 'passwordKey');
    if (!verified) return res.json(false);

    // now we check if User exists or not
    const user = await User.findById(verified.id); // this is "id" which we previously stored in const token ('/api/signin')
    if (!user) return res.json(false);
    // if all these conditions pass there we going to pass in rest.json(true)
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// api for get user data
authRouter.get('/', auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;