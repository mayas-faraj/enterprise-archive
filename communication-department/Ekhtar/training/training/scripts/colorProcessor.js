var ColorProcessor=
{
	getDarkColor: function(stringColor)
	{
		var rgbColor=ColorProcessor.getRgbColor(stringColor);
		rgbColor.r=2*rgbColor.r/3;
		rgbColor.g=2*rgbColor.g/3;
		rgbColor.b=2*rgbColor.b/3;

		return ColorProcessor.toStringColor(rgbColor);
	},

	getLightColor: function(stringColor)
	{
		var rgbColor=ColorProcessor.getRgbColor(stringColor);
		rgbColor.r+=210;
		rgbColor.g+=210;
		rgbColor.b+=210;

		if(rgbColor.r>255) rgbColor.r=255;
		if(rgbColor.g>255) rgbColor.g=255;
		if(rgbColor.b>255) rgbColor.b=255;

		return ColorProcessor.toStringColor(rgbColor);
	},

	getRgbColor: function(stringColor)
	{
		if(stringColor[0]=="#")
			stringColor=stringColor.substring(1);
		
		if(stringColor.length==6 || stringColor.length==3)
		{
			var factor=stringColor.length/3;
			var r=parseInt("0x"+stringColor.substring(0, factor));
			var g=parseInt("0x"+stringColor.substring(1*factor, 2*factor));
			var b=parseInt("0x"+stringColor.substring(2*factor, 3*factor));

			if(factor==1)
			{
				r=r+(r*16);
				g=g+(g*16);
				b=b+(b*16);
			}

			return {r:r, g:g, b:b};
		}
		else
			return null;
	},

	toStringColor: function(rgbColor)
	{
		return "rgb("+rgbColor.r+","+rgbColor.g+","+rgbColor.b+")";
	}
};
