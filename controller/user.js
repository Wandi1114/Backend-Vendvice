var connection = require('../connection');
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const auth = require('../auth')
secretKey = 'venvice dot id'

exports.getAll = (req, res)=>{
    connection.query(
        `SELECT * from user`,
        (error,result)=>{
            if(error){
                res.statusCode = 500
                res.setHeader('Content-Type', 'application/json');
                res.json({success:false, message:'Terjadi kesalahan'})
            }else{
                res.statusCode = 200
                res.setHeader('Content-Type', 'application/json');
                res.json({success:true, result:result})
            }
        }
    )
};


exports.create = async (req,res) => {
    const hashedPassword = await bcrypt.hash(req.body.password,10)
    connection.query(
        `INSERT INTO user (email, password) VALUES (?,?);`,
        [req.body.email, hashedPassword],
        async (error,result)=>{
            if(error){
                res.statusCode = 200;
                res.setHeader('Content-Type', 'application/json');
                res.json({success:false, message: "Email telah digunakan"});
            }else{
                var token = jwt.sign({email:req.body.email}, secretKey,
                    {expiresIn: 3600});
                // mailer.register(req.body.nama, req.body.username, token)
                res.statusCode = 200
                res.setHeader('Content-Type', 'application/json');
                res.json({success:true, message: "Email telah dibuat"})
            }
        }
    )
}

exports.loginEmail = (req, res, next)=>{
    connection.query(
        `SELECT user.* from user where email=?`,
        [req.body.email],
        async (error, rows)=>{
            if(!rows || !rows.length){
                res.statusCode = 200;
                res.setHeader('Content-Type', 'application/json');
                res.json({success: false, message:'Username tidak ditemukan'});
            }else{
                if(await bcrypt.compare(req.body.password,rows[0].password)){
                    var token = auth.getToken({
                        id_user : rows[0].id_user,
                        email : rows[0].email
                    })
                    res.statusCode = 200;
                    res.setHeader('Content-Type', 'application/json');
                    res.json({success: true, token: token, status: 'You are successfully logged in!'});
                }else{
                    res.statusCode = 200;
                    res.setHeader('Content-Type', 'application/json');
                    res.json({success: false, message:'Password salah'});
                }
            }
        }
    )
}