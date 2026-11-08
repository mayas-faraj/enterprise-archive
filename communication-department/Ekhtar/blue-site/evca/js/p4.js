//var L=window.L;
var map;
var lf;
var res_markers = [];
var messages_cord = [];
var markers_l = new L.FeatureGroup();
var areaSelect;

$(document).ready(function () {
    $(function () {
        $("#dialog").dialog({
            autoOpen: false
        });
        $("#places").dialog({
            autoOpen: false
        });
        $('#test').BootSideMenu({side: "left", autoClose: true});
    });
});

function f1(e)
{
}
function f2()
{
    alert("f2");
    map.flyTo([35, 41], 12);
}

function loadpics()
{
    /*map = L.map('map').setView([33,40],8);*/

    var southWest = L.latLng(32, 35.5);
    var northEast = L.latLng(37.4, 43);
    var v1 = document.forms['form1'];
    v1.elements["l1"].value = 35.5;
    v1.elements["l2"].value = 37.4;
    v1.elements["l3"].value = 42.5;
    v1.elements["l4"].value = 32;
    /*
     map = L.map('map',{maxBounds:L.latLngBounds(southWest, northEast), selectArea: true}).setView([35,39.3],8);
     L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg',{minZoom:8,maxZoom:17}).addTo(map);
     */

    var satellite = L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 8, maxZoom: 16}),
            streets = L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 8, maxZoom: 16});
    map = L.map('map', {maxBounds: L.latLngBounds(southWest, northEast), center: [35, 39],
        zoom: 8,
        layers: [satellite] // only add one!
    });


    var baseLayers = {
        "Satellite Map": satellite,
        "Streets Map": streets
    };

    L.control.layers(baseLayers).addTo(map);

    map.on('moveend', function () {
//alert("move end");
        //alert(map.getBounds().getSouthWest());
        var v1 = document.forms['form1'];
        var v2 = v1.elements["l1"];
        // alert(v1.elements["l2"].value);
        //alert(map.getBounds().getWest());

        v1.elements["l1"].value = map.getBounds().getWest();
        v1.elements["l2"].value = map.getBounds().getNorth();
        v1.elements["l3"].value = map.getBounds().getEast();
        v1.elements["l4"].value = map.getBounds().getSouth();
        //alert("done");
    });
    //map.on('click', function(e) { alert("Lat, Lon : " + e.latlng.lat + ", " + e.latlng.lng); });
    /*
     map.selectArea.setCtrlKey(true); 
     // events
     /*map.on('moveend', function() { 
     alert(map.getBounds().getSouthWest());
     });
     map.on('click', function(e) { alert("Lat, Lon : " + e.latlng.lat + ", " + e.latlng.lng); });*/
    /*
     map.on('areaselected', (e) => {
     alert("Lat");
     console.log(e.bounds.toBBoxString()); // lon, lat, lon, lat 
     });
     */



}

function addbookmark() {

    $("#dialog").dialog("open");

}
function finddata() {
  //  alert("search()");
    $("#searchdialog").dialog("open");
    

}

function wbs1() {
    alert("wbs1");



}
function insertbm() {
    alert("insert");
    var latitude1 = $("#latitude").val();
    var longitude1 = $("#longitude").val();
    var message = $("#message").val();

    if (latitude1 === '' || longitude1 === '') {
        alert("Please fill all fields...!!!!!!");
        // e.preventDefault();
    } else
    {
        var marker = L.marker([latitude1, longitude1])
                .addTo(map)
                .bindPopup("<b>" + message + "</b>")
                .openPopup();

        $("#dialog").dialog("close");
    }
}

// Validating Form Fields.....

function drawmark22() {
    markers_l = new L.FeatureGroup();

    for (j = 0; j < res_markers.length; j++) {
        marker = new L.marker([res_markers[j][1], res_markers[j][2]])
                .bindPopup(res_markers[j][0])
                .addTo(map);
    }

}


function drawmark(t0, t1, t2, t3) {
    var index = t0;
    var latitude1 = t1;
    var longitude1 = t2;
    var message = t3;
    alert(t1 + "     " + t2 + "     " + t3 + "     " + t0);
    res_markers[index] = L.marker([latitude1, longitude1])
            .addTo(map)
            .bindPopup("<b>" + message + "</b>")
            .openPopup();


}

