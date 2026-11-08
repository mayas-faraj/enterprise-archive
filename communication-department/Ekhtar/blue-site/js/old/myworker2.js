var i = 0;
var arr_res;
var id="fffffffffffffffff";
function timedCount() {
      var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
       if (this.readyState == 4 && this.status == 200) {  
           
myarr = JSON.parse(this.responseText);  

if(Array.isArray(myarr.item))       

        {     if (myarr.item.length > 0)
            {
                  obj = JSON.parse(myarr.item[0]);
                  id=obj.RowId;
            } 
                 postMessage(this.responseText);
        }
else{
    if(myarr.item!="")
    {
        //obj = JSON.parse(myarr.item);
     //id=obj.RowId;  
      postMessage(this.responseText);
          //postMessage(myarr.item);
          }
}  
       
            
            //  myarr = JSON.parse(this.responseText);
           //  alert(myarr.item.length);
           // obj = JSON.parse(myarr.item[0]);
        
        }
    }
    var strvar = "id=" + id;
    xmlhttp.open("GET", "http://192.168.90.11/map/php/not2.php?"+strvar, false);
    xmlhttp.send();      
    setTimeout("timedCount()",10000);    
}

timedCount(); 


