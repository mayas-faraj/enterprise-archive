var map;
var res_markers = [];
var messages_cord = [];
var messages=[];
var markers_l = new L.FeatureGroup();
var rect;
var areaSelect;
var w;
var workeriswork;
var boarray;
var id='0';

var l1;
var l2;
var l3;
var l4;
var audio;
var lednot;
var myinterval;

var markcount;

var viewCapacity=20;
var fetchCount=20;

var displayName=false;
var notifyMapBoundary=false;
var users=SetManager.getUsers();

DataAccess.findSetting("dispalyJid", function(result)
{
	displayName=result.trim()!='"1"';
	console.log("display name setting:" ,displayName);
});

DataAccess.findSetting("notifyMapBoundary", function(result)
{
	notifyMapBoundary=result.trim()!='"1"';
	console.log("notify map boundary setting: ", notifyMapBoundary);
});

DataAccess.findSetting("notifyMapBoundary", function(result)
{
	notifyMapBoundary=result.trim()=='"1"';

});


$(document).ready(function () {
    $(function () {
	$('#places').dialog({autoOpen: false});
        $('#test').BootSideMenu({side: "left", autoClose: true});
    });

	document.getElementById("content_messages").innerHTML = "";
	$("#nameCheck").prop("checked", displayName);
	loadpics();
	StropheAccess.connected(function()
	{
		StropheAccess.connection.addHandler(function(result)
		{
			var body=$(result).find('body').text();
			console.log(body);
			try
			{
				obj = JSON.parse(body);

				var messageToken=obj.publisher+';'+obj.text+';'+obj.timestamp.toString();
				
				if(messages.indexOf(messageToken)==-1)
				{ 
					messages.push(messageToken);
					var x=0;
					var y=0;
					var aGen="";
					var isGps;
					var date=new Date(obj.timestamp);
					var type;
					if(obj.location!=null &&
					   obj.location.x!=null && obj.location.y!=null)
					{  
						x=obj.location.x;
						y=obj.location.y;
						aGen=obj.location.a;
						date=new Date(obj.location.time);
						type=1;
						isGps=true;
					}
					else if(obj.cell!=null &&
						obj.cell.cellX!=null && obj.cell.cellY!=null)
					{  console.log('3');
						x=obj.cell.cellX;
						y=obj.cell.cellY;
						aGen=obj.cell.g;
						type=2;
						isGps=false;
						
					}

					//check coordinate
					var west= map.getBounds().getWest();
					var north = map.getBounds().getNorth();
					var east= map.getBounds().getEast();
					var south = map.getBounds().getSouth();

					if((x>=west && x<east && y>=south && y<north)||(x==0 && y==0))
					{
 						var str110='';
						lednot.style.display='block';
						myinterval=setInterval(function(){ myTimer() },3000);
						audio.play();

						var locationImg="";
						var mayFly="";
console.log("xmpp", obj.text);
						addReport(Math.random().toString().substring(2), obj.text, obj.publisher, obj.es, isGps, x, y, aGen, obj.timestamp, obj.rcvTimestamp, obj.attachments, null, true);
					}
					//else
					//	console.log('out of boundary');
				}
				//else
				//	console.log('message has been ignored!');
			}
			catch(ex)
			{
				console.log(ex);
			}

			return true;
		}, null , 'message');
		StropheAccess.connection.sendIQ($pres());
	});

	function fetch(l1,l2,l3,l4)
	{
		if(!notifyMapBoundary)
			l1=l2=l3=l4=0;

		InterfaceAccess.loadReportsMap(l1, l2, l3, l4, id, fetchCount.toString(),function(result)
		{
			if(result!=null)
			{
				if(result=='There are no privileges!')
					window.location.replace('nonePrivileges.html');
				if(id==0)
					 document.getElementById("content_messages").innerHTML='';

				var reports=result.split('<br />');console.log(reports);

				for(var i=0;i<reports.length;i++)
					if(reports[i]!="")
					{
						try
						{
							var report=JSON.parse(reports[i]);
							var str110='';

							var locationImg="";
							var mayFly="";

							var isGps=report.gps!=null && report.gps!=undefined && report.gps.longitude!=0 && report.gps.latitude!=0;
							var x=0; y=0, aGen="";

							if(isGps)
							{
								x=report.gps.longitude;
								y=report.gps.latitude;
								aGen=report.gps.accuracy;
							}
							else
								if(report.cellInfo!=null)
								{
								
									x=report.cellInfo.longitude;
									y=report.cellInfo.latitude;
									aGen=report.cellInfo.generation;
								}

							console.log('historical: ',report);
							addReport(report.rowKey, report.text, report.publisher, report.es, isGps, x, y, aGen, report.timestamp,report.receivedTimestamp, report.attachments, report.attachmentFiles, false);
						}

                                                catch(ex)
                                                {
                                                        console.log(ex);
                                                }

						$('.carousel').removeClass('initialized');
												$('.carousel').carousel({dist: 0});
                                        }
                        }
                });
        }

        fetch("0", "0", "0" ,"0");

        var scroller=document.getElementById('scroller');
        scroller.onscroll = function()
        {
                if ((window.innerHeight + scroller.scrollTop) == scroller.scrollHeight + 67 )
                {
                        fetch(map.getBounds().getWest(), map.getBounds().getSouth(), map.getBounds().getEast(), map.getBounds().getNorth());

                        console.log("scrolling");
                }

        }

	$("#nameCheck").change(function()
	{
		displayName=$("#nameCheck").prop("checked");
		updateView();
	});
});

