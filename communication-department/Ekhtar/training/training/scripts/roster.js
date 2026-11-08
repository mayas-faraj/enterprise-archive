var Roster = 
{
	saveToLocalStorage: function(callback)
	{
		DataAccess.loadGroups(function(groups)
		{	
			groupsObj={};
			if(groups.trim()!="null")
			{
				var groupArray=groups.split("<br />");

				for(var i=0;i<groupArray.length;i++)
					if(groupArray[i].trim()!="")
					{
						groupObj=JSON.parse(groupArray[i]);
						groupsObj[groupObj.group_id]={name: groupObj.name, color: groupObj.color, logo: groupObj.logo};
					}
			}

			StropheAccess.getRosterItems(function(rosters)
			{
				var rosterObject={};
				var jid, name, subscription, group, groupId;

				$(rosters).find('>query>item').each(function()
				{
					groupId=$(this).find(">group:first").text();
					jid=$(this).attr('jid');
					name=$(this).attr("name");
					subscription=$(this).attr("subscription");

					if(name==null)
						name=Strophe.getNodeFromJid(jid);

					rosterObject[jid]= 
					{
						"name": name,
						"available": subscription=="to",
						"groupId": groupId,
					};
				});

				StropheAccess.getNodes(function(nodes)
				{
					var userObject={};
					var nodeCount=$(nodes).find("affiliation").length;
					var nodeIndex=0;

					$(nodes).find("affiliation").each(function()
					{
						var node=$(this).attr('node');
						StropheAccess.getUsers(node, function(users)
						{
							var usersNode=$(users).find('affiliations').attr('node');
							var publishers=$(users).find('affiliation[affiliation=publisher]');
							nodeIndex++;
console.log(nodeIndex, nodeCount);
							publishers.each(function()
							{
								var jid=$(this).attr('jid');
								if(rosterObject[jid]!=null)
								{
									var groupId=rosterObject[jid].groupId;
									if(groupId!="" && groupsObj[groupId]!=null)
										group=groupsObj[groupId];
									else
										group=defaultGroup;

									userObject[jid]=
									{
										name: rosterObject[jid].name,
										available: rosterObject[jid].available,
										groudId: rosterObject[jid].groupId,
										node: node,
										"groupName":group.name,
										"groupColor":group.color,
										"groupLogo":group.logo
									};
								}
								else
									userObject[jid]=
									{
										node: node
									};
							});
							if(nodeIndex==nodeCount)
							{
								//last node processing
								localStorage.setItem("roster", JSON.stringify(userObject));
								callback();
							}
						});
					});	
				});
			});
		});
	}
};

var defaultGroup=
{
	id: -1,
	name: "",
	color: "#ffffff",
	logo: "imgs/admin.png"
	
};
