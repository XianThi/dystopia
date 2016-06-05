var socket = require( 'socket.io' );
var express = require( 'express' );
var http = require( 'http' );
var app = express();
var server = http.createServer( app );
var kullaniciSayisi = 0;
var io = socket.listen( server );

function buyaction(company,value,price){

}

io.sockets.on('connection', function(socket){
    kullaniciSayisi++;
    console.log('\n>> Toplam aktif kullanici:'+kullaniciSayisi);
    io.sockets.emit('status','Borsaya hoşgeldiniz..');
    socket.on('disconnect', function(){
        kullaniciSayisi--;
        console.log('\n>> Toplam aktif kullanici:'+kullaniciSayisi);
    });
    
    socket.on('message', function(message, callback) {
    });
   // socket.emit('message','<%init%>init');
 
socket.on('data', function(data) {
    var action=data.action;
    console.log(action);
    if (action== 'getmarket'){
    socket.emit('message','<%market%>');
    }
    if(action=='poke'){
        socket.emit('message','<%update%>');
    }
    if(action == 'buy'){
    new buyaction(data.company,data.vlm,data.prc);
  }
});
});
server.listen( 1234 ,function(){
    console.log('Listening..');
});