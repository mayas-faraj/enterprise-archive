$(document).on("click", ".search-field>a", function()
{
	var searchText=$(this).siblings("input[type=text]");
	if(searchText.css("max-width")=="100px")
	{
		searchText.css("visibility", "hidden");
		searchText.css("max-width", "0px");
	}
	else
	{
		searchText.css("visibility", "visible");
		searchText.css("max-width", "100px");
	}
});

$(document).on("click", ".filter-field>a", function()
{
	var selectWrapper=$(this).siblings(".select-wrapper");
	if(selectWrapper.css("max-width")=="200px")
	{
		selectWrapper.css("visibility", "hidden");
		selectWrapper.css("max-width", "0px");
	}
	else
	{
		selectWrapper.css("visibility", "visible");
		selectWrapper.css("max-width", "200px");
	}
});

$(document).on("change", ".filter-field select", function()
{
	var filterElement=$(this).parent().parent().attr("data-filter");
	var filterPrefix=$(this).parent().parent().attr("data-prefix");
	var filterSuffix=$(this).parent().parent().attr("data-suffix");
	var prefixRegExp=null;
	var suffixRegExp=null;

	if(filterPrefix!=null && filterPrefix!="")
		prefixRegExp=new RegExp("^"+filterPrefix);

	if(filterSuffix!=null && filterSuffix!="")
		suffixRegEx=new RegExp(filterSuffix+"$");
	
	var value=$(this).val();

	$(filterElement).each(function()
	{
		var elementId=$(this).attr("id");

		if(prefixRegExp!=null)
			elementId=elementId.replace(prefixRegExp, "");
		if(suffixRegExp!=null)
			elementId=elementId.replace(suffixRegExp, "");

		if(value.indexOf(elementId)>=0)
			$(this).removeClass("hide")
		else
			$(this).addClass("hide");
	});
});

$(document).on("keyup", ".search-field>input[type=text]", function()
{
	var searchElement=$(this).parent().attr("data-search");
	var value=$(this).val();

	if(value=="")
		$(searchElement).removeClass("hide");
	else
		$(searchElement).each(function()
		{
			if($(this).find("label").length>0 && 
			  ($(this).find("label").html().indexOf(value)>=0 ||
			  ($(this).find("label").attr("data-tooltip")!=null && $(this).find("label").attr("data-tooltip").indexOf(value)>=0)))
				$(this).removeClass("hide");
			else
				$(this).addClass("hide");
		});

	$(document).trigger("searchCompleted");
});

