var udp = require('dgram');

// --------------------creating a udp server --------------------

// creating a udp server
var server = udp.createSocket('udp4');

// emits when any error occurs
server.on('error',function(error){
  console.log('Error: ' + error);
  server.close();
});

// emits on new datagram msg
server.on('message',function(msg,info){
  console.log('Data received from client : ' + msg.toString());
  console.log(info);

//sending msg
server.send(msg,info.port,'localhost',function(error){
  if(error){
    client.close();
  }else{
    console.log(`The session is full at ${new Date()}`);
  }
});

});
server.on('close',function(){
  console.log('Socket is closed !');
});

server.bind(2222);


