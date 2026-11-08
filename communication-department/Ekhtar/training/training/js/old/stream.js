$(document).ready(function()
{
	var rowKey='0';
	var op=Master.getVariable('op');
	var arg0=Master.getVariable('arg0');
	var arg1=Master.getVariable('arg1');

	$(".datepicker").datepicker({format: "m/d/yyyy", isRtl: true});
        $(".timepicker").timepicker();


	//loadKeywords();
	load();

	function fetch()
	{
console.log('a');
		var l1=Master.getVariable('l1');
		if(l1==null || l1=="")
			l1="0";

		var l2=Master.getVariable('l2');
		if(l2==null || l2=="")                  
                        l2="0";

		var l3=Master.getVariable('l3');
		if(l3==null || l3=="")                  
                        l3="0";

		var l4=Master.getVariable('l4');
		if(l4==null || l4=="")                  
                        l4="0";			

		var keywords=Master.getVariable('keywords');
		if(keywords==null)
			keywords="";

		var date1=Master.getVariable('date1');
                if(date1==null || date1=='')
                        date1="1-1-1970 12:00:00";

		var date2=Master.getVariable('date2');
                if(date2==null || date2=='')
                        date2="1-1-2020 12:00:00";
			
		console.log('fetch', keywords, date1, date2, l1 ,l2, l3 ,l4, rowKey);
		InterfaceAccess.loadReportsByArgs('' ,keywords, '0', '', '', '0', '0' , '0', '0', '0', '0', date1, date2, l1 ,l2, l3 ,l4 , rowKey ,'10' ,function(result)
		{
console.log(result);
			if(result=='There are no privileges!')
				window.location.replace('nonePrivileges.html');

			console.log(result);
			if(result!=null)
			{
				var reports=result.split('<br />');
				if (reports.length > 0)
					for (var i = 0; i < reports.length; i++)
						if(reports[i]!="")
						{
							reportObject=JSON.parse(reports[i]);
							addReport('reports',reportObject);
							rowKey=reportObject.rowKey;
						}

				$('.carousel').removeClass('initialized');
				$('.carousel').carousel();
			}
		});
	}	

	function loadImportance(arg0, arg1)
	{
		 InterfaceAccess.loadReportsByArgs('' , '', '0', '', '', arg0, arg1 , '0', '0', '0', '0', '1-1-2010 12:00:00', '1-1-2020 12:00:00', '0' ,'0', '0' ,'0' ,'0' ,rowKey ,'10' ,function(result)
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
console.log(reports[i]);
							addReport('reports',reportObject);
							rowKey=reportObject.rowKey;
						}


				$('.carousel').removeClass('initialized');
				$('.carousel').carousel();
			}
		});
	}

	function loadClassification(name)
	{
		InterfaceAccess.loadReportsByArgs('' , '', '0', '', name, '0', '0' , '0', '0', '0', '0', '1-1-2010 12:00:00', '1-1-2020 12:00:00', '0' ,'0', '0' ,'0', '0', '0' ,'0' ,rowKey ,'10' ,function(result)
		{
			if(result!=null)
			{
				var reports=result.split('<br />');
				if (reports.length > 0)
					for (var i = 0; i < reports.length; i++)
						if(reports[i]!="")
						{
							reportObject=JSON.parse(reports[i]);
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
		if(op!=null && op!="")
		{
			switch(op)
			{
				case "getreportsbyclassification":
					console.log('class: ', arg0);
					loadClassification(arg0);
					break;
				case "getreportsbyimportancerange":
					console.log('importance range: ', arg0, arg1);
					loadImportance(arg0, arg1);
					break;
				case "getreportsbyreviewstate":
				//	loadState(arg0, arg1);
				break;
			}
		}
		else
		{
			fetch();
		}
	}

	function loadKeywords()
	{
		InterfaceAccess.getKeywords(function(result)
		{
			var keywords=result;
			console.log(keywords);
			var keywordArray=keywords.split(';');
			var kDiv=document.getElementById('keywordsDiv');

			for(var i=0;i<keywordArray.length;i++)
					$('#keywordsDiv').append("<p><a href='stream.html?op=getreportsbyclassification&arg0="+keywordArray[i]+"#rss'>"+keywordArray[i]+"</a>");
		});
	}

	window.onscroll = function() 
	{
			if ((window.innerHeight + window.pageYOffset - 80) == document.body.clientHeight) 
			{
				console.log("fetching............");
				console.log("row key: "+rowKey);
				load();
			}
	}

	$('#searchButton').click(function()
	{
		if(FormValidation.checkNotEmpty('searchText') || $('#mapCheck').prop('checked') || ($('#fromDate')!="" && $('#fromDate')!=""))
		{
			var date1Condition="";
			var date2Condition="";
			var textCondition="";
			var locationCondition="";
			
			if($('#mapCheck').prop('checked'))
			{
				var iframe = document.getElementById('mapframe');
				var bounds=iframe.contentWindow.map.getBounds();

				var l3=bounds._northEast.lng;
				var l2=bounds._northEast.lat;
				var l1=bounds._southWest.lng;
				var l4=bounds._southWest.lat;

				locationCondition="&l1="+l1+"&l2="+l2+"&l3="+l3+"&l4="+l4;
			}

			if($('#fromDate').val()!="")
				date1Condition="&date1="+DateProcessor.formatDate(new Date($('#fromDate').val()));;

			if($('#toDate').val()!="")
                                date2Condition="&date2="+DateProcessor.formatDate(new Date($('#toDate').val()+" 23:59:59"));
			
			var textCondition="keywords="+$('#searchText').text();
			

			window.location="stream.html?"+textCondition+locationCondition+date1Condition+date2Condition;
		}
	});
});

function exportDoc(strvar)
{
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function ()
	{
		setTimeout(function() {window.location.href='content/result.docx'}, 2000);
	}
	xmlhttp.open("GET", "php/export.php?" + strvar, true);
	xmlhttp.send();
}
