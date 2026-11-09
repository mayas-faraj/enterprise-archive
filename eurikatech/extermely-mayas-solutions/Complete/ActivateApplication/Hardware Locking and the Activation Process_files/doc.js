$(function() {
	var frame = $('#doc-content-frame');
	var header = $( '#doc-header' );
	
	var resizefn = function() {
		var h = window.innerHeight || document.documentElement.clientHeight;
		
		frame
			.height( h - header.outerHeight( true ) );
	};
	resizefn();
	$(window).resize(resizefn);
});

function contentLoaded() {
	
	if (doccontent.document.location.host != location.host)
		return;

	var d = $(doccontent.document);

	$('a', d).each(function() {
		var a = $(this);

		var href = a.attr('href') || '';
		if (href.substring(0, 1) == '#') return;
		if (a.attr('target') == '' || a.attr('target') === undefined)
			a.attr('target', '_parent');

		href = this.toString();
		if (href.indexOf('dochxs') == -1) return;

		var ix = href.indexOf('?');
		if (ix < 0)
			ix = href.indexOf('#');

		if (ix == 0)
			return;

		if (ix < 0)
			href = href.replace('dochxs', 'docs').toLowerCase();
		else
			href = href.substring(0, ix).toLocaleLowerCase() + href.substring(ix);

		a.attr('href', href);
	});
	
	$( '#toclinks', d ).append( $('#toc') );
	
	if( $('#topTable', d).length )
		doccontent.document.location.reload( true );
		
}