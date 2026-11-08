$(document).ready(function()
{
	var satellite=L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true});
	var streetsOpacity=L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true, opacity: .5});
	var streets=L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true});
	var markersLayer=L.featureGroup();
	
	var northEast=L.latLng(37.7, 43.6);
	var southWest=L.latLng(31.94, 35.15);
	var areaSelect=null;

	var usersString='';

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
	map.addLayer(markersLayer);

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
							usersString+=Strophe.getNodeFromJid($(this).attr('jid'))+';';
					});
				});
			});
		});
	});

	$('#usersButton').click(function()
	{
		markersLayer.clearLayers();
		console.log(usersString);
		InterfaceAccess.getUsersLastPoint(usersString, function(responseText)
		{
			console.log(responseText);
			if(responseText=='There are no privileges!')
					window.location.replace('nonePrivileges.html');
			var users=responseText.split('<br />');
			for(var i=0;i<users.length;i++)
				if(users[i]!='')
				{
					try
					{
						var obj=JSON.parse(users[i]);
						var marker=L.marker([obj.Coordinate.Latitude, obj.Coordinate.Longitude], {icon: L.icon({iconUrl: 'imgs/node/'+obj.Node+'.png', iconSize: [32,32]})});
						marker.bindPopup(obj.Publisher+"<img style='width:15px;height:15px' src='imgs/phone.png'/><br />"+obj.Date+"<img style='width:15px;height:15px' src='imgs/clock.png'/>").openPopup();
						markersLayer.addLayer(marker);
					}
					catch(ex)
					{
						console.log(ex);

					}
				}
		});
	});

	$('#selectButton').click(function()
	{
		areaSelect=L.areaSelect();
		areaSelect.addTo(map);
		console.log('x');
	});

	$('#deselectButton').click(function()
	{
		if(areaSelect!=null)
			areaSelect.remove();
	});

	$('#messageButton').click(function()
	{
		if(areaSelect==null)
			window.open("commands.html", "_blank");
		else
		{
			bounds=areaSelect.getBounds();
			window.open("commands.html?b1="+bounds.getWest()+"&b2="+bounds.getNorth()+"&b3="+bounds.getEast()+"&b4="+bounds.getSouth(), "_blank");	
		}
	});

	$('#configButton').click(function()
	{
		
	});
});
