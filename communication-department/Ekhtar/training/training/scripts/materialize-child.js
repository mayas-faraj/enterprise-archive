M.Datepicker.prototype._insertHTMLIntoDOM=function()
{ 
	if (this.options.showClearBtn) 
	{
		$(this.clearBtn).css({ visibility: '' });
		this.clearBtn.innerHTML = this.options.i18n.clear;
	}

	this.doneBtn.innerHTML = this.options.i18n.done;
	this.cancelBtn.innerHTML = this.options.i18n.cancel;

	this.$modalEl.appendTo("body");
};

M.Timepicker.prototype._insertHTMLIntoDOM=function()
{
	this.$modalEl = $(M.Timepicker._template);
	this.modalEl = this.$modalEl[0];
	this.modalEl.id = 'modal-' + this.id;

	this.$modalEl.appendTo("body");
};

datepickerArgs=
{
	isRTL: false,
	firstDay: 6,
	showClearBtn: true,
	format: "dd-mm-yyyy",
	i18n:
	{
		cancel: "<i class='material-icons tooltipped red-text' data-tooltip='إلغاء'>close</i>",
		clear: "<i class='material-icons tooltipped orange-text' data-tooltip='مسح'>not_interested</i>",
		done: "<i class='material-icons tooltipped green-text' data-tooltip='اختيار'>done</i>",
		months: ["كانون الثاني", "شباط", "آذار", "نيسان", "أيار", "حزيران", "تموز", "آب", "أيلول", "تشرين الأول", "تشرين الثاني", "كانون الأول"],
		monthsShort: ["كانون الثاني", "شباط", "آذار", "نيسان", "أيار", "حزيران", "تموز", "آب", "أيلول", "تشرين الأول", "تشرين الثاني", "كانون الأول"],
		weekdays: ["الأحد", "الاثنين", "الثلاثاء", "الأربعاء", "الخيس", "الجمعة", "السبت"],
		weekdaysShort: ["الأحد", "الإثنين", "الثلاء", "الأربعاء", "الخميس", "الجمعة", "السبت"],
		weekdaysAbbrev: ["أحد", "إثنين", "ثلاثاء", "أربعاء", "خميس", "جمعة", "سبت"]
	},
	onClose: function()
	{
		var timepicker=this.el.getAttribute("data-timepicker");

		if(timepicker!=null && $(timepicker).length>0)
			$(timepicker).prop("disabled", this.date==null);
	}
};

timepickerArgs=
{
	showClearBtn: true,
	twelveHour: false,
	i18n:
	{
		cancel: "<i class='material-icons tooltipped red-text' data-tooltip='إلغاء'>close</i>",
		clear: "<i class='material-icons tooltipped orange-text' data-tooltip='مسح'>not_interested</i>",
		done: "<i class='material-icons tooltipped green-text' data-tooltip='اختيار'>done</i>"
	}
};

function getTimestamp(dateElement, timeElement, isEndRange)
{
	var timestamp;
	if(M.Datepicker.getInstance(dateElement).date==null)
		timestamp=0;
	else
	{
		var date=new Date(M.Datepicker.getInstance(dateElement).date.getTime());
		var timeInstance=M.Timepicker.getInstance(timeElement);

		if(!timeInstance.el.disabled && timeInstance.time!=null)
		{
			date.setHours(timeInstance.hours);
			date.setMinutes(timeInstance.minutes);
			date.setSeconds(0);
		}
		else
			if(isEndRange)
			{
				date.setHours(23);
				date.setMinutes(59);
				date.setSeconds(59);
			}
			else
			{
				date.setHours(0);
				date.setMinutes(0);
				date.setSeconds(0);
			}

		timestamp=date.getTime();
	}

	return timestamp;
}

function updateDateControl(control)
{
        if(control.val()!="")
        {
                var instance=M.Datepicker.getInstance(control);
                instance.setDate(moment(control.val(), datepickerArgs.format.toUpperCase()).toDate());
                instance.setInputValue();
        }
}

function updateTimeControl(control)
{
	if(control.val()!="")
	{
		if(control.prop("disabled"))
			control.prop("disabled", false);

		var instance=M.Timepicker.getInstance(control);
		instance.time=control.val();
		instance._updateTimeFromInput();
	}
}

function addSelectAll(selectControl)
{
		selectControl.siblings("ul").prepend("<li id=selectAllLi><span>إزالة التحديد</span></li>");
		selectControl.siblings("ul").find("li#selectAllLi").on("click", function()
		{
			var isSelectAll=$(this).find("span").text()=="تحديد الكل";
			if(isSelectAll)
				$(this).find("span").text("إزالة التحديد");
			else
				$(this).find("span").text("تحديد الكل");

			$(this).siblings("li").filter(function()
			{
				return $(this).find("input").prop("checked") != isSelectAll;
			}).click();
		});
}
