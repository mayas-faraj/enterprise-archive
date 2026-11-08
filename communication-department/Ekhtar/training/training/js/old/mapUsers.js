var map;
var markersLayer;
var areaSelect=null;
var viewSelect=null;
var markersLayerEmpty=true;
var onlineUsers={};
var sets=SetManager.getSet();
var setUsers=SetManager.getUsers();

$(document).ready(function()
{
	//consts
	var NOW="الآن";

	//initilize map
	var satellite=L.tileLayer('./../assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true});
	var streetsOpacity=L.tileLayer('./../assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true, opacity: .5});
	var streets=L.tileLayer('./../assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16, maxNativeZoom: 18, reuseTiles: true});
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
		"مناطق":streets
	};

	var totalMaps=
	{
		"تسميات": streetsOpacity
	}

	var layers=L.control.layers(baseMaps, totalMaps);
	layers.addTo(map);
	map.addLayer(markersLayer);

	//materialize initialization
	$("#citySelect").formSelect();

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

	//date slider
	minDateValue=1499997600000;
        maxDateValue=(new Date()).getTime();
        difDateValue=maxDateValue-minDateValue;

	var slider = document.getElementById("dateSlider");
	noUiSlider.create(slider, 
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

	slider.noUiSlider.on('update', function (value, handle) 
	{
		if(value[0]!=null && value[1]!=null)
		{
			var logValue0=(difDateValue/Math.log(difDateValue+1))*Math.log(value[0]-minDateValue+1)+minDateValue;
			var logValue1=(difDateValue/Math.log(difDateValue+1))*Math.log(value[1]-minDateValue+1)+minDateValue;
			var date1=DateProcessor.formatDate(new Date(parseInt(logValue0)));
			var date2=DateProcessor.formatDate(new Date(parseInt(logValue1)));
			$('#date1').html(date1);

			if(value[1]==maxDateValue)
				$('#date2').html(NOW);
			else
				$('#date2').html(date2);

			$('#longDate1').val(logValue0);
			$('#longDate2').val(logValue1)

			return 'من '+date1+' حتى '+date2;
		}
	});

	slider.noUiSlider.on('change', function (values, handle) 
	{
		$('#loadingImage').css('visibility','visible');

		DataManager.updateRequest(function()
		{
			$('#loadingImage').css('visibility','hidden');  
			updateLegend();
		});

	});

	//initialize set
	loadSet();
	$('#onlineCheckbox').change(function()
	{
		if(!markersLayerEmpty)
		{
			$('#loadingImage').css('visibility','visible');
			if($(this).prop('checked'))
			{
				$('#dateSlider').sliding('disable');
				DataManager.syncRequest(Object.keys(onlineUsers), function(result)
				{
					$('#loadingImage').css('visibility','hidden');
					console.log('op result', result);
					updateLegend();
				});
			}
			else
			{
				$('#loadingImage').css('visibility','visible');
				$('#dateSlider').sliding('enable');
				var selectedSets=$('#setSelect').val();
				var usersArray=[];

				if($("#setSelect>option").length==selectedSets.length)
					for(var i in sets)
						usersArray=usersArray.concat(sets[i].users);
				else		
					for(var i=0;i<selectedSets.length;i++)
                                        	usersArray=usersArray.concat(sets[selectedSets[i]].users);

				DataManager.syncRequest(usersArray, function(result)
				{
					$('#loadingImage').css('visibility','hidden');
					console.log('op result2', result);
					updateLegend();
				});
			}
		}
	});

	$('#setSelect').on('changed.bs.select', function(event, idx, added)
	{
		if(!markersLayerEmpty)
		{
			$('#loadingImage').css('visibility','visible');

			var node=event.currentTarget[idx].value;
			console.log('change', node);

			if(added)
			{
				console.log('added');
				DataManager.addRequest(sets[node].users, function()
				{
					$('#loadingImage').css('visibility','hidden');
					updateLegend();
				});
			}
			else
			{
				console.log('removed');
				DataManager.removeRequest(sets[node].users, function()
				{
					$('#loadingImage').css('visibility','hidden');
					updateLegend();
				});
			}
		}
	});

	//collapse
	$("div.collapse").addClass("hide").css("position","fixed").css("top","100px").css("width","100%").css("z-index", "400");

	$("a.collapse").click(function()
	{
		var target=$(this).attr("data-target");
		
		if($(target).hasClass("hide"))
		{	
			$("div.collapse").not(".hide").addClass("hide");
			$(target).removeClass("hide");
		}
		else
			$(target).addClass("hide");
	});

	//onctrols
	/*$('.selectpicker').selectpicker(
	{
		size: 6
	});*/
	
	$('#deselectButton').css('display','none');

	$('#citySelect').on('change', function()
	{
		var value=$('#citySelect').val();
		var index=value.indexOf(',');
		map.flyTo([value.substring(0, index), value.substring(index+1)],12);
		$('#citySelect').selectpicker('val','');

	});

	//data manager
	DataManager.requestFunction=function(keys, callback)
	{
		var keyString="";
		for(var key in keys)
			keyString+=keys[key]+";";
		console.log("args:", keyString);
		InterfaceAccess.loadUsersLastPoint(keyString, callback);
	};
	
	DataManager.conditionFunction=function(marker)
	{
		var date1=$('#date1').html();
		var date2=$('#date2').html();
		return (viewSelect==null || (viewSelect.getBounds().contains(marker.getLatLng()))) && marker.date>=DateProcessor.extractDate(date1).getTime() && (date2==NOW || marker.date<DateProcessor.extractDate(date2).getTime()) && (!$('#onlineCheckbox').prop('checked') || marker.online) && $('#setSelect').val().indexOf(marker.set)>=0;
	};

	DataManager.activeFunction=function(marker)
	{
		marker.addTo(markersLayer);
	};

	DataManager.deactiveFunction=function(marker)
	{
		marker.removeFrom(markersLayer);
	};

	DataManager.isActiveFunction=function(marker)
	{
		return marker._map!=null;
	};

	DataManager.dataSplitFunction=function(result)
	{
		return result.split('<br />');
	};

	DataManager.dataConvertFunction=function(resultItem)
	{
		var isOnline=false;

		if(resultItem!='')
		{
			try
			{
				var obj=JSON.parse(resultItem);

				isOnline=(onlineUsers[obj.publisher]==0);
				locationImage=obj.coordinate.accuracy==0?"<img class='map-marker-image' src='imgs/cell.png'>":"<img class='map-marker-image' src='imgs/gps.png'>";

				var marker=L.marker([obj.coordinate.latitude, obj.coordinate.longitude], {icon: L.icon({iconUrl: 'imgs/node/'+obj.es+'.png', iconSize: [32,32]})});
				marker.bindPopup("<div><img class='map-marker-image' src='imgs/phone.png'/><a href='profile.html?id="+obj.publisher+"' target='_blank'>"+obj.publisher+"</a></div><div><img class='map-marker-image' src='imgs/clock.png'/>"+obj.date+"</div><div>"+locationImage+"x: "+obj.coordinate.latitude+"</div><div>"+locationImage+"y: "+obj.coordinate.longitude+"</div><div>"+(isOnline?"<div class='map-status-online'></div>متصل":"<div class='map-status-offline'></div>غير متصل")+"</div>").openPopup();

				marker.date=DateProcessor.extractDate(obj.date).getTime();
				marker.online=isOnline;
				marker.es=obj.es;
				marker.set=setUsers[StropheAccess.getJid(obj.publisher)].setId;

				return {key: obj.publisher, value: marker};
			}
			catch(ex)
			{
				console.log(ex);
			}
	       }
	};

	function loadSet()
	{
		var setKeys=Object.keys(sets);

		for(var i=0; i<setKeys.length; i++)
		{
			var set=sets[setKeys[i]];
			$("#setSelect").append(new Option(set.name, setKeys[i], true));
			$("#legend").append("<div class='map-legend-item'><img src='"+set.logo+"' class='map-legend-image'/><label class='map-legend-text'>"+set.name+": <label id='legend_"+setKeys[i]+"'></label>"+set.users.length+"</label></div>");
			console.log("set: ", $("#setSelect").html());
			$("#setSelect").formSelect();
			addSelectAll($("#setSelect"));
		}
	}

	$('#runButton').click(function()
	{
		$('#loadingImage').css('visibility','visible');

//		if($('#setSelect').val().length==0)
			//$('#setSelect').selectpicker('selectAll');
		 markersLayerEmpty=false;

		//clear markers
		markersLayer.clearLayers();

		//input values
		var selectedSet=$('#setSelect').val();
		var onlineOnly=$('#onlineCheckbox').prop('checked');

		//string users
		var usersArray=[];

		for(var key in sets)
			sets[key].active=0;

		if(selectedSet.length==0 || $("#setSelect>option").length==selectedSet.length)
		{
			if(onlineOnly)
				usersArray=Object.keys(onlineUsers);
			else
				for(var node in sets)
					for(var i=0; i<sets[node].users.length; i++)
						usersArray.push(Strophe.getNodeFromJid(sets[node].users[i].jid));
		}
		else 
			for(var i=0;i<selectedSet.length;i++)
				if(onlineOnly)
				{
					var usersNode=sets[selectedSet[i]].users;
					for(var j=0;j<usersNode.length;j++)
						if(onlineUsers[usersNode[j]]==0)
						{
							usersArray.push(Strophe.getNodeFromJid(usersNode[j].jid));
						}
				}
				else
				{
					for(var j=0; j<sets[selectedSet[i]].users.length; j++)
						usersArray.push(Strophe.getNodeFromJid(sets[selectedSet[i]].users[j].jid));
				}

		console.log(usersArray);

		DataManager.addRequest(usersArray, function(result)
		{
			$('#loadingImage').css('visibility','hidden');
			console.log('op result', result);
			updateLegend();
		});
	});

	$('#selectButton').click(function()
	{
		if(areaSelect==null)
		{
			$('#selectMessageButton').css('display','inline-block');
			$('#clearSelectButton').css('display','inline-block');
			$(this).css('display','none');


			areaSelect=L.areaSelect();

			areaSelect.on("change", function()
			{
				bounds=this.getBounds();
				var counter=0;
				var marker;
				for(var key in DataManager.cache)
				{
					marker=DataManager.cache[key];
					if(marker._map!=null && marker.getLatLng().lng<=bounds.getEast() &&
					marker.getLatLng().lng>bounds.getWest() &&
					marker.getLatLng().lat<=bounds.getNorth() &&
					marker.getLatLng().lat>bounds.getSouth())
						counter++;
				}	

				$("#markerCounterLabel").css("visibility", "visible");
				$("#markerCounterLabel").text("تم تحديد (" + counter + ") مستخدم");

				$('#selectMessageButton').css('display', 'inline-block');
				$('#clearSelectButton').css('display', 'inline-block');
			});

			areaSelect.on("changing", function(e)
			{
				topOffset=areaSelect._neHandle.offsetTop;
				leftOffset=areaSelect._neHandle.offsetLeft+26;
				$('#selectMessageButton').css('top',topOffset+'px');
				$('#selectMessageButton').css('left',leftOffset+'px');
				$('#clearSelectButton').css('top',(topOffset+ 50)+'px');
				$('#clearSelectButton').css('left',leftOffset+'px');
			});

			areaSelect.addTo(map);
			areaSelect.fireEvent('changing');
		}
	});

	$('#clearSelectButton').click(function()
	{
		if(areaSelect!=null)
		{
			$('#selectButton').css('display','inline-block');
			$('#selectMessageButton').css('display','none');
			$(this).css('display','none');
			areaSelect._events=[];
			areaSelect.remove();
			areaSelect=null;
			$("#markerCounterLabel").css("visibility", "hidden");
		}
	});


	$('#messageButton').click(function()
	{
		var usersString="";
		var marker;
		for(var key in DataManager.cache)
		{
			marker=DataManager.cache[key];
			if(marker._map!=null)
				usersString+=key+";";
		}

		localStorage.setItem('usersString', usersString);
		window.open("commands.html?type=local", "_blank");
		
	});

	$('#selectMessageButton').click(function()
	{
		if(areaSelect!=null)
		{
			var usersString="";
			var marker;
			for(var key in DataManager.cache)
			{
				marker=DataManager.cache[key];
				if(marker._map!=null && areaSelect.getBounds().contains(marker.getLatLng()))
					usersString+=key+";";
			}

			localStorage.setItem('usersString', usersString);
			window.open("commands.html?type=local", "_blank");
		}
	});

	$('#opaqueButton').click(function()
	{
		if($('#optionsDiv>.map-option').css('background-color')!=null && $('#optionsDiv>.map-option').css('background-color').substring(0,4)=='rgba')
			$('#optionsDiv>.map-option').css('background-color','#4f4f4f');
		else
			$('#optionsDiv>.map-option').css('background-color','');
	});

	$('#viewSelectButton').click(function()
	{
		if(viewSelect==null)
		{
			viewSelect=L.areaSelect();

			viewSelect.on("changing", function(e)
			{
				topOffset=viewSelect._neHandle.offsetTop;
				leftOffset=viewSelect._neHandle.offsetLeft+26;
				$('#runSelectButton').css('top',topOffset+'px');
				$('#runSelectButton').css('left',leftOffset+'px');
				$('#clearViewSelectButton').css('top',(topOffset+ 50)+'px');
				$('#clearViewSelectButton').css('left',leftOffset+'px');
			});


			viewSelect.addTo(map);		

			$('#optionsDiv').hide();
			$('#menuButton').addClass('disabled');
			$('#runSelectButton').css('display','inline-block');
			$('#clearViewSelectButton').css('display','inline-block');

			viewSelect.fireEvent('changing');
		}
	});

	$('#clearViewSelectButton').click(function()
	{
		$('#optionsDiv').show();
		$('#menuButton').removeClass('disabled');
		if(viewSelect!=null)
		{
			viewSelect._events=[];
			viewSelect.remove();
			viewSelect=null;
		}

		$('#runSelectButton').css('display','none');
		$(this).css('display','none');
	});

	$('#runSelectButton').click(function()
	{
		$('#runButton').click();
	});

	$('#closeButton').click(function()
	{
		$('#optionsDiv').addClass("hide");	
	});

	$('#findButton').click(function()
	{
		var marker=DataManager.cache[$('#phoneText').val()];
		if(marker!=null)
		{
			if(marker._map!=null)
			{
				map.flyTo(DataManager.cache[$('#phoneText').val()].getLatLng(), 16)
				DataManager.cache[$('#phoneText').val()].openPopup();
				$('#resultLabel').text('');
			}
			else
				FormValidation.writeError('لم يتم عرض المستخدم وفقاً لشروط الترشيح.', 'resultLabel');
		}
		else
			FormValidation.writeError('الرقم المراد البحث عنه غير موجود على الخارطة.', 'resultLabel');
	});

	$('#phoneText').keydown(function(event)
	{
		if($(this).val().length!=0 || event.keyCode==57 || event.keyCode==105)
		{
			if(event.keyCode==13)
				$('#findButton').click();
			else if(event.keyCode==27)
				$('#findDiv').hide();
			else if(event.keyCode==46 || event.keyCode==8 || event.keyCode==9 || event.keyCode==27 ||
				(event.keyCode==65 && (event.ctrlKey==true || event.metakey===true)) ||
				(event.keyCode==67 && (event.ctrlKey==true || event.metakey===true)) ||
				(event.keyCode==86 && (event.ctrlKey==true || event.metakey===true)) ||
				(event.keyCode==88 && (event.ctrlKey==true || event.metakey===true)) ||
				(event.keyCode>=35 && event.keyCode<=39))
				return true;
			else if((event.keyCode>=48 && event.keyCode<=57) ||
				(event.keyCode>=96 && event.keyCode<=105))
			{
				if($(this).val().length<=8)
				{
					$('#resultLabel').text('');
					return true;
				}
				else
					FormValidation.writeError('طول معرف المستخدم لا يزيد عن 9 أرقام.', 'resultLabel');
			}
			else
				FormValidation.writeError('معرف المستخدم يحوي فقط أرقام.', 'resultLabel');
		}
		else
			FormValidation.writeError('معرف المستخدم يجب أن يبدأ بالرقم 9.', 'resultLabel');

		return false;
	});

	StropheAccess.presenceReceived(function(event, from, type)
        {
		var fromId=Strophe.getNodeFromJid(from);
		var index=onlineUsers.indexOf(fromId);

		if(type==null)
		{
			if(index==-1)
				onlineUsers.push(fromId);
		}
		else if(type=="unavailable")
			if(index>=0)
				onlineUsers.splice(index, 1);
	});
});

function updateLegend()
{
	for(var key in sets)
		sets[key].active=0;

	for(var key in DataManager.cache)
		if(DataManager.cache[key]._map!=null)
		{
			var setId=setUsers[StropheAccess.getJid(key)].setId;
			sets[setId].active++;
		}

	var total=0;
	for(var key in sets)
	{
		$('#legend_'+key).text(sets[key].active+"/");
		total+=sets[key].active;
	}

	M.toast({html:"("+total+") مستخدم"}, 4000);

	if(areaSelect!=null)
		areaSelect.fireEvent("change");
}

function updateOnlineMarker(id, isOnline)
{
	var marker=DataManager.cache[id];

	if(marker!=null)
	{
		marker.online=isOnline;

		if(isOnline)
		{
			marker.bindPopup(marker._popup._content.replace('غير متصل','متصل'));
			marker.bindPopup(marker._popup._content.replace('map-status-offline', 'map-status-online'));
		}
		else
		{
			marker.bindPopup(marker._popup._content.replace('متصل','غير متصل'));
			marker.bindPopup(marker._popup._content.replace('map-status-online', 'map-status-offline'));
		}

		console.log(id, " updated to online:", isOnline);

		if($('#onlineCheckbox').prop('checked'))
			if(!isOnline && marker._map!=null)
			{
				marker.removeFrom(markersLayer);
				updateLegend();
			}
			else if(isOnline && marker._map==null)
			{
				marker.addTo(markersLayer);
				updateLegend();
			}
	}
}
