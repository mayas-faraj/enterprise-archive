var GeoCooder=
{
	getName: function(longitude, latitude)
	{
		if(longitude==0 || latitude==0 || longitude==null || latitude==null) return null;
		var norm=0, x=0, y=0, minNorm=100, minIndex=0;
		for(var name in GeoCooder.locations)
		{
			x=GeoCooder.locations[name][0]-longitude;
			y=GeoCooder.locations[name][1]-latitude;
			norm=x*x+y*y;

			if(norm<minNorm)
			{
				minNorm=norm;
				minIndex=name;
			}
		}

		return minIndex;
	},

	locations:
	{
		damascus: [33.509086, 36.284302],
		aleepo: [36.201454, 37.131642],
		homs: [34.726088, 36.718231],
		latakia: [35.542282, 35.792080],
		tartous: [34.896334, 35.891522],
		swidaa: [32.714722, 36.566717],
		daraa: [32.623195, 36.106300],
		qunaitera: [33.004156, 35.759118],
		hama: [35.139434, 36.751240],
		idlib: [35.923049, 36.638581],
		raqqa: [35.958096, 39.002502],
		derzor: [35.331115, 40.148009],
		hasaka: [36.504149, 40.750194]
	}
};
