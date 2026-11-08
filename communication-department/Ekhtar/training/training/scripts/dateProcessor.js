var DateProcessor=
{
	NOW: "الآن",

	formatDate: function(date)
	{
		function formatNumber(i)
		{
			if(i!=null)
				return (i>9)?""+i:"0"+i
			else
				return null;
		}

		return formatNumber(date.getDate())+'-'+formatNumber(date.getMonth()+1)+'-'+(date.getYear()+1900)+' '+formatNumber(date.getHours())+':'+formatNumber(date.getMinutes())+':'+formatNumber(date.getSeconds());
	},

	extractDate: function(stringDate)
	{
		try
		{
			var date=stringDate.split(' ')[0].split('-');
			var time=stringDate.split(' ')[1].split(':');

			return new Date(date[2],(parseInt(date[1])-1).toString(),date[0],time[0],time[1],time[2]);
		}
		catch(ex)
		{
			console.log(ex);
			return new Date();
		}
	}
};
