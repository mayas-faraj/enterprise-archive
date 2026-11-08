$(document).ready(function()
{
	$('#uploadButton').change(function()
	{
		$('#uploadText').val($('#uploadButton').val());
	});

	$('#sendUpdateButton').click(function()
	{
		StropheAccess.publish((new Date()).getTime(), 'ema-support', 'http://www.imei.sy/dist/ekhtar/stable/Ekhtar_1.5.apk;1.5;<update>', function(result)
		{
			console.log('done', result);
			$('#resultLabel').html(result);
		});
	});
});
