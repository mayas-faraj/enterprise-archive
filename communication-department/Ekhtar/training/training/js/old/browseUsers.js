$(document).ready(function()
{
	//var initialOnlineUsers=[];
	var NOT_REGISTER="المستخدم مضاف إلى جهة إخطار, لكنه لم يقم حتى الآن بالتسجيل على جهازه الخلوي.";
	var setSelect=$("#setSelect");
	var setListElement=$("#setListElement");
	var setElement=$.extend(true, {}, setListElement.find(">#setElement"));
	var setHeaderElement=setElement.find(">#setHeaderElement");
	var userListElement=setElement.find(">#userListElement");
	var userElement=$.extend(true, {}, userListElement.find(">#userElement"));
	var setOption=$.extend(true, {}, $("#setSelect>option:first"));

	var accordionCollapsible=true;

	if(Master.getVariable("schema")==null)
	{
		fillList();
		fillUsers();
		$("#set_-1 .input-collapse-badge-new").remove();

		$("select").formSelect();
		addSelectAll($("select"));
		$("#setListElement").collapsible();
	}

	function addSet(id, name, logo)
	{
		setElement.attr("id", "set_"+id);

		setHeaderElement.find(">#setImage").attr("src", logo);
		setHeaderElement.find(">#setNameDiv").html(name);
		setElement.html(setHeaderElement.wrapAll("<div>").parent().html());

		userListElement.attr("id", "userList_"+id);
		userListElement.html("");

		setElement.append(userListElement.wrapAll("<div>").parent().html());
		setListElement.append(setElement.wrapAll("<li>").parent().html());

		return setElement;
	}

	function addSetUser(setId, jid, name, available, logo)
	{
		if(name==null)
			name="مستخدم إخطار";
		console.log("set user: ", setId, jid, name, available, logo);
		var id=Strophe.getNodeFromJid(jid);
		userElement.attr("id", "user_"+id);
		userElement.find(">a").attr("href", "reports.html?id="+id);
		userElement.find(">a>#userImage").attr("src", logo);
		userElement.find(">a>#jidLabel").html(Strophe.getNodeFromJid(jid));
		userElement.find(">a>#nameLabel").html(name);

		if(available)
			userElement.find(">a>div").addClass("input-icon-offline").removeClass("input-icon-exclamation");
		else
			userElement.find(">a>div").addClass("input-icon-exclamation").removeClass("input-icon-offline");

		$("#userList_"+setId).append(userElement.wrapAll("<a>").parent().html());
	}

	function fillUsers()
	{
		setListElement.html("");
		var sets=SetManager.getSet();

		var deleted=sets[SetManager.DELETED_SET_ID];
		delete(sets[SetManager.DELETED_SET_ID]);
		sets[SetManager.DELETED_SET_ID]=deleted;

		for(var key in sets)
		{
			var set=sets[key];
			if(set.users.length!=0 || key!=SetManager.GENERAL_GROUP_ID || key!=SetManager.DELETED_SET_ID)
			{
				addSet(key, set.name, set.logo);

				var users=set.users;
				
				if(users!=null)
				for(var i=0; i<users.length; i++)
				{
					var id=Strophe.getNodeFromJid(users[i].jid);
					addSetUser(key, users[i].jid, users[i].name, users[i].available, set.logo);
				}

				updateSetBadge($("#set_"+key), false);	
			}
		}
	}

	function fillList()
	{
		var sets=SetManager.getSet();
		setSelect.html("");

		SessionAccess.getSessionRoleId(function(roleId)
		{
			if(roleId!="3")
				delete(sets[0]);

			for(var key in sets)
			{
				setOption.attr("value", key);
				setOption.attr("data-icon", sets[key].logo);
				setOption.html(sets[key].name);	
				setSelect.append(setOption.wrapAll("<option>").parent().html());
			}

			setSelect.formSelect();
			addSelectAll(setSelect);
		});
	}

	StropheAccess.rosterUpdated(function(event, jid, name, setId, isAvailable, isRemoved)
	{
		console.log("roster updated:" ,jid, name, setId, isAvailable, isRemoved);
		var id=Strophe.getNodeFromJid(jid);
		var userIcon=$("#user_"+id);

		if(userIcon.length>0)
		{
			var iconSetId=userIcon.parent().parent().attr("id");
			userIcon.remove();
			updateSetBadge($("#"+iconSetId), false);
		}

		if(!isRemoved)
		{
			if(setId==null || setId=="")
				setId=0;

			addSetUser(setId, jid, name, isAvailable, SetManager.getSet()[setId].logo);
			updateSetBadge($("#set_"+setId), false);
		}
	});

	StropheAccess.presenceReceived(function(event, from, type)
        {
		var id=Strophe.getNodeFromJid(from);
		var jid=Strophe.getBareJidFromJid(from);

                if(type==null)
                        $("#user_"+id+" div").removeClass("input-icon-offline").removeClass("input-icon-exclamation").addClass("input-icon-online");
                else if(type=="unavailabe")
                        $("#user_"+id+" div").removeClass("input-icon-online").removeClass("input-icon-exclamation").addClass("input-icon-offline");

		if(SetManager.getUsers()[jid]!=null)
		{
			var setId=SetManager.getUsers()[jid].setId;
			updateSetBadge($("#set_"+setId), false);
		}
        });

	$("#setSelect").change(function()
	{
		var selected=$(this).val();
		setListElement.find(">li").each(function()
		{
			var setId=$(this).attr("id").substring(4);
			if(selected.indexOf(setId.toString())>=0)
				$(this).removeClass("filter-node")
			else
				$(this).addClass("filter-node");
		});
	});

	$("#userSearchText").keyup(function(event)
	{
		var input=$(this).val();

		if(input.length==0)
		{
			setListElement.find(".input-icon.filter-jid").removeClass("filter-jid");
			setListElement.find(">li.filter-jid").removeClass("filter-jid");
			$('.collapsible').collapsible({accordion: true});
			accordionCollapsible=true;
		}
		else
		{
			if(accordionCollapsible)
			{
				accordionCollapsible=false;
				$(".collapsible-header").addClass("active");
				$(".collapsible").collapsible({accordion: false});
			}

			setListElement.find(".input-icon").each(function()
			{
				var value=$(this).find("#nameLabel").html()+";"+$(this).find("#jidLabel").html();
				if(value.indexOf(input)>=0)
					$(this).removeClass("filter-jid");
				else
					$(this).addClass("filter-jid");
			});
		}

		$(setListElement).find(">li").each(function(i)
		{
			updateSetBadge($(this), input.length!=0);
		});
	});

	function updateSetBadge(element, clearIfEmpty)
	{
		var userCount=element.find(".input-icon").not(".filter-jid").length;
		if(clearIfEmpty)
			if(userCount==0)
				element.addClass("filter-jid")
			else
			{
				element.removeClass("filter-jid");
			}

		element.find(".input-collapse-badge-text").html(userCount+" مستخدم");
		element.find(".input-collapse-badge-new").html(element.find(".input-icon-online").length+" متصل");
	}
});
