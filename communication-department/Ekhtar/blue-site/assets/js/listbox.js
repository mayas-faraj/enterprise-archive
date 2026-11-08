        $(function () {
	    var IMG="<img style=\"width:20;height:20\" src=\"assets/images/user.png\">";
	    var toControl=document.getElementById('to');
	    var toUsers=document.getElementById('toUsers');
            $('body').on('click', '.list-group .list-group-item', function () {
		
                $(this).toggleClass('active');
		if($(this).hasClass('active')){
			$(this).find('img').removeClass('icon-plus').addClass('icon-minus');
			toUsers.value+=$(this).text()+';';}
		else {
			$(this).find('img').removeClass('icon-minus').addClass('icon-plus');
			toUsers.value=toUsers.value.replace($(this).text()+';','');}
			toControl.innerHTML=toUsers.value.split(';').join(IMG+' ');
            });
            $('.list-arrows button').click(function () {
                var $button = $(this), actives = '';
                if ($button.hasClass('move-left')) {
                    actives = $('.list-right ul li.active');
                    actives.clone().appendTo('.list-left ul');
                    actives.remove();
                } else if ($button.hasClass('move-right')) {
                    actives = $('.list-left ul li.active');
                    actives.clone().appendTo('.list-right ul');
                    actives.remove();
                }
            });
            $('.dual-list .selector').click(function () 
		{
                var $checkBox = $(this);
		toUsers.value=' ';

                if (!$checkBox.hasClass('selected')) 
		{
                    $checkBox.addClass('selected').closest('.well').find('ul li:not(.active)').addClass('active');
		    $checkBox.addClass('selected').closest('.well').find('ul li.active').find('img').removeClass('icon-plus').addClass('icon-minus');
		    $checkBox.addClass('selected').closest('.well').find('ul li.active').each(function () {
				
				if($(this).css('display')!='none')
					toUsers.value+=this.innerText+';';
				});
                    $checkBox.children('i').removeClass('glyphicon-unchecked').addClass('glyphicon-check');
		    
                } else 
		{
		    $checkBox.addClass('selected').closest('.well').find('ul li.active').find('img').removeClass('icon-minus').addClass('icon-plus');
                    $checkBox.removeClass('selected').closest('.well').find('ul li.active').removeClass('active');
                    $checkBox.children('i').removeClass('glyphicon-check').addClass('glyphicon-unchecked'); 
                }

		toControl.innerHTML=toUsers.value.split(';').join(IMG+' ');
            });
            $('[name="SearchDualList"]').keyup(function (e) {
                var code = e.keyCode || e.which;
                if (code == '9') return;
                if (code == '27') $(this).val(null);
                var $rows = $(this).closest('.dual-list').find('.list-group li');
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });

        });
