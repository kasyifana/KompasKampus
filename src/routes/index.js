const express = require('express');
const router = express.Router();
const { isAuthenticated } = require('../middleware/auth');

// Public routes
router.get('/', (req, res) => {
    res.render('home');
});

// Protected routes - add isAuthenticated middleware
router.get('/dashboard', isAuthenticated, (req, res) => {
    res.render('dashboard');
});

router.get('/profile', isAuthenticated, (req, res) => {
    res.render('profile');
});

module.exports = router;
