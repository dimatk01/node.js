
var udp = require('dgram');
var buffer = require('buffer');

// creating a client socket
var client = udp.createSocket('udp4');

//buffer msg
var data = Buffer.from('Send msg');

client.on('message',function(msg,info){
  console.log(`Data received from server :  ${msg.toString()} time ${new Date -start}ms`);
  console.log('Received %d bytes from %s:%d\n',msg.length, info.address, info.port);
  client.close()
});

//sending msg
const start = new Date();
client.send(data,2222,'localhost',function(error){
  if(error){
    client.close();
  }
});


