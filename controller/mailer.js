const mailer = require('nodemailer');

var transporter = mailer.createTransport({
    service : 'gmail',
    secure : 'true',
    auth : {
        user : "wandidh25.wd@gmail.com",
        pass : "************"
    }
})

var mailOptions = {
    from : "Official Vendvice <noreply>",
    to : "suwandek@gmail.com",
    subject : "TESTING API",
    text : "PESAN INI GAUSAH DIBALES YA ... !"
};

transporter.sendMail(mailOptions, (err, info)=>{
    if(err){
        console.log(err);
    }else{
        console.log("Email berhasil dikirim : " + info.response);
    }
})