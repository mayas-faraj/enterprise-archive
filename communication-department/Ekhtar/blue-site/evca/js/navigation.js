$(document).ready(function()
{
	var satellite=L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true});
	var streetsOpacity=L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true, opacity: .5});
	var streets=L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true});
	
	var northEast=L.latLng(37.7, 43.6);
	var southWest=L.latLng(31.94, 35.15);

	var map=L.map('map', 
	{
		maxBounds: L.latLngBounds(southWest, northEast),
		center:[35,39],
		zoom: 8,
		layers: [satellite, streetsOpacity]
	}); 

	var baseMaps=
	{
		"قمر صناعي":satellite,
		"مناطق":streets
	};

	var totalMaps=
	{
		"تسميات": streetsOpacity
	}

	var layers=L.control.layers(baseMaps, totalMaps);
	layers.addTo(map);

	var marker=L.marker([35,38]);
	var circle=L.circle([35,38], {color: 'red', fillColor: '#f03', fillOpacity: .5, radius: 500});
	marker.bindPopup('I am a marker');
	circle.bindPopup('I am a circle');
	circle.addTo(map);
	marker.addTo(map);
	
});
