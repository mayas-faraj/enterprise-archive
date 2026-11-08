function displayPanel(id) 
{
    console.log(id);
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

function toggle(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("l3") == -1) {
        x.className = x.className.replace("d1", "l3");
    } else { 
        x.className = x.className.replace("l3", "d1");
    }
}

function important(id)
{
	var x = document.getElementById("processed"+id);
    	if (x.className.indexOf("l3") == -1) 
	{
        	x.className = x.className.replace("d1", "l3");
		InterfaceAccess.setReportImportant(id ,"1" , function(v){console.log(v);});
    	}
	else
	{
        	x.className = x.className.replace("l3", "d1");
		InterfaceAccess.setReportImportant(id,"0",function(v){console.log(v);});
	}
}

function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

function addReportPreview(element, obj)
{
	if(obj.Message!=undefined && obj.Message!="" && obj.Message!=null)
	{
		var cell=obj.CellInfo;
		var longitude=0;
                var latitude=0;
                var isGps=false;
		
                if(obj.Gps!=undefined)
                {
                        longitude=obj.Gps.Longitude;
                        latitude=obj.Gps.Latitude;
                        isGps=true;
                }
                
		if(longitude==0 && latitude==0 && cell!=undefined)
                {
			var cellLocation=JSON.parse(cell);
                        longitude=cellLocation.Longitude;
                        latitude=cellLocation.Latitude;
                        isGps=false;
                }
                
		//realtime logo
		var realtimeImage="";

		(obj.Realtime==true)
			ltimeImage="<img src='assets/img/realtime.png' style='width:15px;height:15px;margin-left:5px;margin-bottom:-3px'/>";
                address=geoName(longitude, latitude);

		//add report and schema info
                var dv=document.getElementById(element);
                dv.innerHTML+=
                " <div class='w3-container w3-card-2 w3-white w3-round w3-margin'><br>"+
                "       <a href='profile.html?id="+obj.Publisher+"'><img src='assets/img/user.png' alt='Avatar' class='w3-right w3-circle w3-margin-right' style='width:60px;margin:10px'></a>"+
                "       <div class='w3-left w3-opacity'><img src='assets/img/clock.png' style='width:15px;height:15px;margin-left:5px;margin-bottom:-3px'/>"+obj.Date+"</div>"+
                "       <a style='text-decoration:none;' href='profile.html?id="+obj.Publisher+"'><h4>"+obj.Publisher+"</h4>"+
                "       <a style='text-decoration:none;color:gray;' target='_blank' href='map.html?message="+obj.Publisher+"&longitude="+longitude+"&latitude="+latitude+"'><h8><img src='assets/img/checking.png' style='width:15px;height:15px;margin-left:5px;margin-bottom:-3px'>في "+address+"</h8></a>"+
                "       <hr class='w3-clear'>"+
                "       <p>"+realtimeImage+obj.Message+"</p>"+
                "       <button type='button' id='processed"+obj.RowKey+"' onclick='important(\""+obj.RowKey+"\")' class='w3-button w3-theme-d1 w3-margin-bottom'><i class='fa'><img src='assets/img/spark.png' width='20px' height='20px'/></i> &nbsp;معالج</button> "+
                "       <button type='button' onclick='displayPanel(\"comment"+obj.RowKey+"\");' class='w3-button w3-theme-d2 w3-margin-bottom'><i class='fa'><img src='assets/img/comment.png' width='20px' height='20px'/></i> &nbsp;إجراء</button> "+
                "      <button type='button' onclick='window.open(\""+obj.ExtendedReportId+"\",\"_blank\");' class='w3-button w3-theme-d1 w3-margin-bottom'><i class='fa'><img src='assets/img/export.png' width='20px' height='20px'/></i> &nbsp;تفاصيل</button>"+
		"       <div id='comment"+obj.RowKey+"' class='w3-hide w3-container'>"+
                "       <input style='width:41%;margin-right:-15px' type='text'><button type='button'>حفظ</button>"+
                "       </div>"+
                " </div>";
        	}
}

