<?php
$city_ids=array(167541, 169575, 170062, 173578, 163342, 170015, 172410, 170903, 173336, 170792, 172957, 173813, 169387);
$weather_array=array();

/*{
	name: "Damascus Governorate", id: 167541,
	name: "Homs Governorate", id: 169575,
	name: "Aleppo Governorate", id: 170062,
	name: "Latakia Governorate", id: 173578,
	name: "Tartus Governorate", id: 163342,
	name: "Hama Governorate", id: 170015,
	name: "As-Suwayda Governorate", id: 172410,
	name: "Daraa Governorate", id: 170903,
	name: "Quneitra Governorate", id: 173336,
	name: "Deir ez-Zor Governorate", id: 170792,
	name: "Ar-Raqqah Governorate", id: 172957,
	name: "Al-Hasakah Governorate", id: 173813
	name: "Idlib Governorate", id: 169387,
}*/


$curl=curl_init();
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
foreach($city_ids as $id) {
curl_setopt($curl, CURLOPT_URL, "http://api.openweathermap.org/data/2.5/weather?id=$id&lang=ar&units=metric&APPID=15f343a985c4e356609a466558d20f4f");
$result=json_decode(curl_exec($curl));
$weather_array[]=array("city"=>$result->name, "temp"=>$result->main->feels_like, "humidity"=>$result->main->humidity, "icon"=>$result->weather[0]->icon, "main"=>$result->weather[0]->main);
}
curl_close($curl);
?>
<section class="weather-widget">
	<?php foreach($weather_array as $weather): ?>
	<div class="weather-row">
		<span><?php echo str_replace("محافظة ", "", $weather["city"]); ?></span>
		<img src="http://openweathermap.org/img/wn/<?php echo $weather["icon"]; ?>.png">
		<span><i class="fa fa-thermometer-half"></i><?php echo $weather["temp"]; ?>&deg;</span>
		<span><i class="fa fa-tint"></i><?php echo $weather["humidity"]; ?></span>
	</div>
	<?php endforeach; ?>
</section>
<style>
.weather-widget {
	display: table;
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	background-image: url(assets/imgs/snow.svg);
}

.weather-row {
	display: table-row;
}

.weather-row > * {
	display: table-cell;
	vertical-align: middle;
}

.weather-row img {
	filter: drop-shadow(2px 4px 6px black);
}

.weather-row i {
	font-size: .7rem;
}

i.fa.fa-thermometer-half {
	color: #f05454;
}

i.fa.fa-tint {
	color: #30475e;
}

</style>

