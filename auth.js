var jwt = require('jsonwebtoken'); // used to create, sign, and verify tokens
var connection = require('./connection');
var bcrypt = require('bcrypt');
var salt = bcrypt.genSaltSync(10);
var hash = bcrypt.hashSync("my password", salt);
var secretKey = 'Slim Motherfucker Shady';

exports.getToken = function(user) {
    return jwt.sign(user, secretKey,
        {expiresIn: 3600});
};