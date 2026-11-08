var initialOnlineUsers={};
var test={};
var searchingMode=false;
var searchPacketReceived;
var searchLastLength=0;

$(document).ready(function()
{
	//var initialOnlineUsers=[];
	var NOT_REGISTER="المستخدم مضاف إلى جهة إخطار, لكنه لم يقم حتى الآن بالتسجيل على جهازه الخلوي.";
	var containerDiv=$('#containerDiv');
	var usersDiv=containerDiv.find('>.input-collapse');
	var areaDiv=usersDiv.find('>.collapsible-body');
	var iconDiv=areaDiv.find('>.input-icon');

	var nodeArray={};

	var documentWidth=$(document).width();
	var ballonWidth=$('.input-ballon').width();

	areaDiv.html("<img class='status-loading input-loading'/>");

	$(document).on('mouseenter', '.input-collapse-body .input-icon', function(event)
	{
		//check vcard
		var icon=$(this);
		var ballon=$(this).find('>.input-ballon>.input-ballon-info');
		var status=$(this).find('>.input-ballon>.input-ballon-status');
		var button=$(this).find('>.input-ballon>.input-ballon-button');

		if(ballon.text()!=NOT_REGISTER && ballon.find('>label:eq(1)').html().length==0)
		{
			var from=ballon.find('>label:eq(0)').html();
			ballon.addClass('status-loading');
			StropheAccess.getUserVcard(StropheAccess.getJid(from), function(vcard)
			{
				var from=$(vcard).attr('from');
				var fullName=$(vcard).find('FN').text();
				var job=$(vcard).find('Work01').text();
				if(job=="")
					job=$(vcard).find('ORGNAME').text();
				var address=$(vcard).find('City').text();
				if(address=="")
					address=$(vcard).find('LOCALITY').text();

				if(icon.find('>a>div').hasClass('input-icon-online'))
					status.text('متصل').css('color','green');
				else
					status.text('غير متصل');

				if((fullName!='' && fullName!=null) || (job!='' && job!=null))
				{
					ballon.find('>label:eq(1)').html(fullName);	
					ballon.find('>label:eq(2)').html(job);
					ballon.find('>label:eq(3)').html(address);
					button.find('>a').attr('href', 'commands.html?u='+Strophe.getNodeFromJid(from)+';');
				}
				else
				{
					ballon.text(NOT_REGISTER);
					button.find('>a>img').attr('src','imgs/state_info.png');
					button.find('>a').removeAttr('href');
					status.text('');
				}

				ballon.removeClass('status-loading');
			});
		}


		//containerWidth=$('.input-collapse-body').width();
		//containerRight=parseInt($('.input-collapse-body').css('margin-right'));
		//console.log(event.clientX,ballonWidth,documentWidth,containerWidth);
		//if(event.clientX-ballonWidth<documentWidth-(containerWidth+containerRight))
		//	$(this).find('.input-ballon').css('left',ballonWidth+'px');
		//else
		//	$(this).find('.input-ballon').css('left','0px');

		$(this).find('.input-ballon').css('opacity','1').css('visibility','visible');
	});

	$(document).on('mouseenter', '#resultDiv > .input-icon', function(event)
	{
		//console.log((event.clientX));
		if(event.clientX<170)
			 $(this).find('.input-ballon').css('left','180px');
		else	
			 $(this).find('.input-ballon').css('left','55px');

		$(this).find('.input-ballon').css('opacity','1').css('visibility','visible');
	});

	$(document).on('mouseleave', '.input-icon', function()
	{
		$(this).find('.input-ballon').css('opacity','0').css('visibility','hidden');
	});

	//load nodes
	StropheAccess.connected(function()
	{
		StropheAccess.connection.addHandler(function(pres)
		{
			var from=Strophe.getNodeFromJid($(pres).attr('from'));
			var type=$(pres).attr('type');

			if((initialOnlineUsers['icon_'+from]==0 && type==undefined) || (initialOnlineUsers['icon_'+from]==undefined && type!=undefined))
				return true;

			console.log(from, ' changed to online status: ',type==undefined);

			if(type==undefined)
			{
				initialOnlineUsers['icon_'+from]=0;

				if($('#icon_'+from).length==1)
				{
					$('#icon_'+from).find('>a').children().eq(1).removeClass('input-icon-offline').addClass('input-icon-online');
					$('#icon_'+from).find('>.input-ballon>.input-ballon-status').css('color','#1dff02').html('متصل');
				}
			}
			else
			{
				initialOnlineUsers['icon_'+from]=undefined;
				$('#icon_'+from).find('>a').children().eq(1).removeClass('input-icon-online').addClass('input-icon-offline');
				$('#icon_'+from).find('>.input-ballon>.input-ballon-status').css('color','black').html('غير متصل');
			}

			for(var node in nodeArray)
				if(nodeArray[node].users.indexOf(from)>=0)
				{
					var online=$('#'+node+'>.input-collapse-header>.input-collapse-badge>.input-collapse-badge-new');

					if(type==undefined)
					{
						nodeArray[node].online++;
					}
					else
					{
						nodeArray[node].online--;
					}

					if(online.length>0)
						online.text(nodeArray[node].online+ " متصل");

					break;
				}
	
			return true;
		}, null, 'presence');

		StropheAccess.getNodes(function(nodes)
		{
			//containerDiv.html('');
			var nodesCount=$(nodes).find('affiliation').length;

			if(nodesCount>1)
			{
				$('#nodeSearchText').parent().removeClass('visibility-hidden');
				$('#userSearchText').parent().removeClass('offset-s4').addClass('offset-s2');
			}
			
			usersDiv.remove();
			
				
			$(nodes).find('affiliation').each(function()
			{
				var node=$(this).attr('node');
				nodeArray[node]={users: [], online: 0};
				//console.log(node);n
				//add icons area
				if(node!='commands' && node!='es_updates')
				{
					usersDiv.attr('id',node);
					usersDiv.find('.input-collapsible-image').attr('src','imgs/node/'+node+'.png');
					usersDiv.find('.collapsible-header>div').text(node);
					containerDiv.append(usersDiv.wrapAll('<li>').parent().html());

					StropheAccess.getUsers(node, function(users)
					{
						var usersNode=$(users).find('affiliations').attr('node');
						var publishers=$(users).find('affiliation[affiliation=publisher]');

						var headerDiv=$('#'+usersNode+'>.input-collapse-header');
						var badge=headerDiv.find('>.input-collapse-badge>.input-collapse-badge-text');
						var online=headerDiv.find('>.input-collapse-badge>.input-collapse-badge-new');
						var publishersCount=publishers.length;

						publishers.each(function()
						{
							var jid=$(this).attr('jid');
							var name=Strophe.getNodeFromJid(jid);
							var isOnline=initialOnlineUsers['icon_'+name]==0;

							nodeArray[usersNode].users.push(name);

							if(isOnline)
							{
								nodeArray[usersNode].online++;
								online.text(nodeArray[usersNode].online);
							}

							if(nodesCount==1)
							{
								publishersCount--;

								if(publishersCount==0)
									$('.input-collapsible>.input-collapse>.input-collapse-header').click();
							}
								
						});

						badge.text(publishers.length+ " مستخدم");
						online.text(nodeArray[usersNode].online+" متصل");
					});

					$('#'+node+'>.input-collapse-header').click(function()
					{
						var bodyDiv=$('#'+node+'>.input-collapse-body');
						var headerDiv=$('#'+node+'>.input-collapse-header');
						if(!searchingMode && bodyDiv.find('>.input-icon').length==0)
						{
							bodyDiv.html('');

							for(var i in nodeArray[node].users)
							{
								var name=nodeArray[node].users[i];
								var isOnline=initialOnlineUsers['icon_'+name]==0;
								IconManager.addIcon(bodyDiv, iconDiv, name, node, isOnline);
							}
						}
					});
				}
			});
		});
	});

	$('#nodeSearchText').keyup(function(event)
	{
		var input=$(this).val();

		if(input.length==0)
			containerDiv.find('>li.filter-node').removeClass('filter-node');
		else
			containerDiv.find('>li').each(function()
			{
				var id=$(this).attr('id');
				if(id!=null)
					if(id.indexOf(input)>=0)
						$(this).removeClass('filter-node');
					else
						$(this).addClass('filter-node');
			});
	});


	$('#userSearchText').keyup(function(event)
	{
		var input=$(this).val();

		if(input.length>0)
		{
			if(!searchingMode)
			{
				searchingMode=true;

				$('.collapsible-header').addClass('active');
				$('.collapsible').collapsible({accordion: false});
				$('.collapsible-body').html('');
				$('.input-icon').addClass('filter-jid');
				containerDiv.find('>li[id]').addClass('filter-jid');
			}

					
			if((input[0]=='9' && input.length>=2) || input[0]!='9')
			{
					var nodes=Object.keys(nodeArray);
					var searchIncrement=input.length-searchLastLength>0;
					DataXmpp.searchUsers(input, nodes, function(result)
					{
						if(searchIncrement)
						{
							$('.input-icon').each(function()
							{
								var id=$(this).prop('id');
								id=id.substring(id.indexOf('_')+1);

								if(!result.indexOf(id+":"))
									$(this).addClass('filter-jid');
							});
						}
						else
						{
							var resultArray=result.split(';');
							var user, node;
							for(var i=0;i<resultArray.length;i++)
								if(resultArray[i]!="")
								{
								console.log(user, node);
									user=resultArray[i].substring(0,resultArray[i].indexOf(':'));
									node=resultArray[i].substring(resultArray[i].indexOf(':')+1);
									var icon=$('#icon_'+name);

									if(icon.length!=0)
									{
										icon.removeClass('filter-jid');
										icon.removeClass('filter-prepare');
									}
									else
									{
										var container=$('#'+node);	
										if($('#icon_'+user).length==0)
											IconManager.addIcon(container.find('>.input-collapse-body'), iconDiv, user, node, initialOnlineUsers['icon_'+name]==0);
										$('#icon_'+name).removeClass('filter-prepare').removeClass('filter-jid').addClass('filter-result');
									}
										
								}
						}
					});
			}
		}
		else
		{
			$('.collapsible').collapsible({accordion: true});
			$('.filter-jid').removeClass('filter-jid');
			$('.filter-result').remove();


			$('.collapsible-header').removeClass('active');
			$('.collapsible').collapsible({accordion: true});

			searchingMode=false;
		}

		searchLastLength=input.length;
	});

	function prepareSearch()
	{
		//$('#userSearchText').prop('disabled',true);
		$('.input-collapse-body').addClass('filter-prepare');
		$('.input-collapse-body>.input-icon').addClass('filter-prepare');
	}

	function finilizeSearch()
	{
		$('.input-collapse-body>.input-icon.filter-prepare').removeClass('filter-prepare').addClass('filter-jid');

		$('.input-collapse-body').each(function()
		{
			if($(this).find('>.input-icon').not('.filter-jid').length==0)
				$(this).parent().addClass('filter-jid');
			else
				$(this).parent().removeClass('filter-jid');
		});

		//$('#userSearchText').prop('disabled',false);
	}

	function manageSearch(result)
	{
		var item=$(result).find('>query>x>item');

		if(item.length>0)
		{
			var node=item.first().find('>field[var="orgname"]').text();
			var container=$('#'+node);
			
			console.log($('.filter-prepare').length);
			item.each(function()
			{
				var name=$(this).find('>field:first').text();

				if(name!="")
				{
					var name=Strophe.getNodeFromJid(name);
					var icon=$('#icon_'+name);

					if(icon.length!=0)
					{
						icon.removeClass('filter-jid');
						icon.removeClass('filter-prepare');
					}
					else
					{
						var fullName=$(this).find('>field[var=first]').text()+' '+$(this).find('>field[var=last]').text();
						var locality=$(this).find('>field[var=locality]').text();

						IconManager.addIcon(container.find('>.input-collapse-body'), iconDiv, name, node, initialOnlineUsers['icon_'+name]==0, fullName, locality);
						$('#icon_'+name).removeClass('filter-prepare').removeClass('filter-jid').addClass('filter-result');
					}

				}
			});	
		}
	}
});


