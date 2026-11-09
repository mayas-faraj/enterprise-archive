

var commentElement, linkElement, codeElement, iframeElement;

var primaryCode="window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date());gtag('config', 'UA-107438887-1');";

var secondaryCode="(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-T4Q5TJG');";

var commentElement = document.createComment('<!-- Global site tag (gtag.js) - Google Analytics -->');
document.head.insertBefore(commentElement, document.head.firstChild);

linkElement = document.createElement("script");
linkElement.setAttribute('async','');
linkElement.setAttribute('src','https://www.googletagmanager.com/gtag/js?id=UA-107438887-1');
document.head.insertBefore(linkElement, commentElement.nextSibling);

codeElement = document.createElement("script");
codeElement.innerHTML=primaryCode;
document.head.insertBefore(codeElement, linkElement.nextSibling);

commentElement = document.createComment('<!-- Google Tag Manager -->');
document.head.insertBefore(commentElement, codeElement.nextSibling);

codeElement = document.createElement("script");
codeElement.innerHTML=secondaryCode;
document.head.insertBefore(codeElement, commentElement.nextSibling);

commentElement = document.createComment('<!-- End Google Tag Manager -->');
document.head.insertBefore(commentElement, codeElement.nextSibling);

commentElement = document.createComment('<!-- Google Tag Manager (noscript) -->');
document.body.insertBefore(commentElement, document.body.firstChild);

codeElement = document.createElement("noscript");

iframeElement = document.createElement("iframe");
iframeElement.setAttribute('src', 'https://www.googletagmanager.com/ns.html?id=GTM-T4Q5TJG');
iframeElement.setAttribute('width', '0');
iframeElement.setAttribute('height', '0');
iframeElement.setAttribute('style', 'display:none;visibility:hidden');

codeElement.appendChild(iframeElement);
document.body.insertBefore(codeElement, commentElement.nextSibling);

commentElement = document.createComment('<!-- End Google Tag Manager (noscript) -->');
document.body.insertBefore(commentElement, document.body.codeElement);




