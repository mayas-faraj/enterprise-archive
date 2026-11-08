$(document).ready(function()
{
	var locationInfoChart;

	$(".sidenav").addClass("sidenav-fixed");
	$(".sidenav").sidenav({edge: "right"});

	var set=SetManager.getSet();

	$("#setTypesLabel").html(SetManager.getSetInfo()["theTypes"]);
	$("#setTypeLabel").html(SetManager.getSetInfo()["type"]);
	$("#setCountLabel").html(Object.keys(SetManager.getSet()).length-1);
	$("#onlineUserCountLabel").html("0");

	$("#reportMapInfoDiv").html("");
	$("#reportCountSpan").html("-");

	$("#reportGpsCountSpan").html("-");
	$("#reportCellCountSpan").html("-");
	$("#reportNoneCountSpan").html("-");
	$("#reportLocationCount").html("-");

	calculateUserCount();

	$("#reportSvg>g>path").mouseover(function()
	{
		console.log($(this).next().html())
		var reportCount=$(this).next().html();
		var info=$(this).attr("title");

		if(reportCount=="")
			info+=", لا يوجد بلاغات حتى الآن";
		else
			info+=", "+reportCount+" بلاغ";

		$("#reportMapInfoDiv").html(info);
	});

	StropheAccess.messageReceived(function(event, id, publisher, es, text, timestamp, receivedTimestamp, commandId, importance, location, cell)
	{
		var locationX=0;
		var locationY=0;
		var locationType="none";
		var city="none";

		if(location!=null && location.x!=null && location.y!=null)
		{
			locationX=location.x;
			locationY=location.y;
			locationType="gps";
		}
		else if(cell!=null && cell.cellX!=null && cell.cellY!=null)
		{
			locationX=cell.cellX;
			locationY=cell.cellY;
			locationType="cell";
		}

		var city=GeoCooder.getName(locationY, locationX);
		var count=$("#"+city+"Text").html();

		if(count=="")
			count=0;
		else
			count=parseInt(count);

		$("#"+city+"Text").html(parseInt(count)+1);
		$("#"+city+"Path").css("fill", "red");

		setTimeout(function()
		{
			$("#"+city+"Path").css("fill", "");
		}, 1000);

		if(locationType=="cell")
			locationInfoChart.data.datasets[0].data[0]++;
		else if(locationType="gps")
			locationInfoChart.data.datasets[0].data[1]++;
		else
			locationInfoChart.data.datasets[0].data[2]++;

		locationInfoChart.update();
	});


	StropheAccess.presenceReceived(function(event, from, type)
        {
		var count=parseInt($("#onlineUserCountLabel").html());

		if(type==null)
			count++;
		else
			if(count>0)
				count--;

		$("#onlineUserCountLabel").html(count);
	});

	StropheAccess.rosterUpdated(function(event)
	{
		console.log("roster updated...");
		calculateUserCount();
	});

	InterfaceAccess.findStatistic("reportDistribution", function(distributionStatistic)
	{
		var cities=
		{
			damascus: 0,
			homs: 0,
			tartous: 0,
			latakia: 0,
			aleepo: 0,
			hama: 0,
			swidaa: 0,
			daraa: 0,
			qunaitera: 0,
			idlib: 0,
			raqqa: 0,
			derzor: 0,
			hasaka: 0
		};

		if(distributionStatistic!=null && distributionStatistic!="")
			if(distributionStatistic.indexOf("Error")==-1)
			{
				var statisticsArray=JSON.parse(distributionStatistic);
				for(var i=0; i<statisticsArray.length; i++)
					cities[statisticsArray[i].name]+=statisticsArray[i].value;	
			}
			else
			{
				$("#reportMapInfoDiv").html("لا يمكن الوصول للبيانات.");
				$("#reportMapInfoDiv").attr("id", "");
			}
		

		InterfaceAccess.findStatistic("reportCoverage", function(coverageStatistic)
		{
			var locationType=
			{
				gps: 0,
				cell: 0,
				none: 0
			};

			if(coverageStatistic!=null && coverageStatistic!="" && coverageStatistic.indexOf("Error")==-1)
			{
				var statisticsArray=JSON.parse(coverageStatistic);
				for(var i=0; i<statisticsArray.length; i++)
					locationType[statisticsArray[i].name]+=statisticsArray[i].value;	
			}

			InterfaceAccess.loadReportsRealtime(function(reports)
			{
				if(reports!=null && reports.trim()!="" && reports.indexOf("Error")==-1)
				{
					var reportArray=reports.split("<br />");
					var minTimestamp=(new Date()).getTime();

					for(var i=0; i<reportArray.length; i++)
					if(reportArray[i]!="")
					{
						try
						{
							var reportObj=JSON.parse(reportArray[i]);

							if(reportObj.timestamp<minTimestamp)
								minTimestamp=reportObj.timestamp;
							console.log(reportObj);

							var isGps=reportObj.gps!=null && reportObj.gps.longitude!=0 && reportObj.gps.latitude!=0;
							var x=0; y=0;
							if(isGps)
							{
								x=reportObj.gps.longitude;
								y=reportObj.gps.latitude;
								locationType.gps++;
							}
							else
								if(reportObj.cellInfo!=null)
								{

									x=reportObj.cellInfo.longitude;
									y=reportObj.cellInfo.latitude;
									locationType.cell++;
								}
								else
								{
									locationType.none++;
								}

							var city=GeoCooder.getName(y, x);
							console.log("g:", y, x, city);

							if(city!=null)
								cities[city]++;
						}
						catch(ex)
						{
							console.log(ex);
						}

					}
				}

				//calculate statics
				var reportCount=0;

				for(var city in cities)
					if(cities[city]!=0)
					{
						$("#"+city+"Text").html(cities[city]);
						reportCount+=cities[city];
					}

				$("#reportCountSpan").html(locationType.gps+locationType.cell+locationType.none);
				$("#reportLocationCount").html(locationType.gps+locationType.cell);

				$("#reportGpsCountSpan").html(locationType.gps);
				$("#reportCellCountSpan").html(locationType.cell);
				$("#reportNoneCountSpan").html(locationType.none);

				var ctx = document.getElementById("locationInfoCanvas").getContext("2d");
				locationInfoChart = new Chart(ctx,
				{
					type: "pie",
					data:
					{
						labels: ["برج التغطية", "قمر صناعي", "بدون إحداثيات"],
						datasets: [
						{
							data: [locationType.cell, locationType.gps, locationType.none],
							backgroundColor: ["#00ff00", "#ff0000", "#333"]
						}]
					},
					options: 
					{
						legend:
						{
							labels:
							{
							}
						}
					}
				});
			});
		});
	});

	SessionAccess.getViewUsersPrivilege(function(userPrivilege)
	{
		if(userPrivilege.trim()!="1")
		{
			$("userCountDiv").remove();
			$("setCountDiv").remove();
			$("onlineUserCountDiv").remove();
		}
	});

	function calculateUserCount()
	{
		
		var users=SetManager.getUsers();
		var count=0;
		var availableCount=0;
		for(var key in users)
			if(users[key].setId!=SetManager.DELETED_NODE_ID)
			{
				if(users[key].available!=null)
					count++;

				if(users[key].available)
					availableCount++;				
			}

		$("#userCountLabel").html(count);
		$("#availableUserCountLabel").html(availableCount);
	}
});
