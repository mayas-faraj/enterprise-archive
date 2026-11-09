document.addEventListener("DOMContentLoaded", load);
document.addEventListener("click", deleteButtonClick);

function load() {
	
	var typeSelect=document.getElementById("typeSelect");
	typeSelect.onchange=typeChanged;
	typeSelect.selectedIndex=0;
	typeChanged();

	document.getElementById("addStageButton").onclick=addButtonClick;
	document.getElementById("generateButton").onclick=generateButtonClick;
	document.getElementById("infoTextarea").onkeyup=updateAdditional;
	document.getElementById("conclutionTextarea").onkeyup=updateConclution;
	document.getElementById("companyText").onkeyup=updateCompany;
	document.getElementById("languageSelect").onchange=function() {
		typeSelect.onchange();
	};

	var techFieldset=document.getElementById("techFieldset").getElementsByTagName("input");
	for(let i=0; i<techFieldset.length; i++) {
		techFieldset[i].checked=false;
		techFieldset[i].onchange=techChanged;
	}
}

function typeChanged() {
	var typeSelect=document.getElementById("typeSelect");
	if(typeSelect.selectedOptions.length==1) {
		var techFieldset=document.getElementById("techFieldset").getElementsByTagName("input");
		var tech=typeSelect.selectedOptions[0].dataset.tech;
		if(tech!=undefined) {
			document.getElementById("techFieldset").getElementsByTagName("p")[0].classList.add("hidden");
			for(let i=0; i<techFieldset.length; i++) {
				techFieldset[i].checked=false;

				if(tech.indexOf(techFieldset[i].id)>=0)
					techFieldset[i].parentElement.classList.remove("hidden");
				else
					techFieldset[i].parentElement.classList.add("hidden");
			}
			updateIntro(typeSelect.value, typeSelect.dataset.gr);
		}	
		else {
			document.getElementById("techFieldset").getElementsByTagName("p")[0].classList.remove("hidden");
			for(let i=0; i<techFieldset.length; i++)
				techFieldset[i].parentElement.classList.add("hidden");

			updateIntro("", "");
		}
	}
}

function techChanged() {
	var techFieldset=document.getElementById("techFieldset");
	var techLabels=techFieldset.getElementsByTagName("label");
	var techInputs=techFieldset.getElementsByTagName("input");
	var techs=new Array();

	if(this.checked) {
		var type=this.dataset.type;
		for(let i=0; i<techInputs.length; i++)
			if(techInputs[i]!=this && techInputs[i].dataset.type==type)
				techInputs[i].checked=false;
	}

	for(let i=0; i<techLabels.length; i++) {
		var field=techFieldset.elements[techLabels[i].htmlFor];
		if(field.checked)
			techs.push({name: techLabels[i].innerHTML,type: document.getElementById("languageSelect").value=="english"?field.dataset.type:field.dataset.typegr});
	}

	updateTech(techs);
 }

function addButtonClick() {
	if(this.form.checkValidity()) {
		document.getElementById("blankRow").classList.add("hidden");
		document.getElementById("stages").getElementsByTagName("tbody")[0].innerHTML+="<tr>"
		+"<td>"+this.form.elements["stageText"].value+"</td>"
		+"<td>"+this.form.elements["detailsText"].value+"</td>"
		+"<td>"+this.form.elements["periodText"].value+"</td>"
		+"<td>"+this.form.elements["costText"].value+"</td>"
		+"<td><input type='button' value='X' class='remove-button'></td>"
		+"</tr>";

		this.form.reset();
		updateStages();
	}
}

function deleteButtonClick(event) {
	if(event.target.className=="remove-button") {
		event.target.parentElement.parentElement.remove();

		if(document.getElementById("stages").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length==1)
			document.getElementById("blankRow").classList.remove("hidden");
	}

	updateStages();
}

function generateButtonClick() {
	var jspdf=new jsPDF({orientation: 'p', unit: 'px', format: 'a4'});
	jspdf.fromHTML(document.getElementsByTagName("aside")[0], 0, 0, {width: 2480}, function() {jspdf.save("eurikatech-offer.pdf")});
}

function generateDisplay() {
	var isEnglish=document.getElementById("languageSelect").value==="english";
	var typeSelect=document.getElementById("typeSelect");
	var projectType;
	if(isEnglish)
		projectType=typeSelect.selectedOptions[0].innerHTML;
	else
		projectType=typeSelect.selectedOptions[0].dataset.gr;
}

function updateCompany() {
	if(this.value!="") {
		document.getElementById("client").children[0].innerHTML="Dear "+this.value+",";
	}
	else
		document.getElementById("client").children[0].innerHTML="";
}

