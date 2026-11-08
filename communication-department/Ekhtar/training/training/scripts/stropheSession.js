$(document).ready(function()
{
	StropheSession.initialize();
});

var StropheSession=
{
	initialize: function()
	{
		var name='';
		var tone='';
		var messages=[];

		SessionAccess.getSessionUser(function(user)
		{
			jid=StropheAccess.getJid(user);
			SessionAccess.getSessionTone(function(tone)
			{

				setTimeout(function(){StropheSession.process(Strophe.Status.CONNECTING)}, 1500);
				setTimeout(function(){StropheSession.process(Strophe.Status.CONNECTED)}, 4000);
			});
		});
	},

	process: function(status)
	{
		console.log("pr: ", status);
		if (status == Strophe.Status.CONNECTING)
		{
			$(document).trigger('connecting');
		}
		else if (status == Strophe.Status.AUTHFAIL || status == Strophe.Status.DISCONNECTED)
		{
			$(document).trigger('disconnected');
		}
		else if (status == Strophe.Status.CONNECTED || status == Strophe.Status.ATTACHED)
		{
			$(document).trigger('connected');
			StropheAccess.connection.sendIQ($pres().c('priority').t('50').up().c('c',{xmlns: 'http://jabber.org/protocol/caps', node:'http://psi-im.org/caps', ver: 'caps-b75d8d2b25', ext: 'ca cs ep-notify-2 htm'}));

			StropheAccess.connection.addHandler(function(stanza)
			{
				//console.log('stanza has been received:', stanza);

				var stanzaFrom=Strophe.getBareJidFromJid($(stanza).attr('from'));

				if($(stanza).is("message"))
				{
					var messageBody=$(stanza).find('body').text();

					if(messageBody=="" || messages.indexOf(messageBody)==-1)
					{
						if(messageBody!="")
							messages.push(messageBody);

						if($(stanza).attr("type")=="error")
						{
							//error message stanza
						}
						else
						{
							if((stanzaFrom==StropheAccess.XMPP_SERVER ||
							   stanzaFrom==StropheAccess.getJid("ehq")) &&
							   /\d+@\w+\.\w+/.test())
							{
								//console.log("New user has been registerd: ", messageBody);
							}
							else if(messageBody.startsWith("<privilege"))
							{
								//console.log("checking privilege...");
							
								SessionAccess.getSessionUser(function(user)
								{
									SessionAccess.getSessionTone(function(tone)
									{
										DataAccess.dbConnect(user, tone, function(result)
										{
										//	if(result=null || result.trim()!="1")
										//		window.location.replace("login.html");
										});
									});
								});
							}
							else if(messageBody.startsWith("<roster>"))
							{
								StropheSession._addRosterMessage(messageBody.substring(8), stanzaFrom);
							}
							else if($(stanza).has("received").length>0)
							{
//console.log("set command read:");
								var commandId=$(stanza).find("received").attr("id");
								var date;
								if($(stanza).has("delay").length>0)
									date=new Date($(stanza).find("delay").attr("stamp"));
								else
									date=new Date();

//console.log(commandId, stanzaFrom);
								InterfaceAccess.setCommandRead(commandId, Strophe.getNodeFromJid(stanzaFrom), date.getTime(), function(resultCommandId)
								{
									$(document).trigger("commandRead", [resultCommandId, stanzaFrom, new Date().getTime()]);	
									//console.log("Set Command Read: ", resultCommandId, " from:", stanzaFrom);
								});
							}
							else
							{
								try
								{
									var messageObject=JSON.parse(messageBody);
									//console.log("received: ",messageObject.id, messageObject.publisher, messageObject.es, messageObject.text, messageObject.timestamp, messageObject.rcvTimestamp, messageObject.commandId, messageObject.importance, messageObject.location, messageObject.cell, messageObject.provider, messageObject.keywords, messageObject.attachments);
									$(document).trigger("messageReceived", [messageObject.id, messageObject.publisher, messageObject.es, messageObject.text, messageObject.timestamp, messageObject.rcvTimestamp, messageObject.commandId, messageObject.importance, messageObject.location, messageObject.cell, messageObject.provider, messageObject.keywords, messageObject.attachments]);
								}
								catch(ex)
								{
									//console.log("message json parsin error: ", messageBody ,ex);
								}
							}
						}
					}
					else
					{
						//console.log("Strphe Session: Message has been ignored!", messages);
					}

				}
				else if($(stanza).is("iq"))
				{
					if($(stanza).has("query").length>0 && $(stanza).find("query").attr("xmlns")=="jabber:iq:roster")
					{
						var rosterJid=$(stanza).find("item").attr("jid");
						var rosterName=$(stanza).find("item").attr("name");
						var rosterGroup=$(stanza).find("group").text();
						var rosterSubscription=$(stanza).find("item").attr("subscription");
						if(rosterName!=null || rosterGroup!="" || rosterSubscription!=null)
						{
							var isRemoved=rosterSubscription=="remove";
							var isAvailable=rosterSubscription=="to";

							if(!isRemoved)
								SetManager.updateUser(rosterJid, rosterName, rosterGroup, isAvailable);
							else
								SetManager.removeUser(rosterJid);

							$(document).trigger("rosterUpdated", [rosterJid, rosterName, rosterGroup, isAvailable, isRemoved]);

						}
					}
				}
				else if($(stanza).is("presence"))
				{
					if(Strophe.getBareJidFromJid($(stanza).attr("from"))!=Strophe.getBareJidFromJid($(stanza).attr("to")))	
						$(document).trigger("presenceReceived", [$(stanza).attr("from"), $(stanza).attr("type")]);
				}

				return true;
			});
		}
	},

	_rosterMessages: [],
	_processRosterRunning: false,

	_addRosterMessage: function(message, stanzaFrom)
	{

		StropheSession._rosterMessages.push({message: message, from: stanzaFrom});
//console.log("messageing: ", StropheSession._rosterMessages, StropheSession._rosterMessages.length, StropheSession._processRosterRunning);
		if(!StropheSession._processRosterRunning)
			StropheSession._processRosterMessage();
	},

	_processRosterMessage: function()
	{	
		StropheSession._processRosterRunning=true;
		if(StropheSession._rosterMessages.length==0)
		{
			StropheSession._processRosterRunning=false;
			//console.log("end...");
			return;
		}

		var object=StropheSession._rosterMessages.shift();
		//console.log("processing object: ", object);
		var message=object.message;
		var stanzaFrom=object.from;

		var rosterObj=JSON.parse(message);
		if(rosterObj.command==null)
		{
			//console.log("---processing add user...");
			SetManager.updateUser(rosterObj.jid, rosterObj.name, Strophe.getNodeFromJid(stanzaFrom), false);
			StropheAccess.saveRosterItem(rosterObj.jid, rosterObj.name, Strophe.getNodeFromJid(stanzaFrom), function(rosterResult)
			{
				//console.log("roster request has been saved from ", stanzaFrom, " with id: ", rosterObj.jid, ", name: ", rosterObj.name, " and avilability: ", rosterObj.available);
				if(!rosterObj.available)
					StropheAccess.presenceSubscribe(rosterObj.jid);
				//console.log("---end processing add user...");
				StropheSession._processRosterMessage();
			});
		}
		else if(rosterObj.command=="delete")
		{
			//console.log("---processing block user...");
			InterfaceAccess.countReportsByUsers(Strophe.getNodeFromJid(rosterObj.jid), "0", function(reportCount)
			{	
				if(reportCount!="0")
				{
					SetManager.updateUser(rosterObj.jid, rosterObj.name, SetManager.DELETED_SET_ID, null);
					StropheAccess.saveRosterItem(rosterObj.jid, rosterObj.name, SetManager.DELETED_SET_ID, function()
					{
						StropheAccess.presenceUnsubscribed(rosterObj.jid);
						//console.log("---end process block user", rosterObj.jid);
						StropheSession._processRosterMessage();
					});
				}
				else
				{
					SetManager.removeUser(rosterObj.jid);
					StropheAccess.deleteRosterItem(rosterObj.jid, function()
					{
						//console.log("ehq jid deleted completely: ", rosterObj.jid);
						StropheSession._processRosterMessage();
					});
				}
			});
		}
	}
};
