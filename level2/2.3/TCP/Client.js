'use strict';

const net = require('node:net');


const socket = new net.Socket();
socket.setEncoding('utf-8')
const mesege = "This i send at server"
let start;
socket.connect({
    port: 2000,
    host: 'localhost',
}, () => {
    start = new Date().getTime();
    socket.write("I get text - "+mesege);

});
socket.on('data', (data) => {
    socket.unref();
    console.log(`I send: ${mesege},, get: ${data}, time ${new Date().getTime() - start}ms`);
});
