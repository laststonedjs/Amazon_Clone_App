const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true // if user type ' user ' trim will help us to get 'user'
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: 'Please enter a valid email address',
    },
  },
  password: {
    required: true,
    type: String,
    //   validate: {
    //     validator: (value) => {
    //       return value.lenght > 6;
    //     },
    //     message: 'Password must contain a minimum 6 characters',
    //   },
  },
  address: {
    type: String,
    default: '',
  },
  type: {
    type: String,
    default: 'user',
  },
  // cart
});

const User = mongoose.model('User', userSchema); // in this way we create user model

module.exports = User;