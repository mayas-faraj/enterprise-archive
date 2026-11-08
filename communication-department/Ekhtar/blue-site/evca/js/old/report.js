$(document).ready(function()
{
	load();

	function load()
	{
		var id=Master.getVariable('id');
                if(id==null)
                        return;

		InterfaceAccess.getReportsByArgs('' ,keywords ,date1 ,date2 ,l1 , l2 , l3, l4 ,rowKey ,emaRowKey ,'6' ,function(result) 
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
							addReport('reports',reportObject);

							if(reportObject.Realtime)
								emaRowKey=reportObject.RowKey;
							else
								rowKey=reportObject.RowKey;

							
						}
			}
		});
	}	

	function loadImportance(arg0, arg1)
	{
		InterfaceAccess.getReportsByImportance(arg0, arg1,function(result)
		{
			if(result!=null)
			{
				var reports=result.split('<br />');
				if (reports.length > 0)
					for (var i = 0; i < reports.length; i++)
						if(reports[i]!="")
						{
							rowkey=JSON.parse(reports[i]).RowKey;
							console.log("row key stream:"+RowKey);
							addReport('reports',reports[i]);
						}
			}
		});
	}

	function loadClassification(name)
	{
		InterfaceAccess.getReportsByClassification(name, function(result)
		{
			if(result!=null)
			{
				var reports=result.split('<br />');
				if (reports.length > 0)
					for (var i = 0; i < reports.length; i++)
						if(reports[i]!="")
						{
							rowkey=JSON.parse(reports[i]).RowKey;
							console.log("row key stream:"+RowKey);
							addReport('reports',reports[i]);
						}
			}
		});
	}

	function load()
	{
		loadKeywords();

		var op=Master.getVariable('op');
		var arg0=Master.getVariable('arg0');
		var arg1=Master.getVariable('arg1');

		if(op!=null && op!="")
		{
			switch(op)
			{
				case "getreportsbyclassification":
					loadClassification(arg0);
					break;
				case "getreportsbyimportancerange":
					loadImportance(arg0, arg1);
					break;
				case "getreportsbyreviewstate":
				//	loadState(arg0, arg1);
				break;
			}
			stream=false;	
		}
		else
		{
			fetch();
			stream=true;
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
		if(stream)
		{
			if ((window.innerHeight + window.pageYOffset - 80) == document.body.clientHeight) 
			{
				fetch();
				console.log("row key: "+rowKey, "ema key:" +emaRowKey);
			}
		}
	}

	$('#searchButton').click(function()
	{
		if(FormValidation.checkNotEmpty('searchText'))
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

				alert(l1, l2, l3, l4);
				locationCondition="&l1="+l1+"&l2="+l2+"&l3="+l3+"&l4="+l4;
			}

			if($('#fromDate').val()!="")
				date1Condition="&date1="+Date.parse($('#fromDate').val());

			if($('#toDate').val()!="")
                                date2Condition="&date2="+Date.parse($('#toDate').val());
			
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
