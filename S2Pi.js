const sys = require('sys');
const process = require('child_process');
const express = require('express');
const app = express();

const port = 3000;

app.get('/', function (req, res) {
        res.send('Connected to S2Pi! Visit http://${host}:${port} + website /nThe following websites are supported: Dailymotion, Livestream, Twitch, UStream & YouTube Live');
});

app.get('/stream/:url', function (req, res) {
        res.send('Connecting to Stream...');
        process.exec("streamlink " + req.params.url + " best");
});


var server = app.listen(port, function () {
        var host = server.address().address;

        console.log(`Access on http://${host}:${port}`);
});