var SetManager = 
{
	SET_KEY: "set",
	SET_INFO_KEY: "setInfo",
	DELETED_SET_ID: -1,
	GENERAL_GROUP_ID: 0,

	initialize: function(callback)
	{
		var setInfo={};
		setInfo["type"]="مجموعة";
		setInfo["types"]="مجموعات";
		setInfo["theType"]="المجموعة";
		setInfo["theTypes"]="المجموعات";

		localStorage.setItem(SetManager.SET_INFO_KEY, JSON.stringify(setInfo));
		localStorage.setItem(SetManager.SET_KEY, '{"0":{"name":"مجموعة عامة","color":"#000","logo":"imgs/admin.png","description":"مجموعة تجوي الامستخدمين الذين لم يتم إضافتهم إلى أي مجموعة.","users":[]},"76":{"name":"وحدات الاستطلاع","color":"#AA0","logo":"imgs/group/recon-unit.jpg","description":"قوات مجهزة بتجهيزات استطلاع","date":1558121408000,"users":[{"jid":"944100200@ekhtar.sy","name":"علي حيدر","available":false},{"jid":"944893832@ekhtar.sy","name":"سامر ميهوب","available":false}]},"77":{"name":"قوات الاستطلاع","color":"#A00","logo":"imgs/group/recon-force.jpg","description":"العناصر المسلحة في الخطوط المتقدمة","date":1558121447000,"users":[{"jid":"933349823@ekhtar.sy","name":"سعيد الناشف","available":false},{"jid":"944200300@ekhtar.sy","name":"علاء الهادي","available":false},{"jid":"944545869@ekhtar.sy","name":"رامز العدوي","available":false}]},"78":{"name":"مهندسي المعلوماتية","color":"#00A","logo":"imgs/group/recon-engineer.jpg","description":"مهام جمع المعلومات عبر الانترنت والاختراق","date":1558121503000,"users":[{"jid":"933483948@ekhtar.sy","name":"سمير الخالد","available":false},{"jid":"944506398@ekhtar.sy","name":"هادي الحسن","available":false}]},"-1":{"name":"العناصر المحجوبة","color":"#000","logo":"imgs/user-blocked.png","description":"العناصر التي تم حجبها.","users":[]}}');
		callback();
	},

	getUsers: function()
	{
		var setObject=SetManager.getSet();
		var users={};

		if(setObject!=null)
		{
			var setKeys=Object.keys(setObject);

			for(var i=0; i<setKeys.length; i++)
			{
				var setItem=setObject[setKeys[i]];

				if(setItem.users!=null)
				{
					var userList=setItem.users;
					for(var j=0; j<userList.length; j++)
					{
						var user=userList[j];
						users[user.jid]=
						{
							name:user.name,
							available: user.available,
							setId: setKeys[i],
							setName: setItem.name,
							setColor: setItem.color,
							setLogo: setItem.logo
						};
					}
				}
			}

			return users;
		}
		else
			return null;


	},

	getEmptyUser: function()
	{
		return  {
				name: null,
				available: null,
				setId: SetManager.DELETED_SET_ID,
				setName: "غير معروف",
				setColor: "#000",
				setLogo: "imgs/admin.png"
			};
	},

	getSet: function()
	{
		var result=localStorage.getItem(SetManager.SET_KEY);

		if(result==null)
		{
			SetManager.initialize();
		}

		return JSON.parse(localStorage.getItem(SetManager.SET_KEY));
	},

	setSet: function(set)
	{
		localStorage.setItem(SetManager.SET_KEY, JSON.stringify(set));
	},	

	getSetInfo: function()
	{
		return JSON.parse(localStorage.getItem(SetManager.SET_INFO_KEY));
	},

	updateUser: function(jid, name, setId, available)
	{
		var set=SetManager.getSet();
		
		if(setId==null || setId=="" || set[setId]==null)
			if(set[SetManager.GENERAL_GROUP_ID]==null)
				setId=SetManager.DELETED_SET_ID;
			else
				setId=SetManager.GENERAL_GROUP_ID;

		//check if user exists
		for(var key in set)
			if(set[key].users!=null)
				for(var i=0; i<set[key].users.length; i++)
					if(set[key].users[i].jid==jid)
					{
						set[key].users[i].name=name;
						set[key].users[i].available=available;
						if(setId!=key)
						{
							set[setId].users.push(set[key].users[i]);
							set[key].users.splice(i, 1);
						}
						SetManager.setSet(set);
						return;
					}

		//add new item
		set[setId].users.push({jid: jid, name: name, available: available});

		SetManager.setSet(set);
	},
	
	addSet: function(id, name, color, logo, description, date)
	{
		var set=SetManager.getSet();

		//check if set exists
		if(set[id]!=null)
		{
			set[id].name=name;
			set[id].color=color;
			set[id].logo=logo;
			set[id].description=description;
			set[id].date=date;
		}
		else
		{
			set[id]=
			{
				name: name,
				color: color,
				logo: logo,
				description: description,
				date: date,
				users: []
			};
		}

		SetManager.setSet(set);
	},

	removeUser: function(jid)
	{
		var set=SetManager.getSet();
		var setKeys=Object.keys(set);

		for(var i=0; i<setKeys.length; i++)
		{
			var users=set[setKeys[i]].users;
			
			if(users!=null)
				for(var j=0; j<users.length; j++)
					if(users[j].jid==jid)
					{
						users.splice(j, 1);
						set[setKeys[i]].users=users;
						SetManager.setSet(set);
						return;
					}
		}
	},

	removeSet: function(id)
	{
		var set=SetManager.getSet();
		delete set[id];
		SetManager.setSet(set);
	}
};
