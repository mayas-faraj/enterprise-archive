var LiveNavigation=
{
	_INTERVAL: 6000,
	_SCROLL: 500,
	_reportQueue: [], 
	_timer: null,
	_lastLocation: null,
	_map: null,
	_containerList: null,
	_playButton: null,
	_stopButton: null,
	navigate: function()
	{
		console.log("navigate queue: ", LiveNavigation._reportQueue);
		if(LiveNavigation._reportQueue.length!=0)
		{
			console.log("navigato to: ", rowKey);

			var rowKey=LiveNavigation._reportQueue.shift();

			var offset;
			if(!LiveNavigation._containerList.is("html"))
				offset=LiveNavigation._containerList.scrollTop();
			else	
				offset=0;
			LiveNavigation._containerList.animate({scrollTop: offset + $("#report_"+rowKey.replace("*", "\\*")).offset().top-50}, LiveNavigation._SCROLL);

			var markerId=$("#report_"+rowKey.replace("*", "\\*") + " #locationLink").attr("data-marker");
			if(markerId!="0")
			{
				var marker=LiveNavigation._map._layers[markerId];
				map.flyTo(marker.getLatLng(), 13);
				marker.openPopup();

				LiveNavigation._timer=setTimeout(function()
				{
					LiveNavigation.navigate();
				}, LiveNavigation._INTERVAL);
				
			}
			else
			{
				map.closePopup();
				LiveNavigation._timer=setTimeout(function()
				{
					LiveNavigation.navigate();
				}, LiveNavigation._INTERVAL/2);
			}

		}
		else
		{
			LiveNavigation._timer=null;

			if(LiveNavigation._lastLocation!=null)
			{
				map.flyTo([LiveNavigation._lastLocation.latitude, LiveNavigation._lastLocation.longitude], LiveNavigation._lastLocation.zoom);
				LiveNavigation._lastLocation=null;

				if(LiveNavigation._stopButton!=null)
					LiveNavigation._stopButton.addClass("hide");

				if(LiveNavigation._playButton!=null)
					LiveNavigation._playButton.addClass("hide");
			}
		}
	},

	startNavigation: function(rowKey, currentLongitude, currentLatitude, currentZoom)
	{
		console.log("start navigation: ", rowKey);
		if(rowKey!=null)
			LiveNavigation._reportQueue.push(rowKey);

		if(LiveNavigation._lastLocation==null && currentLongitude!=null && currentLatitude!=null && currentZoom!=null)
			LiveNavigation._lastLocation={longitude: currentLongitude, latitude: currentLatitude, zoom: currentZoom};

		if(LiveNavigation._timer==null && LiveNavigation._reportQueue.length==1)
		{
			if(LiveNavigation._stopButton!=null)
				LiveNavigation._stopButton.removeClass("hide");
			if(LiveNavigation._playButton!=null)
				LiveNavigation._playButton.removeClass("hide");
			LiveNavigation.navigate();
		}
	},

	pauseNavigation: function()
	{
		var active=LiveNavigation._timer!=null;
		if(active)
		{
			clearTimeout(LiveNavigation._timer);
			LiveNavigation._timer=null;

			if(LiveNavigation._playButton!=null)
			{
				LiveNavigation._playButton.removeClass("green").addClass("orange");
				LiveNavigation._playButton.find(">i").html("pause");
			}
		}

		return active;

	},

	resumeNavigation: function()
	{
		var active=LiveNavigation._lastLocation!=null;
		if(active)
		{
			LiveNavigation.navigate();
			if(LiveNavigation._playButton!=null)
			{
				LiveNavigation._playButton.removeClass("orange").addClass("green");
				LiveNavigation._playButton.find(">i").html("play_arrow");
			}
		}
		
		return active;
	},

	stopNavigation: function()
	{
		LiveNavigation.pauseNavigation();
		LiveNavigation._reportQueue=[];

		if(LiveNavigation._lastLocation!=null)
		{
			map.flyTo([LiveNavigation._lastLocation.latitude, LiveNavigation._lastLocation.longitude], LiveNavigation._lastLocation.zoom)
			LiveNavigation._lastLocation==null;
		}
	},

	setMap: function(map)
	{
		LiveNavigation._map=map;
	},

	setContainerList: function(containerList)
	{
		LiveNavigation._containerList=containerList;
	},

	setPlayButton: function(button)
	{
		LiveNavigation._playButton=button;
	},

	setStopButton: function(button)
	{
		LiveNavigation._stopButton=button;
		LiveNavigation._stopButton.click(function()
		{
			LiveNavigation.stopNavigation();
			LiveNavigation._stopButton.addClass("hide");
			LiveNavigation._playButton.addClass("hide");
		});
	}
};
