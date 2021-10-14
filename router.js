var express =  require('express')
var router = express.Router()
var user = require('./controller/user')
var penyedia_jasa = require('./controller/penyedia_jasa')
var pencari_jasa = require('./controller/pencari_jasa')


// router.route('/')
// .get("Helo world")

router.route('/login-email')
.post(user.loginEmail)

router.route('/user')
.get(user.getAll)
.post(user.create)


router.route('/penyedia-jasa') //bisa
.get(penyedia_jasa.getAll)
.post(penyedia_jasa.create)

router.route('/penyedia-jasa/login') //bisa
.post(penyedia_jasa.loginEmail)

router.route('/pencari-jasa') //bisa
.get(pencari_jasa.getAll)
.post(pencari_jasa.create)

router.route('/pencari-jasa/login') //bisa
.post(pencari_jasa.loginEmail)

// router.route('/admin/coba')
// .post(admin.getByid2)

// router.route('/admin/:idadmin')
// .get(admin.getByid)


module.exports = router;
