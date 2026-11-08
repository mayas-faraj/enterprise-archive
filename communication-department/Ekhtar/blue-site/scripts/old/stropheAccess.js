var StropheAccess = 
{
	XMPP_SERVER:  'ekhtar.sy',
	connection: new Strophe.Connection('http://192.168.90.1:5280/http-bind'),
	
	connected: function(callback)
	{
		$(document).bind('connected',callback);
	},
	
	getJid: function(local)
	{
		if(local.indexOf('@')==-1)
			return local+'@'+StropheAccess.XMPP_SERVER;
		else
			return local;
	},

	createNode: function(node, title, jid, callback)
	{
		//create node
		var iq = new Strophe.Builder('iq',{
                        from: StropheAccess.connection.jid,
                        to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
                        id: 'create_node',
                        type: 'set'
                        }).c('pubsub',{
                        xmlns: 'http://jabber.org/protocol/pubsub'
                        }).c('create',{
                        node: node
                        }).up().c('configure').c('x',{
			xmlns: 'jabber:x:data',
			type: 'submit'
			}).c('field',{
			'var': 'FORM_TYPE',
			type: 'hidden'
			}).c('value').t('http://jabber.org/protocol/pubsub#node_config')
			.up().up().c('field', {'var': 'pubsub#title'}).c('value').t(title)
			.up().up().c('field', {'var': 'pubsub#deliver_notifications'}).c('value').t(1)
			.up().up().c('field', {'var': 'pubsub#deliver_payloads'}).c('value').t(1)
			.up().up().c('field', {'var': 'pubsub#persist_items'}).c('value').t(0)
			.up().up().c('field', {'var': 'pubsub#access_model'}).c('value').t('whitelist')
			.up().up().c('field', {'var': 'pubsub#publish_model'}).c('value').t('publishers')
			.up().up().c('field', {'var': 'pubsub#purge_offline'}).c('value').t(0)
			.up().up().c('field', {'var': 'pubsub#send_last_published_item'}).c('value').t('never')
			.up().up().c('field', {'var': 'pubsub#presence_based_delivery'}).c('value').t(0)
			.up().up().c('field', {'var': 'pubsub#notification_type'}).c('value').t('normal')
			.up().up().c('field', {'var': 'pubsub#notify_config'}).c('value').t(0)
			.up().up().c('field', {'var': 'pubsub#notify_delete'}).c('value').t(0)
			.up().up().c('field', {'var': 'pubsub#notify_retract'}).c('value').t(0)
			.up().up().c('field', {'var': 'pubsub#notify_sub'}).c('value').t(0)
			.up().up().c('field', {'var': 'pubsub#max_payload_size'}).c('value').t(2048)
			.up().up().c('field', {'var': 'pubsub#type'}).c('value').t('http://www.w3.org/2005/Atom')
			.up().up().c('field', {'var': 'pubsub#body_xslt'}).c('value').t('http://jabxslt.jabberstudio.org/atom_body.xslt');
		
			StropheAccess.connection.sendIQ(iq, function()
			{
				//create user
				iq = new Strophe.Builder('iq',{
				from: StropheAccess.connection.jid,
				to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
				id: 'affiliation_owner',
				type: 'set'
				}).c('pubsub',{
				xmlns: 'http://jabber.org/protocol/pubsub#owner',
				}).c('affiliations',{
				node: node
				}).c('affiliation',{
				jid: jid,
				affiliation: 'owner'
				});

				StropheAccess.connection.sendIQ(iq, callback, callback);

				//edp affiliations
				iq = new Strophe.Builder('iq',{
					from: StropheAccess.connection.jid,
					to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
					id: 'affiliation_member',
					type: 'set'
					}).c('pubsub',{
					xmlns: 'http://jabber.org/protocol/pubsub#owner',
					}).c('affiliations',{
					node: node
					}).c('affiliation',{
					jid: StropheAccess.getJid('edp'),
					affiliation: 'member'
					});

				StropheAccess.connection.sendIQ(iq);
				
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
					id: 'creating_node'
					}).c('entry',{
					xmlns: 'http://www.w3.org/2005/Atom'
					}).c('title').t(node);

				StropheAccess.connection.sendIQ(iq);
			});
	},

	getUsers: function(node, callback)
	{
		var iq = new Strophe.Builder('iq',{
		from: StropheAccess.connection.jid,
		to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
		id: 'users'+StropheAccess.connection.getUniqueId(),
		type: 'get'
		}).c('pubsub',{
		xmlns: 'http://jabber.org/protocol/pubsub#owner',
		}).c('affiliations',{
		node: node
		});

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	getNodes: function(callback)
	{
		var iq = new Strophe.Builder('iq',{
		from: StropheAccess.connection.jid,
		to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
		id: 'nodes',
		type: 'get'
		}).c('pubsub',{
		xmlns: 'http://jabber.org/protocol/pubsub',
		}).c('affiliations',{
		});

		StropheAccess.connection.sendIQ(iq, callback, callback);	
	},

	saveUserVcard: function(firstName, lastName, callback)
	{
		 iq = new Strophe.Builder('iq',{
				id: 'save-vcard',
				type: 'set'
				}).c('vCard',{
				xmlns: 'vcard-temp'
				}).c('FN').t(firstName+' '+lastName).up().c('N').c('FAMILY').t(lastName).up().c('GIVEN').t(firstName);
		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	getUserVcard: function(jid, callback)
	{
		var iq = new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: jid,
			id: 'vcard'+StropheAccess.connection.getUniqueId(),
			type: 'get'
			}).c('vCard',{
			xmlns: 'vcard-temp'
			});

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	registerUser: function(node, jid, callback)
	{
		 var iq = new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
			id: 'affiliation_publish',
			type: 'set'
			}).c('pubsub',{
			xmlns: 'http://jabber.org/protocol/pubsub#owner',
			}).c('affiliations',{
			node: node
			}).c('affiliation',{
			jid: jid,
			affiliation: 'publisher'
			});

		StropheAccess.connection.sendIQ(iq, callback, callback);

		iq = new Strophe.Builder('presence',{
				from: StropheAccess.connection.jid,
				to: jid,
				type: 'subscribe',
				});

		StropheAccess.connection.sendIQ(iq);
	},

	unRegisterUser: function(node, jid, callback)
	{
		var iq = new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
			id: 'affiliation_remove',
			type: 'set'
			}).c('pubsub',{
			xmlns: 'http://jabber.org/protocol/pubsub#owner',
			}).c('affiliations',{
			node: node
			}).c('affiliation',{
			jid: jid,
			affiliation: 'none'
			});

		StropheAccess.connection.sendIQ(iq, callback, callback);
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

	searchJid: function(jid, callback)
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
		}).c('value').t(jid);

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
		var iq=new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			id: 'change-tone',
			type: 'set'
			}).c('query',{
			xmlns: 'jabber:iq:register',
			})
			.c('username').t(Strophe.getNodeFromJid(StropheAccess.connection.jid)).up()
			.c('password').t(tone);

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	subscribeUser: function(jid, node, callback)
	{
		var iq = new Strophe.Builder('iq',{
			from: StropheAccess.connection.jid,
			to: Strophe.getDomainFromJid(StropheAccess.connection.jid),
			id: 'subscribe',
			type: 'set'
			}).c('pubsub',{
			xmlns: 'http://jabber.org/protocol/pubsub'
			}).c('subscribe',{
			node: node,
			jid: jid});

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	sendMessage: function(id, users, data, callback)
	{
		if (data == '') return;

    		var message = new Strophe.Builder('message', {
			from: StropheAccess.connection.jid,
			to: 'multicast.'+Strophe.getDomainFromJid(StropheAccess.connection.jid),
			type: 'chat',
			id:StropheAccess.connection.getUniqueId() 
		}).cnode(Strophe.xmlElement("addresses", {xmlns: 'http://jabber.org/protocol/address'}));

		for (i = 0; i < users.length; i++)
		{
      			message.c("address", {type: 'to', jid: StropheAccess.getJid(users[i])});
			message.up();
		}
		message.up().cnode(Strophe.xmlElement("body", {}, data)).up().c('thread').t('e4d7a1c'+(new Date()).getTime());
		StropheAccess.connection.send(message.tree());
	},

	publish: function(id, node, data, callback)
	{
		if(data == '') return;

		 var iq = new Strophe.Builder('iq',
			{
				from: StropheAccess.connection.jid,
				to: 'pubsub.' + Strophe.getDomainFromJid(StropheAccess.connection.jid),
				id: 'publish',
				type: 'set'
			}).c('pubsub',
			{
				xmlns: 'http://jabber.org/protocol/pubsub'
			}).c('publish',
			{
			node: node,
			}).c('item',
			{
				id: 'f4a7b5'+(new Date()).getTime() 
			}).c('entry',
			{
				xmlns: 'http://www.w3.org/2005/Atom'
			}).c('summary').t([data]);

		StropheAccess.connection.sendIQ(iq, callback, callback, callback, 10000);
	},

	presenceUnsubscribed: function(jid, callback)
	{
		var iq=new Strophe.Builder('presence', {
			to: jid,
			type: 'unsubscribed'
		});

		StropheAccess.connection.sendIQ(iq, callback, callback);
	},

	presenceSubscribe: function(jid, callback)
	{
		var iq=new Strophe.Builder('presence', {
			to: jid,
			type: 'subscribe'
		});

		StropheAccess.connection.sendIQ(iq, callback, callback);
	}
};
