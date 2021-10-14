var connection = require('../connection');
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const auth = require('../auth')
secretKey = 'venvice dot id'

exports.getAll = (req, res)=>{
    connection.query(
        `SELECT * from penyedia_jasa`,
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
        `INSERT INTO penyedia_jasa (nama_penyedia_jasa, email_penyedia, nomor_telpon_penyedia,password) VALUES (?, ?, ?, ?);`,
        [req.body.nama, req.body.email, req.body.nomor_telpon, hashedPassword],
        async (error,result)=>{
            if(error){
                res.statusCode = 200;
                res.setHeader('Content-Type', 'application/json');
                res.json({success:false, message: "Email/Nomor HP telah digunakan"});
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
        `SELECT penyedia_jasa.* from penyedia_jasa where email_penyedia=?`,
        [req.body.email],
        async (error, rows)=>{
            if(!rows || !rows.length){
                res.statusCode = 200;
                res.setHeader('Content-Type', 'application/json');
                res.json({success: false, message:'Email tidak terdaftar'});
            }else{
                if(await bcrypt.compare(req.body.password,rows[0].password)){
                    var token = auth.getToken({
                        id_penyedia_jasa : rows[0].id_penyedia_jasa,
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