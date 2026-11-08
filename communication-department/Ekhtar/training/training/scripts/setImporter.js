var SetImporter = 
{
	importRoster: function(progressCallback, finishCallback)
	{
		console.log("start importing...");
		StropheAccess.getNodes(function(nodeResult)
		{
			console.log("getting nodes: ", nodeResult);
			var nodeArray=[];
			var node;
	
			$(nodeResult).find("affiliation").each(function()
			{
				node=$(this).attr("node");

				if(node!="commands" && node!="ema-support" && node!="es_updates")
					nodeArray.push(node);
			});

			for(var i=0; i<nodeArray.length; i++)
			{
				var node=nodeArray[i];

				StropheAccess.getUsers(node, function(userResult)
				{
					console.log("getting users: ", userResult);
					var userNode=$(userResult).find("affiliations").attr("node");
					var userResult=$(userResult).find("affiliation[affiliation=publisher]");
					var userArray=[];

					userResult.each(function()
					{
						userArray.push($(this).attr("jid"));
						console.log("push: ", $(this).attr("jid"));
					});

					if(userArray.length==0)
						finishCallback();
					else
					{
						var j=0;

						function processUser(j)
						{
							if(j<userArray.length)
							{
								StropheAccess.getUserNodeVcard(userArray[j], userNode, function(vcard)
								{
									var vcardId=$(vcard).attr("id");
									var vcardName="";
									
									if($(vcard).find('FN').length>0)
										vcardName=$(vcard).find('FN').html().trim();	

									var vcardNode;

									if(nodeArray.length>1)
										vcardNode=vcardId.substring(0, vcardId.indexOf(':'));
									else
										vcardNode="";

									StropheAccess.saveRosterItem($(vcard).attr("from"), vcardName, vcardNode, function(result)
									{
										var id=$(result).attr("id");
										var rosterId=id.substring(0, id.indexOf("-"));
										var rosterName=id.substring(id.indexOf("-")+1);
										console.log("vcard: ", id, rosterId, rosterName);
										StropheAccess.presenceSubscribe(StropheAccess.getJid(rosterId));
										progressCallback(rosterId, rosterName);

										if((vcardNode==nodeArray[nodeArray.length-1] || nodeArray.length==1) && rosterId==Strophe.getNodeFromJid(userArray[userArray.length-1]))
											finishCallback();
											
										setTimeout(function(){processUser(j+1);}, 100);
									});
								});
							}
							else
								return;
						};

						processUser(0);
					}
				});
			}
		});
	},

	checkRoster: function(callback)
	{
		StropheAccess.getRosterItems(function(roster)
		{
			callback(true);
		});
	}
};
