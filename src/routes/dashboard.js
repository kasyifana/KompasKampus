const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');

router.get('/', auth.isAuthenticated, (req, res) => {
    res.sendFile(path.join(__dirname, '../views/dashboard.html'));
});

router.get('/user-info', auth.isAuthenticated, (req, res) => {
    res.json({
        name: req.user.displayName,
        email: req.user.emails[0].value,
        picture: req.user.photos[0].value
    });
});

module.exports = router;
