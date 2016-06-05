</div></div>

<div class="container">{{content()}}
<style>
#map{
    height: 600px;
}
</style>
<script>
var x=new google.maps.LatLng(52.395715,4.888916);
var stavanger=new google.maps.LatLng(58.983991,5.734863);
var amsterdam=new google.maps.LatLng(52.395715,4.888916);
var london=new google.maps.LatLng(51.508742,-0.120850);

function initialize()
{
        var mapOptions = {
        zoom: 5,
        center: new google.maps.LatLng(40,-117),
        mapTypeId: google.maps.MapTypeId.SATELLITE
    };

var map = new google.maps.Map(document.getElementById('map'),  mapOptions);
    var arr = new Array();
    var polygons = [];
    var bounds = new google.maps.LatLngBounds();
   // downloadUrl("subdivision-coordinates.php", function(data) {
    var xmlString = '<subdivisions><subdivision name="Auburn Hills"><coord lat="39.00748" lng="-92.323222"/><coord lat="39.000843" lng="-92.323523"/><coord lat="39.000509" lng="-92.311592"/><coord lat="39.007513" lng="-92.311378"/><coord lat="39.00748" lng="-92.323222"/></subdivision><subdivision name="Vanderveen"><coord lat="38.994206" lng="-92.350645"/><coord lat="38.985033" lng="-92.351074"/><coord lat="38.984699" lng="-92.343092"/><coord lat="38.981163" lng="-92.342234"/><coord lat="38.984663" lng="-92.3335"/><coord lat="38.993472" lng="-92.333179"/><coord lat="38.994206" lng="-92.350645"/></subdivision><subdivision name="Vanderveen"><coord lat="39.02206" lng="-92.350645"/><coord lat="39.005033" lng="-92.351074"/><coord lat="39.004699" lng="-92.343092"/><coord lat="39.001163" lng="-92.342234"/><coord lat="39.004663" lng="-92.3335"/><coord lat="39.003472" lng="-92.333179"/><coord lat="39.0206" lng="-92.350645"/></subdivision><subdivisions>';
        var xml = xmlParse(xmlString);
        var subdivision = xml.getElementsByTagName("subdivision");
        // alert(subdivision.length);
        for (var i = 0; i < subdivision.length; i++) {
            arr = [];
            var coordinates = xml.documentElement.getElementsByTagName("subdivision")[i].getElementsByTagName("coord");
            for (var j=0; j < coordinates.length; j++) {
              arr.push( new google.maps.LatLng(
                    parseFloat(coordinates[j].getAttribute("lat")),
                    parseFloat(coordinates[j].getAttribute("lng"))
              ));
                
              bounds.extend(arr[arr.length-1])
            }
            polygons.push(new google.maps.Polygon({
                paths: arr,
                strokeColor: '#123456',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35
            }));
            polygons[polygons.length-1].setMap(map);
        }
  // });
  map.fitBounds(bounds);
}
/**
 * Parses the given XML string and returns the parsed document in a
 * DOM data structure. This function will return an empty DOM node if
 * XML parsing is not supported in this browser.
 * @param {string} str XML string.
 * @return {Element|Document} DOM.
 */
function xmlParse(str) {
  if (typeof ActiveXObject != 'undefined' && typeof GetObject != 'undefined') {
    var doc = new ActiveXObject('Microsoft.XMLDOM');
    doc.loadXML(str);
    return doc;
  }

  if (typeof DOMParser != 'undefined') {
    return (new DOMParser()).parseFromString(str, 'text/xml');
  }

  return createElement('div', null);
}

google.maps.event.addDomListener(window, 'load', initialize);

</script>

<div id="map"></div>



</div>