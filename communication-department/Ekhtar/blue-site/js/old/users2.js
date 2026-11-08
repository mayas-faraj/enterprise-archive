var map;
var res_markers = [];
var messages_cord = [];
var markers_l = new L.FeatureGroup();
var rect;
var areaSelect;

var l1;
var l2;
var l3;
var l4;

var br1;
var br2;
var br3;
var br4;

var thierisselectedarea;


$(document).ready(function () {
    $(function () {
        $("#places").dialog({
            autoOpen: false
        });
         $("#messagedialog").dialog({
            autoOpen: false
        });
        $('#test').BootSideMenu({side: "left", autoClose: true});
    });
});



function loadpics()
{
    var southWest = L.latLng(32, 35.5);
    var northEast = L.latLng(37.4, 43);
 thierisselectedarea=0;
    l1= 35.5;
    l2 = 37.4;
    l3 = 42.5;
    l4 = 32;
    
  var satellite = L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 16}),
            streets = L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16});
    
   
    map = L.map('map', {center: [35, 39],
        zoom: 8,
        layers: [streets] // only add one!
    });


    var baseLayers = {
        "Satellite Map": satellite,
        "Streets Map": streets
    };

    L.control.layers(baseLayers).addTo(map);
    map.on('moveend', function () {
        
        l1 = map.getBounds().getWest();
        l2 = map.getBounds().getNorth();
        l3= map.getBounds().getEast();
        l4 = map.getBounds().getSouth();
        
       
    });
    //map.on('click', function(e) { alert(" Lat , Lon : " + e.latlng.lat + "," + e.latlng.lng); });
}


function clearmarkers() {
    map.removeLayer(markers_l);
    markers_l=new L.FeatureGroup();
    res_markers = [];
    messages_cord=[];
}





function movetoplace()
{
    var e = document.getElementById("selectlist1");
    var stru = e.options[e.selectedIndex].text;
     
    switch (stru)
    {
        case "Damascus":
            map.flyTo([33.5138,36.2765], 12);
             $("#places").dialog("close");break;
        case "Homs":
            map.flyTo([34.7324 , 36.7137], 12);
             $("#places").dialog("close");break;
        case "Hama":
            map.flyTo([35.1409 , 36.7552], 12);
             $("#places").dialog("close");break;
        case "Aleppo":
            map.flyTo([36.2021 , 37.1343], 12);
             $("#places").dialog("close");break;
        case "Lattakia":
            map.flyTo([35.5407 , 35.7953], 12);
             $("#places").dialog("close");break;
        case "Tartus":
            map.flyTo([34.8959 , 35.8867], 12);
             $("#places").dialog("close");break;
        case "Daraa":
            map.flyTo([32.6264 , 36.1033], 12);
             $("#places").dialog("close");break;
        case "Deir ez-Zor":
            map.flyTo([35.3297 , 40.1350], 12);
             $("#places").dialog("close");break;
        case "Idlib":
            map.flyTo([35.93131670856903,36.63700103759766], 12);
             $("#places").dialog("close");break;
        case "Al-Hasakah":
            map.flyTo([36.5079 , 40.7463], 12);
             $("#places").dialog("close");break;
        case "As-Suwayda":
            map.flyTo([32.71270540105518,36.56636238098145], 12);
             $("#places").dialog("close");break;
        case "Quneitra":
            map.flyTo([33.1263 , 35.8258], 12);
             $("#places").dialog("close");break;
        case "Al Raqqa":
            map.flyTo([35.9594,38.9981], 12);
             $("#places").dialog("close");break;

        default:
             $("#places").dialog("close");break;

    }
  


}

function showplaces()
{
    $("#places").dialog("open");
}
//// new modify 


//***************************************  jump ************************************
function getuserslist() {

document.getElementById("content_messages").innerHTML = "";
clearmarkers();
//alert("l1="+l1+"  "+l2+"   "+l3+"   "+l4);
  var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () 
{
        var obj;
        var obj2;
        if (this.readyState == 4 && this.status == 200) {
            myarr = JSON.parse(this.responseText);
         //alert(this.responseText);
if(Array.isArray(myarr.item))       
{     if