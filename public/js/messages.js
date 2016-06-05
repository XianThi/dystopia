$(document).ready(function(){
var scripts = document.getElementById('message');
console.log(scripts);
// myScript now contains our script object
var queryString = scripts.src.replace(/^[^\?]+\??/,'');
var badge=queryString.substr(6);
document.getElementById("message_badge").innerHTML = badge;
});
