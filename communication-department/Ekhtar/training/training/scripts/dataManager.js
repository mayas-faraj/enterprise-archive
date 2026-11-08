var DataManager = 
{
	cache: {},
	conditionFunction: null,
	requestFunction: null,
	activeFunction: null,
	deactiveFunction: null,
	isActiveFunction: null,
	dataSplitFunction: null,
	dataConvertFunction: null,

	addRequest: function(keys, callback)
	{
		var requestKeys=[];
		console.log('requst', keys);
		for(var i=0; i<keys.length; i++)
		{
			if(DataManager.cache[keys[i]]!=null)
			{
				if(DataManager.conditionFunction(DataManager.cache[keys[i]]))
					DataManager.activeFunction(DataManager.cache[keys[i]]);
			}
			else
				requestKeys.push(keys[i]);
		}
		console.log('from db', requestKeys);
		DataManager.requestFunction(requestKeys, function(responseText)
		{
			console.log(responseText);
			if(responseText=='There are no privileges!')
				window.location.replace('nonePrivileges.html');

			var resultArray=DataManager.dataSplitFunction(responseText);
			var result=null;

			for(var key in resultArray)
			{
				result=DataManager.dataConvertFunction(resultArray[key]);
				if(result!=null)
				{
					DataManager.cache[result.key]=result.value;

					if(DataManager.conditionFunction(DataManager.cache[result.key]))
						DataManager.activeFunction(DataManager.cache[result.key]);
				}
				else
					console.log('null result', resultArray[key]);
			}

			callback(requestKeys);
		});
	},

	removeRequest: function(keys, callback)
	{
		for(var i=0; i<keys.length; i++)
		{
			if(DataManager.cache[keys[i]]!=null)
				DataManager.deactiveFunction(DataManager.cache[keys[i]]);
		}

		callback();
	},

	syncRequest: function(keys, callback)
	{
		for(var key in DataManager.cache)
			if(DataManager.isActiveFunction(DataManager.cache[key]) && keys.indexOf(key)==-1)
				DataManager.deactiveFunction(DataManager.cache[key]);

		DataManager.addRequest(keys, callback);
	},

	updateRequest: function(callback)
	{
		for(var key in DataManager.cache)
			if(DataManager.conditionFunction(DataManager.cache[key]))
				DataManager.activeFunction(DataManager.cache[key]);
			else
				DataManager.deactiveFunction(DataManager.cache[key]);
		callback();
	}
};
