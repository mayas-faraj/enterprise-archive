var map;
var markcount=0;
var res_markers = [];
var messages_cord = [];
var markers_l = new L.FeatureGroup();
var rect;
var areaSelect;


$(document).ready(function () {
    $(function () {
        $("#bookmarkdialog").dialog({
            autoOpen: false
        });
        $("#places").dialog({
            autoOpen: false
        });
        $('#test').BootSideMenu({side: "left", autoClose: true});
    });

	var scroller=document.getElementById('scroller');

	scroller.onscroll = function()
	{
		if ((window.innerHeight + scroller.scrollTop) == scroller.scrollHeight + 67 )
		{
			if(stream)
				 ajaxp1_m();

			console.log("srcolling");
		}

	}
	var stream=true;
	var rowKey="0";
	var emaRowKey="0";

});

function loadpics()
{
    var southWest = L.latLng(31.94, 33.9);
    var northEast = L.latLng(37.7, 43.6);
    var v1 = document.forms['form1'];
    v1.elements["l1"].value = 35.5;
    v1.elements["l2"].value = 37.4;
    v1.elements["l3"].value = 42.5;
    v1.elements["l4"].value = 32;
    
    /*
     map = L.map('map',{maxBounds:L.latLngBounds(southWest, northEast), selectArea: true}).setView([35,39.3],8);
     L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg',{minZoom:8,maxZoom:17}).addTo(map);
     */
    

    var satellite = L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 19,  maxNativeZoom: 16, minNativeZoom: 8}),
            streets = L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 19,  maxNativeZoom: 16, minNativeZoom: 8});
    
  /*    map = new   L.Map('map', {maxBounds: L.latLngBounds(southWest, northEast), center: [35, 39],
        zoom: 8,
        layers: [satellite],
  selectArea: true // will enable it by default
});
  */
   
    map = L.map('map', {maxBounds: L.latLngBounds(southWest, northEast), center: [34, 39],
        zoom: 7.5, 
        layers: [streets] // only add one!
    });


    var baseLayers = {
        "Satellite Map": satellite,
        "Streets Map": streets
    };

    L.control.layers(baseLayers).addTo(map);
    
    
    /*
     * 
     map.selectArea.enable(); 
     map.selectArea.setCtrlKey(true);
    map.on('areaselected', (e) => {
  alert("selcted");
});

// You can restrict selection area like this:
const bounds = map.getBounds().pad(-0.25); // save current map bounds as restriction area
// check restricted area on start and move
map.selectArea.setValidate((layerPoint) => {
  return bounds.contains(
    this.map.layerPointToLatLng(layerPoint)
  );
});
     
     **/

/*
var locationFilter =  L.LocationFilter({enable:true,buttonPosition:"bottomleft"}).addTo(map);


locationFilter.on("change", function (e) {
    // Do something when the bounds change.
    // Bounds are available in `e.bounds`.
});

locationFilter.on("enabled", function () {
    // Do something when enabled.
});

locationFilter.on("disabled", function () {
    // Do something when disabled.
});
    

rect = L.rectangle([[33, 36], [35, 38]]);
map.addLayer(rect);
rect.editing.enable();

rect.on('edit', function() { alert(rect.getBounds().getWest()); });
*/

// events
    map.on('moveend', function () {
        //alert(map.getBounds().getSouthWest());
        var v1 = document.forms['form1'];
        var v2 = v1.elements["l1"];
        // alert(v1.elements["l2"].value);
        //alert(map.getBounds().getWest());
        v1.elements["l1"].value = map.getBounds().getWest();
        v1.elements["l2"].value = map.getBounds().getNorth();
        v1.elements["l3"].value = map.getBounds().getEast();
        v1.elements["l4"].value = map.getBounds().getSouth();
        //alert("done");
    });
    //map.on('click', function(e) { alert("Lat, Lon : " + e.latlng.lat + ", " + e.latlng.lng); });
    /*
     map.selectArea.setCtrlKey(true); 
     // events
     /*map.on('moveend', function() { 
     alert(map.getBounds().getSouthWest());
     });
     map.on('click', function(e) { alert("Lat, Lon : " + e.latlng.lat + ", " + e.latlng.lng); });*/
    /*
     map.on('areaselected', (e) => {
     alert("Lat");
     console.log(e.bounds.toBBoxString()); // lon, lat, lon, lat 
     });
     */



}

function addbookmark() {

    $("#bookmarkdialog").dialog("open");

}
function finddata() {
    /* alert("search()");*/

    $("#searchdialog").dialog("open");

}

