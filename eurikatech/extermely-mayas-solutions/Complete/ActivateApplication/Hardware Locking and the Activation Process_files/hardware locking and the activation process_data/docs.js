/**
 * jQuery Cookie plugin
 *
 * Copyright (c) 2010 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */
jQuery.cookie = function (key, value, options) {

    // key and at least value given, set cookie...
    if (arguments.length > 1 && String(value) !== "[object Object]") {
        options = jQuery.extend({}, options);

        if (value === null || value === undefined) {
            options.expires = -1;
        }

        if (typeof options.expires === 'number') {
            var days = options.expires, t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }

        value = String(value);

        return (document.cookie = [
            encodeURIComponent(key), '=',
            options.raw ? value : encodeURIComponent(value),
            options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
            options.path ? '; path=' + options.path : '',
            options.domain ? '; domain=' + options.domain : '',
            options.secure ? '; secure' : ''
        ].join(''));
    }

    // key and possibly options given, get cookie...
    options = value || {};
    var result, decode = options.raw ? function (s) { return s; } : decodeURIComponent;
    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};

if( window.top == window && location.href.match( /\/dochxs\// ) )
    location.href = location.href.replace( "dochxs", "docs" );

$(function(){

    var lang = $.cookie('lang')||'visualbasic';
    
    var sa = $('.seealso');
    if( sa.length )
    {    
       $('#seealsoalt').append('<h1>See Also</h1>').append( sa.clone() );
    }
    
    // Automatically convert consecutive <div> code blocks into a tab group
    (function(){
        var codes = $('div.code:not(#syntaxCodeBlocks)');
        var group, groups = [];

        codes.each(function(){
            var c = $(this);
            if( ! c.prev().is('div.code') )
            {
                group = [];
                groups.push(group);
            }
            group.push(this);
        });

        $.each(groups,function(){
           group = $(this);

           var tabs = $('<ul class="tabs source pulled"></ul>');       
           tabs.insertBefore(group.first());
           group.wrapAll('<div>');
           group.find('> a').each(function(){
                $(this).wrap('<li>').parent().appendTo(tabs);
            });
        });
    })();

    // Create jump links below title based on <h1 class="heading"> tags
    (function(){
        var n = $('<ul>');


        $("h1.heading").each(function(){
            var h = $(this);
            if( h.text() == "See Also" || h.text() == "In This Section")
                return; 
            var a = h.find('a');
            if( ! a.length )
                a = h.prev('a');
            if( ! a.length )
            {
                a = $('<a>'); 
                h.before(a);
            }

            if( ! a.attr('name') )
                a.attr('name', h.text().replace(/[^a-zA-Z]/g, '') ); 

            n.append( $('<li><a href="#'+ a.attr('name')+'">' + h.text() + '</a></li>') );
        });


        if( n.children().length )
        {
            $('#jumplinks')
                .append( '<h1>Jump To</h1>' )
                .append( n );
        }
    })();
       
    function tn(n)
    {
        return n.replace(/\s+(pulled)/, '' ).replace(/ /g, '_');
    }

    // Handle code tabs and persistence of selected tab groups and language
    $('.tabs').each(function() {
        // Get the tab panes and ensure they are all at least the same height
        var t = $(this), h = 0, ch = 
            t.next().children()
            .each(function(){
                h = Math.max( h, $(this).innerHeight() );
            })
            .css({minHeight:h});

        var tabs = t.fptabs(ch).data('tabs');
        t.data('tabs',tabs);
 
        var cn = tn(this.className);
        var ix = $.cookie(cn);
        if( ix )
            tabs.click(parseInt(ix));

        tabs.onClick(function(e,index){            
            $.cookie(cn, index, {expires:30, path: '/'});
            if( cn == 'tabs_source' )
            {
                var a = this.getCurrentTab().attr('href').substring(1);
                $('body').removeClass(lang).addClass(a);
                $.cookie('lang', a, {expires:30, path: '/'});
                lang = a;
            }

            $('.tabs').each(function(){
                if( tn( this.className ) == cn )
                    $(this).data('tabs').click(index);
            });
        });
    });

    $('body').addClass(lang);
    $('#tocnav h1').first().addClass('first');

    $('.expand-link').click(function(){$(this).addClass('expanded')});

    // Add syntax highlighting to <pre> tags
    $('pre').each(function(){
        var pre = $(this);
        
        if( pre.is('.nocode,.syntax') ) 
            return;

        var classList = this.className.split(/\s+/);
        for( var i = 0; i < classList.length; i++ )
        {
            pre.addClass('lang-' + classList[i]);
        }
        pre.addClass('prettyprint');
    });

    prettyPrint();
});