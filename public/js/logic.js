/*********************************************
 *
 *  StockExchangeSimulator
 *  BYU-Idaho CS460 Final Project
 *
 *  by Rodrigo Silveira
 *
 * This project implements an HTML5 
 * Web Socket server in PHP5. 
 *
 * The application that illustrates the
 * protocol is a simple stock exchange-like 
 * simulator. The server accepts, manages,
 * and processes multiple connections to the
 * same process.
 *
 * Each client connects to the server using
 * Javascript, through the HTML5 Web Socket
 * API implemented by modern browsers.
 *
 *********************************************/

/**
 * Parse initial data sent from the server upon
 * a successful 3-way handshake
 */
function init( pData )
{

var oTable = $('#example').dataTable();
data=pData;
oTable.fnClearTable();
for(var i = 0; i < data.length; i++) {
if(data[i].last>=data[i].yesterday){
var percent=(data[i].last)/(data[i].yesterday);
}else{
var percent=(data[i].yesterday)/(data[i].last);
}
oTable.fnAddData([
"<a href=../stock_comp/view/"+data[i].stock_comp+">"+data[i].stock_comp_name+"</a>",
data[i].last,
data[i].yesterday,
percent,
data[i].max,
data[i].min,
"",
data[i].volume,
data[i].volume*data[i].last
]);
} // End For

/*
$.getJSON('http://localhost/stock/ex/ajax/companies.php', function(data) {
    //data is the JSON string
    data = JSON.parse(data);

  for(var i = 0; i < 3; i++)
  {
    // update GUI
    $('#stockComp'+(i+1)+'Sym').text( data[i].symbol );
    $('#stockComp'+(i+1)+'Vol').text( data[i].volume );
    $('#stockComp'+(i+1)+'Bid').text( data[i].bid.toFixed(2) );
    $('#stockComp'+(i+1)+'Ask').text( data[i].ask.toFixed(2) );
    $('#portComp'+(i+1)+'Sym').text( data[i].symbol );

    // update company data in memory
    window.companies[i].symbol = data[i].symbol;
    window.companies[i].volume = data[i].volume;
    window.companies[i].bid = data[i].bid.toFixed(2);
    window.companies[i].ask = data[i].ask.toFixed(2);

    $('#mycash').text('$'+window.myPortfolio.myCash.toFixed(2));
  }
  });
*/
}
function update(){
$.get("/dystopia/stock/getMarketInfo", function( data ) {
init(data);
});
updateStatus('Değerler güncellendi..');
}
function getmarketinfo(){
$.getJSON('/dystopia/stock/getMarketInfo', function(data) {
    //data is the JSON string
    init(data);
});
updateStatus('Veriler yüklendi...');
}
/**
 * Inspect data string sent from the server,
 * and determine what command was sent.
 * If no action is associated with the command,
 * display error message, and ignore the data
 * sent with the command
 */
function parseMessage(pMessage)
{
  /*
   * pMessage = <%X%>message, where X is a message
   *            identifier.
   */
  var message = pMessage.split(/%>/);

  // a map of commands to funtions to handle each command
  switch( message[0].slice(2) )
  {
    case 'status':
      updateStatus( message[1] );
      break;
    case 'market':
      getmarketinfo();
      break;
case 'update':
      update();
      break;
    case 'data':
      processData( message[1] );
      break;

    case 'init':
      init( message[1] );
      break;

    case 'confirmbuy':
      confirmBuy( message[1] );
      break;

    case 'confirmsell':
      confirmSell( message[1] );
      break;

    default:
      showAlert('Oops...', "For some reason the server sent us an invalid message identifier of <em>"+
                           message[0].slice(2) +
                           "</em>.<br/><br/>That's weird...");
  }
}


/**
 * Update the current state of the application
 */
 
