var map;
var res_markers = [];
var messages_cord = [];
var markers_l = new L.FeatureGroup();
var rect;
var areaSelect;
var allUsers="";

var l1;
var l2;
var l3;
var l4;

var br1;
var br2;
var br3;
var br4;
var myicon;
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


	StropheAccess.connected(function()
	{
		StropheAccess.getNodes(function(nodes)
		{
			$(nodes).find('affiliation').each(function()
			{
				StropheAccess.getUsers($(this).attr('node'), function(users)
				{
					$(users).find('affiliation').each(function()
					{
						if($(this).attr('affiliation')=='publisher')
							allUsers+=Strophe.getNodeFromJid($(this).attr('jid'))+';';
					});
				});
			});
		});	
	});
});



function loadpics()
{
    var southWest = L.latLng(32, 35.5);
    var northEast = L.latLng(37.4, 43);
     myicon=L.icon({iconUrl:'imgs/node/es-cd.png', iconSize:[32,32]});
 
thierisselectedarea=0;
    l1= 35.5;
    l2 = 37.4;
    l3 = 42.5;
    l4 = 32;
    
  var satellite = L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 16}),
            streets = L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16});
    
   
    map = L.map('map', {center: [34, 39],
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
console.log(allUsers);
InterfaceAccess.getUsersLastPoint(allUsers, function(responseText)
{
	if(responseText=='There are no privileges!')
                                        window.location.replace('nonePrivileges.html');

	myarr = responseText.split('<br />');
	if (myarr.length > 0)
	{
		for (var i = 0; i < myarr.length; i++)
		if(myarr[i]!='')
		{
			try
			{
			obj = JSON.parse(myarr[i]);
			var image;
			
			if(obj.Node=='')
				image='imgs/node/es-cd.png';
			else
				image='imgs/node/'+obj.Node+'.png';

			res_markers[i] = L.marker([obj.Coordinate.Latitude, obj.Coordinate.Longitude], {icon : L.icon({iconUrl:image, /*shadowUrl:'imgs/shadow.png', shadowSize: [32,32] ,*/iconSize:[32,32]})});
			res_markers[i].bindPopup(obj.Publisher+"<img style='width:15px;height:15px' src='imgs/phone.png'/><br />"+obj.Date+"<img style='width:15px;height:15px' src='imgs/clock.png'/>").openPopup();
			markers_l.addLayer(res_markers[i]);
			messages_cord[i]=[obj.Coordinate.Latitude, obj.Coordinate.Longitude,obj.Publisher]; 
			document.getElementById("content_messages").innerHTML = document.getElementById("content_messages").innerHTML +
			'<div dir="ltr" style="color:white;cursor: pointer;padding-top:10px;"><div><a href="profile.html?id='+obj.Publisher+'"><img src="imgs/node/'+obj.Node+'.png" style="width: 40px; height: 40px; margin: 5px;"></a><h5 style="display: inline;font-size:20px;text-align: left;color:#f6ebeb"><a style="color: white;" href="profile.html?id='+obj.Publisher+'">'+obj.Publisher+'</a><img src="imgs/map_movelocation.png" onclick="mayfly('+i+')" style="width:40px; height: 40px;right:10px;position: absolute;"></h5></div><img style="width:20px;height:20px" src="imgs/clock.png">'+obj.Date+'<br><hr></div>'
			"<div onclick=\"mayfly("+i+")\" style=\"padding-top:10px;\" ><h5 style=\"font-size:24px;text-align: right;\">"+obj.Publisher+"</h5><hr/></div>";
			}
			catch(ex)
			{
				console.log(myarr[i]);
				console.log(ex);
			}
		} 
		map.addLayer(markers_l);
	}
	else
	{
		alert("not an array");
		try
		{
			obj = JSON.parse(myarr);
			res_markers[0] = L.marker([obj.Coordinate.Latitude, obj.Coordinate.Longitude]);
			res_markers[0].bindPopup(obj.Publisher+"<br />"+obj.Date).openPopup();
			markers_l.addLayer(res_markers[0]);
			messages_cord[0]=[obj.Coordinate.Latitude, obj.Coordinate.Longitude,obj.Publisher];
			document.getElementById("content_messages").innerHTML = document.getElementById("content_messages").innerHTML +
				'<div dir="ltr" style="color:white;cursor: pointer;padding-top:10px;"><div><a href="profile.html?id='+obj.Publisher+'"><img src="imgs/node/'+obj.Node+'.png" style="width: 40px; height: 40px; margin: 5px;"></a><h5 style="display: inline;font-size:20px;text-align: left;color:#f6ebeb"><a style="color: white;" href="profile.html?id='+obj.Publisher+'">'+obj.Publisher+'</a><img src="imgs/map_movelocation.png" onclick="mayfly('+i+')" style="width:40px; height: 40px;right:10px;position: absolute;"></h5></div><img style="width:20px;height:20px" src="imgs/clock.png">'+obj.Date+'<br><hr></div>'
				"<div onclick=\"mayfly("+i+")\" style=\"padding-top:10px;\" ><h5 style=\"font-size:24px;text-align: right;\">"+obj.Publisher+"</h5><hr/></div>";
			map.addLayer(markers_l);
		}
	  	catch(ex)
		{
			console.log(myarr[i]);
			console.log(ex);
		}
	}
});
}

function mayfly(t6)
{
    map.flyTo([messages_cord[t6][0], messages_cord[t6][1]], 14);
    res_markers[t6].openPopup();
}

// *******************************************************************************************
function  myareaselect()
{
    if(thierisselectedarea===0)
    {        
thierisselectedarea=1;
areaSelect =  L.areaSelect();

areaSelect.addTo(map);
// Read the bouding box
var bounds = areaSelect.getBounds();
// Get a callback when the bounds change
areaSelect.on("change", function() {
 bounds = areaSelect.getBounds();
 br1=bounds.getWest();
 br2=bounds.getNorth();
 br3=bounds.getEast();
 br4=bounds.getSouth();
// alert("br1="+br1+"  "+br2+"   "+br3+"   "+br4);
});
    }
}
function  unselect()
{if(thierisselectedarea===1){
    areaSelect.remove();  
    thierisselectedarea=0;
    }
}
/*
function showmessagedialog() 
{
  		var xmlhttp2 = new XMLHttpRequest();
                var xmlhttpusers = new XMLHttpRequest(); 
                xmlhttp2.onreadystatechange = function ()
                {
                        if (this.readyState == 4 && this.status == 200)
                        {
 				$url = 'http://192.168.90.11/ekhtar/sendmessage.php';
                               	$param = array('users' =>'');
 				$data= array('userr' => '');
                                $options = array('http' => array('header'  => "Content-type: application/x-www-form-urlencoded\r\n",
                                                                 'method'  => 'POST',
                                                                 'content' => http_build_query($data)));

                                $context  = stream_context_create($options);
                                $result = file_get_contents($url, false, $context);
                                var_dump($result);

                        }
                }
                var strvar = "l1=" + br1 + "&l2=" + br2 + "&l3=" + br3 + "&l4=" + br4;
                xmlhttp2.open("GET", "php/usersbycoordinate.php?"+ strvar, true);
                xmlhttp2.send();

}
*/
function sendmessage(){
//alert("br1="+br1+"  "+br2+"   "+br3+"   "+br4);
/*
   var xmlhttp2 = new XMLHttpRequest();
   var xmlhttpusers = new XMLHttpRequest();
    xmlhttp2.onreadystatechange = function () {         
        if (this.readyState == 4 && this.status == 200) {
            alert("<br>"+this.responseText);
            console.log(this.responseText);
              }
    }
    var strvar = "l1=" + br1 + "&l2=" + br2 + "&l3=" + br3 + "&l4=" + br4;
    xmlhttp2.open("GET", "sendmessage.php?"+ strvar, true);
    xmlhttp2.send();
*/
	var args = "b1=" + br1 + "&b2=" + br2 + "&b3=" + br3 + "&b4=" + br4;
	window.location="commands.html?"+args;
}
