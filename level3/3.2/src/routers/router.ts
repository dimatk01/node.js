import express = require('express');
const authBasic = require('../middleware/auth')
const router = express.Router();
const userControllers = require('../controllers/userControllers')
const adminControllers = require('../controllers/adminController')
router.get('/', userControllers.getBooks)
router.get('/book/:id', userControllers.getBook)
router.post('/book/:id', userControllers.addWantsCount)
router.get('/admin/api/v1/admin', authBasic,adminControllers.adminBooks)
router.get('/admin/api/v1/deleteBook/', authBasic,adminControllers.deleteBook)
router.post('/admin/api/v1/addBook/', authBasic, adminControllers.addBook)
module.exports = router