function processData( pData )
{

  var data = JSON.parse(pData);
  for(var i = 0; i < 3; i++)
  {
    var priceDiff = data[i].bid - window.companies[i].bid;

    priceDiff = priceDiff.toFixed(2);

    if( priceDiff < 0 )
    {
      $('#stockComp'+(i+1)+'Chg').removeClass('gain');
      $('#stockComp'+(i+1)+'Chg').addClass('loss');
      $('#stockComp'+(i+1)+'Chg').text( priceDiff );
    }
    else if( priceDiff > 0 )
    {
      $('#stockComp'+(i+1)+'Chg').removeClass('loss');
      $('#stockComp'+(i+1)+'Chg').addClass('gain');
      $('#stockComp'+(i+1)+'Chg').text( '+'+priceDiff );
    }

    $('#stockComp'+(i+1)+'Sym').text( data[i].symbol );
    $('#stockComp'+(i+1)+'Vol').text( data[i].volume );
    $('#stockComp'+(i+1)+'Bid').text( data[i].bid.toFixed(2) );
    $('#stockComp'+(i+1)+'Ask').text( data[i].ask.toFixed(2) );

    $('#portComp'+(i+1)+'Sym').text( data[i].symbol );

    window.companies[i].symbol = data[i].symbol;
    window.companies[i].volume = data[i].volume;
    window.companies[i].bid = data[i].bid.toFixed(2);
    window.companies[i].ask = data[i].ask.toFixed(2);
  }
}
function openTheMarket(){
socket.emit('data', {
action: 'getmarket'
    });
}

function pokeServer(){
socket.emit('data', {
action: 'poke'
    });
setTimeout(pokeServer,10000);
}

/**
 * Display a message from the server
 */
function updateStatus( pMessage )
{
  $('#messages').hide();
  $('#messages').text( pMessage );
  $('#messages').slideDown(1000);
}


/**
 * A custom alert box to replace Javascript's alert()
 */
function showAlert(pTitle, pMessage)
{
  $('.modal-title').text(pTitle);
  $('.modal-body').html(pMessage);

$('#alert').modal('show');
}




/**
 * Activate the app
 */



/**
 * Update the data displayed in the GUI
 */
function updateAlldisplays()
{
  for(var i = 0; i < 3; i++)
  {
    $('#stockCompBuyMycash'+(i + 1)).text( window.myPortfolio.myCash.toFixed(2) );
  }
}


/**
 * Call back that processes an approaved buy request
 */
function confirmBuy( companyData )
{
  if( companyData === 'fail' )
  {
    showAlert('fail!', "Can't buy that...");
    return;
  }

  companyData = companyData.split(',');

  window.myPortfolio.myCash -= companyData[1] * companyData[2];
  $('#mycash').text('$' + window.myPortfolio.myCash.toFixed(2) );
  window.myPortfolio['comp'+ companyData[0]].price = companyData[2];
  window.myPortfolio['comp'+ companyData[0]].volume += parseInt(companyData[1]);

  $('#portCompPric'+ companyData[0]).text( '$'+parseInt(window.myPortfolio['comp'+ companyData[0]].price).toFixed(2) );
  $('#portCompVol'+ companyData[0]).text( window.myPortfolio['comp'+ companyData[0]].volume );

  updateAlldisplays();
}


/**
 * Call back that processes an approaved sale request
 */
function confirmSell( companyData )
{
  companyData = companyData.split(',');

  window.myPortfolio.myCash += companyData[1] * companyData[2];

  $('#mycash').text('$' + window.myPortfolio.myCash.toFixed(2) );

  window.myPortfolio['comp'+ companyData[0]].price = companyData[2];
  window.myPortfolio['comp'+ companyData[0]].volume -= parseInt(companyData[1]);

  $('#portCompPric'+ companyData[0]).text( '$'+parseInt(window.myPortfolio['comp'+ companyData[0]].price).toFixed(2) );
  $('#portCompVol'+ companyData[0]).text( window.myPortfolio['comp'+ companyData[0]].volume );

  updateAlldisplays();
}


// inject dependencies and start services
(function(){

  $('#stretch').append('<img src="img/loader.gif"/>');
  $('body').append('<script type="text/javascript" src="js/eventlisteners.js"></script>');

})();