var IconManager=
{
	addIcon: function(container, template, name, node, isOnline, fullName, city)
	{
		template.attr('id','icon_'+name);
		template.find('>a').attr('href','profile.html?id='+name);
		template.find('.input-icon-text').text(name);
		template.find('a>.input-icon-image').attr('src','imgs/node/'+node+'.png');

		//vcard initialization
		var ballon=template.find('.input-ballon>div');
		ballon.find('>label:eq(0)').html(name);
		if(fullName!=null || city!=null)
		{
			ballon.find('>label:eq(1)').html(fullName);
			ballon.find('>label:eq(2)').html(node);
			ballon.find('>label:eq(3)').html(city);
		}
		else
		{
			ballon.find('>label:eq(1)').html("");
			ballon.find('>label:eq(2)').html("");
			ballon.find('>label:eq(3)').html("");
		}

		if(isOnline)
			template.find('a>div').removeClass('input-icon-offline').addClass('input-icon-online');
		else
			template.find('a>div').removeClass('input-icon-online').addClass('input-icon-offline');

		container.append(template.wrapAll('<div>').parent().html());
	},

	activateIcon: function(iconId, template, name, node, isOnline, fullName, city)
	{
		var icon=$('#'+iconId);
		if(icon.length==0)
			icon.removeClass('filter-jid');
	}
};