function clearmarkers() {
    map.removeLayer(markers_l);
    markers_l=new L.FeatureGroup();
    res_markers = [];
    messages_cord=[];
}

function ajaxp1() {
    alert("ajax");
    var v3 = document.forms['form1'];
    var l1 = v3.elements["l1"].value;
    var l2 = v3.elements["l2"].value;
    var l3 = v3.elements["l3"].value;
    var l4 = v3.elements["l4"].value;
    var l5 = v3.elements["key_word"].value;
    var l6 = v3.elements["starttime"].value;
    var l7 = v3.elements["endtime"].value;

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        var obj;
        if (this.readyState == 4 && this.status == 200) {
            alert("ok2");
            alert(this.responseText);
            myarr = JSON.parse(this.responseText);
            //alert(myarr.item.length);
            obj = JSON.parse(myarr.item[0]);
            v3.elements["key_word"].value = obj.Latitude;
            // alert(myarr.item[0]);
            //  alert( obj.Latitude);
            if (myarr.item.length > 0)
            {
                for (i = 0; i < myarr.item.length; i++)
                {
                    //   alert("be");
                    obj = JSON.parse(myarr.item[i]);
                    //res_markers[i]=[obj.Message,obj.Latitude,obj.Longitude];
                    drawmark(i, obj.Latitude, obj.Longitude, obj.Message);
                    /*       res_markers[i] =L.marker([obj.Latitude,obj.Longitude])
                     .addTo(map)
                     .bindPopup("<b>"+obj.Message+"</b>")
                     .openPopup();
                     alert("aft");
                     }*/

                    //  alert("aft");
                }
                // drawmark22();
            }

        }
    }
    var strvar = "key_word=" + l5 + "&starttime=" + l2 + "&endtime=" + l7+ "&l1=" + l1+ "&l2=" + l2+ "&l3=" + l3+ "&l4=" + l4  ;
    xmlhttp.open("GET", "php/getreportbyargs.php?" + strvar, true);
    xmlhttp.send();

}


/*   
 $(document).ready(function () {
 $(function () {
 $("#dialog").dialog({
 autoOpen: false
 });
 $("#openDialog").on("click", function () {
 $("#dialog").dialog("open");
 });
 $("#key_word_check").on("click", function () {
 $("#key_word_div").css("visibility",
 $("#key_word_div").css("visibility") == "hidden" ? "visible" : "hidden"
 );
 });
 $("#date_check").on("click", function () {
 $("#date_div").css("visibility",
 $("#date_div").css("visibility") == "hidden" ? "visible" : "hidden"
 );
 });
 $( "#datepicker" ).datepicker();
 });
 });*/


// insert to div


function test1()
{/*
    document.getElementById("content_messages").innerHTML = document.getElementById("content_messages").innerHTML +
            "<div style=\"padding-top:20px;\"><h5 style=\"font-size:80px\">Majllan</h5><h5>TItle Message</h5><hr/></div>";*/
    map.flyTo([35, 40], 12);
}
function test2()
{
    var e = document.getElementById("selectlist1");
    var stru = e.options[e.selectedIndex].text;
    switch (stru)
    {
        case "Damascus":
            alert("d")
            break;
        case "Homs":
            alert("d")
            break;
        default:
            break;

    }
    map.flyTo([t1, t2], t3);
}
function test3()
{
    $("#places").dialog("open");
    $('select').selectmenu();
$('.RegularDialog').dialog({
  autoOpen: false,
  modal: true,
  height: 500,
  width: 570
});
$('#OpenDialog').click(function(e) {
  $('.RegularDialog').dialog('open');
});
}
//// new modify 


function insertbm2() {
    alert("insert");
    var latitude1 = $("#latitude").val();
    var longitude1 = $("#longitude").val();
    var message = $("#message").val();

    if (latitude1 === '' || longitude1 === '') {
        alert("Please fill all fields...!!!!!!");
        // e.preventDefault();
    } else
    {
        var marker = L.marker([latitude1, longitude1]);
        marker.bindPopup("<b>" + message + "</b>")
                .openPopup();
        markers_l.addLayer(marker);
        map.addLayer(markers_l);
        $("#dialog").dialog("close");
    }
}