function addReport(element, obj)
{
	if(obj.Message!=undefined && obj.Message!="" && obj.Message!=null)
	{
		//calculate coordinates
		var longitude=0;
		var latitude=0;
		var isGps=false;

		if(obj.Gps!=undefined)
		{
			longitude=obj.Gps.Longitude;
			latitude=obj.Gps.Latitude;
			isGps=true;
		}

		if(longitude==0 && latitude==0 && obj.CellInfo!=undefined)
		{
			longitude=obj.CellInfo.Longitude;
			latitude=obj.CellInfo.Latitude;
			isGps=false;
		}
		
		//realtime logo
		var realtimeImage="";
		var locationImage;

		if(isGps)
			locationImage='imgs/map_gpslocation.png';
		else
			locationImage='imgs/map_location.png';

		if(obj.Realtime==true)
			realtimeImage="<img src='assets/img/realtime.png' style='width:15px;height:15px;margin-left:5px;margin-bottom:-3px'/>";		
		address=geoName(longitude, latitude);
		//add report schema and info
		var exportParameter= "node="+obj.Es+"&admin=مراقب بيانات&user="+obj.Publisher+"&text="+obj.Message+"&date="+obj.Date+"&address="+address+"&ip="+obj.IP+"&imei="+obj.Device.IMEI+"&imsi="+obj.Sim.IMSI+"&cell="+obj.CellInfo.Cgi+"&type="+obj.Device.DeviceType+"&ssn="+obj.Sim.SimSerialNumber+"&mac="+obj.Device.Macaddress+"&os="+obj.Device.Osversion+"&longitude="+longitude+"&latitude="+latitude;

		var dv=document.getElementById(element);

		var processedStyle="w3-theme-d1";
		if(obj.Importants!=null && obj.Importants.length>0 && obj.Importants[0].value==true)
			processedStyle="w3-theme-l3";
		dv.innerHTML+=
		" <div class='w3-container w3-card-2 w3-white w3-round w3-margin'><br>"+
		"       <a href='profile.html?id="+obj.Publisher+"'><img src='imgs/node/"+obj.Es+".png' alt='Avatar' class='w3-right w3-circle w3-margin-right' style='width:60px;margin:10px'></a>"+
		"       <div class='w3-left w3-opacity'><img src='imgs/clock.png' style='width:15px;height:15px;margin-left:5px;margin-bottom:-3px'/>"+obj.Date+"</div>"+
		"       <a style='text-decoration:none;' href='profile.html?id="+obj.Publisher+"'><h4>"+obj.Publisher+"</h4></a>"+
		((longitude!=0||latitude!=0)?
		"	<a style='text-decoration:none;color:gray;' target='mapframe' href='map.html?message="+obj.Publisher+"&longitude="+longitude+"&latitude="+latitude+"'><h8><img src='"+locationImage+"' style='width:25px;height:25px;vertical-align: middle;margin-left:5px;margin-bottom:-3px'>في "+address+"</h8></a>":"<h8>في "+address+"</h8>")+
		"       <hr class='w3-clear'>"+
		"       <p style='font-family: cursive;'>"+realtimeImage+obj.Message+"</p>"+
	        "	<table style='border: 2px solid black;width:100%;padding: 8px; text-align: center;'>"+
	        "	<tr style='background:#cccccc'><td>IP</td><td>Imei</td><td>Imsi</td><td>CGI</td><tr>"+
	        "	<tr><td>"+obj.IP+"</td><td>"+obj.Device.IMEI+"</td><td>"+obj.Sim.IMSI+"</td><td>"+obj.CellInfo.Cgi+"</td><tr>"+
	        "	<tr style='background:#cccccc'><td>Device</td><td>SSN</td><td>Mac</td><td>OS</td><tr>"+
	        "	<tr><td>"+obj.Device.DeviceType+"</td><td>"+obj.Sim.SimSerialNumber+"</td><td>"+obj.Device.Macaddress+"</td><td>"+obj.Device.Osversion+"</td><tr>"+
	        "	</table><br>"+
		"       <button type='button' style='margin-right: 50px' id='processed"+obj.RowKey+"' onclick='important(\""+obj.RowKey+"\")' class='w3-button "+processedStyle+" w3-margin-bottom'><i class='fa'><img src='assets/img/spark.png' width='20px' height='20px'/></i> &nbsp;تعيين كهام</button> "+
		"      <button type='button'  style='margin-right: 50px' onclick='DocumentAccess.exporting(\""+obj.Es+"\",\"مراقب بيانات\",\""+obj.Publisher+"\",\""+obj.Publisher+"\",`"+obj.Message+"`,\""+obj.Date+"\",\""+address+"\",\""+obj.IP+"\",\""+obj.Device.IMEI+"\",\""+obj.Sim.IMSI+"\",\""+obj.CellInfo.Cgi+"\",\""+obj.Device.DeviceType+"\",\""+obj.Sim.SimSerialNumber+"\",\""+obj.Device.Macaddress+"\",\""+obj.Device.Osversion+"\",\""+longitude+"\",\""+latitude+"\", function(v){window.location.href=\"documents/"+obj.Es+"_result.docx\"})' class='w3-button w3-theme-d1 w3-margin-bottom'><i class='fa'><img src='assets/img/export.png' width='20px' height='20px'/></i> &nbsp;تصدير</button>"+
		" </div>";
	}
}
