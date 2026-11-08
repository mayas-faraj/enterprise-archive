var map;
var res_markers = [];
var messages_cord = [];
var markers_l = new L.FeatureGroup();
var rect;
var areaSelect;
var w;
var ja;
//var ght=110;
//window.ght=110;
$(document).ready(function () {
    $(function () {
        $("#places").dialog({
            autoOpen: false
        });
        $('#test').BootSideMenu({side: "left", autoClose: true});
    });
});



function loadpics()
{
    var southWest = L.latLng(32, 35.5);
    var northEast = L.latLng(37.4, 43);
  /*  var v1 = document.forms['form1'];
    v1.elements["l1"].value = 35.5;
    v1.elements["l2"].value = 37.4;
    v1.elements["l3"].value = 42.5;
    v1.elements["l4"].value = 32;
     */
  var satellite = L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 16}),
            streets = L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16});
    
   
    map = L.map('map', {maxBounds: L.latLngBounds(southWest, northEast), center: [35, 39],
        zoom: 8,
        layers: [satellite] // only add one!
    });


    var baseLayers = {
        "Satellite Map": satellite,
        "Streets Map": streets
    };

    L.control.layers(baseLayers).addTo(map);
    
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
            map.flyTo([35.8269, 36.6957], 12);
             $("#places").dialog("close");break;
        case "Al-Hasakah":
            map.flyTo([36.5079 , 40.7463], 12);
             $("#places").dialog("close");break;
        case "As-Suwayda":
            map.flyTo([32.7989 , 36.7820], 12);
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
function ajaxp1_m() {
   // alert("ajax not  m");
    var v3 = document.forms['form1'];
    var l1 = v3.elements["l1"].value;
    var l2 = v3.elements["l2"].value;
    var l3 = v3.elements["l3"].value;
    var l4 = v3.elements["l4"].value;
    var l5 = v3.elements["key_word"].value;
    var l6 = v3.elements["starttime"].value;
    var l7 = v3.elements["endtime"].value;

    document.getElementById("content_messages").innerHTML = "";


    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        var obj;
        if (this.readyState == 4 && this.status == 200) {
           // alert("ok4_m");
           // alert(this.responseText);
          var  myarr = JSON.parse(this.responseText);
            // alert(myarr.item.length);
            obj = JSON.parse(myarr.item[0]);
            v3.elements["key_word"].value = obj.Latitude;
          //   alert(myarr.item[0]);
            //  alert( obj.Latitude);
            if (myarr.item.length > 0)
            {
                for (var i = 0; i < myarr.item.length; i++)
                {
                    obj = JSON.parse(myarr.item[i]);
                    res_markers[i] = L.marker([obj.Latitude, obj.Longitude]);
                    res_markers[i].bindPopup(obj.Message).openPopup();
                    markers_l.addLayer(res_markers[i]);
                      messages_cord[i]=[obj.Latitude, obj.Longitude,obj.Message];            
    document.getElementById("content_messages").innerHTML = document.getElementById("content_messages").innerHTML +
            "<div onclick=\"mayfly("+i+")\" style=\"padding-top:20px;\"><h5 style=\"font-size:24px;color:#88d4f9\"><br/>"+obj.Message+"<br/>" +"</h5><hr/></div>";
                } map.addLayer(markers_l);
                 $("#searchdialog").dialog("close");
            }
        }
    }
    var strvar = "l1=" + l1 + "&l2=" + l2 + "&l3=" + l3 + "&l4=" + l4 + "&key_word=" + l5;
    xmlhttp.open("GET", "php/not.php?" + strvar, true);
    xmlhttp.send();

}


function mayfly(t6)
{
    map.flyTo([messages_cord[t6][0], messages_cord[t6][1]], 14);
    res_markers[t6].openPopup();
}

function startWorker() {
alert("start worker");
    if(typeof(Worker) !== "undefined") {
        if(typeof(w) == "undefined") {
            alert("defined");
            w = new Worker("js/myworker2.js");
            document.getElementById("content_messages").innerHTML = "";
            ja=0;
            alert("ok work");
        }
        w.onmessage = function(event) 
        {
          console.log('Message posted to worker'+event.data);
         // alert( event.data);
          var obj;
            
           // myarr = JSON.parse(event.data);
            alert(event.data);
            // alert("array length"+myarr.item.length);
           // obj = JSON.parse(myarr.item[0]);
         //   alert(myarr.item[0]);
         
if(Array.isArray(myarr.item))       
{     if (myarr.item.length > 0)
            {
                for (var i = 0; i < myarr.item.length; i++)
                {
                    obj = JSON.parse(myarr.item[i]);
                    res_markers[i] = L.marker([obj.Latitude, obj.Longitude]);
                    res_markers[i].bindPopup(obj.Message).openPopup();
                    markers_l.addLayer(res_markers[i]);
                      messages_cord[i]=[obj.Latitude, obj.Longitude,obj.Message];            
    document.getElementById("content_messages").innerHTML ="<div onclick=\"mayfly("+i+")\" style=\"padding-top:10px;\" ><h5 style=\"font-size:24px;text-align: right;color:#d3e460\">"+
            obj.Message+
            "</h5><hr/></div>"+ document.getElementById("content_messages").innerHTML;
                } 
map.addLayer(markers_l);
            }
        }
else{
                    obj = JSON.parse(myarr.item);
                    res_markers[0] = L.marker([obj.Latitude, obj.Longitude]);
                    res_markers[0].bindPopup(obj.Message).openPopup();
                    markers_l.addLayer(res_markers[0]);
                      messages_cord[0]=[obj.Latitude, obj.Longitude,obj.Message];
    document.getElementById("content_messages").innerHTML = document.getElementById("content_messages").innerHTML +
            "<div onclick=\"mayfly("+0+")\" style=\"padding-top:10px;\" ><h5 style=\"font-size:24px;text-align: right;color:#d3e460\">"+obj.Message+"</h5><hr/></div>";
                map.addLayer(markers_l);
      

} 
        };
    } else {
        alert( "Sorry, your browser does not support Web Workers...");
    }
}

function stopWorker() { 
    w.terminate();
    w = undefined;
}



// *******************************************************************************************





function  myareaselect()
{
var areaSelect = L.areaSelect();
areaSelect.addTo(map);
// Read the bouding box
var bounds = areaSelect.getBounds();
// Get a callback when the bounds change
areaSelect.on("change", function() {
 //   alert("Bounds:", this.getBounds().getWest());
});
 /*
    alert("r");
rect = L.rectangle([[33, 36], [35, 38]]);
map.addLayer(rect);
rect.editing.enable();

rect.on('edit', function() { alert(rect.getBounds()); });
  */  
    //var locationFilter = L.LocationFilter({enable:true,enableButton:true}).addTo(map);

//alert("r"+locationFilter.isEnabled());
    /*
var areaSelect = L.areaSelect({width:200, height:300,keepAspectRatio:true});
areaSelect.addTo(map);
// Read the bouding box
var bounds = areaSelect.getBounds();
// Get a callback when the bounds change
areaSelect.on("change", function() {
    console.log("Bounds:", this.getBounds());
});
// Set the dimensions of the box
areaSelect.setDimensions({width: 500, height: 500});*/
}
