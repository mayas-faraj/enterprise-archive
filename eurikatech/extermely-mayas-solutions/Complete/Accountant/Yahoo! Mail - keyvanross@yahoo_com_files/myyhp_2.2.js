function ygmamyyhp(){
  var sHost = (typeof(location.href)=='string' && location.href.indexOf('https:')==0) ? 'https://sec.yimg.com/' : 'http://us.i1.yimg.com/us.yimg.com/';
	document.write('<iframe name="ygmaprocframe" width="0" height="0" style="width:0;height:0;" frameborder="0"></iframe><style type="text/css">#ygmamyyhpff{position:absolute;}#ygmashpd{display:none;font:normal x-small verdana;position:relative;top:8px;left:65px;display:block;}#ygmashpd .shdw{-moz-border-radius:4px;background:#ccc;z-index:1000;position:absolute;top:1.5em;left:1.5em;}#ygmashpd .bd{border:1px solid #4333BC;-moz-border-radius:4px;width:360px;background:#fff;position:relative;top:-2px;left:-2px;z-index:1001;color:#333;}#ygmashpd #pnt{position:absolute;top:-6px;left:30%;width:11px;height:6px;font-size:0px;background:url('+sHost+'i/ww/shpa1.gif);}#ygmashpd .ygmashp{width:40px;height:37px;font-size:0px;line-height:0px;top:10px;left:10px;display:block;position:absolute;background:url('+sHost+'i/ww/ydrag.gif);}#ygmashpd .ygmashp strong{display:none;}#ygmashpd ol{margin:9px 9px 9px 60px;padding:0 0 0 1.5em;*padding:0;}#ygmashpd li{padding:0;}#ygmashpd .hr{border-color:#ccc;margin:0 19px 5px;}#ygmashpd p{margin:0 9px 9px;text-align:center;}</style>');
	var ygmaffdd='<div id=ygmashpd style="display:none;" class=shdw><div class=bd><div id=pnt></div><a title="Yahoo!" class=ygmashp href="http://www.yahoo.com/"><strong>Yahoo!</strong></a><ol><li>Drag the "Y!" and drop it onto the "House" icon.</li><li>Select "Yes" from the pop up window.</li><li>Nothing, you\'re done.</li></ol><div class=hr></div><p>If this didn\'t work for you or you want more detailed instructions <a class=ygmashps href=http://www.yahoo.com/bin/set>click here</a>.</p><p><a href=# onclick="document.getElementById(\'ygmashpd\').style.display=\'none\';return false;">Close this window</a></p></div></div>';
	if(ygmaie&&ygmamyyhp){
		document.getElementById("ygmamyyhp").style.behavior="url(#default#homepage)";
		document.getElementById("ygmamyyhp").onclick=function(){
			ygmamyyhpbcn("ie");
			var hp="http://www.yahoo.com/";
			this.setHomePage(hp);
			ygmaprocframe.location.replace("http://www.yahoo.com/includes/hdhpdetect.php?hp="+hp+"&hpid=1&ygma_rd="+ygma_rd+"&ygma_space="+ygma_space+"&ygma_space2="+ygma_space2+"&ygma_space3="+ygma_space3+"&ygma_adid="+ygma_adid+"&ygma_prop="+ygma_prop);
			return false;
		}
	}else if(navigator.userAgent.toLowerCase().indexOf("firefox")>0){
		document.getElementById("ygmamyyhpff").innerHTML=ygmaffdd;
		document.getElementById("ygmamyyhp").onclick=function(){
			ygmamyyhpbcn("ff");
			var ygmashpds=document.getElementById("ygmashpd");
			ygmashpds.style.display=(ygmashpds.style.display=="block")?"none":"block";
			return false;
		}
	}
}
function ygmamyyhpbcn(b){
	var bcn=new Image;
	bcn.src=ygma_rd+ygma_space+"/*http://www.yahoo.com/bin/set?adid="+ygma_adid+"&prop="+ygma_prop+"&browser="+b;
}
if(document.cookie.indexOf("HP=")<0){
	document.getElementById("ygmamyyhp").style.display="inline";
	var ygmaie=(document.all)?1:0;
	var ygmahlc=(ygmaie)?0:1;
	var ygmashp=(window.history.length==ygmahlc);
	if(ygmashp){document.getElementById("ygmamyyhp").style.display="none";document.cookie="HP=1;path=/;domain=yahoo.com";}
	else{ygmamyyhp();}
}else{
	document.getElementById("ygmamyyhp").style.display="none";
}