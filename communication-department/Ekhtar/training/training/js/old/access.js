$(document).ready(function()
{
	$(".collapsible").collapsible()
	var id=Master.getVariable('id');
	var collapse=$('#accessCollapse');
	var content=$('#accessCollapse>li:first');

	var rowKey="0";

	if(id!=null)
	{
		$('#jidDiv').html(id);	
		content.css('display', 'none');
		fetch(rowKey, '10');
	}

	function display(logins)
	{
		for(var i=0; i<logins.length; i++)
			if(logins[i]!="")
			{
				var jsonObj=JSON.parse(logins[i]);
				var date=moment(jsonObj.timestamp).format(DATE_FORMAT);
				var receivedDate;
				var usedDate;

				if(jsonObj.receivedTimestamp!=undefined)
				{
					receivedDate=moment(jsonObj.receivedTimestamp).format(DATE_FORMAT);
					usedDate=receivedDate;
				}
				else
					usedDate=date;
 	
				rowKey=jsonObj.rowKey;

				content.find('#titleLabel').html(jsonObj.deviceType + " on " + usedDate);
				content.find('#dateLabel').html('إرسال: '+date);
				content.find('#receivedDateLabel').html('استقبال :'+usedDate);
				content.find('#typeLabel').html(jsonObj.deviceType);
				content.find('#osLabel').html(jsonObj.osVersion);
				content.find('#providerLabel').html(jsonObj.provider);
				content.find('#versionLabel').html("Ekhtar "+ jsonObj.emaVersion);
				content.find('#macLabel').html("MAC: " +jsonObj.mac);
				content.find('#imeiLabel').html("IMEI: "+jsonObj.imei);
				content.find('#imsiLabel').html("IMSI: "+jsonObj.imsi);
				content.find('#ssnLabel').html("SSN: "+jsonObj.simSerialNumber);

				if(jsonObj.gps!=null && (jsonObj.gps.latitude!=0 || jsonObj.gps.longitude!=0))
				{
					content.find('#gpsLabel').html("<u><a target='mapFrame' href='map.html?icon=phone&message="+jsonObj.deviceType+"&longitude="+jsonObj.gps.longitude+"&latitude="+jsonObj.gps.latitude+"'>GPS (x: "+jsonObj.gps.longitude +", y: "+jsonObj.gps.latitude+"), a: "+jsonObj.gps.accuracy+"</a></u>");
					
				}
				else
					content.find('#gpsLabel').html("إحداثيات الأقمار الصناعية غير متوفرة.");

				if(jsonObj.cell!=null)
						if(jsonObj.cell.cgi!=null && jsonObj.cell.cgi!="")
						{
							var generation=jsonObj.cell.generation;
							content.find('#cellInfoLabel').html("CGI: "+jsonObj.cell.cgi + (generation==null?"":" - " + generation) +" ("+ jsonObj.cell.siteName+")");
							if(jsonObj.cell.longitude!=0 || jsonObj.cell.latitude!=0)
							{
								content.find('#cellLocationLabel').html("<u><a target='mapFrame' href='map.html?icon=phone&message="+jsonObj.deviceType+"&longitude="+jsonObj.cell.longitude+"&latitude="+jsonObj.cell.latitude+"'>Cell (x: "+jsonObj.cell.longitude+",y:"+jsonObj.cell.latitude+")</a></u>");
								content.find('#cellLocationLabel').parent().css('visibility', 'visible');
							}
							else
							{
								content.find('#cellLocationLabel').parent().css('visibility', 'hidden');
							}
						}
						else
						{
							content.find('#cellInfoLabel').html("لا يوجد معلومات عن خلية التغطية.");
							content.find('#cellLocationLabel').parent().css('visibility', 'hidden');
						}

				collapse.append("<li>"+content.html()+"</li>");
			}
	}

	function fetch(rowKey, offset)
	{
		InterfaceAccess.loadUserLogin(id, rowKey, offset, function(result)
		{
			console.log(result);
			if(result!="" && result!=null)
			{
				var logins=result.split('<br />');
				display(logins);
				updateIframeLocation();
			}
			else
				console.log('No more result!');
		});
	}

	function updateIframeLocation()
	{
		var iframe=$('iframe');

		if(iframe.prop('src')=="http://192.168.90.2/map.html")
		{
			var positionLink=$('#accessCollapse>li:nth-child(2)>.collapsible-body>div>label>a');
			if(positionLink.length>0)
				$('iframe').prop('src', positionLink.prop('href'));
		}
	}

	$('.input-scrollable').scroll(function()
	{
		if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) 
		{
			console.log('feching...', rowKey);
			fetch(rowKey, '10');
		}
	});
});