function wbs1() {
    alert("wbs1");



}
function insertbm() {
   // alert("insert");
    var latitude1 = $("#latitude").val();
    var longitude1 = $("#longitude").val();
    var message = $("#message").val();

    if (latitude1 === '' || longitude1 === '') {
        alert("Please fill all fields...!!!!!!");
        // e.preventDefault();
    } else
    {
        var marker = L.marker([latitude1, longitude1])
                .addTo(map)
                .bindPopup("<b>" + message + "</b>")
                .openPopup();

        $("#bookmarkdialog").dialog("close");
    }
}

// Validating Form Fields.....

function drawmark22() {
    markers_l = new L.FeatureGroup();

    for (j = 0; j < res_markers.length; j++) {
        marker = new L.marker([res_markers[j][1], res_markers[j][2]])
                .bindPopup(res_markers[j][0])
                .addTo(map);
    }

}


function drawmark(t0, t1, t2, t3) {
    var index = t0;
    var latitude1 = t1;
    var longitude1 = t2;
    var message = t3;
    alert(t1 + "     " + t2 + "     " + t3 + "     " + t0);
    res_markers[index] = L.marker([latitude1, longitude1])
            .addTo(map)
            .bindPopup("<b>" + message + "</b>")
            .openPopup();


}

function clearmarkers() {
    map.removeLayer(markers_l);
    markers_l=new L.FeatureGroup();
    res_markers = [];
    messages_cord=[];
}

function ajaxp1() {
    alert("ajax");
    var v3 = document.forms['form1'];
    var l1 = v3.elements["l1"].value;
    var l2 = v3.elements["l2"].value;
    var l3 = v3.elements["l3"].value;
    var l4 = v3.elements["l4"].value;
    var l5 = v3.elements["key_word"].value;
    var l6 = v3.elements["starttime"].value;
    var l7 = v3.elements["endtime"].value;
    var l8 = v3.elements["user"].value;
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        var obj;
        if (this.readyState == 4 && this.status == 200) {
            alert("ok2");
            alert(this.responseText);
	    console.log(this.responseText);
            myarr = JSON.parse(this.responseText);
            // alert(myarr.item.length);
            obj = JSON.parse(myarr.item[0]);
            v3.elements["key_word"].value = obj.Latitude;
            // alert(myarr.item[0]);
            //  alert( obj.Latitude);
            if (myarr.item.length > 0)
            {
                for (i = 0; i < myarr.item.length; i++)
                {
                    //   alert("be");
                    obj = JSON.parse(myarr.item[i]);
                    //res_markers[i]=[obj.Message,obj.Latitude,obj.Longitude];
                    drawmark(i, obj.Latitude, obj.Longitude, obj.Message);
                    /*       res_markers[i] =L.marker([obj.Latitude,obj.Longitude])
                     .addTo(map)
                     .bindPopup("<b>"+obj.Message+"</b>")
                     .openPopup();
                     alert("aft");
                     }*/

                    //  alert("aft");
                }
                // drawmark22();
            }

        }
    }
    var strvar = "l1=" + l1 + "&l2=" + l2 + "&l3=" + l3 + "&l4=" + l4 + "&key_word=" + l5;
    xmlhttp.open("GET", "php/getreportbyargs.php?" + strvar, true);
    xmlhttp.send();

}


// insert to div


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


function insertbm2() {
    //alert("insert");
    var latitude1 = $("#latitude").val();
    var longitude1 = $("#longitude").val();
    var message = $("#message").val();

    if (latitude1 === '' || longitude1 === '') {
        alert("Please fill all fields...!!!!!!");
        // e.preventDefault();
    } else
    {
        var marker = L.marker([latitude1, longitude1]);
        marker.bindPopup("<b>" + message + "</b>")
                .openPopup();
        markers_l.addLayer(marker);
        map.addLayer(markers_l);
        $("#bookmarkdialog").dialog("close");
    }
}
function ajaxp1_click()
{
	rowKey="0";
	emaRowKey="0";
	stream=false;
	ajaxp1_m();
}


