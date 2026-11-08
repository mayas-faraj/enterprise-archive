var initialOnlineUsers={};

$(document).ready(function()
{
	//var initialOnlineUsers=[];
	var containerDiv=$('#containerDiv');
	var usersDiv=containerDiv.find('.box-glass');
	var areaDiv=containerDiv.find('.input-area');
	var iconDiv=areaDiv.find('.input-icon');

	var documentWidth=$(document).width();
	var ballonWidth=$('.input-ballon').width();

	areaDiv.html("<img class='status-loading input-loading'/>");

	$('#toggleDiv').click(function()
	{
		var shift=$('.page-sidebar').width();
		if(shift==0)
			shift=-320;
		$('.page-sidebar').animate({width: '-='+shift}, 1000);
		$('.input-icons-wide').animate({width: '+='+shift}, 1000);
	});

	$(document).on('mouseenter', '.input-icons-wide .input-icon', function(event)
	{
		containerWidth=$('.input-icons-wide').width();
		containerRight=parseInt($('.input-icons-wide').css('margin-right'));
		//console.log(event.clientX,ballonWidth,documentWidth,containerWidth);
		if(event.clientX-ballonWidth<documentWidth-(containerWidth+containerRight))
			$(this).find('.input-ballon').css('left',ballonWidth+'px');
		else
			$(this).find('.input-ballon').css('left','0px');

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

	function updateOnlineStatus()
	{
		if(Strophe.getNodeFromJid(StropheAccess.connection.jid)=='ehq')
		{
			StropheAccess.getOnlineUsers(function(result)
			{
				initialOnlineUsers={};
				$(result).find('item').each(function()
				{
					var jid=$(this).attr('jid');
					if(jid.length>0 && jid[0]=='9')
					{
						//console.log(Strophe.getNodeFromJid(jid));
						initialOnlineUsers['icon_'+Strophe.getNodeFromJid(jid)]=0;
					}
				});
			});
		}
	}

	function setOnlineStatus()
	{
		if(Strophe.getNodeFromJid(StropheAccess.connection.jid)=='ehq')
		{
			updateOnlineStatus();
			$('.input-icon>a>.input-icon-online + label, .input-icon>a>.input-icon-offline + label').each(function()
			{
				var name=$(this).html().trim();
				if(initialOnlineUsers['icon_'+name]!=null)
				{

					$('#icon_'+name).find('>a').children().eq(1).removeClass('input-icon-offline').addClass('input-icon-online');
					$('#icon_'+name).find('>.input-ballon>.input-ballon-status').css('color','#1dff02').html('متصل');
				}
				else
				{
					$('#icon_'+name).find('>a').children().eq(1).removeClass('input-icon-online').addClass('input-icon-offline');
					$('#icon_'+name).find('>.input-ballon>.input-ballon-status').css('color','black').html('غير متصل');
				}
			});
		}
	}

	
	

	//load nodes
	StropheAccess.connected(function()
	{
		updateOnlineStatus();	

		//if(Strophe.getNodeFromJid(StropheAccess.connection.jid)=='ehq')
		//	setInterval(function() {setOnlineStatus()},30000);
		
		StropheAccess.connection.addHandler(function(pres)
		{
			var from=Strophe.getNodeFromJid($(pres).attr('from'));
			var type=$(pres).attr('type');
			if(type==undefined)
			{
				if(type==undefined)
					if($('#icon_'+from).length==1)
					{
						$('#icon_'+from).find('>a').children().eq(1).removeClass('input-icon-offline').addClass('input-icon-online');
						$('#icon_'+from).find('>.input-ballon>.input-ballon-status').css('color','#1dff02').html('متصل');
					}
					else
						initialOnlineUsers['icon_'+from]=0;
			}
			else if(type=='unavailable')
			{
				$('#icon_'+from).find('>a').children().eq(1).removeClass('input-icon-online').addClass('input-icon-offline');
				$('#icon_'+from).find('>.input-ballon>.input-ballon-status').css('color','black').html('غير متصل');
				
			}
	
			return true;
		}, null, 'presence');

		StropheAccess.getNodes(function(nodes)
		{
			containerDiv.html('');
			
			$(nodes).find('affiliation').each(function()
			{
				var node=$(this).attr('node');
				//console.log(node);
				//add icons area
				if(node!='commands' && node!='es_updates')
				{
					usersDiv.attr('id',node);
					usersDiv.find('.box-logo').attr('src','imgs/node/'+node+'.png');
					usersDiv.find('.input-header').text(node);

					containerDiv.append(usersDiv.wrapAll('<div>').parent().html());

					//add users to area
					StropheAccess.getUsers(node, function(users)
					{
						usersDiv.find('.input-area').html('');
						$(users).find('affiliation').each(function()
						{
							if($(this).attr('affiliation')=='publisher')
							{
								var jid=$(this).attr('jid');
								var name=Strophe.getNodeFromJid(jid);
								iconDiv.attr('id','icon_'+name);
								iconDiv.find('a').attr('href','profile.html?id='+name);
								iconDiv.find('.input-icon-text').text(name);
								
								usersDiv.find('.input-area').append(iconDiv.wrapAll('<div>').parent().html());

								StropheAccess.getUserVcard(jid, function(vcard)
								{
									var from=$(vcard).attr('from');
									//var data=$(vcard).find('PHOTO').find('BINVAL').text();
									var fullName=$(vcard).find('FN').text();
									var job=$(vcard).find('Work01').text();
									var address=$(vcard).find('City').text();
									var id='icon_'+Strophe.getNodeFromJid(from);
									var ic=$('#'+id);
									
									if(fullName!='' || job!='')
									{
										//if(data!='')
										//	ic.find('>a').children().eq(0).attr('src','data:image/png;base64, ' + $(vcard).find('PHOTO').find('BINVAL').text());
										ic.find('.input-ballon-info').children().eq(1).text(Strophe.getNodeFromJid(from));
										ic.find('.input-ballon-info').children().eq(3).text(fullName);
										ic.find('.input-ballon-info').children().eq(5).text(job);
										ic.find('.input-ballon-info').children().eq(7).text(address);
										ic.find('.input-ballon>.input-ballon-button>a').attr('href','commands.html?u='+Strophe.getNodeFromJid(from)+';');
										//console.log(initialOnlineUsers);
										if(initialOnlineUsers['icon_'+Strophe.getNodeFromJid(from)]!=null)
										{
											ic.find('>a').children().eq(1).removeClass('input-icon-offline').addClass('input-icon-online');
											ic.find('>.input-ballon>.input-ballon-status').css('color','#1dff02').html('متصل');										
										}
										
									}
									else
									{
										ic.find('>a').children().eq(1).removeClass('input-icon-offline').addClass('input-icon-exclamation');
										ic.find('.input-ballon').remove();
									}

								});
							}
						});

						$('#'+node).find('.input-area').html(usersDiv.find('.input-area').html());
					});
				}
			});
		});
	});

	$('#searchText').keyup(function(event)
	{
		$('#resultDiv').html('');
		if(FormValidation.checkNotEmpty('searchText'))
		{
			var search=$('#searchText').val().toLowerCase();
			search=search.replace('*','.*').replace('?','.');
		
			var regex=new RegExp(search);
			$('.input-icon').each(function()
			{
				if(regex.test($(this).find('>a >label').text()) ||
				   regex.test($(this).find('>.input-ballon>.input-ballon-info').children().eq(3).text().toLowerCase())||
				   regex.test($(this).find('>.input-ballon>.input-ballon-info').children().eq(7).text().toLowerCase()))
				{
					$('#resultDiv').append($(this).wrapAll('<div>').parent().html());
				}	
			});
		}
	});
});
