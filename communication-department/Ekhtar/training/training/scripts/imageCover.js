$(document).ready(function()
{
	$('body').css("backgroundImage","url("+getRandomImage()+")");
});

function getRandomImage() 
{
	var imgs=['syria1.jpg','syria2.jpg','syria3.jpg','syria4.jpg','syria5.jpg','syria6.jpg'];
	return 'imgs/cover/' + imgs[Math.floor(Math.random()*imgs.length)];
}
