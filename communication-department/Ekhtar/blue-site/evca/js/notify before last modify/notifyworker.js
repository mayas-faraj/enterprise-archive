var i = 0;
var arr_res;
var id=0;
var obj;
var myarr;
var l1=35.5;
var l2=37.4;
var l3=42.5;
var l4=32;

var oldid=1;

function timedCount() {
      var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        
if (this.readyState == 4 && this.status == 200) {            
 if(this.responseText ==0 ||this.responseText==-1)
{
console.log("first condition");  
}
if(this.responseText)
{
    console.log("outer second condition is full"+this.responseText);
}
else {console.log("outer second condition is empty");}

// get last id 
if(this.responseText)
{
console.log("response not empty check");
myarr = JSON.parse(this.responseText);     

if(Array.isArray(myarr.item))       
{  
  console.log("item array");
 if (myarr.item.length > 0)

{
obj = JSON.parse(myarr.item[0]);
                    //obj = JSON.parse(myarr.item[myarr.item.length-1]);
oldid=id;                    
id =obj.Timestamp;  
postMessage(this.responseText);
console.log(" message posted  oldid  "+oldid+"   "+this.responseText);
            
}

}
else{
if(myarr)
{
console.log(" arr  -"+myarr+"_"); 
console.log(" my arr   "+myarr.item);
obj = JSON.parse(myarr.item);
oldid=id;    
id =obj.Timestamp;
postMessage(this.responseText);
console.log(" one message posted  oldid  "+oldid+"   "+this.responseText);
 }   
 }
}

   }
    };
    var strvar = "id=" + id+"&l1=" + l1 + "&l2=" + l2 + "&l3=" + l3 + "&l4=" + l4;
    xmlhttp.open("GET", "http://192.168.90.11/ekhtar/php/notify.php?"+strvar, false);
    xmlhttp.send();      
    setTimeout("timedCount()",5000);    
}

timedCount(); 


self.onmessage=function(e){    
l1=e.data[0];
l2=e.data[1];
l3=e.data[2];
l4=e.data[3];
    console.log("l1   "+l1+"    "+l3);
};
