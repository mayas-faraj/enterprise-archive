$(document).ready(function()
{
	var id="";
	var rowKey='0';
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
                                                        rowKey=reportObject.rowKey;
                                                }

				$('.carousel').removeClass('initialized');
				$('.carousel').carousel();
                        }
                });
	}

	function load()
	{
		id=Master.getVariable('id');
		var users=SetManager.getUsers();
		//id=localStorage.getItem('profile-id');
		console.log(id);
		var jid=StropheAccess.getJid(id);
		if(id.trim()!="")
		{
			if(users[jid]!=null)
			{
				$("#nodeLabel").html(users[jid].setName);
				$('#nameLabel').html(users[jid].name);
				$('#userImage').attr('src',users[jid].setLogo);

				$('#commandButton').click(function()
				{
					window.location.href='commands.html?u='+id+';';
				});

				if(!users[jid].available)
					$('#commandButton').remove();
			}
			else
				window.location.href='nonePrivileges.html';
		}
		else
		{
			 $('#nameLabel').html('لا يوجد معلومات عن المستخدم.');
			 $('#commandButton').remove();
		}

		if(id!="" && id!=null)
			fetch();

		//loadSim();
		//loadDevices();
	}

	window.onscroll = function()
	{
		if ((window.innerHeight + window.pageYOffset - 80) == document.body.clientHeight)
		{
			fetch();
			console.log("Row Key: ", rowKey);
		}
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
