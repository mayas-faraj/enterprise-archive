$(document).ready(function()
{
	Master.getMainContent(function(content)
	{
		$('body').after(content);
	});
});
