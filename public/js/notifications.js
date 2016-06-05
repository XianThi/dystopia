$(document).ready(function(){
var scriptsx = document.getElementById('notif');
console.log(scriptsx);
// myScript now contains our script object
var queryStringx = scriptsx.src.replace(/^[^\?]+\??/,'');
var badgex=queryStringx.substr(6);
document.getElementById("notifications_badge").innerHTML = badgex;
});
