var map;
var res_markers = [];
//var messages_cord = [];
var markers_l = new L.FeatureGroup();
var rect;
var areaSelect;
var w;
var obj;


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
    
// events
    /*
     * map.on('moveend', function () {
        alert(map.getBounds().getSouthWest());
        var v1 = document.forms['form1'];
        var v2 = v1.elements["l1"];
        alert(v1.elements["l2"].value);
        alert(map.getBounds().getWest());
        v1.elements["l1"].value = map.getBounds().getWest();
        v1.elements["l2"].value = map.getBounds().getNorth();
        v1.elements["l3"].value = map.getBounds().getEast();
        v1.elements["l4"].value = map.getBounds().getSouth();
        alert("done");
    });*/
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
function mayfly(t6)
{
    map.flyTo([messages_cord[t6][0], messages_cord[t6][1]], 14);
    res_markers[t6].openPopup();
}
function mayfly2(t15,t16,t17)
{
//alert("fly2  "+t15+"   "+t16+"   "+t17);
    map.flyTo([t16,t17],14);
    res_markers[t15].openPopup();
}

function startWorker() {
alert("start notfications");
    if(typeof(Worker) !== "undefined") {
        if(typeof(w) == "undefined") {
            w = new Worker("js/myworker.js");
           
        }
        w.onmessage = function(event) 
        {
           
            document.getElementById("content_messages").innerHTML = "";
            myarr = JSON.parse(event.data);
             //alert("array length"+myarr.item);
           // obj = JSON.parse(myarr.item[0]);         
if(Array.isArray(myarr.item))       
{     if (myarr.item.length > 0)
            {
                for (var i = 0; i < myarr.item.length; i++)
                {
                    obj = JSON.parse(myarr.item[i]);
                    res_markers[i] = L.marker([obj.Latitude, obj.Longitude]);
                    res_markers[i].bindPopup(obj.Message).openPopup();
                    markers_l.addLayer(res_markers[i]);

          //            messages_cord[i]=[obj.Latitude, obj.Longitude,obj.Message];            
    document.getElementById("content_messages").innerHTML = document.getElementById("content_messages").innerHTML +
            "<div onclick=\"mayfly2("+i+","+obj.Latitude+","+obj.Longitude +")\" style=\"padding-top:10px;\" ><h5 style=\"font-size:24px;text-align: right;color:#d3e460\">"+
            obj.Message+
            "</h5><hr/></div>";
                } 
map.addLayer(markers_l);
            }
        }
else{
                    obj = JSON.parse(myarr.item);
                    res_markers[0] = L.marker([obj.Latitude, obj.Longitude]);
                    res_markers[0].bindPopup(obj.Message).openPopup();
                    markers_l.addLayer(res_markers[0]);
                     // messages_cord[0]=[obj.Latitude, obj.Longitude,obj.Message];
    document.getElementById("content_messages").innerHTML = document.getElementById("content_messages").innerHTML +
            "<div onclick=\"mayfly2("+0+","+obj.Latitude+","+obj.Longitude +")\" style=\"padding-top:10px;\" ><h5 style=\"font-size:24px;text-align: right;color:#d3e460\">"+obj.Message+"</h5><hr/></div>";
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



// ***********************************************************************************
