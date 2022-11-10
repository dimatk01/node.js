'use strict';

const net = require('node:net');



const server = net.createServer((socket) => {
    socket.setEncoding('utf-8')
    console.log("start at "+new Date());
    console.dir(socket.address());
    socket.setNoDelay(true);
    socket.on('data', (data) => {
        socket.write(data, 'utf-8');
        console.log(data);
    });
    socket.on('close', () => console.log(`The session is full at ${new Date()}`));
    socket.on('error', (err) => {
        console.log('Socket error', err);
    });
}).listen(2000);

server.on('error', (err) => {
    console.log('Server error', err);
});