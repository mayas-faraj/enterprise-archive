var users=SetManager.getUsers();
var displayName=false;

DataAccess.findSetting("dispalyJid", function(result)
{
        displayName=result.trim()!='"1"';
        console.log("dn:" ,displayName);
});

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

function important(id)
{
	var x = document.getElementById("processed"+id);
    	if (x.className.indexOf("l3") == -1) 
	{
        	x.className = x.className.replace("d1", "l3");
		InterfaceAccess.setReportImportant(id ,"1" , "1" ,function(v){console.log(v);});
    	}
	else
	{
        	x.className = x.className.replace("l3", "d1");
		InterfaceAccess.setReportImportant(id,"1", "0",function(v){console.log(v);});
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

function addReport(element, obj)
{
	if(obj.text!=undefined && obj.text!="" && obj.text!=null)
	{
		var userElement=users[StropheAccess.getJid(obj.publisher)];
		var name;
		var logo;

		if(userElement!=null)
		{
			name=userElement.name;
			logo=userElement.setLogo;
		}
		else
		{
			name=obj.publisher;
			logo="imgs/node/es-smd.png";
		}
			


		//calculate coordinates
		var longitude=0;
		var latitude=0;
		var isGps=false;

		if(obj.gps!=undefined)
		{
			longitude=obj.gps.longitude;
			latitude=obj.gps.latitude;
			isGps=true;
		}

		if(longitude==0 && latitude==0 && obj.cellInfo!=undefined)
		{
			longitude=obj.cellInfo.longitude;
			latitude=obj.cellInfo.latitude;
			isGps=false;
		}
		
		//realtime logo
		var realtimeImage="";
		var locationImage;

		if(isGps)
			locationImage='imgs/map_gpslocation.png';
		else
			locationImage='imgs/map_location.png';

		var carousel='';
		if(obj.attachmentFiles !=null && obj.attachmentFiles !="")
        	{
			if(obj.attachmentFiles[obj.attachmentFiles.length-1]==';')
				obj.attachmentFiles=obj.attachmentFiles.substring(0,obj.attachmentFiles.length-1);
			var attachmentArray=obj.attachmentFiles.split(';');

			carousel='<div id="carousel_'+obj.RowKey+'" style="height: 200px" class="carousel">';
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
				var imageOffsetClass="";

				if(attachmentArray.length==2)
					imageOffsetClass='carousel-image-offset';
				carousel +='<a id="a_'+imageId+'" class="carousel-item '+imageOffsetClass+'" data-title="'+obj.text+'" data-lightbox="light_'+obj.RowKey+'"><img class="status-loading"></a>';
			}
			if(attachmentArray.length>1)
				carousel+='<div class="carousel-arrow-left" onclick="$(\'#carousel_'+obj.RowKey+'\').carousel(\'prev\');event.stopPropagation();">></div><div class="carousel-arrow-right" onclick="$(\'#carousel_'+obj.RowKey+'\').carousel(\'next\');event.stopPropagation();"><</div>';

			carousel+='</div><br/>';
		}
		else if(obj.attachments !=null && obj.attachments !="")
		{
			var attachmentArray=obj.attachments.split(';');
			carousel='<div id="carousel_'+obj.RowKey+'" style="height: 200px" class="carousel">';
			for(var i=0;i<attachmentArray.length;i++)
			{
				var imageOffsetClass="";
				if(attachmentArray.length==2)
                                        imageOffsetClass='carousel-image-offset';
				carousel +='<a class="carousel-item '+imageOffsetClass+'" href="'+attachmentArray[i]+'" data-title="'+obj.text+'" data-lightbox="light_'+obj.RowKey+'"><img id="img_'+imageId+'" src="'+attachmentArray[i]+'"></a>';
			}

			if(attachmentArray.length>1)
				carousel+='<div class="carousel-arrow-left" onclick="$(\'#carousel_'+obj.RowKey+'\').carousel(\'prev\');event.stopPropagation();">></div><div class="carousel-arrow-right" onclick="$(\'#carousel_'+obj.RowKey+'\').carousel(\'next\');event.stopPropagation();"><</div>';
			carousel+='</div><br/>';
		}	

		if(obj.Realtime==true)
			realtimeImage="<img src='assets/img/realtime.png' style='width:15px;height:15px;margin-left:5px;margin-bottom:-3px'/>";		
		address=geoName(longitude, latitude);
console.log('llllll;', longitude, latitude);
		//add report schema and info
		var exportParameter= "node="+obj.es+"&admin=مراقب بيانات&user="+obj.publisher+"&text="+obj.text+"&date="+DateProcessor.formatDate(new Date(obj.timestamp))+"&address="+address+"&ip="+obj.ip+"&imei=&imsi=&cell="+(obj.cellInfo!=null?obj.cellInfo.Cgi:"لا يوجد")+"&type=&ssn=&longitude="+longitude+"&latitude="+latitude;

		var dv=document.getElementById(element);

		var processedStyle="w3-theme-d1";
		dv.innerHTML+=
		" <div class='w3-container w3-card-2 w3-white w3-round w3-margin'><br>"+
		"       <a href='profile.html?id="+obj.publisher+"'><img src='"+logo+"' alt='Avatar' class='w3-right w3-circle w3-margin-right' style='height:60px;width:60px;margin:10px'></a>"+
		"       <div class='w3-left w3-opacity'><i class='material-icons'>access_alarm</i><i class='material-icons'>call_made</i>"+DateProcessor.formatDate(new Date(obj.timestamp))+"<br><i class='material-icons'>access_alarm</i><i class='material-icons'>call_received</i>"+(obj.receivedTimestamp==undefined?DateProcessor.formatDate(new Date(obj.timestamp)):DateProcessor.formatDate(new Date(obj.receivedTimestamp)))+"</div>"+
		"       <a style='text-decoration:none;' href='profile.html?id="+obj.publisher+"'><h5><span class='jid' style='color: black'>"+obj.publisher+"</span><span class='name' style='color: black'>"+ name+"</span></h5></a>"+
		((longitude!=0||latitude!=0)?
		"	<a style='text-decoration:none;color:gray;' target='mapframe' href='map.html?message="+obj.publisher+"&longitude="+longitude+"&latitude="+latitude+"'><h8><img src='"+locationImage+"' style='width:25px;height:25px;vertical-align: middle;margin-left:5px;margin-bottom:-3px'>في "+address+"</h8></a>":"<h8>في "+address+"</h8>")+
		"       <hr class='w3-clear'>"+
		"       <p style='font-family: cursive;'>"+realtimeImage+obj.text+"</p><br>"+carousel+
	        "	<table style='border: 2px solid black;width:100%;padding: 8px; text-align: center;'>"+
	        "	<tr style='background:#cccccc'><td>Provider</td><td>CGI</td></tr>"+
	        "	<tr><td style='width: 30%'>"+(obj.provider!=""?obj.provider:"XMPP")+"</td><td style='width: 70%'>"+(obj.cellInfo!=null?obj.cellInfo.Cgi:"لا يوجد")+"</td></tr>"+
	        "	</table><br>"+
		"       <button type='button' style='margin-right: 50px' id='processed"+obj.RowKey+"' onclick='important(\""+obj.RowKey+"\")' class='w3-button "+processedStyle+" w3-margin-bottom'><i class='fa'><img src='assets/img/spark.png' width='20px' height='20px'/></i> &nbsp;تعيين كهام</button> "+
		"      <button type='button'  style='margin-right: 50px' onclick='DocumentAccess.exporting(\""+obj.es+"\",\"مراقب بيانات\",\""+obj.publisher+"\",\""+obj.publisher+"\",`"+obj.text+"`,\""+DateProcessor.formatDate(new Date(obj.timestamp))+"\",\""+address+"\",\""+obj.ip+"\",\"\",\"\",\""+(obj.cellInfo!=null?obj.cellInfo.Cgi:"لا يوجد")+"\",\"\",\"\",\"\",\"\",\""+longitude+"\",\""+latitude+"\", function(v){window.location.href=\"documents/"+obj.es+"_result.docx\"})' class='w3-button w3-theme-d1 w3-margin-bottom'><i class='fa'><img src='assets/img/export.png' width='20px' height='20px'/></i> &nbsp;تصدير</button></div>";

		updateView();
	}
}

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