function ajaxp1_m() {
    var v3 = document.forms['form1'];
    var l1 = v3.elements["l1"].value;
    var l2 = v3.elements["l2"].value;
    var l3 = v3.elements["l3"].value;
    var l4 = v3.elements["l4"].value;
    var l5 = v3.elements["key_word"].value;
    var l6 = v3.elements["starttime"].value;
    var l7 = v3.elements["endtime"].value;
    var l8 = v3.elements["user"].value;
console.log('stream:'+stream);
if(!stream)
{
document.getElementById("content_messages").innerHTML="";
clearmarkers();
}
console.log(l8, l5, l6, l7, l1, l2, l3, l4, rowKey, emaRowKey);

if(l6=="" || l6==null) l6="1-1-2016 12:00:00"; 
if(l7=="" || l7==null) l7="1-1-2018 12:00:00";

InterfaceAccess.getReportsByArgs(l8, l5, l6, l7, l1, l2, l3, l4, rowKey, emaRowKey, "10", function(result)
{
	console.log(result);
	
	if(result!="")
	{
		var reports=result.split('<br />');
			
		for(var i=0;i<reports.length;i++)
			if(reports[i]!="")
			{
				var obj=JSON.parse(reports[i]);

				if(obj.Message!=undefined && obj.Message!="" && obj.Message!=null)
				{
					//calculate coordinates
					var x=0;
					var y=0;
					var isGps=false;

					if(obj.Gps!=undefined)
					{
						x=obj.Gps.Longitude;
						y=obj.Gps.Latitude;
						isGps=true;
					}

					if(x==0 && y==0 && obj.CellInfo!=undefined)
					{
						x=obj.CellInfo.Longitude;
						y=obj.CellInfo.Latitude;
						isGps=false;
					}

					if(x==0 && y==0)
					{
						locationImg="<img src='imgs/map_nolocation.png' style='width:40px; height: 40px;right:10px;position: absolute;'>";
					}
					else
					{
						window['marker_'+markcount] = L.marker([y, x]);
						window['marker_'+markcount].bindPopup(obj.Publisher +":<br/>"+obj.Message).openPopup();

						map.addLayer(window['marker_'+markcount]);
						markcount=markcount+1;

						if(isGps)
							locationImg="<img src='imgs/map_gpslocation.png' onclick='mayfly2("+markcount+","+y+","+x+")' style='width:40px; height: 40px;right:10px;position: absolute;'>";
						else
							locationImg="<img src='imgs/map_location.png' onclick='mayfly2("+markcount+","+y+","+x+")' style='width:40px; height: 40px;right:10px;position: absolute;'>";
					}

                                        var mark=markcount-1;

                                        document.getElementById("content_messages").innerHTML="<div dir='ltr' id=\"div"+mark +"\" style=\"cursor: pointer;padding-top:10px;\" ><input type='hidden' value='0'/><div><a style='color:white;' href='profile.html?id="+obj.Publisher+"'><img src='imgs/node/"+obj.Es+".png' style='width: 40px; height: 40px; margin: 5px;'/><h5 style=\"display: inline;font-size:20px;text-align: left;color:#f6ebeb\">"+obj.Publisher+"</a>"+locationImg+"</h5></div><h5 style=\"margin-right: 10px;font-size:24px;text-align: right;\">"+
                                                obj.Message+"</h5>"+obj.Date+"<br/><img src='imgs/state_error.png'  id=\""+mark+"\" name=\"ch"+mark+"\" value=\"del\" onclick=\"delm("+mark+")\"  style=\"position:static;left:60px;opacity:20; width:20px;height:20px;\"/>"
                                                +"<hr/></div>"+document.getElementById("content_messages").innerHTML;

/*
					res_markers[i] = L.marker([latitude, longitude]);
					res_markers[i].bindPopup(obj.Publisher+"<br/> "+obj.Message).openPopup();
					markers_l.addLayer(res_markers[i]);
					messages_cord[i]=[latitude, longitude,obj.Message];
					console.log(latitude, longitude,obj.Message);
					document.getElementById("content_messages").innerHTML +=
					"<div onclick=\"mayfly("+i+")\" style=\"cursor: pointer;direction: ltr;padding-top:10px;\" ><div><a target='_blank' href='profile.html?id="+obj.Publisher+"&n="+obj.Es+"'><img style='width:40px; height: 40px; margin: 5px;' src='imgs/node/"+obj.Es+".png'/><h5 style=\"display: inline;font-size:24px;text-align: left;color:#f6ebeb\">"+obj.Publisher+"</h5></a></div><h5 style=\"font-size:24px;text-align: right;color:black\">"+obj.Message+"</h5>"+obj.Date+"<hr/></div>";
*/
					if(obj.Realtime)
						emaRowKey=obj.RowKey;
					else
						rowKey=obj.RowKey;
					
				}
			

			map.addLayer(markers_l);

			$("#searchdialog").dialog("close");
			stream=true;
		}
	}
});
}

function mayfly2(t15,t16,t17)
{
    map.flyTo([t16,t17], 14);
    window['marker_'+(parseInt(t15)-1).toString()].openPopup();
}

function mayfly(t6)
{
    map.flyTo([messages_cord[t6][0], messages_cord[t6][1]], 14);
    res_markers[t6].openPopup();
}

function delm(mc11) {
    //alert("ha2  "+mc11);
    var parentd=document.getElementById(content_messages);
    $("#div"+mc11).remove();
    map.removeLayer(window['marker_'+mc11]);
    window['marker_'+mc11]=undefined;

}

function  myareaselect()
{var areaSelect = L.areaSelect();
areaSelect.addTo(map);
// Read the bouding box
var bounds = areaSelect.getBounds();
// Get a callback when the bounds change
areaSelect.on("change", function() {
 //   alert("Bounds:", this.getBounds().getWest());
});
}