function updateIntro(type, gr) {
	if(type!="") {
		if(document.getElementById("languageSelect").value==="english") {
			document.getElementById("intro").innerHTML="On behalf of the entire team here at Eurikatech, I want to thank you for the opportunity to earn your business as your provider of "+type+"."
			+" At Eurikatech we believe in standing out. We stand out as IT company by insisting on pushing the boundaries of "+type+" performance, and by delivering work of the highest quality on-time and on-budget.";
		}
		else {
			document.getElementById("intro").innerHTML="Im Namen des gesamten Teams hier bei Eurikatech möchte ich Ihnen für die Gelegenheit danken, Ihr Geschäft als Anbieter von "+type+" zu verdienen. Bei Eurikatech möchten wir uns von anderen abheben. Wir zeichnen uns als IT-Unternehmen dadurch aus, dass wir darauf bestehen, die Grenzen der Leistung von "+type+" zu erweitern und Arbeiten von höchster Qualität pünktlich und im Rahmen des Budgets zu liefern.";
		}
	}
	else
		document.getElementById("intro").innerHTML="";
}

function updateTech(techs) {
	var tech=document.getElementById("tech");
	if(techs.length>0) {
		var forWord;
		if(document.getElementById("languageSelect").value==="english") {
			tech.innerHTML="To achive your project, we will implement ";
			forWord="for";
		}
		else {
			tech.innerHTML="Um Ihr Projekt zu erreichen, implementieren wir ";
			forWord="für";
		}

		for(let i=0; i<techs.length; i++) {
			tech.innerHTML+=techs[i].name+" "+forWord+" "+techs[i].type;	
			if(i!==techs.length-1)
				tech.innerHTML+=", ";
		}

		tech.innerHTML+=".";
	}
	else
		tech.innerHTML="";
}

function updateAdditional() {
	document.getElementById("additional").innerHTML=this.value;
}

function updateStages(stages) {
	var stagesTable=document.getElementById("stages").getElementsByTagName("tr");
	var stageArray=new Array();
	for(let i=2; i<stagesTable.length; i++) {
		var cells=stagesTable[i].getElementsByTagName("td");
		stageArray.push({stage: cells[0].innerHTML, details: cells[1].innerHTML, period: cells[2].innerHTML, cost: cells[3].innerHTML});
	}

	var stage=document.getElementById("stage");
	var stages=document.getElementById("stagesFigure");
	var postStages=document.getElementById("postStages");
	if(stageArray.length==0) {
		stage.innerHTML="";
		stages.classList.add("hidden");
		postStages.innerHTML="";
	}
	else if(stageArray.length==1) {
		if(document.getElementById("languageSelect").value==="english") 
			stage.innerHTML="Our process will take at most "+stageArray[0].period+" hours, and it is about "+(parseInt(stageArray[0].period/5)+1).toString()+" days with the total cost &euro;"+stageArray[0].cost+".";
		else
			stage.innerHTML="gr single stage";

		stages.classList.add("hidden");
		postStages.innerHTML="";
	}
	else {
		var totalPeriod=0;
		var totalCost=0;
		stages.classList.remove("hidden");
		if(document.getElementById("languageSelect").value==="english") 
			stage.innerHTML="I've included the detail in the table below regarding the functionality of your project, and the design process, testimonials from pase Eurikatech clients.";
		else
			stage.innerHTML="Ich habe in der folgenden Tabelle die Details zur Funktionalität Ihres Projekts und zum Entwurfsprozess sowie Testimonials von Kunden von pase Eurikatech aufgeführt.";


		if(document.getElementById("languageSelect").value==="english")
			stages.getElementByTagName("thead")[0].innerHTML="<tr>"+
			+"<td>Stage</td><td>Details</td><td>Period</td><td>Cost</td></tr>";
		else
			stages.getElementByTagName("thead")[0].innerHTML="<tr>"+
			+"<td>Bühne</td><td>Einzelheiten</td><td>Zeit (Stunden)</td><td>Kosten (€)</td></tr>";


		stages.getElementsByTagName("tbody")[0].innerHTML="";
		for(let i=0; i<stageArray.length; i++) {
			stages.getElementsByTagName("tbody")[0].innerHTML+="<tr>"+
			"<td>"+stageArray[i].stage+"</td>"+
			"<td>"+stageArray[i].details+"</td>"+
			"<td>"+stageArray[i].period+"</td>"+
			"<td>"+stageArray[i].cost+"</td>"+
			"</tr>";
			totalPeriod+=parseInt(stageArray[i].period);
			totalCost+=parseInt(stageArray[i].cost);
		}


		if(document.getElementById("languageSelect").value==="english")
			postStages.innerHTML="Our process will take at most "+totalPeriod+" hours, and it is about "+(parseInt(totalPeriod/5)+1).toString()+" days with the total cost &euro;"+totalCost+".";
		else
			postStages.innerHTML="Unser Prozess dauert höchstens "+totalPeriod+" Stunden und dauert ungefähr "+(parseInt(totalPeriod/5)+1).toString()+" Tage. Die Gesamtkosten betragen "+totalCost+" €.";


	}
}

function updateConclution() {
	document.getElementById("conclution").innerHTML=this.value;
}
