$(document).ready(function()
{
	//consts
	var NOW="الآن";

	//initilize map
	var satellite=L.tileLayer('./../assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 18,  maxNativeZoom: 16, resuseTiles: true});
	var streetsOpacity=L.tileLayer('./../assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 18, maxNativeZoom: 16, reuseTiles: true, opacity: .5});
	var streets=L.tileLayer('./../assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 18, maxNativeZoom: 16, reuseTiles: true});
	markersLayer=L.featureGroup();

	var northEast=L.latLng(37.7, 43.6);
	var southWest=L.latLng(31.94, 35.15);
	$('.fixed-action-btn').floatingActionButton();

	map=L.map('map',
	{
		maxBounds: L.latLngBounds(southWest, northEast),
		center:[35,39],
		zoom: 8,
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
	map.addLayer(markersLayer);

 	var startIcon=L.icon({iconUrl: 'imgs/map_startlocation.png', iconSize: [32,32]});
	var moveIcon=L.icon({iconUrl: 'imgs/map_movelocation.png', iconSize: [32,32]});
	var gpsIcon=L.icon({iconUrl: 'imgs/map_gpslocation.png', iconSize: [32,32]});
	var endIcon=L.icon({iconUrl: 'imgs/map_endlocation.png', iconSize: [32,32]});

	//initilize legend
	var legend=new L.Control.Legend(
	{
		position: 'topright',
		collapsed: true,
		controlButton:
		{
			title: "الرموز المستخدمة"
		}
	});

	map.addControl(legend);

	$(".legend-container").append($("#legend"));
	$(".legend-toggle").append("<i class='legend-toggle-icon fa fa-info fa-2x' style='color: #000'>i</i>");

	$("#legend").append("<div class='map-legend-item'><img src='imgs/map_startlocation.png' class='map-legend-image'/><label class='map-legend-text'>بداية الإنتقال</label></div>");
	$("#legend").append("<div class='map-legend-item'><img src='imgs/map_movelocation.png' class='map-legend-image'/><label class='map-legend-text'>إحداثي من برج تغطية</label></div>");
	$("#legend").append("<div class='map-legend-item'><img src='imgs/map_gpslocation.png' class='map-legend-image'/><label class='map-legend-text'>إحداثي من قمر صناعي</label></div>");
	$("#legend").append("<div class='map-legend-item'><img src='imgs/map_endlocation.png' class='map-legend-image'/><label class='map-legend-text'>نهاية الإنتقال</label></div>");

	//initilize variables
	var movePoints=[];
	var allPoints=[];
	var currentPointIndex=0;
	var dateSlider;

	//collapse
        $("div.collapse").css("visibility", "hidden");

        $("a.collapse").click(function()
        {
                var target=$(this).attr("data-target");

                if($(target).css("visibility")=="hidden")
                        $(target).css("visibility", "visible");
                else
                        $(target).css("visibility", "hidden");
        });


	//draw navigation
	if(Master.getVariable('id')!=null)
	{
		loadNavigation(Master.getVariable('id'));
		setInterval(function()
		{
			loadNavigation(Master.getVariable('id'));
			clearNavigation();
			updateNavigation();
		}, 720000);
	}

	function clearNavigation()
	{
		map.eachLayer(function(v){if(v._url==null) map.removeLayer(v)});
	}

	function updateNavigation()
	{
		var drawGps=$('#gpsCheckbox').prop('checked');
		var drawCell=$('#cellCheckbox').prop('checked');
		var date1=$('#longDate1').val();
		var date2=$('#longDate2').val();
		movePoints=[];

		for(var i=0; i<allPoints.length; i++)
		{
			if(((drawGps && allPoints[i].gps) || (drawCell && !allPoints[i].gps)) && (extractDate(allPoints[i].time)>=date1) && (extractDate(allPoints[i].time)<=date2))
				movePoints.push(allPoints[i]);
		}

	 	drawNavigation(movePoints);
	}

	function loadNavigation(id)
	{
		InterfaceAccess.loadUserNavigations(id, function(result)
		{
			console.log(result);
			if(result!=null)
			{
				var resultArray=result.split('<br />');
				allPoints=[];
				movePoints=[];

				if(resultArray.length==0)
				{
					M.toast({html:'لا يوجد تنقلات'}, 4000);	
					return;
				}

				for(var i=0;i<resultArray.length;i++)
					if(resultArray[i].length>0)
					{
						var obj=JSON.parse(resultArray[i]);
						var gps=obj.location.cgi==undefined;
						allPoints.push(
						{
							time: obj.locationTime,
							gps: gps,
							longitude: obj.location.longitude,
							latitude: obj.location.latitude,
							accuracy: obj.location.accuracy,
							text: obj.locationTime+"<img class='map-marker-image' src='imgs/clock.png'/><br/>"
								+(gps?obj.location.accuracy+"<img class='map-marker-image' src='imgs/gps.png'/><br/>":"Cell<img class='map-marker-image' src='imgs/cell.png'/><br/>"),
							marker: null
						});			
					}

				
				var minDate=extractDate(allPoints[0].time).getTime();
				var maxDate=extractDate(allPoints[allPoints.length-1].time).getTime();
				var currentDate=Date.now()-86400000;

				if(currentDate<minDate)
					currentDate=minDate;
				else if(currentDate>maxDate)
					currentDate=maxDate;

				buildSlider(minDate, maxDate, currentDate);
console.log(minDate, maxDate, currentDate);
				if(movePoints==null || movePoints.length==0)
				{
					movePoints=[];
					for(var i=0; i<allPoints.length; i++)
						if(extractDate(allPoints[i].time)>=new Date(maxDate-86400000))
							movePoints.push(allPoints[i]);
				}
				else
					movePoints=allPoints;
				drawNavigation(movePoints, true);
			}
		});
	}

	function drawNavigation(points, isFit)
	{
		if(points.length==0)
			return;

		//drawing points
		var marker;
		var circle;
		var icon;
		var path=[];

		var startIcon=L.icon({iconUrl: 'imgs/map_startlocation.png', iconSize: [32,32]});
		var moveIcon=L.icon({iconUrl: 'imgs/map_movelocation.png', iconSize: [32,32]});
		var gpsIcon=L.icon({iconUrl: 'imgs/map_gpslocation.png', iconSize: [32,32]});
		var endIcon=L.icon({iconUrl: 'imgs/map_endlocation.png', iconSize: [32,32]});

		for(var i=0;i<points.length;i++)
		{
			if(i==0)
				icon=startIcon;
			else if(i==points.length-1)
				icon=endIcon;
			else if(points[i].gps)
				icon=gpsIcon;
			else
				icon=moveIcon;

			marker=L.marker([points[i].latitude, points[i].longitude], {icon: icon});
			marker.bindPopup(points[i].text);
			if(points[i].gps)
			{
				circle=L.circle([points[i].latitude, points[i].longitude], {color: 'red', fillColor: '#f03', fillOpacity: .5, radius: points[i].accuracy});		
				circle.addTo(map);
			}

			points[i].marker=marker;

			marker.addTo(map);

			path.push([points[i].latitude, points[i].longitude]);
		}

		var polyline=L.polyline(path, {opacity: 0.6, weight: 4, dashArray: [5], color: 'green'});
		polyline.addTo(map);

		if(isFit)
			map.fitBounds(polyline.getBounds());
		
		M.toast({html:points.length + " نقطة انتقال."}, 4000);	
	}
			
	$('#homeButton').click(function()
	{
		currentPointIndex=0;
		focusPoint(currentPointIndex);
	});

	$('#nextButton').click(function()
	{
		if(currentPointIndex<movePoints.length-1)
		{
			currentPointIndex++;
			focusPoint(currentPointIndex);
		}
		else
			M.toast({html:"لا يوجد المزيد من التنقلات."}, 4000);
			
	});

	$('#previousButton').click(function()
	{
		if(currentPointIndex>0)
		{
			currentPointIndex--;
			focusPoint(currentPointIndex);
		}
		else
			M.toast({html:"تم الوصول لبداية التنقلات."}, 4000);
	});

	$('#endButton').click(function()
	{
		currentPointIndex=movePoints.length-1;
		focusPoint(currentPointIndex);
	});

	$('#gpsCheckbox ,#cellCheckbox').click(function()
	{
		clearNavigation();
		updateNavigation();
	});

	$('.button-filter-day').click(function()
	{
		var day=parseInt($(this).attr("data-day"));
		var min=dateSlider.noUiSlider.options.range.min;
		var max=dateSlider.noUiSlider.options.range.max;

		var now=new Date(max);
		var dt=(new Date(now.getFullYear(), now.getMonth(), now.getDate()-day, 0, 0, 0, 0)).getTime();

		if(dt>max)
			dt=max;
		else if(dt<min)
			dt=min;

		dateSlider.noUiSlider.set([dt ,null]);
		clearNavigation();
		updateNavigation();
	});

	function focusPoint(index)
	{
		map.flyTo([movePoints[index].latitude, movePoints[index].longitude], 12);
		movePoints[index].marker.openPopup();
	}

	function buildSlider(minDateValue, maxDateValue, currentDate)
	{
		//date slider
		difDateValue=maxDateValue-minDateValue;

		dateSlider = document.getElementById("dateSlider");
		noUiSlider.create(dateSlider,
		{
			start: [minDateValue, maxDateValue],
			connect: true,
			tooltips: false,
			step: 1000*60*60,
			orientation: "horizontal",
			direction: "rtl",
			range:
			{
				"min": minDateValue,
				"max": maxDateValue
			}
		});

		dateSlider.noUiSlider.on('update', function (value, handle)
		{
			if(value[0]!=null && value[1]!=null)
			{
				var date1=moment(parseInt(value[0])).format(DATE_FORMAT);
				var date2=moment(parseInt(value[1])).format(DATE_FORMAT);
				$('#date1').html(date1);

				if(value[1]==maxDateValue)
					$('#date2').html(NOW);
				else
					$('#date2').html(date2);

				$('#longDate1').val(value[0]);
				$('#longDate2').val(value[1])

				return 'من '+date1+' حتى '+date2;
			}
		});

		dateSlider.noUiSlider.on('change', function (values, handle)
		{
			clearNavigation();
			updateNavigation();

		});
	}
});

function extractDate(stringDate)
{
	try
	{
		var date=stringDate.split(' ')[0].split('-');
		var time=stringDate.split(' ')[1].split(':');

		return new Date(date[2],(parseInt(date[1])-1).toString(),date[0],time[0],time[1],time[2]);
	}
	catch(ex)
	{
		console.log(ex);
		return new Date();
	}
}

function formatDate(date)
{
	function formatNumber(i)
	{
		if(i!=null)
			return (i>9)?""+i:"0"+i
		else
			return null;
	}

	return formatNumber(date.getDate())+'-'+formatNumber(date.getMonth()+1)+'-'+(date.getYear()+1900)+' '+formatNumber(date.getHours())+':'+formatNumber(date.getMinutes())+':'+formatNumber(date.getSeconds());
}

var filter=
{
	displayGps:true,
	displayCell:true,
	date1:0,
	date2:0
};

var navigationManager=
{
	navigationSet: {},
	shapeSet: {},
	
	createUser: function(user, color, points)
	{
		navigationSet[user].points=points;
		navigationSet[user].color=color;

		navigationSet[user].filteredPoints=[];
		for(var i=0; i<points.length; i++)
			if(filter.apply(points[i]))
				navigationSet[user].filteredPoints.push(points[i]);
				

				
	},

	drawPoints: function(navigation)
	{
		var points=navigation.filteredPoints;
		var marker;
		var circle;
		var icon;
		var path=[];

		for(var i=0;i<points.length;i++)
		{
			if(i==0)
				icon=startIcon;
			else if(i==points.length-1)
				icon=endIcon;
			else if(points[i].gps)
				icon=gpsIcon;
			else
				icon=moveIcon;

			marker=L.marker([points[i].latitude, points[i].longitude], {icon: icon});
			marker.bindPopup(points[i].text);
			if(points[i].gps)
			{
				circle=L.circle([points[i].latitude, points[i].longitude], {color: navigation.color, fillColor: navigation.color, fillOpacity: .5, radius: points[i].accuracy});
				circle.addTo(map);
			}

			points[i].marker=marker;

			marker.addTo(map);

			path.push([points[i].latitude, points[i].longitude]);
		}

		var polyline=L.polyline(path, {opacity: 0.6, weight: 4, dashArray: [5], color: navigation.color});
		polyline.addTo(map);

		M.toast({html:points.length + " ﻦﻘﻃﺓ ﺎﻨﺘﻗﺎﻟ."}, 4000);			
	},

	focusShape: function(user)
	{
		map.fitBounds(shapeSet[user].shape.getBounds());
	},

	visibleShape: function(user, visibility)
	{
		if(visibility && shapeSet[user].shape._map==null)
			shapeSet[user].shape.addTo(map);
		else if(!visibility && shapeSet[user].shape._map!=null)
			shapeSet[user].shape.removeFrom(map);
	},

	deleteShape: function(user)
	{
		visibleShape(user, false);
		shapeSet[user].shape=null;
	},

	addUserPoint: function(user, point)
	{
		var lastPoint=navigationSet[user].points[navigationSet[user].points.length-1];
		if(point.longitude!=lastPoint.longitude || point.latitude!=lastPoint.latitude)
		{
			navigationSet[user].push(point);
			return true;
		}
		else
			return false;
	},

	drawUserPoint(user, initialPoint, point)
	{
		var marker=L.marker([point.latitude, point.longitude], {icon: endIcon});
		marker.bindPopup(point.text);
		if(point.gps)
		{
			circle=L.circle([point.latitude, point.longitude], {color: navigationSet[user].color, fillColor: navigationSet[user].color, fillOpacity: .5, radius: point.accuracy});
			circle.addTo(map);
		}

		point.marker=marker;

		marker.addTo(map);
	},

	checkEqual(array1, array2)
	{
		return false;
	} 
};