function hash(s)
{
	/* Simple hash function. */
	var a = 1, c = 0, h, o;
	if (s) {
	a = 0;
	/*jshint plusplus:false bitwise:false*/
	for (h = s.length - 1; h >= 0; h--) {
	    o = s.charCodeAt(h);
	    a = (a<<6&268435455) + o + (o<<14);
	    c = a & 266338304;
	    a = c!==0?a^c>>21:a;
	}
}
return String(a);
};

function updateView()
{
	if(displayName)
	{
		$(".jid").css("display", "none");
		$(".name").css("display", "inline-block");
	}
	else
	{
		$(".name").css("display", "none");
		$(".jid").css("display", "inline-block");
	}

}


function addReport(rowKey, message, publisher, es, isGps, x, y, aGen, timestamp, receivedTimestamp, attachments, attachmentFiles, addToTop)
{
	var jid=StropheAccess.getJid(publisher);
	var userLogo, userName;

	if(users[jid]==null)
	{
		userName=publisher;
		setLogo="imgs/node/es-smd.png";
	}
	else
	{
		setLogo=users[jid].setLogo;
		userName=users[jid].name;
	}

	if(x==0 && y==0)
	{
		locationImg="<img src='imgs/map_nolocation.png' style='width:40px; height: 40px;right:10px;position: absolute;'>";
	}
	else
	{
		var markerImage=isGps?"<img class='map-marker-image' src='imgs/gps.png'>":"<img class='map-marker-image' src='imgs/cell.png'>";
		var accuracy="";
		var generation="";

		if(aGen!=null && aGen!="")
			if(isGps)
				accuracy="<div>"+markerImage+"a: "+aGen+"</div>";
			else
				generation="<div>"+markerImage+"gen: "+aGen+"</div>";

		

		window['marker_'+markcount] = L.marker([y, x]);
		window['marker_'+markcount].bindPopup("<div><img class='map-marker-image' src='imgs/phone.png'/><a href='profile.html?id="+publisher+"' target='_blank'>"+publisher+"<br>"+userName+"</a></div><div><img class='map-marker-image' src='imgs/clock.png'/>"+DateProcessor.formatDate(new Date(timestamp))+"</div><div>"+markerImage+"x: "+x+"</div><div>"+markerImage+"y: "+y+"</div>"+accuracy+generation+"<div><img class='map-marker-image' src='imgs/command.png'/>"+message+"</div>").openPopup();
		map.addLayer(window['marker_'+markcount]);
		markcount=markcount+1;

		if(!isGps)
			locationImg="<img src='imgs/map_location.png' onclick='mayfly2("+markcount+","+y+","+x+")' style='width:40px; height: 40px;right:10px;position: absolute;'>";
		else
			locationImg="<img src='imgs/map_gpslocation.png' onclick='mayfly2("+markcount+","+y+","+x+")' style='width:40px; height: 40px;right:10px;position: absolute;'>";
	}

	var carousel='';
	if(attachmentFiles !=null && attachmentFiles !="")
	{
	console.log('attachmentFiles',attachmentFiles);
		if(attachmentFiles[attachmentFiles.length-1]==';')
			attachmentFiles=attachmentFiles.substring(0,attachmentFiles.length-1);

		var attachmentArray=attachmentFiles.split(';');
		carousel='<div class="light-container"><div class="light-box" style="margin-left:auto;margin-right:auto;width:'+(attachmentArray.length*50)+'px">';
		for(var i=0;i<attachmentArray.length;i++)
		if(attachmentArray[i]!="")
		{
			var seperator=attachmentArray[i].indexOf(':');
			var uri=attachmentArray[i].substring(0,seperator);
			var position=attachmentArray[i].substring(seperator+1);
			MediaAccess.findMedia(uri, position, function(result)
			{
				var resultUri=result.substring(0,result.indexOf(';'));
				var resultContent=result.substring(result.indexOf(';')+1);
				var imageId=hash(resultUri);

				if(resultContent=="Connection refused (Connection refused)" || resultContent.substring(0,4)=="http")
				{
					$('#a_'+imageId+'>img').removeClass('status-loading').addClass('status-exclamation');
				}
				else
				{
					try
					{
						$('#a_'+imageId).prop('href','data:image/png;base64, '+resultContent);
						$('#a_'+imageId+'>img').prop('src','data:image/png;base64, '+resultContent);
					}
					catch(e)
					{
						console.log("error fetch media",e);
					}
				}
			});

			var imageId=hash(uri+'_'+position);
			carousel+='<a id="a_'+imageId+'" data-title="'+message+'" data-lightbox="light_'+rowKey+'"><img class="light-image status-loading"></a>';
		}
		carousel+='</div></div><br/>';
		carousel+='عدد ملفات الوسائط: '+attachmentArray.length+'<br>';
	}
	else if(attachments !=null && attachments !="")
	{
		var attachmentArray=attachments.split(';');
		carousel='<div class="light-container"><div class="light-box" style="margin-left:auto;margin-right:auto;width:'+((attachmentArray.length)*50)+'px">';

		for(var i=0;i<attachmentArray.length;i++)
			carousel+='<a href="'+attachmentArray[i]+'" data-title="'+message+'" data-lightbox="light_'+rowKey+'"><img class="light-image" src="'+attachmentArray[i]+'"></a>';
		carousel+='</div></div><br/>';
		carousel+='عدد ملفات الوسائط: '+attachmentArray.length+'<br>';
	}


	var mark=markcount-1;
	viewCapacity++;
	id=rowKey;
	var messageToken=publisher+';'+message+';'+timestamp.toString();
	messages.push(messageToken);
	var messageContent="<div dir='ltr' id=\"div"+mark +"\" style=\"cursor: pointer;padding-top:10px;\" ><input type='hidden' value='"+rowKey+"'/><div><a style='color: white;' href='profile.html?id="+publisher+"'><img src='"+setLogo+"' style='border-radius:50%;width: 40px; height: 40px; margin: 5px;'/><h5 style=\"display: inline;font-size:27px;text-align: left;color:#f6ebeb\"><span class='jid'>"+publisher+"</span><span class='name'>"+userName+"</span></h5></a>"+locationImg+"</div><h5 style=\"word-wrap: break-word;;margin-right: 10px;font-size:30px;text-align: right;\">"+
	 message+"</h5>"+carousel+"<i class='material-icons'>access_alarm</i><i class='material-icons'>call_made</i>"+DateProcessor.formatDate(new Date(timestamp))+"<br/><i class='material-icons'>access_alarm</i><i class='material-icons'>call_received</i>"+(receivedTimestamp==undefined?DateProcessor.formatDate(new Date(timestamp)):DateProcessor.formatDate(new Date(receivedTimestamp)))+"<br/><img src='imgs/state_error.png'  id=\""+mark+"\" name=\"ch"+mark+"\" value=\"del\" onclick=\"delm("+mark+")\"  style=\"position:static;left:60px;opacity:20; width:20px;height:20px;\"/>"
                                                        +"<hr/></div>";

	if(addToTop)
		document.getElementById("content_messages").innerHTML=messageContent+document.getElementById("content_messages").innerHTML;
	else
		document.getElementById("content_messages").innerHTML+=messageContent;

	updateView();
}

