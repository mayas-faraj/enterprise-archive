export default function sendXhr(request, callback) {
	let xhr=new XMLHttpRequest();
	xhr.open("POST", "/backend/api.php");
	xhr.setRequestHeader("Content-Type" ,"application/json:charset=UTF-8");
	xhr.onreadystatechange=function() {
		if(this.readyState==4 && this.status==200)
			callback(JSON.parse(this.responseText));
	}

	xhr.send(JSON.stringify(request));
}
