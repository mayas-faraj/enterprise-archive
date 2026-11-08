var map;
var res_markers = [];
var messages_cord = [];

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

var starticon;
var roadicon;
var endicon;
var path=[];
var plines;
var jj=0;


function loadpics()
{
    var southWest = L.latLng(32, 35.5);
    var northEast = L.latLng(37.4, 43);
path=[];
res_markers = [];
messages_cord = [];
jj=0;
 starticon=L.icon({iconUrl:'http://192.168.90.11/ekhtar/css/images/start.png',shadowUrl:'http://192.168.90.11/ekhtar/css/images/signshadow.png',iconAnchor:[15,30]});
 roadicon=L.icon({iconUrl:'http://192.168.90.11/ekhtar/css/images/road.png',shadowUrl:'http://192.168.90.11/ekhtar/css/images/signshadow.png',iconAnchor:[15,30]});
 endicon=L.icon({iconUrl:'http://192.168.90.11/ekhtar/css/images/end.png',shadowUrl:'http://192.168.90.11/ekhtar/css/images/signshadow.png',iconAnchor:[15,30]});
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
     $("#messagedialog").dialog("open");
    //map.on('click', function(e) { alert(" Lat , Lon : " + e.latlng.lat + "," + e.latlng.lng); });
}



function sendusername(id){
var obj;
    l1= 35.5;
    l2 = 37.4;
    l3 = 42.5;
    l4 = 32;

InterfaceAccess.getShortNavigations(id,function(result)
{
		var startIcon=L.icon({iconUrl: 'imgs/map_startlocation.png', iconSize: [45,45]});
		var endIcon=L.icon({iconUrl: 'imgs/map_endlocation.png', iconSize: [45,45]});
		var pointIcon=L.icon({iconUrl: 'imgs/map_movelocation.png', iconSize: [40,40]});
		var locations=result.split('<br />');
		var pointIndex=0;
		var pointOrder=0;
		var startDate="";
		
		for (var i = 0; i < locations.length; i++)
		if(locations[i]!="")
		{
		   obj=JSON.parse(locations[i]);
		
		   if(obj.Latitude>l2 || obj.Latitude<l4 || obj.Longitude>l3 || obj.Longitude<11 || (obj.Latitude==0 &&  obj.Longitude==0))
			continue;

		   if(i>0 &&
			(res_markers[pointIndex].getLatLng().lng==obj.Longitude && 
			res_markers[pointIndex].getLatLng().lat==obj.Latitude))
		   {
			res_markers[pointIndex].bindPopup('<center>('+(pointOrder)+')<br /><img style="width:15px;height:15px" src="imgs/clock.png"/>'+startDate+ '<br />حتى<br /><img style="width:15px;height:15px" src="imgs/clock.png"/>'+obj.LocationTime+'</center>');
			continue;
		   }

		   pointIndex=i;
		   pointOrder++;
		   startDate=obj.LocationTime;
		
		   if(i==0) 
		   {
			res_markers[i] = L.marker([obj.Latitude, obj.Longitude], {icon: startIcon});
			res_markers[i].bindPopup('<center>البداية<br/><img style="width:15px;height:15px" src="imgs/clock.png"/>'+obj.LocationTime+'</center>').openPopup();
			res_markers[i].addTo(map);
			messages_cord[i]=[obj.Latitude, obj.Longitude,obj.LocationTime];            
			path[jj]=[obj.Latitude, obj.Longitude];                   
			jj=jj+1;
		   }
		   else if(i == (locations.length-2))
		   {
			res_markers[i] = L.marker([obj.Latitude, obj.Longitude], {icon: endIcon});
			res_markers[i].bindPopup('<center>النهاية<br/><img style="width:15px;height:15px" src="imgs/clock.png"/>'+obj.LocationTime+'</center>').openPopup();
			res_markers[i].addTo(map);
			messages_cord[i]=[obj.Latitude, obj.Longitude,obj.LocationTime];            
			path[jj]=[obj.Latitude, obj.Longitude]; 
			jj=jj+1;
		   }
		   else
		   {
			res_markers[i] = L.marker([obj.Latitude, obj.Longitude], {icon:pointIcon});
			res_markers[i].bindPopup('<center>('+pointOrder+')<br /><img style="width:15px;height:15px" src="imgs/clock.png"/>'+obj.LocationTime+'</center>').openPopup();
			res_markers[i].addTo(map);
			messages_cord[i]=[obj.Latitude, obj.Longitude,obj.LocationTime];            
			path[jj]=[obj.Latitude , obj.Longitude];
			jj=jj+1;
		  }
			 
		L.polyline(path).addTo(map);
		map.flyTo(path[0], 12);

		lastLongitude=obj.Longitude;
		lastLatitude=obj.Latitude;
	    }
});
}

function load()
{
        var url=window.location.search;
        if(url!="")
        {
                url=url.substring(1);
                var parts=url.split('&');
                var params={}
                for(var i=0;i<parts.length;i++)
                {
                        var nv=parts[i].split('=');
                        if(!nv[0]) continue;
                        params[nv[0]] = nv[1] || true;
                }

                id=params.id;
                fetch(id);

		sendusername(id);
        }

}

window.onload=load();
