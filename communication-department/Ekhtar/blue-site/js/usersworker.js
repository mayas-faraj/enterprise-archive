var i = 0;
var arr_res;

function timedCount() {
      var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
       if (this.readyState == 4 && this.status == 200) {
            postMessage(this.responseText);
            //  myarr = JSON.parse(this.responseText);
           //  alert(myarr.item.length);
           // obj = JSON.parse(myarr.item[0]);
        
        }
    }
   // var strvar = "l1=" + l1 + "&l2=" + l2 + "&l3=" + l3 + "&l4=" + l4 + "&key_word=" + l5;
    xmlhttp.open("GET", "http://192.168.90.11/map/php/not.php", false);
    xmlhttp.send();      
    setTimeout("timedCount()",5000);    
}

timedCount(); 


