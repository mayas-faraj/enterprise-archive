var map=null;
var satellite;
var streetsOpacity;
var streets;


$(document).ready(function()
{
	satellite=L.tileLayer('./../assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, reuseTitles: true});
	streetsOpacity=L.tileLayer('./../assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, resuseTiles: true, opacity:0.5});
	streets=L.tileLayer('./../assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, resuseTiles: true});

	var northEast=L.latLng(37.7, 43.2);
	var southWest=L.latLng(31.94, 33.97);

	map=L.map('map',
	{
		//maxBounds: L.latLngBounds(southWest, northEast),
		center:[34.8,38.5],
		zoom: 7,
		zoomSnap: 0.1,
		layers: [satellite, streetsOpacity]
	});

	var baseMaps=
	{
		"قمر صناعي":satellite,
		"مخططات":streets
	};

	var totalMaps=
	{
		"تسميات": streetsOpacity
	}

	var layers=L.control.layers(baseMaps, totalMaps);
	layers.addTo(map);

	var latitude = getVariable("latitude");
	var longitude = getVariable("longitude");
	var message = getVariable("message");
	var icon = getVariable("icon");

	if(latitude!=null && longitude!=null)
		flyToLocation(longitude, latitude, message, icon);

	function getVariable(name)
	{
		var url = window.location.href;
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		results = regex.exec(url);
		if (!results) return null;
		if (!results[2]) return '';
		return decodeURIComponent(results[2].replace(/\+/g, " "));
	}
});

function flyToLocation(longitude, latitude, message, icon)
{
	var marker;
	var leafletIcon=null;

	if(icon != null)
	{
		leafletIcon = L.icon({iconUrl: "imgs/"+icon+".png", iconSize: [32, 32]});
		marker = L.marker([latitude, longitude], {icon: leafletIcon});
	}
	else
		marker = L.marker([latitude, longitude]);

	if(message!=null)
		marker.bindPopup(message).openPopup();

	console.log(map, "map");	
	map.addLayer(marker);	
	map.flyTo(marker.getLatLng(), 10);
	marker.openPopup();
}