function ajaxp1_m() {
    alert("ajax m");
    var v3 = document.forms['form1'];
    var l1 = v3.elements["l1"].value;
    var l2 = v3.elements["l2"].value;
    var l3 = v3.elements["l3"].value;
    var l4 = v3.elements["l4"].value;
    var l5 = v3.elements["key_word"].value;
    var l6 = v3.elements["starttime"].value;
    var l7 = v3.elements["endtime"].value;

    document.getElementById("content_messages").innerHTML = "";


    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        var obj;
        if (this.readyState == 4 && this.status == 200) {
           // alert("ok4_m");
            alert(this.responseText);
            myarr = JSON.parse(this.responseText);
            alert("getreportbyargs  "+myarr.item.length);
            obj = JSON.parse(myarr.item[0]);
            v3.elements["key_word"].value = obj.Latitude;
          //   alert(myarr.item[0]);
            //  alert( obj.Latitude);
            if (myarr.item.length > 0)
            {
                for (var i = 0; i < myarr.item.length; i++)
                {
                    obj = JSON.parse(myarr.item[i]);
                    res_markers[i] = L.marker([obj.Latitude, obj.Longitude]);
                    res_markers[i].bindPopup(obj.Message).openPopup();
                    markers_l.addLayer(res_markers[i]);
                      messages_cord[i]=[obj.Latitude, obj.Longitude,obj.Message];            
    document.getElementById("content_messages").innerHTML = document.getElementById("content_messages").innerHTML +
            "<div onclick=\"mayfly("+i+")\" style=\"padding-top:20px;\"><h5 style=\"font-size:24px;color:#88d4f9\">"+obj.Message+"<br/>"+messages_cord[i][2] +"</h5><hr/></div>";
                }
                
 
                
                
                map.addLayer(markers_l);
                 $("#searchdialog").dialog("close");
            }

        }
    }
    //var strvar = "l1=" + l1 + "&l2=" + l2 + "&l3=" + l3 + "&l4=" + l4 + "&key_word=" + l5;
      var strvar = "key_word=" + l5 + "&starttime=" + l6 + "&endtime=" + l7+ "&l1=" + l1+ "&l2=" + l2+ "&l3=" + l3+ "&l4=" + l4  ;
    xmlhttp.open("GET", "php/test.php?" + strvar, true);
    xmlhttp.send();

}
function mayfly(t6)
{
    map.flyTo([messages_cord[t6][0], messages_cord[t6][1]], 14);
    res_markers[t6].openPopup();
}
function  myareaselect()
{var areaSelect = L.areaSelect({width:200, height:300});
areaSelect.addTo(map);

// Read the bouding box
var bounds = areaSelect.getBounds();

// Get a callback when the bounds change
areaSelect.on("change", function() {
    console.log("Bounds:", this.getBounds());
});

// Set the dimensions of the box
areaSelect.setDimensions({width: 500, height: 500})
}

  $(function() {
    $('#datetimepicker1').datetimepicker({
      language: 'en'
    });
  });
  
    $(function() {
    $('#datetimepicker2').datetimepicker({
      language: 'en'
    });
  });

function recselect()
{    alert("area rec select 6");
    var so = L.latLng(34, 36.5);
    var nor = L.latLng(37, 40);

var locationFilter = new L.LocationFilter({bounds: L.latLngBounds(so,nor),enable:true}).addTo(map);
//Bounds: L.latLngBounds(so, nor)

//Bounds: L.latLngBounds(so, nor)
//lf =new  L.LocationFilter({bounds: L.latLngBounds(so,nor)});
//map.addLayer(lf);
}

function recselect2()
{    alert("2 area rec select 6");
    var so = L.latLng(34, 36.5);
    var nor = L.latLng(37, 40);
map.selectArea.enable();

//map.selectArea.setCtrlKey(true); 
map.on('areaselected', (e) => {
  alert(e.bounds); // lon, lat, lon, lat
});


//var locationFilter = new L.LocationFilter({bounds: L.latLngBounds(so,nor),enable:true}).addTo(map);
//Bounds: L.latLngBounds(so, nor)

//Bounds: L.latLngBounds(so, nor)
//lf =new  L.LocationFilter({bounds: L.latLngBounds(so,nor)});
//map.addLayer(lf);
}

