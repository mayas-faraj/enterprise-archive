$(document).ready(function()
{
	var id="";
	var rowKey='0';
	var emaRowKey='0';
	var stream=true;
	var emptyReports=false;

	load();

	function fetch()
	{
		console.log(id);
		var userName=document.getElementById('userName');
                userName.innerHTML=id;
		//var toDate=DateProcessor.formatDate(new Date((new Date()).getTime()+(1000*60*60*24*3)));
		InterfaceAccess.loadReportsStream(id ,rowKey ,'10' ,function(result)
                {
                        console.log(result);
                        if(result!=null)
                        {
                                var reports=result.split('<br />');
                                if (reports.length > 0)
                                        for (var i = 0; i < reports.length; i++)
                                                if(reports[i]!="")
                                                {
                                                        reportObject=JSON.parse(reports[i]);
							console.log(reportObject);
                                                        addReport('reports',reportObject);
                                                        rowKey=reportObject.RowKey;
                                                }

				$('.carousel').removeClass('initialized');
				$('.carousel').carousel();
                        }
                });
	}

	function loadSim()
	{
		InterfaceAccess.getUserSim(id, function(result)
		{
			var userName=document.getElementById('userName');
			userName.innerHTML=id;

			var locationDiv=document.getElementById('locationDiv');
			locationDiv.innerHTML="<p><a onclick='showNavigation(false)' href='#' style='text-decoration:none;'>التقارير المرسلة</a></p>"
					     +"<p><a onclick='showNavigation(true)' href='#' style='text-decoration:none;'>خريطة التنقلات</a></p>";                
			var obj;
			var simDiv=document.getElementById('simDiv');
			myarr=result.split('<br />');
			if (myarr.length > 0)
			{
				for (var i = 0; i < myarr.length; i++)
					if(myarr[i]!="" && myarr[i]!=null && myarr[i][0]=='{')
					{
						console.log(myarr[i]);
						obj = JSON.parse(myarr[i]);
						simDiv.innerHTML+= "<p style='direction: ltr;'>IMSI: "+obj.IMSI+"<br />SSN: "+obj.SimSerialNumber+"</p>";
					}
			}
		});
	}

	function loadDevices()
	{
		InterfaceAccess.getUserDevices(id, function(result)
		{
			var obj;
			var deviceDiv=document.getElementById('deviceDiv');
			myarr=result.split('<br />');
			if (myarr.length > 0)
			{
				for (var i = 0; i < myarr.length; i++)
					if(myarr[i]!="" && myarr[i]!=null  && myarr[i][0]=='{')
					{
						console.log(myarr[i]);
						obj = JSON.parse(myarr[i]);
						deviceDiv.innerHTML+= "<p  style='direction: ltr;'>Device: "+obj.DeviceType+"<br />Mac: "+obj.Macaddress+"<br />IMEI: "+obj.IMEI+"<br />OS Version: Android ("+obj.Osversion+")</p>";
					}
			}
		});
	}

	function load()
	{
		id=Master.getVariable('id');
		//id=localStorage.getItem('profile-id');
		console.log(id);
		StropheAccess.connected(function()
		{
			StropheAccess.getUserVcard(StropheAccess.getJid(id), function(result)
			{
				console.log(result);

				var node=$(result).find('Work01').html();
				if(node=="" || node==null)
					node=$(result).find('ORGNAME').html();

				var name=$(result).find('FN').html();

				if(node!=null || name!="")
				{
					var jid=Strophe.getNodeFromJid(StropheAccess.connection.jid);

					if(jid=='ehq' || jid==node || !emptyReports)
					{
						if(jid=='ehq')
							$('#nodeLabel').html("الجهة "+node);

						$('#nameLabel').html(name);

						if(node!=null)
							$('#userImage').attr('src','imgs/node/'+node+'.png');

						$('#commandButton').click(function()
						{
							window.location.href='commands.html?u='+id+';';
						});
					}
					else
						window.location.href='nonePrivileges.html';
				}
				else
				{
					$('#nameLabel').html('المستخدم مضاف إلى جهة إخطار, لكنة لم يقم حتى الآن بالتسجيل من جهازه الخلوي.');
					$('#commandButton').remove();
				}
			});
		});

		if(id!="" && id!=null)
			fetch();

		//loadSim();
		//loadDevices();
	}

	window.onscroll = function()
	{
		if ((window.innerHeight + window.pageYOffset - 80) == document.body.clientHeight)
		fetch();
	}

	$('#accessButton').click(function()
	{
		window.location.href='access.html?id='+Master.getVariable('id');
	});

	$('#navigationButton').click(function()
        {
                window.location.href='navigation.html?id='+Master.getVariable('id');
        });
});

function showNavigation(on)
{
	var id=Master.getVariable('id');

	window.open('navigation.html?id='+id, '_blank');
	return;
	var reportsDiv=document.getElementById('reports');
	var navigationDiv=document.getElementById('navigationDiv');

	if(on)
	{
		reportsDiv.style.display='none';
		navigationDiv.style.display='block';
		navigationDiv.src='profilenavigation.html?id='+id;
	}
	else
	{
		reportsDiv.style.display='block';
		navigationDiv.style.display='none';
	}
}
