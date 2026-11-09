jQuery(document).ready(function()
{
	jQuery('.datepicker').datepicker({startDate: "-30d"});
	updateCanvas();
	updateStaffId();

	jQuery("#runButton").click(function()
	{
		var dateFromString=null;
		var dateToString=null;

		if(jQuery("#startDatepicker").datepicker("getDate")!=null)
		{
			//startTimestamp=jQuery("#startDatepicker").datepicker("getDate").getTime() - new Date().getTimezoneOffset() * 60000;
			var dateFrom=jQuery("#startDatepicker").datepicker("getDate");
			dateFromString=(dateFrom.getYear()+1900).toString() + "-" + (dateFrom.getMonth()+1).toString() + "-" + (dateFrom.getDate()).toString();
		}

		if(jQuery("#endDatepicker").datepicker("getDate")!=null)
		{
			//endTimestamp=jQuery("#endDatepicker").datepicker("getDate").getTime() - new Date().getTimezoneOffset() * 60000;
			var dateTo=jQuery("#endDatepicker").datepicker("getDate");
			dateToString=(dateTo.getYear()+1900).toString() + "-" + (dateTo.getMonth()+1).toString() + "-" + (dateTo.getDate()).toString();
		}

		sendAjaxData(
		{
			"action": "query_appointment",
			"dateFrom":dateFromString,
			"dateTo": dateToString
		}, function(result)
		{
			console.log("result: ", result);
			resultArray=JSON.parse(result);

			for(var i=0; i<resultArray.length; i++)
			{
				jQuery("#" + resultArray[i].name + "Table #approvedCell").text(resultArray[i].appointments.approved);
				jQuery("#" + resultArray[i].name + "Table #pendingCell").text(resultArray[i].appointments.pending);
				jQuery("#" + resultArray[i].name + "Table #rejectedCell").text(resultArray[i].appointments.rejected);
			}

			updateCanvas();
		});
	});

	jQuery("#saveStaffButton").click(function()
	{
		var staffIdJson="{";
		jQuery("#staffEditTable>tbody>tr").each(function()
		{
			var staffId=jQuery(this).find("td>input").val();

			if(staffId!="")
			{
				var staffName=jQuery(this).find("td:first").html();
				if(staffIdJson.length>1)
					staffIdJson+=",";
				staffIdJson += '"' + staffName + '":"' + staffId + '"';
			}
		});
		staffIdJson+="}";
		updateStaffId(staffIdJson);
	});

	jQuery("#staffModal").on("show.bs.modal", function()
	{
		var table=jQuery("#staffTable").clone(true);
		table.attr("id", "staffEditTable");
		table.find("tbody>tr").each(function()
		{
			var td=jQuery(this).find("td:last");
			if(td.html()=="[not set]")
				td.html("");
			td.html('<input type="text" placeholder="[not set]"  value="'+td.html()+'"></input>');
		});
		jQuery(this).find(".modal-body").html(table.wrapAll("<table>").parent().html());
	});

	function updateCanvas()
	{
		var approvedCount = 0;
		var pendingCount = 0;
		var rejectedCount = 0;

		jQuery("#statisticsDiv>table").each(function(k, v)
		{
			approvedCount += parseInt(jQuery(v).find("#approvedCell").text());
			pendingCount += parseInt(jQuery(v).find("#pendingCell").text());
			rejectedCount += parseInt(jQuery(v).find("#rejectedCell").text());
		});

		if(pieChartObject!=null)
			pieChartObject.destroy();

		var ctxP = document.getElementById("pieChart").getContext('2d');

		pieChartObject = new Chart(ctxP, 
		{
			type: 'pie',
			data: 
			{
				labels: ["Approved", "Pending", "Denied"],
				datasets: 
				[{
					data: [approvedCount, pendingCount, rejectedCount],
					backgroundColor: ["#46BFBD", "#FDB45C", "#F7464A"],
					hoverBackgroundColor: ["#5AD3D1", "#FFC870", "#FF5A5E"]

				}]
			},
			options: 
			{
				responsive: true
			}
		});
	}

	function updateStaffId(jsonStaffId)
	{
		sendAjaxData(
		{
			action: "get_set_appointments_staff_id_list",
			jsonStaffId: jsonStaffId
		}, function(result)
		{
			console.log("staff result: ", result);
			var staffRow=jQuery("#staffTable>tbody>tr:last").clone();
			jQuery("#staffTable>tbody>tr").remove();

			var staffIdArray=JSON.parse(result);
			var staffKeys=Object.keys(staffIdArray);

			for(var i=0; i<staffKeys.length; i++)
			{
				staffRow.find("td:first").html(staffKeys[i]);
				staffRow.find("td:last").html(staffIdArray[staffKeys[i]]);
				jQuery("#staffTable>tbody").append(staffRow.get(0).outerHTML);
			}


		});
	}


	function sendAjaxData(data, updateUiCallback)
	{
		jQuery.ajax(
		{
			method: "POST",
			data: data,
			url: "admin-ajax.php",
			success: function(result)
			{
				if(updateUiCallback!=null)
				updateUiCallback(result);
			},
			error: function(err)
			{
				console.log("error on saving option with data: ", err);
			}
		});
	}

	var pieChartObject;
});
