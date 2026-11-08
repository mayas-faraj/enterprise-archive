var map;
var res_markers = [];
var messages_cord = [];
var markers_l = new L.FeatureGroup();


function loadpics()
{
    var southWest = L.latLng(32, 35.5);
    var northEast = L.latLng(37.4, 43);

    var satellite = L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 16}),
            streets = L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16});
   
    map = L.map('map', {zoomControl:false, maxBounds: L.latLngBounds(southWest, northEast), center: [33.5, 36.3],
        zoom: 8,
        layers: [streets] // only add one!
    });


    draw();
}

function draw() 
{
    var url=window.location.search;
    if(url=="") return;

    url=url.substring(1);
    var parts=url.split('&');
    var params={}
    for(var i=0;i<parts.length;i++)
    {
        var nv=parts[i].split('=');
        if(!nv[0]) continue;
        params[nv[0]] = nv[1] || true;
    }

    var latitude = params.latitude;
    var longitude = params.longitude;
    var message= params.message;

    if(latitude!=0 || longitude!=0)
    {
        var marker = L.marker([latitude, longitude]);
        marker.bindPopup("<b>" + message  + "</b>").openPopup();
        markers_l.addLayer(marker);
        map.addLayer(markers_l);
	map.flyTo([latitude, longitude], 12);	
    }
}

