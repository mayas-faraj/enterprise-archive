$(document).ready(function()
{
	var imageButton = $('#imageButton');

	imageButton.change(function()
	{
		if(imageButton.prop('files') && imageButton.prop('files')[0])
                {
                        var reader=new FileReader();
                        reader.onload=function(e)
                        {
                                $('#image').attr('src',e.target.result);
                        }
                        reader.readAsDataURL(imageButton.prop('files')[0]);
                }
	});
});

var ImageUpload =
{
	saveImage: function(path, data, callback)
	{
		if(data.substring(0,4)=='data')
		{
			$.ajax(
			{
				url: "php/ImageManager.php",
				type: "POST",
				data: {op: 'saveImage', path: path, data: data},
				success: callback,
				error: function(XMLHttpRequest, textStatus, errorThrown) 
				{ 
					console.log("Status: " + textStatus); alert("Error: " + errorThrown); 
				} 
			});
		}
	},

	deleteImage: function(path, callback)
	{
		$.ajax(
		{
			url: "php/ImageManager.php",
			type: "POST",
			data: {op: 'deleteImage'},
			success: callback,
			error: function(XMLHttpRequest, textStatus, errorThrown)
			{
				console.log("Status: " + textStatus); alert("Error: " + errorThrown);
			}
		});
	}
}
