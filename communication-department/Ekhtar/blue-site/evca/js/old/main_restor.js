var offset=0;

function displayPanel(id) 
{
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

//toggle button
function toggle(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("l3") == -1) {
        x.className = x.className.replace("d1", "l3");
    } else { 
        x.className = x.className.replace("l3", "d1");
    }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

function addReport(index,json)
{
	 console.log(json);
	 obj = JSON.parse(json);
         console.log(obj);
         var device=JSON.parse(obj.Device);
         var cell=JSON.parse(obj.CellInfo);
         var sim=JSON.parse(obj.Sim);
         var gps=JSON.parse(obj.Gps);

	 //calculate coordinates
         var longitude=gps.Longitude;
         var latitude=gps.Latitude;
         var isGps=true;

         if(longitude==0 && latitude==0)
         {
         	longitude=cell.Longitude;
                latitude=cell.Latitude;
		isGps=false;
         }

	var address=geoName(longitude, latitude);
	rowkey=obj.RowKey;

	//add report schema and info
   	if(obj.Message!="")
	{
		var exportParameter= "admin=ﻡﺭﺎﻘﺑ ﺐﻳﺎﻧﺎﺗ&user="+obj.Publisher+"&text="+obj.Message+"&date="+obj.Date+"&address="+address+"&ip="+obj.IP+"&imei="+device.IMEI+"&imsi="+sim.IMSI+"&cell="+cell.Cgi+"&type="+device.DeviceType+"&ssn="+sim.SimSerialNumber+"&mac="+device.Macaddress+"&os="+device.Osversion+"&longitude="+longitude+"&latitude="+latitude;

		var dv=document.getElementById('reports');
		dv.innerHTML+=
		" <div class='w3-container w3-card-2 w3-white w3-round w3-margin'><br>"+
		"       <a href='profile.html?id="+obj.Publisher+"'><img src='assets/img/user.png' alt='Avatar' class='w3-right w3-circle w3-margin-right' style='width:60px;margin:10px'></a>"+
		"       <div class='w3-left w3-opacity'>"+obj.Date+"</div>"+
		"       <a style='text-decoration:none;' href='profile.html?id="+obj.Publisher+"'><h4>"+obj.Publisher+"</h4>"+
		"	<a style='text-decoration:none;color:gray;' target='mapframe' href='map.html?message="+obj.Publisher+"&longitude="+longitude+"&latitude="+latitude+"'><h8>"+address+"</h8></a>"+
		"       <hr class='w3-clear'>"+
		"       <p>"+obj.Message+"</p>"+
	        "	<table style='border: 2px solid black;width:100%;padding: 8px; text-align: center;'>"+
	        "	<tr style='background:#cccccc'><td>IP</td><td>Imei</td><td>Imsi</td><td>Cid</td><tr>"+
	        "	<tr><td>"+obj.IP+"</td><td>"+device.IMEI+"</td><td>"+sim.IMSI+"</td><td>"+cell.Cgi+"</td><tr>"+
	        "	<tr style='background:#cccccc'><td>Device</td><td>SSN</td><td>Mac</td><td>OS</td><tr>"+
	        "	<tr><td>"+device.DeviceType+"</td><td>"+sim.SimSerialNumber+"</td><td>"+device.Macaddress+"</td><td>"+device.Osversion+"</td><tr>"+
	        "	</table><br>"+
		"       <button type='button' id='processed"+index+"' onclick='toggle(\"processed"+index+"\")' class='w3-button w3-theme-d1 w3-margin-bottom'><i class='fa'><img src='assets/img/spark.png' width='20px' height='20px'/></i> &nbsp;تم المعالجة</button> "+
		"       <button type='button' onclick='displayPanel(\"comment"+index+"\");' class='w3-button w3-theme-d2 w3-margin-bottom'><i class='fa'><img src='assets/img/pen.png' width='20px' height='20px'/></i> &nbsp;تعليق</button> "+
		"       <div id='comment"+index+"' class='w3-hide w3-container'>"+
		"               <table><tr width='100%'>"+
		"                        <td><input type='text'/></td>"+
		"                        <td><button type='button'>حفظ</button> </td>"+
		"                </tr></table>"+
		"          </div>"+
		"      <button type='button' onclick='exportDoc(\""+encodeURI(exportParameter)+"\")' class='w3-button w3-theme-d1 w3-margin-bottom'><i class='fa'><img src='assets/img/export.png' width='20px' height='20px'/></i> &nbsp;تصدير</button>"+
		" </div>";
	}
}

function fetch()
{
 	var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function ()
        {
                var obj;

                if (this.readyState == 4 && this.status == 200) {
                myarr=this.responseText.split('\n');
                if(Array.isArray(myarr))
                {
                        if (myarr.length > 0)
                        {
                            var length=myarr.length;
                            console.log(myarr.length);
                            for (var i = 0; i < myarr.length; i++)
                                if(myarr[i]!="" && myarr[i]!=null)
                                      	addReport(index++,myarr[i]);
                        }
                }
                else
                {
                        addReport(index++,myarr);
                }
        }
        }
        var strvar ="op=getreportsstream&arg0="+rowkey+"&arg1=10";
        xmlhttp.open("GET", "php/interface.php?" + strvar, true);
        xmlhttp.send();
}

function loadImportance(arg0, arg1)
{
 	var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function ()
        {
                var obj;

                if (this.readyState == 4 && this.status == 200) 
		{
                	myarr=this.responseText.split('\n');
	                if(Array.isArray(myarr))
	                {
	                        if (myarr.length > 0)
	                        {
	                            for (var i = 0; i < myarr.length; i++)
	                                if(myarr[i]!="" && myarr[i]!=null)
	                                        addReport(index++,myarr[i]);
	                        }
	                }
	                else
	                        addReport(index++,myarr);
        	}
        }
        var strvar ="op=getreportsbyimportancerange&arg0="+arg0+"&arg1="+arg1;
        xmlhttp.open("GET", "php/interface.php?" + strvar, true);
        xmlhttp.send();
}

function loadClassification(name)
{
	var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function ()
        {
                var obj;

                if (this.readyState == 4 && this.status == 200) 
		{
                	myarr=this.responseText.split('\n');
                	if(Array.isArray(myarr))
                	{
                        	if (myarr.length > 0)
                        	{
					console.log("l:"+myarr.length);
                            		for (var i = 0; i < myarr.length; i++)
                                		if(myarr[i]!="" && myarr[i]!=null)
						{
							console.log("xxx:"+myarr[i]);
                                                	addReport(index++,myarr[i]);
						}
                                }
                        }
			else
				addReport(index++,myarr);
                }
        }
        var strvar ="op=getreportsbyclassification&arg0="+name;
	console.log(strvar);
        xmlhttp.open("GET", "php/interface.php?" + strvar, true);
        xmlhttp.send();
}


function loadCommands()
{
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function ()
        {
                var obj;
		var lst=document.getElementById('list');
                if (this.readyState == 4 && this.status == 200) {
                myarr=this.responseText.split('\n');
                if (myarr.length > 0)
                {
                      for (var i = 0; i < myarr.length; i++)
                            if(myarr[i]!="" && myarr[i]!=null)
                            {
                                obj = JSON.parse(myarr[i]);
				lst.innerHTML+= "<a href='#' class='w3-bar-item w3-button'>"+obj.Message+"</a>";		
                       	    } 

			lst.innerHTML+="<b><i><a href='commands.html' class='w3-bar-item w3-button'>مشاهدة الكل</a></i></b>";
        	}
        }
	}
        var strvar ="op=getcommands&arg0=0&arg1=5";
        xmlhttp.open("GET", "php/interface.php?" + strvar, true);
        xmlhttp.send();
}

function load()
{
	loadKeywords();
	loadCommands();

	var url=window.location.search;
	if(url!="")
	{
		url=url.substring(1);
		var parts=url.split('&');
		var params={}
		for(var i=0;i<parts.length;i++)
		{
			var nv=parts[i].split('=');
			if(!nv[0]) continue;

			params[nv[0]] = nv[1] || true;
		}

		var op=params.op;
		var arg0=params.arg0;
		var arg1=params.arg1;

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
	var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function ()
        {
                var obj;

                if (this.readyState == 4 && this.status == 200) 
		{
                var keywords=this.responseText;
		console.log(keywords);
       		var keywordArray=keywords.split(';');
		var kDiv=document.getElementById('keywordsDiv');

		for(var i=0;i<keywordArray.length;i++)
			kDiv.innerHTML+="<p><a href='main.html?op=getreportsbyclassification&arg0="+keywordArray[i]+"#rss'>"+keywordArray[i]+"</a>"			 
		}
        }
        var strvar ="op=getkeywords";
        xmlhttp.open("GET", "php/interface.php?" + strvar, true);
        xmlhttp.send();
}

function exportDoc(strvar)
{
 	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function ()
        {
		setTimeout(function() {window.location.href='http://192.168.90.11/ekhtar/content/result.docx'}, 2000);
        }
        xmlhttp.open("GET", "php/export.php?" + strvar, true);
        xmlhttp.send();
}

window.onscroll = function(ev) 
{
	if(stream)
	{
        	if ((window.innerHeight + window.pageYOffset) >= document.body.offsetHeight-100) 
        	{
			fetch();
			console.log("row key: "+rowkey);
        	}
	}
}
var index=0;
var rowkey='0';
var stream=true;
window.onload=load();
