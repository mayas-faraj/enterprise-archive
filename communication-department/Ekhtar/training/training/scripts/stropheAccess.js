var StropheAccess = 
{
	XMPP_SERVER:  "ekhtar.sy",
	connection: new Strophe.Connection("http://192.168.90.1:5280/bosh"),
	
	connected: function(callback)
	{
		$(document).bind("connected", callback);
	},

	connecting: function(callback)
	{
		$(document).bind("connecting", callback);
	},

	disconnected: function(callback)
	{
		$(document).bind("disconnected", callback);
	},

	messageReceived: function(callback)
	{
		$(document).bind("messageReceived", callback);
	},

	commandRead: function(callback)
	{
		$(document).bind("commandRead", callback);
	},
	
	presenceReceived: function(callback)
	{
		$(document).bind("presenceReceived", callback);
	},

	rosterUpdated: function(callback)
	{
		$(document).bind("rosterUpdated", callback);
	},
	
	getJid: function(local)
	{
		//if(local.indexOf('@')==-1)
		//	return local+'@'+StropheAccess.XMPP_SERVER;
		//else
			return local;
	},

	createNode: function(node, title, jid, callback)
	{
		callback();
	},

	getUsers: function(node, callback)
	{
		callback($('<iq xmlns="jabber:client" xml:lang="en" to="es-force@ekhtar.sy/35681023522539487566530" from="pubsub.ekhtar.sy" type="result" id="usersf11b61c2-555c-4208-b2ca-48b5c09c6ecc"><pubsub xmlns="http://jabber.org/protocol/pubsub#owner"><affiliations node="es-force"><affiliation affiliation="publisher" jid="932423849@ekhtar.sy"/><affiliation affiliation="publisher" jid="934832429@ekhtar.sy"/><affiliation affiliation="publisher" jid="934983292@ekhtar.sy"/><affiliation affiliation="publisher" jid="944243824@ekhtar.sy"/><affiliation affiliation="publisher" jid="944450238@ekhtar.sy"/><affiliation affiliation="member" jid="edp@ekhtar.sy"/><affiliation affiliation="owner" jid="ehq@ekhtar.sy"/><affiliation affiliation="owner" jid="es-force@ekhtar.sy"/></affiliations></pubsub></iq>'));
	},

	getNodes: function(callback)
	{
		callback();
	},

	saveRosterItem: function(jid, name, groupId, callback)
	{
		callback();
	},

	deleteRosterItem: function(jid, callback)
	{
		callback();
	},

	getRosterItems: function(callback)
	{
		callback();
	},


	saveUserVcard: function(firstName, lastName, callback)
	{
		callback();
	},

	getUserVcard: function(jid, callback)
	{
	},

	getUserNodeVcard: function(jid, node, callback)
	{
	},

	registerUser: function(node, jid, callback)
	{
	},

	unRegisterUser: function(node, jid, callback)
	{
	},

	purgeNode: function(node, callback)
	{
	},

	deleteNode: function(node, callback)
	{
		var iq = new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
			id: 'delete_node',
			type: 'set'
			}).c('pubsub',{
			xmlns: 'http://jabber.org/protocol/pubsub#owner',
			}).c('delete',{
			node: node
			});

		StropheAccess.connection.sendIQ(iq, function()
		{
			//publish update
			iq = new Strophe.Builder('iq',{
				from: StropheAccess.connection.jid,
				to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
				id: 'publish_update',
				type: 'set'
				}).c('pubsub',{
				xmlns: 'http://jabber.org/protocol/pubsub',
				}).c('publish',{
				node: 'es_updates'
				}).c('item',{
				id: 'delte_node'
				}).c('entry',{
				xmlns: 'http://www.w3.org/2005/Atom'
				}).c('title').t(node);	
		
			StropheAccess.connection.sendIQ(iq, callback, callback);
		}, callback);	
	},

	createUser: function(jid, firstName, lastName, tone, callback)
	{
		var iq = new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: Strophe.getDomainFromJid(StropheAccess.connection.jid),
			id:'add-user',
			type: 'set'
			}).c('command',{
			xmlns: 'http://jabber.org/protocol/commands',
			node: 'http://jabber.org/protocol/admin#add-user'
			}).c('x',{
			xmlns:'jabber:x:data',
			type: 'submit'
			}).c('field',{
			type: 'hidden',
			'var': 'FORM_TYPE'
			}).c('value').t('http://jabber.org/protocol/admin').up().up()
			.c('field',{'var': 'accountjid'}).c('value').t(jid).up().up()
			.c('field',{'var': 'password'}).c('value').t(tone).up().up()
			.c('field',{'var': 'password-verify'}).c('value').t(tone).up().up()
			.c('field',{'var': 'given_name'}).c('value').t(firstName).up().up()
			.c('field',{'var': 'surname'}).c('value').t(lastName);

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	deleteUser: function(jid, callback)
	{
		var iq = new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: Strophe.getDomainFromJid(StropheAccess.connection.jid),
			id: 'delete-user',
			type: 'set'
			}).c('command',{
			xmlns: 'http://jabber.org/protocol/commands',
			node: 'http://jabber.org/protocol/admin#delete-user'
			}).c('x',{
			xmlns: 'jabber:x:data',
			type: 'submit'
			}).c('field',{
			type: 'hidden',
			'var': 'FORM_TYPE'
			}).c('value').t('http://jabber.org/protocol/admin').up().up()
			.c('field', {'var': 'accountjids'}).c('value').t(jid);

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	disableUser: function(jid, callback)
	{
		var iq=new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: Strophe.getDomainFromJid(StropheAccess.connection.jid),
			id: 'disable-user',
			type: 'set'
			}).c('command',{
			xmlns: 'http://jabber.org/protocol/commands',
			node: 'http://jabber.org/protocol/admin#disable-user'
			}).c('x',{
			xmlns: 'jabber:x:data',
			type: 'submit'
			}).c('field',{
			type: 'hidden',
			'var': 'FORM_TYPE'
			}).c('value').t('http://jabber.org/protocol/admin').up().up()
			.c('field', {'var': 'accountjids'}).c('value').t(jid);
			
		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	enableUser: function(jid, callback)
	{
		var iq=new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: Strophe.getDomainFromJid(StropheAccess.connection.jid),
			id: 'reenable-user',
			type: 'set'
			}).c('command',{
			xmlns: 'http://jabber.org/protocol/commands',
			node: 'http://jabber.org/protocol/admin#reenable-user'
			}).c('x',{
			xmlns: 'jabber:x:data',
			type: 'submit'
			}).c('field',{
			type: 'hidden',
			'var': 'FORM_TYPE'
			}).c('value').t('http://jabber.org/protocol/admin').up().up()
			.c('field', {'var': 'accountjids'}).c('value').t(jid);

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	searchName: function(name, node, callback)
	{
		var iq=new Strophe.Builder('iq',
		{
			type: "set",
			to: "vjud.ekhtar.sy",
			id: StropheAccess.connection.getUniqueId()
		}).c('query',
		{
			xmlns: "jabber:iq:search",
		}).c('x',
		{
			xmlns:"jabber:x:data",
			type: "submit"
		}).c('field',
		{
			type: "text-single",
			"var": "user"
		}).c('value').t(name)
		.up().up().c('field',
		{
			type: "text-single",
			"var": "orgname"
		}).c('value').t(node);

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	searchFirst: function(first, node, callback)
	{
		var iq=new Strophe.Builder('iq',
		{
			type: "set",
			to: "vjud.ekhtar.sy",
			id: StropheAccess.connection.getUniqueId()
		}).c('query',
		{
			xmlns: "jabber:iq:search",
		}).c('x',
		{
			xmlns:"jabber:x:data",
			type: "submit"
		}).c('field',
		{
			type: "text-single",
			"var": "first"
		}).c('value').t(first)
		.up().up().c('field',
		{
			type: "text-single",
			"var": "orgname"
		}).c('value').t(node);

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	searchLast: function(last, node, callback)
	{
		var iq=new Strophe.Builder('iq',
		{
			type: "set",
			to: "vjud.ekhtar.sy",
			id: StropheAccess.connection.getUniqueId()
		}).c('query',
		{
			xmlns: "jabber:iq:search",
		}).c('x',
		{
			xmlns:"jabber:x:data",
			type: "submit"
		}).c('field',
		{
			type: "text-single",
			"var": "last"
		}).c('value').t(last)
		.up().up().c('field',
		{
			type: "text-single",
			"var": "orgname"
		}).c('value').t(node);
		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	searchLocality: function(locality, node, callback)
	{
		var iq=new Strophe.Builder('iq',
		{
			type: "set",
			to: "vjud.ekhtar.sy",
			id: StropheAccess.connection.getUniqueId()
		}).c('query',
		{
			xmlns: "jabber:iq:search",
		}).c('x',
		{
			xmlns:"jabber:x:data",
			type: "submit"
		}).c('field',
		{
			type: "text-single",
			"var": "locality"
		}).c('value').t(locality)
		.up().up().c('field',
		{
			type: "text-single",
			"var": "orgname"
		}).c('value').t(node);
		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	getLastActivity: function(jid, callback)
	{
		var iq=new Strophe.Builder('iq',
			{
				type: "get",
				from: StropheAccess.connection.jid,
				to: jid,
				id: "activity-"+Strophe.getNodeFromJid(jid)
			}).c('query',
			{
				xmlns: 'jabber:iq:last'
			});
				
		StropheAccess.connection.sendIQ(iq, callback, callback);
	},
	

	getOnlineUsers: function(callback)
	{
		var iq=new Strophe.Builder('iq',
			{
				type: "get",
				from: StropheAccess.connection.jid,
				to: Strophe.getDomainFromJid(StropheAccess.connection.jid),
				id: "online-users"
			}).c('query',
			{
				xmlns: 'http://jabber.org/protocol/disco#items',
				node: 'online users'	
			});
				
		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	changeTone: function(tone, callback)
	{
	},

	subscribeUser: function(jid, node, callback)
	{
	},

	getMessages: function(callback)
	{
	},

	sendMessage: function(id, userArray, data, callback)
	{
	},

	publish: function(id, node, data, callback)
	{
	},

	presenceUnsubscribed: function(jid)
	{
	},

	presenceSubscribe: function(jid)
	{
	}
};
