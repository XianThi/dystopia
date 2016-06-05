var socket = io.connect( 'http://188.166.42.60:1234',{'max reconnection attempts': 5,
            'connect timeout': 5000} );

socket.on('status', function(data){
        $('#status').html(data);
    });
 
socket.on('connect', function(){
openTheMarket(); 
pokeServer();

});
socket.on('disconnect', function(){
$('#status').text("Connection closed");
  showAlert('Game Over', 'The market is now closed. The server has been powered off <br/><br/> Thanks for playing!');

});
socket.on('connect_error', function() {
  showAlert('Server Offline', 'The market is closed. The server has been powered off <br/><br/> Thanks for playing!');
        });
socket.on( 'message', function( data ) {
parseMessage(data); 
});

socket.on('callback', function(data) {
  console.log(data.done);
  // Print the data.data somewhere...
});