function loadpics()
{   audio=document.getElementsByTagName("audio")[0];
lednot=document.getElementById("led");
//    var southWest = L.latLng(32, 35.5);
//    var northEast = L.latLng(37.4, 43);
    var southWest = L.latLng(32, 33.3);
    var northEast = L.latLng(37.4, 44);
    l1= 35.5;
    l2 = 37.4;
    l3 = 42.5;
    l4 = 32;
    boarray=[l1,l2,l3,l4];
    workeriswork=0;
markcount=0;

 var satellite=L.tileLayer('./../assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, reuseTitles: true});
        var streetsOpacity=L.tileLayer('./../assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, resuseTiles: true, opacity:0.5});
        var streets=L.tileLayer('./../assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, resuseTiles: true});

        var northEast=L.latLng(37.7, 43.2);
        var southWest=L.latLng(31.94, 33.97);

        map=L.map('map',
        {
                maxBounds: L.latLngBounds(southWest, northEast),
                center:[35.8,36.5],
                zoom: 7.4,
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
//initilize legend
var legend=new L.Control.Legend(
{
	position: 'topright',
	collapsed: true,
	controlButton:
	{
		title: "خيارات العرض"
	}
});

map.addControl(legend);

$(".legend-container").append($("#legend"));
$(".legend-toggle").append("<i class='legend-toggle-icon fa fa-info fa-2x' style='color: #000'>i</i>");

// events
    map.on('moveend', function () {
        
        l1 = map.getBounds().getWest();
        l2 = map.getBounds().getNorth();
        l3= map.getBounds().getEast();
        l4 = map.getBounds().getSouth();     
   boarray=[l1,l2,l3,l4];
       
    });
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

function delm(mc11) {
    //alert("ha2  "+mc11);
    var parentd=document.getElementById(content_messages);
    $("#div"+mc11).remove();
    map.removeLayer(window['marker_'+mc11]);
    window['marker_'+mc11]=undefined;

}

function showplaces()
{
    $("#places").dialog("open");
}

function mayfly(t6)
{
    map.flyTo([messages_cord[t6][0], messages_cord[t6][1]], 14);
    res_markers[t6].openPopup();
}

function mayfly2(t15,t16,t17)
{
    map.flyTo([t16,t17], 14);
    window['marker_'+(parseInt(t15)-1).toString()].openPopup();
}

function myTimer() {
    lednot.style.display='none';
    clearInterval(myinterval);
}
