

var map;

$(document).ready(function () {
    $(function () {
        $("#dialog").dialog({
            autoOpen: false
        });
    });
    });
    
function loadpics()
{/*alert("load");*/
/*map = L.map('map').setView([33,40],8);*/
map = L.map('map').setView([35,39.3],8);
L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg',{minZoom:8,maxZoom:17}).addTo(map);

}
function addbookmark(){
    /*alert("addbookmark");*/
    
    $("#dialog").dialog("open");

}


// Validating Form Fields.....
    function insertbm() {
      /*  alert("insert");*/
        var latitude1 = $("#latitude").val();
        var longitude1 = $("#longitude").val();
        var message=$("#message").val();
       
        if (latitude1 === '' || longitude1 === '') {
            alert("Please fill all fields...!!!!!!");
            e.preventDefault();
        }
        else
        {  var marker = L.marker([latitude1,longitude1])
            .addTo(map)
            .bindPopup("<b>"+message+"</b>")
            .openPopup();
     $("#dialog").dialog("close");
        }
    }
