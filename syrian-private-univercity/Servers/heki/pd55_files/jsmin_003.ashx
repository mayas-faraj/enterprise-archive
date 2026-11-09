
/*script:s_code_dell_PROD_2012_02_01_v8.js*/
var startTScript=new Date().getTime ();
// SiteCatalyst code version: H.24.1
// SUPPORTED ENVIRONMENTS: Dell Storm, Dell Nextgen, Dell Third-party sites
// UPDATED: 01-February-2012
// Version: v6
// CHANGE LOG: Commented out this line
var version = 'S.NG v8 01-FEB-12';

var s_account='dellglobalonline';
var s_dell=s_gi(s_account);

/************************** CONFIG SECTION **************************/

/* Dell Config */
if(!s_dell.localDoms)s_dell.localDoms='javascript:,dell.,dellcomputer.,dellcomputers.,dellcustomerservice.,delldirect.,delldrivers.,dellfinancialservices.,dellideas.,dellnet.,dellstore.,dellsupport.,delltalk.,dellteam.,dellvistaupgrade.,dfsdirectsales.,inspiron.';
if(!s_dell.supportDoms)s_dell.supportDoms='docs.,dellcustomerservice.';
s_dell.isPageLoad=true;

/* Conversion Config */
s_dell.charSet='UTF-8';

/* Link Tracking Config */
s_dell.trackDownloadLinks=true;
s_dell.trackExternalLinks=true;
s_dell.trackInlineStats=true;
s_dell.linkDownloadFileTypes='exe,zip,wav,mp3,mov,mpg,avi,wmv,pdf,doc,docx,xls,xlsx,ppt,pptx';
s_dell.linkInternalFilters=s_dell.localDoms+',alienware.,dell-ins,easy2.,ideastorm.,livelook.,sellpoint.,syndication.intel.,triaddigital.,webcollage.';
s_dell.linkLeaveQueryString=false;
s_dell.linkTrackVars='prop60';
s_dell.linkTrackEvents='None';
s_dell.ActionDepthTest=true;

/* Plugin Config */
s_dell.usePlugins=true;
var doPluginsRanAlready = false;

/***************************** doPlugins ****************************/

function s_dell_doPlugins(s){
	s.prop60 = version;
	 
	if(!s.server)s.server=parseUri(document.location.href).host.replace(/^www[0-9]*\./i,'');

    if(!doPluginsRanAlready)s.processLWP();
	
	if(!doPluginsRanAlready){
        /* Load the Survey Module (except on third party sites) */
		if(s.prop6!='rc1047167'&&s.prop6!='rc1193519'&&s.prop6!='rc1193518'){  //don't load survey for these cookie IDs
			s.loadModule('Survey');
			s.Survey.suites=s_account;
		}
	}

	s.events=s.events?s.events:'';

	s.setupDynamicObjectIDs();

	/* Begin Page Name Logic */

	if(s.onDellCMS()){

		var pn=s.getHTMLtag('meta','metricspath').toLowerCase(),n='';
		if(pn.indexOf('&eiwatch=')>-1)pn=s.repl(pn,'&eiwatch=','');

		if(!s.pageName||s.pageName.indexOf('dellstore^')>-1){
			s.pageName='';
			if(document.location.href=='http://www.dell.com/'||pn=='www1.us.dell.com/us/en/gen//content^default/'){
				s.pageName='dell.com homepage'; //handle dell.com homepages (static and dynamic should have same name)
			}
			var pna=s.split(pn,'/'); //split on / delimiter
			if(pna.length>0&&pna.length<6){ //handle page cloaking
				if(!s.pageName){
					if(pn.indexOf('//')>-1)pn=pn.substring(pn.indexOf('//')+2);
					pn=pn.replace(/^www[0-9]*\./i,'');
					if(pn.indexOf('?')>-1){
						s.pageName=pn.substring(0,pn.indexOf('?'));
					}else{
						s.pageName=pn;
					}
				}
			}

			/*
			 *	Storm Page Name Logic
			 *
			 *	default storm format:
			 *	domain/country/lauguage/segment/customerset/uristem^info/   /[optionalparameters]
			 *	0   1   2    3     4    5   6   7
			 */
			if(s.determineCMS()=='storm'&&pn&&!s.pageName){
				var a7=pna[7],a6=pna[6]; //querystring value (optional parameters)
				var ovf=af=false; //other value flag, appended flag (for else case)
				var pn=dpn=n=''; //clear page name
				for(var i=1;i<8;i++){
					if(i==4&&pna[0].indexOf('premier')>-1){pn=s.apl(pn,'',':',0);af=true;}
					if(i==4&&pna[4].indexOf('rc')==0&&!af){pn=s.apl(pn,'',':',0);af=true;}
					if(i==6&&a6&&a7){
						if(pna[6].indexOf('[')>-1){
							pn=s.apl(pn,'',':',0);
							af=true;
						}
					} else if(i==6&&a6){
						if(pna[6].indexOf('[')>-1)af=true;
					} else if(i==6){
						pn=s.apl(pn,pna[i],':',0);
						af=true;
					}
					/* values to include in page name AND details page name */
					if(i==7&&a7){
						if(a7.indexOf('category_id=')>-1){
							n=a7.substring(a7.indexOf('category_id=')+12);
							n=n.substring(0,n.indexOf(']'));
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('categoryid=')>-1){
							n=a7.substring(a7.indexOf('categoryid=')+11);
							n=n.substring(0,n.indexOf(']'));
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('sku=')>-1&&pn.indexOf('addedtocart')==-1){
							n=a7.substring(a7.indexOf('sku='));
							n='['+n.substring(0, n.indexOf(']')+1);
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('oc=')>-1&&pna[0].indexOf('premier')==-1&&pn.indexOf('dellstore^config')>-1){
							n=a7.substring(a7.indexOf('oc='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('product_id=')>-1){
							n=a7.substring(a7.indexOf('product_id='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('productid=')>-1){
							n=a7.substring(a7.indexOf('productid='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('[~id=')>-1&&pn.indexOf('imagedirect')==-1){
							n=a7.substring(a7.indexOf('id='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('[id=')>-1&&pn.indexOf('imagedirect')==-1){
							n=a7.substring(a7.indexOf('id='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('topic=')>-1){
							n=a7.substring(a7.indexOf('topic='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){pn=s.apl(pn,n,'',0);af=true;}else{pn=s.apl(pn,n,':',0);ovf=true;af=true;}
						}
						dpn=pn;
						/* values to include in details page name */
						if(a7.indexOf('section=')>-1){
							n=a7.substring(a7.indexOf('section='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){dpn=s.apl(dpn,n,'',0);af=true;}else{dpn=s.apl(dpn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('tab=')>-1){
							n=a7.substring(a7.indexOf('tab='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){dpn=s.apl(dpn,n,'',0);af=true;}else{dpn=s.apl(dpn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('page=')>-1){
							n=a7.substring(a7.indexOf('page='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){dpn=s.apl(dpn,n,'',0);af=true;}else{dpn=s.apl(dpn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('brandid=')>-1){
							n=a7.substring(a7.indexOf('brandid='));
							n='['+n.substring(0,n.indexOf(']')+1);
							if(ovf){dpn=s.apl(dpn,n,'',0);af=true;}else{dpn=s.apl(dpn,n,':',0);ovf=true;af=true;}
						}
						if(a7.indexOf('cat=')>-1){ //values to variable only
							n=a7.substring(a7.indexOf('cat=')+4);
							n=n.substring(0,n.indexOf(']'));
							if(pna[0].indexOf('search')>-1)s.eVar9=n;
							af=true;
						}
					}
					if(!af&&i!=7)pn=s.apl(pn,pna[i],':',0);
					af=false;
				}

				/* cleanup - remove trailing colon and undefined */
				if(pn.length-1==pn.lastIndexOf(':'))pn=pn.substring(0,pn.length-1);
				if(pn.indexOf(':undefined')>-1)pn=pn.substring(0,pn.indexOf(':undefined'));
				if(dpn.length-1==dpn.lastIndexOf(':'))dpn=dpn.substring(0,dpn.length-1);

				/* cleanup - remove dellstore: from the beginning of the string for ecomm */
				if(pn.indexOf('dellstore:')==0)pn=pn.substring(10,pn.length);
				if(dpn.indexOf('dellstore:')==0)dpn=dpn.substring(10,dpn.length);

				s.pageName=pn;
				dpn=dpn?s.prop13=dpn:s.prop13=pn;
			}
		}

		if(!s.pageName)s.pageName=s_dell.getPNfromURL();
		if(!s.prop13)s.prop13=s.pageName;

		/* Set prop29 to CMS name. Modified 06/12/10 */
		s.prop29=s.determineCMS();
		if(s.prop29=='unknown'||!s.prop29)s.prop29='unknown:'+s.server;

		/* updated 10/29/08: handling of AJAX pages */
		if(s.pageName.indexOf('ajax')>-1){
			if(s.prop13.indexOf(':ajax')>-1){
				s.pageName=s.prop13.substring(0,s.prop13.indexOf(':ajax'));
			}else{
				s.pageName=s.prop13;
				s.prop13=s.prop13+':ajax';
			}
		}

	}else{ //not on dell.com

		if(!s.pageName)s.pageName=s.getPNfromURL();
		if(!s.prop13)s.prop13=s.pageName;

	}

	/* END Page Name Logic */

	/* Added 10/24/08: getPreviousValue of pageName */
	if (typeof(s.linkType)=='undefined'||s.linkType=='e'){
		s.gpv_pn=s.getPreviousValue(s.pageName,'gpv_pn','');
		if(s.gpv_pn=='no value')s.gpv_pn='';
	}

	/* Classify page as Support (event22) or Segment (event23) */
	var spg=false;
	if(!spg&&(s.server.indexOf('dell')>=0)&&s.server.indexOf('support')>=0)spg=true; //check domain for 'dell' and 'support' in any order
	if(!spg&&s.server.match('('+s.supportDoms.replace(/,/gi,'|').replace(/\./gi,'\\.')+')'))spg=true; //Check domain for specific support domains
	if(!spg&&s.determineCMS()=='nextgen'){ //Logic to determine if a Nextgen page is a Support page follows...
		var urlpn=document.location.pathname.toLowerCase();
		if(urlpn){
			if(!spg&&urlpn.indexOf('/order-support')>=0)spg=true;
			if(!spg&&urlpn.indexOf('/support')>=0)spg=true;
		}
	}      
	s.events=s.apl(s.events,(spg?'event22':'event23'),',',2);
	
	/** added by Jason Case 25 Apr 2011 to include these events in tl calls**/
	if(typeof(s.linkType)!='undefined'){
	    s.linkTrackVars=s.apl(s.linkTrackVars,'events',',',2);
        s.linkTrackEvents=s.apl(s.linkTrackEvents,'event22',',',2);
        s.linkTrackEvents=s.apl(s.linkTrackEvents,'event23',',',2);
    }
   
	/* BEGIN dell.com Only Logic */

	if(s.onDellCMS()){

		/* Utility script - check inputs for Dell values */
		s.ss_kw=s.getHTMLtag('input','kw','id','value');
		s.ss_rff=s.getHTMLtag('input','rff','id','value');
		s.es_on=s.getHTMLtag('input','order_number','name','value');
		s.ss_dkw=s.getQueryParam('sk'); //Check for direct search result keyword. Added 12/06/10

		/* Order Number (uses value from HTML input) */
		if(s.es_on)s.prop22=s.es_on;

		/* Site Search (uses values from HTML inputs) */
		if(s.ss_kw&&s.ss_rff){
			if(s.ss_rff=='1')s.prop7=s.ss_kw;
			else if(s.ss_rff=='2')s.prop7='reclink:'+s.ss_kw;
			else if(s.ss_rff=='3')s.prop7='othercat:'+s.ss_kw;
			else if(s.ss_rff=='0')s.prop7='null:'+s.ss_kw;
		}else if(s.ss_dkw){
			s.prop7='redirect:'+s.ss_dkw; //Save direct search result keyword. Added 12/06/10
		}
		if(s.prop7){
			s.prop7=s.prop7.toLowerCase();
			s.eVar36=s.prop7;
			var t_search=s.getValOnce(s.eVar36,'v36',0);
			if(t_search){
				s.events=s.apl(s.events,'event6',',',2);
				s.prop42=s.gpv_pn;
			}
		}

		s.prop43=s.getQueryParam('ID','','?'+gC('SITESERVER')); //Save ID parameter from SITESERVER cookie

		/* ServiceTag presented on page */
		if(!s.prop17)s.prop17=s.getHTMLtag('input','servicetagmetricsid','id','value');

		/* Set events based on pageName */
		if(s.pageName.indexOf('order^recentorders')>-1||s.pageName.indexOf('order^details')>-1||s.pageName.indexOf('order^singlestatus')>-1||s.pageName.indexOf('order^multiplestatus')>-1)s.events=s.apl(s.events,'event11',',',2);
		if(s.pageName.indexOf('dellstore^basket')>-1)s.events=s.apl(s.events,'scView',',',2); //set cart visit (config in SC once per visit)
		if(s.pageName.indexOf('chkout')>-1)s.events=s.apl(s.events,'scCheckout',',',2); //set checkout start (config in SC once per visit)

		/* Products/Events Handling */
		if(s.pageName.indexOf('sna^productdetail')>-1||s.pageName.indexOf('content^products^productdetails')>-1){
			var prod=s.getQueryParam('sku,oc');
			s.events=s.events?s.events:'';
			if(s.events.indexOf('prodView,event2')>-1)s.events=s.repl(s.events,'prodView,event2','');
			if(prod&&s.events.indexOf('event3')>-1){
				if(prod.indexOf(','))prod=s.repl(prod,',',',;');
				s.products=s.apl(s.products,';'+prod,',',2);
			}else{
				if(prod){
					prod=s.dedupVal('sku_oc',prod);
					if(prod){
						if(prod.indexOf(','))prod=s.repl(prod,',',',;');
						s.products=s.apl(s.products,';'+prod,',',2);
						s.events=s.apl(s.events,'prodView',',',2);
						s.events=s.apl(s.events,'event2',',',2);
					}
				}
			}
		}

		/* Manage config starts by unique order code - most recent unique value per session will set the event */
		if(s.pageName.indexOf('dellstore^config')>-1){
			var oc=s.getQueryParam('oc');
			if(oc)oc=s.dedupVal('ocstart',oc);
			if(oc){
				s.products=s.apl(s.products,';'+oc,',',2);
				s.events=s.apl(s.events,'event10',',',2);
				s.events=s.apl(s.events,'prodView',',',2);
				s.events=s.apl(s.events,'event2',',',2);
			}
		}

		/* Final check to see if we have products with no events, clear products if we do */
		if(s.products){
			s.products=s.events?s.products:'';
			s.events=s.events?s.events:'';
			/* Check for semicolon in products */
			if(s.products&&s.products.indexOf(';')!=0&&s.events.indexOf('scAdd')>-1){
				var p=s.products;
				if(p.indexOf(';')>-1&&p.indexOf(',;')>-1){
					s.products=';'+p;
				}else if(p.indexOf(';')>-1){
					var pa=s.split(p,';');
					p=';'+pa[0];
					for(var i=1;i<pa.length;i++)p+=',;'+pa[i];
					s.products=p;
				}else{
					s.products=';'+p;
				}
			}
		}

		/* Set events based on page URL */
		var loc=document.location.href;
		if(loc.indexOf('/financing/app.aspx')>-1||loc.indexOf('/financing/us_ca/app.aspx')>-1||loc.indexOf('/financing/process.aspx')>-1)s.events=s.apl(s.events,'event8',',',2); //set application start
		if(loc.indexOf('/financing/approved.aspx')>-1||loc.indexOf('/financing/us_ca/approved.aspx')>-1||loc.indexOf('/financing/declined.aspx')>-1 ||loc.indexOf('/financing/reviewed.aspx')>-1||loc.indexOf('/financing/us_ca/reviewed.aspx')>-1)s.events=s.apl(s.events,'event9',',',2); //set application complete

		/* Set S&P Visits */
		if(loc.indexOf('accessories')>-1||s.pageName.indexOf('accessories')>-1)s.events=s.apl(s.events,'event12',',',2);

		/* Read and format cookie values */
		s.prop45=s.c_r('GAAuth');
		if(!s.prop45){
			var cookieArray=document.cookie.split(';');
			for(var i=0;i<cookieArray.length;i++){
				var cookie=cookieArray[i];
				while (cookie.charAt(0)==' ')cookie=cookie.substring(1,cookie.length);
				if(cookie.match(/gahot=/i))s.prop45=cookie.substring(6,cookie.length);
			}
		}
		s.prop46=s.c_r('Profile')?s.c_r('Profile'):s.c_r('profile');
		s.prop48=s.parseCookie('prt:Prof','cnm,sid,cs',','); //issues with this cookie read for prt:Prof?
		s.prop16=s.parseCookie('StormPCookie','penv',',');

		/* Read and store Baynote cookies */
		var bn_search=s.c_r('search_bn'); //Added 9/9/10: Get Baynote Search cookie
		if(bn_search)s.eVar11=bn_search;
		var bn_snp=s.c_r('snp_bn'); //Added 9/9/10: Get Baynote SNP cookie
		if(bn_snp)s.eVar13=bn_snp;

		s.prop16=s.getQueryParam('penv','',s.prop16);

		s.prop12=(s.prop45)?'logged in':'not logged in';

		/* Added 07/09/10: special processing for error pages */
		if((s.pageName.indexOf('content^public^notfound')>-1)||(s.pageName.indexOf('content^public^error')>-1)){
			if(!s.prop44){ //put URL that resulted in error page in prop44
				var errQP=s.getQueryParam('searched');
				if(!errQP)errQP=s.getQueryParam('aspxerrorpath');
				s.prop44=errQP?errQP.replace(':80',''):document.location.href;
			}
			//Added 07/09/10: prevent error pages from being misclassified as "public" if referrer external or no LWP cookie
			var refdom=parseUri(document.referrer).host.toLowerCase();
			if(refdom.indexOf('dell.')==-1||!gC('lwp'))s.prop5='not set';
		}

		/* FIX: blank eVar30 value when pagename contains "ecomm" */
		loc=document.location.href;
		if(loc.indexOf('ecomm')>-1&&s.eVar30){
			s.eVar30='';
			if(s.events.indexOf('event10')>-1){
				var eventlist=s.split(s.events,',');
				for(i in eventlist){
					if(eventlist[i]=='event10')eventlist[i]='';
				}
				s.events='';
				for(i in eventlist){
					if(eventlist[i])s.events=s.apl(s.events,eventlist[i],',',2);
				}
			}
		}

		/* FIX: prefix ANAV caption */
		loc=document.location.href;
		loc=((loc&&loc.indexOf('?')>-1)?loc.substring(0,loc.indexOf('?')):loc).toLowerCase();

		/* T&T integration */
		s.tnt=s.trackTNT();

		/* iPerceptions integration */
		s.iPerceptionsURL =
				((window.location.protocol=='https:')?'https://si.cdn':'http://i')
			+ '.dell.com/images/global/omniture/ipge'
			+	((s_account.substring(s_account.length-3)=='dev')?'_sit':'')
			+	'.htm';
		s.GenesisExchange.setExchangePageURL('iPerceptions',s.iPerceptionsURL);

		/* navigation method - merchandising eVar */
		/* Added 07/09/10: add check for ~ck=gzilla or ref=gzilla to set eVar40 to 'banner' */
		if(s.inList('event6',s.events,',')){
			s.eVar40='site search';
		}else if(s.eVar30&&s.eVar31){
			s.eVar40='anav';
			if(s.p_gh())s.linkTrackVars=s.apl(s.linkTrackVars,'eVar40',',',2);
		}else if(s.getQueryParam('~ck').toLowerCase()=='mn'){
			s.eVar40='masthead';
		}else if(s.getQueryParam('~ck').toLowerCase()=='hbn'||s.getQueryParam('ref').toLowerCase()=='hbn'||s.getQueryParam('~ck').toLowerCase()=='bnn'||s.getQueryParam('ref').toLowerCase()=='bnn'||s.getQueryParam('ref').toLowerCase()=='gzilla'||s.getQueryParam('~ck').toLowerCase()=='gzilla'){
			s.eVar40='banner';
		}else if(s.pageName){
			if(s.pageName.indexOf('advisorweb')>-1){
				s.eVar40='advisor';
			}
		}

		/* Added 07/09/10 release, changed on 10/01/10: substitute local domain for referrer if referrer starts with *nicos.co.jp */
		if(getDomainLevels(document.referrer,3)=='nicos.co.jp'){
			s.referrer=document.location.protocol+'//'+document.location.host.toString()+'/nicos-payment-processing';
		}
	}

	/* END dell.com Only Logic */

	/* Added 07/09/10: Get percent of page viewed */
	var ppv_c=s.getPercentPageViewed(s.pageName);	//Get values for prior page, pass this page's identifier
	if(ppv_c&&ppv_c.length>=4){	//Were values for the prior page returned?
		var ppv_pn=(ppv_c.length>0)?(ppv_c[0]):(''); //Extract last page's identifier
		var ppv_v=((ppv_c.length>0)?(ppv_c[1]):('')) //Extract last page's total % viewed
			+((ppv_c.length>2)?('|'+ppv_c[2]):(''));	//Extract last page's initial % viewed, separated by '|'
		if(ppv_pn&&ppv_v){	//Was pageName and percent % viewed values found?
			s.prop34=ppv_pn;	//Store percent page viewed values in the variable of your choice
			s.prop31=ppv_v;	//Store the page identifier in the variable of your choice
		}
	}

	/* Campaign tracking */
	if(!s.campaign)s.campaign=s.getQueryParam('cid'); //landing_page_cid
	if(!s.eVar1)s.eVar1=s.getQueryParam('lid'); //landing_page_lid
	var cidLID = s.campaign +"::"+ s.eVar1;
	cidLID = s.getValOnce(cidLID,'cidlid',0);
	cidLID = cidLID.split('::');
	if(cidLID.length > 1){
		s.campaign = cidLID[0];
		s.eVar1 = cidLID[1];
	}else{
		s.campaign = '';
		s.eVar1 = '';
	}

	if(!s.eVar2 && s.campaign != ''){
		var dgc=s.getQueryParam('dgc');
		s.eVar2=dgc;
	} //landing_page_dgv
	s.eVar2=s.getValOnce(s.eVar2,'dgc',0);
	if(!s.eVar3)s.eVar3=s.getQueryParam('st'); //external_search_keyword
	s.eVar3=s.getValOnce(s.eVar3,'st',0);
	if(!s.eVar28)s.eVar28=s.getQueryParam('acd'); //affiliate code
	s.eVar28=s.getValOnce(s.eVar28,'acd',0);
	if(!s.eVar43)s.eVar43=s.getQueryParam('mid'); //aprimo message id
	s.eVar43=s.getValOnce(s.eVar43,'mid',0);
	if(!s.eVar44)s.eVar44=s.getQueryParam('rid'); //aprimo recipient id
	s.eVar44=s.getValOnce(s.eVar44,'rid',0);

	/* ODG visits */
	if(typeof(s.linkType)=='undefined'){
		s.odgValues='|af|ba|bf|cj|co|db|dc|ds|ec|em|ls|mb|ms|mt|rs|sm|ss|st|';
		var countrySegment='';
		if(s.prop2&&s.eVar32)countrySegment=s.prop2+'-'+s.eVar32;
		if(countrySegment){
			var d=new Date(),valueNotDeleted=true;
			if(s.c_r('e21')&&s.c_r('e21').indexOf(countrySegment)>-1){
				var e21Array=s.split(s.c_r('e21'),'::');
				for (i in e21Array){
					if(e21Array[i].toString().indexOf(countrySegment)>-1){
						var e21Array2=s.split(e21Array[i],':');
						if(d.getTime()>e21Array2[1]){
							if(e21Array.length==1){
								d.setTime(d.getTime()-86400000); //one day ago
								s.c_w('e21','',d);
							}else{
								e21Array.splice(i,1);
								d.setTime(d.getTime()+30*86400000); //30 days from now
								s.c_w('e21',e21Array,d);
							}
							valueNotDeleted=false;
						}
						if(valueNotDeleted){
							var tempReferrer=s.d.referrer.substring(0,s.d.referrer.indexOf('?'));
							if((s.eVar2&&s.odgValues.indexOf(s.eVar2.toLowerCase()+'|')==-1&&s.eVar2!='ir')||(!s.getQueryParam('dgc')&&tempReferrer&&!s.isInternal(tempReferrer))){
								if(e21Array.length==1){
									d.setTime(d.getTime()-86400000); //24 hours ago
									s.c_w('e21','',d);
								}else{
									e21Array.splice(i,1);
									d.setTime(d.getTime()+30*86400000); //30 days from now
									s.c_w('e21',e21Array,d);
								}
							}else{
								s.events=s.apl(s.events,'event21',',',1);
							}
						}
					}
				}
			}else{
				if((s.eVar2&&s.odgValues.indexOf(s.eVar2.toLowerCase()+'|')>-1)){
					s.events=s.apl(s.events,'event21',',',1);
					d.setTime(d.getTime()+30*86400000); //thirty days from now
					var e21Cookie=s.c_r('e21');
					e21Cookie=e21Cookie?e21Cookie+'::'+countrySegment+':'+d.getTime():countrySegment+':'+d.getTime();
					s.c_w('e21',e21Cookie,d);
				}
			}
		}
	}

	/* Internal Promos tracking */
	if(dgc&&dgc.toLowerCase()=='ir'){ //if a IR code is present, clear other campaign variables
		s.eVar29=s.getQueryParam('cid')+':'+s.getQueryParam('lid');
		s.eVar29=s.getValOnce(s.eVar29,'ir',0);
		s.campaign=s.eVar1=s.eVar2=s.eVar3=s.eVar28='';
	}

	if(s.tCall()){
		/* Calculate bounce rate for paid searches (for the Search Center POC) */
		s.SEMvar=s.getQueryParam('s_kwcid');
		s.SEMvar=s.getValOnce(s.SEMvar,'SEM_var',0);
		s.clickPast(s.SEMvar,'event46','event47','br_psearch');
		if(s.isInternal(document.location.href)){
            /** if the action depth is 1, then fire event44 and if it is 2 then fire event45 - (removed clickpast code) implemented by Jason Case on 25 April 2011 **/
        	if(s.ActionDepthTest){
                if(typeof s.gpv_pn != 'undefined' && s.gpv_pn != s.pageName){
                    s.pdvalue=s.getActionDepth("s_depth");
                    if(s.pdvalue == 1) s.events=s.apl(s.events,'event44',',',2);
                    if(s.pdvalue == 2) s.events=s.apl(s.events,'event45',',',2);
                    s.ActionDepthTest=false;
                }
            	
            }
		}
	}

	/* File downloads */
	s.downloadURL=s.downloadLinkHandler();
	if(s.downloadURL){
		s.prop33=s.downloadURL;
		s.prop33=s.prop33.indexOf('//')?s.prop33.substring(s.prop33.indexOf('//')+2):s.prop33;
		s.eVar23=s.prop33;
		s.prop32=s.pageName;
		s.events=s.apl(s.events,'event24',',',2);
		s.linkTrackVars=s.apl(s.linkTrackVars,'prop32',',',2);
		s.linkTrackVars=s.apl(s.linkTrackVars,'prop33',',',2);
		s.linkTrackVars=s.apl(s.linkTrackVars,'eVar23',',',2);
		s.linkTrackVars=s.apl(s.linkTrackVars,'events',',',2);
		s.linkTrackEvents=s.apl(s.linkTrackEvents,'event24',',',2);
	}

	s.manageVars('lowercaseVars','events',2); //force all variables to lowercase

	s.linkTrackVars=s.apl(s.linkTrackVars,'prop49',',',2);
	s.linkTrackVars=s.apl(s.linkTrackVars,'prop46',',',2);
	s.linkTrackVars=s.apl(s.linkTrackVars,'server',',',2); //Add 'server' to link track vars

     
    /**
     * Tracking Site Search for KW on 3rd party sites - implemented by Jason Case 25 Apr 2011
     */ 
     if(s.isInternal(document.location.href) && !s.onDellCMS()){
        s.prop7 = s.getQueryParam('sk,k,q','::');
        if(s.prop7){
			s.prop7=s.prop7.toLowerCase();
			s.eVar36=s.prop7;
			var t_search=s.getValOnce(s.eVar36,'v36',0);
			if(t_search){
				s.events=s.apl(s.events,'event6',',',2);
				s.prop42=s.gpv_pn;
			}
		}
     }
     
     /** This is for reading the EQuoteID cookie into an eVar - implemented by Jason Case 25 Apr 2011 */    
        s.eVar7 = s.c_r('EQuoteID');  
     /** Read the link_number parameter for EPP info  - implemented by Jason Case 25 Apr 2011 **/
        s.eVar45 = s.getQueryParam('link_number'); 
     /** Capture the Release ID for a driver download - implemented by Jason Case 25 Apr 2011 **/
        s.prop24 = s.getQueryParam('releaseid');  
     /** Capture the Doc ID - implemented by Jason Case 25 Apr 2011 **/
        s.prop51 = s.getQueryParam('docid');     
     /** Custom Pageview Metric - implemented by Jason Case 25 Apr 2011 **/
        s.events = s.events=s.apl(s.events,'event37',',',2);  
     /** View by Usage tabs and sub tabs - implemented by Jason Case 27 Apr 2011 **/
        s.eVar14 = s.getQueryParam('avt,avtsub'); 


	/** Channel Manager - replacing the Unified Sources VISTA rule. Added 17 May 2011**/
 	s.channelManager('ba,st,em,af,cj,ss,dm,dc,sm,ec,jp,ad,ms,tv,ds,rs,mb,co,cid','','0',1,'s_dl');
 	
 	//put natural search keywords into eVar49
	if(s._keywords && s._keywords != 'n/a' && s._channel == 'Natural Search'){
		s.eVar49 = s._keywords;
		//concatenate natural search keyword with the url into eVar52 - ticket #358
		s.eVar52 = s._keywords +":"+ document.location.href;
	}
	var CID = s.getQueryParam('cid');
	if(CID && s.campaign){
		s.eVar48 = s.campaign;
	}else if(CID){
	}else if(location.href.indexOf('s_kwcid') > -1){
	    s.eVar48 = 'SearchCenter';
	}else if(s._keywords && s._keywords != 'n/a'){
		s.eVar48 = s._partner+ " organic";
	}else if(s._referrer != 'Direct Load' && s._referrer != '' && s._referringDomain != '' &&
			 s._referringDomain.indexOf('dell.') == -1 &&
			 s._referringDomain.indexOf('dellfinancialservices.com') == -1 &&
			 s._referringDomain.indexOf('dellcomputers.') == -1 &&
			 s._referringDomain.indexOf('dellcomputer.') == -1){
		var domain = s._referringDomain.split('.');
  		s.eVar48 = (domain.length>2 ? (domain[domain.length-3] +"."):'') +domain[domain.length-2] +"."+ domain[domain.length-1];
	}
	s.eVar51 = s.eVar2;
	if(s.eVar51==undefined || s.eVar51==''){
    	if(s._channel){
			s.eVar51 = s._channel;
		}else if(s._keywords){
			s.eVar51 = 'Organic Search';
		}else if(s._referringDomain){
			s.eVar51 = s._referringDomain;
		}
	}

	s.eVar51 = s.crossVisitParticipation(s.eVar51,'s_channelstack','90','5',' > ','purchase','1');
	
	/** Grab s_vi value and store in prop47 **/
    s.prop47 = 'D=s_vi';
    
    /** product details - ticket #358 **/
    if(s.prop1=='productdetails')
        s.events=s.apl(s.events,'event46',',',2);

	/** Tracking RGID - ticket #384 **/
    s.prop53 = s.getQueryParam('rgid');
    
    /** Putting pageName into an eVar - ticket #396 **/
    s.eVar53 = 'D=pageName';
    
    /** Setting the URL to prop14 - ticket #278 **/
    s.prop14 = (location.href.split('?'))[0];
    
    /** Setting event41 when support and contact are found in the URL **/
    if(location.href.indexOf('support') > -1 && location.href.indexOf('contact') > -1)
    	s.events = s.apl(s.events,'event41',',',2);

    /** Set User Guide Parameters - ticket #243 **/
	s.prop58 = s.getQueryParam('~subcat') +':'+ s.getQueryParam('~cat');
	if(s.prop58 == ':') s.prop58 = '';

    /** Adding TeaLeaf Code - implemented by Jason Case 25 Apr 2011 **/
    if (typeof(TeaLeaf) != "undefined" &&  typeof(TeaLeaf.Client) != "undefined") {
           var OMTagsToTL = new TeaLeaf.Event(TeaLeaf.$C("UIEventAppInfo"), "OMTagsToTL");
                  var teaLeafArray = new Array();
                    teaLeafArray = ["tl_pageName",TeaLeaf.Event.tlFormatXML(s_dell.pageName),
                                    "tl_events", TeaLeaf.Event.tlFormatXML(s_dell.events),
                                    "tl_campaign", TeaLeaf.Event.tlFormatXML(s_dell.campaign),
                                    "tl_c7", TeaLeaf.Event.tlFormatXML(s_dell.prop7),
                                    "tl_c8", TeaLeaf.Event.tlFormatXML(s_dell.prop8),
                                    "tl_c9", TeaLeaf.Event.tlFormatXML(s_dell.prop9),
                                    "tl_c10", TeaLeaf.Event.tlFormatXML(s_dell.prop10),
                                    "tl_c12", TeaLeaf.Event.tlFormatXML(s_dell.prop12),
                                    "tl_c23", TeaLeaf.Event.tlFormatXML(s_dell.prop23),
                                    "tl_dgv",TeaLeaf.Event.tlFormatXML(s_dell.eVar2)];
           OMTagsToTL.tlAddData(teaLeafArray);
           OMTagsToTL.tlSend();
    }
    
    /** Floating footer code - added 26 Oct 2011 by Jason Case **/
    if(document.getElementById("floatingToolbar")){
        if(s.c_r('hideDellToolbar')){
            s.eVar38 = 'floating toolbar: closed';
		}else{
            s.eVar38 = 'floating toolbar: open';
		}
	}else{
  		s.eVar38 = 'floating toolbar: no toolbar';
	}
	
	/** Capture Partner Type and Parter Status - Updated to add the 'c' 5 Jan 2012 by Jason Case **/
	if(document.getElementById("ctl00_ctl00_PartnerTypeStatus")){
	    var element = document.getElementById("ctl00_ctl00_PartnerTypeStatus");
        s.eVar57 = element.value;
	}else if(document.getElementById("ctl00_PartnerTypeStatus")){
	    var element = document.getElementById("ctl00_PartnerTypeStatus");
        s.eVar57 = element.value;
	}
	
	/** Capture the PCID from the mbox cookie and place it in prop59 - added on 7 Dec 11 by jcase */
	s.mboxCookie = s.c_r('mbox');
	if(s.mboxCookie){
	    try{
            s.mboxCookie = s.mboxCookie.split('|');
			for (var i in s.mboxCookie){
				if(s.mboxCookie[i].indexOf('PC')>-1)
				    s.pcid = i;
			}
			s.pcid = s.mboxCookie[s.pcid];
			s.pcid = s.pcid.split('#');
			s.pcid = s.pcid[1];
			s.prop59 = s.pcid;
		}catch(err){
			//console.debug('error parsing pcid in mbox cookie:  '+err);
		}
	}//end mbox code
    
	/** Profiling cookie creation and updating **/
	s.c_r('s_hwp')=='' ? s.createData() : s.updateData();
	
    doPluginsRanAlready = true;
}
s_dell.doPlugins=s_dell_doPlugins

/*
 * Partner Plugin: Gigya v3 (BEGIN)  //added 12 July for ticket #373
 */
var gigya_omniture_conf = {
    linkName: 'Gigya Action',
  eventMap : [
    {
      gigEvent:"login",
      omtrEvents:["event42"],
      mapVars:["eVar55=user.loginProvider", "eVar54=getAge()", "eVar54=getGender()", "eVar54=getiRank()"]
    },
    {
      gigEvent:"sendDone",
      omtrEvents:["event43"],
      mapVars:["eVar55=providers","products"]
    },
    {
      gigEvent:"commentSubmitted--disabled",
      omtrEvents:[""],
      mapVars:["eVar55=providerPostIDs","products"]
    },
    {
      gigEvent:"reactionClicked--disabled",
      omtrEvents:[""],
      mapVars:["=reaction.ID","products"]
    }
  ],
	getAge:function(evt) {
		var a=evt.user['age']
		if(typeof(a)=="number"&&a>0){
			return a;
		}
		return '?';
	},
	getGender:function(evt) {
		var g=evt.user['gender']
		if(typeof(g)=="string"&&g.length>0){
			return g;
		}
		return '?';
	},
	getiRank:function(evt) {
		if(typeof(evt.user['iRank'])=="string"){
		  var r = parseFloat(evt.user['iRank']).toFixed(0);
		  if(r >= 0.0001) return r;
		}
		return '?';
	}
}
/*
 * Partner Plugin: Gigya v3 (END)
 */
/* ********************* S7 Viewer Tracking ***************************** */
s_dell.baseCategory = "";
s_dell.viewerFrame = "";
s_dell.lastFrame = "";
s_dell.viewerType = "unknown";
s_dell.asset = "";
s_dell.internalCounter = 0;

function s7ComponentEvent (objectID, componentClass, instanceName, timeStamp, eventData) {
	s7track(eventData);
};


function s7pullProductParam(query) {
    if (!query) return "";

    var dQuery;
    try {
        dQuery = decodeURIComponent(query);
    } catch (e) {
        dQuery = query;
    }
    var lQuery = dQuery.toLowerCase();

    var params = ["rolloverkey", "rollover_key", "p", "productkey", "pid"];
    for (var n in params) {
        var m1 = lQuery.indexOf(params[n]+'=');
        if (m1 == undefined || m1 == -1) continue;
        m1 += params[n].length + 1;

        var m2 = lQuery.indexOf("&", m1);
        return (m2 > m1) ? dQuery.substring(m1, m2) : dQuery.substr(m1);
    }
    return "";
}

function s7track(eventInfo, rolloverInfo) {
    var eventValues = eventInfo.split(',');
    var eventType = eventValues[0].toString();
    var eventData = (eventValues.length > 1) ? unescape(eventValues[1].toString()) : "";


    var params = new Array();
    var paramsRaw = eventInfo.split(",");
    var tmp="";
    for (var param in paramsRaw) {
    	tmp = paramsRaw[param].toString();
    	if(tmp.length<100){
    	    params.push(decodeURIComponent(paramsRaw[param] + ''));
    	}
    }

    if (eventType == "SWATCH") eventType = "PAGE";
    if (eventType == "SPIN") eventType = "PAGE";
    if (eventType == "TARG") eventType = "TARGET";
    //if (eventType == "RELOAD") eventType = "SWAP";

    /*
    if (eventType == "PAGE") {
        if(eventData == "0")
             s_dell.baseCategory = "p1";
        else
             s_dell.baseCategory = "p" + parseInt(eventData)*2 + "-" + (parseInt(eventData)*2+1);
        s_dell.pageName = params[2];
        s_dell.lastFrame = s_dell.viewerFrame;
        s_dell.viewerFrame = params[1];
    } else 
    */
    if (eventType == "SWAP") {
        s_dell.lastFrame = s_dell.viewerFrame;
        s_dell.viewerFrame = params[1];
        if (params.length >= 2) {
            s_dell.asset = params[1];    
        }
    } else if (eventType == "LOAD") {
        if (params.length > 1) {
            s_dell.viewerType = params[1];
            var assetPos = 6;   // sdk based viewers?
            if (s_dell.viewerType == 3) assetPos = 7; // eCatalog, special case
            else if (s_dell.viewerType == 2) assetPos = 7; // imageset, special case
            else if (s_dell.viewerType == 5) assetPos = 7; // old (?) video viewer
            else if (s_dell.viewerType < 100) assetPos = 7; // thought the default was 5th pos?

            if (params.length >= assetPos)
                s_dell.asset = params[assetPos]+'';
        }
    }


    s_dell.prop4='';


    s_dell.internalCounter++;

 /*
    if (eventType == "LOAD") {
        s_dell.prop4=params[1];
        s_dell.linkTrackVars='prop4';
        return s_dell.tl(this,'o','Scene 7 Load');
    }



   if (eventType == "PAGE") {
        s_dell.prop4=s_dell.pageName;
        s_dell.linkTrackVars='prop4';

        return s_dell.tl(this,'o','Scene 7 Page');
    }
    */
    if(eventType == "ZOOM"){
        s_dell.prop4= 'targ:'+params[1];
        s_dell.linkTrackVars='prop4';
        return s_dell.tl(this,'o','Scene 7 Zoom');
    
    }


    if (eventType == "TARGET") {
        s_dell.prop4=params[0];
        s_dell.linkTrackVars='prop4';

        return s_dell.tl(this,'o','Scene 7 Target');
    }

    if (eventType == "SWAP") {
        s_dell.prop4= s_dell.asset;
        s_dell.linkTrackVars='prop4';

        return s_dell.tl(this,'o','Scene 7 Swap');
    }

    if (eventType == "HREF") {
        s_dell.prop4=(rolloverInfo==undefined?s7pullProductParam(eventData):rolloverInfo);
        s_dell.linkTrackVars='prop4';

        return s_dell.tl(this,'o','Scene 7 Href');
    }

    s_dell.internalCounter--;//only count tracked events
}

/* ********************* END S7 Viewer Tracking ***************************** */
 
/* ************************ PLUGINS SECTION *********************** */
/* You may insert any plugins you wish to use here. */

/*
 * Plugin: getQueryParam 2.3
 */
s_dell.getQueryParam=new Function("p","d","u",""
+"var s=this,v='',i,t;d=d?d:'';u=u?u:(s.pageURL?s.pageURL:s.wd.locati"
+"on);if(u=='f')u=s.gtfs().location;while(p){i=p.indexOf(',');i=i<0?p"
+".length:i;t=s.p_gpv(p.substring(0,i),u+'');if(t){t=t.indexOf('#')>-"
+"1?t.substring(0,t.indexOf('#')):t;}if(t)v+=v?d+t:t;p=p.substring(i="
+"=p.length?i:i+1)}return v");
s_dell.p_gpv=new Function("k","u",""
+"var s=this,v='',i=u.indexOf('?'),q;if(k&&i>-1){q=u.substring(i+1);v"
+"=s.pt(q,'&','p_gvf',k)}return v");
s_dell.p_gvf=new Function("t","k",""
+"if(t){var s=this,i=t.indexOf('='),p=i<0?t:t.substring(0,i),v=i<0?'T"
+"rue':t.substring(i+1);if(p.toLowerCase()==k.toLowerCase())return s."
+"epa(v)}return ''");

/*
 * Plugin: getValOnce 0.2 - get a value once per session or number of days
 */
s_dell.getValOnce=new Function("v","c","e",""
+"var s=this,k=s.c_r(c),a=new Date;e=e?e:0;if(v){a.setTime(a.getTime("
+")+e*86400000);s.c_w(c,v,e?a:0);}return v==k?'':v");

/*
 * Plugin: getPreviousValue_v1.0 - return previous value of designated
 *  variable (requires split utility)
 */
s_dell.getPreviousValue=new Function("v","c","el",""
+"var s=this,t=new Date,i,j,r='';t.setTime(t.getTime()+1800000);if(el"
+"){if(s.events){i=s.split(el,',');j=s.split(s.events,',');for(x in i"
+"){for(y in j){if(i[x]==j[y]){if(s.c_r(c)) r=s.c_r(c);v?s.c_w(c,v,t)"
+":s.c_w(c,'no value',t);return r}}}}}else{if(s.c_r(c)) r=s.c_r(c);v?"
+"s.c_w(c,v,t):s.c_w(c,'no value',t);return r}");

/*
 * DynamicObjectIDs v1.4: Setup Dynamic Object IDs based on URL
 */
s_dell.setupDynamicObjectIDs=new Function(""
+"var s=this;if(!s.doi){s.doi=1;if(s.apv>3&&(!s.isie||!s.ismac||s.apv"
+">=5)){if(s.wd.attachEvent)s.wd.attachEvent('onload',s.setOIDs);else"
+" if(s.wd.addEventListener)s.wd.addEventListener('load',s.setOIDs,fa"
+"lse);else{s.doiol=s.wd.onload;s.wd.onload=s.setOIDs}}s.wd.s_semapho"
+"re=1}");
s_dell.setOIDs=new Function("e",""
+"var s=s_c_il["+s_dell._in+"],b=s.eh(s.wd,'onload'),o='onclick',x,l,u,c,i"
+",a=new Array;if(s.doiol){if(b)s[b]=s.wd[b];s.doiol(e)}if(s.d.links)"
+"{for(i=0;i<s.d.links.length;i++){l=s.d.links[i];c=l[o]?''+l[o]:'';b"
+"=s.eh(l,o);z=l[b]?''+l[b]:'';u=s.getObjectID(l);if(u&&c.indexOf('s_"
+"objectID')<0&&z.indexOf('s_objectID')<0){u=s.repl(u,'\"','');u=s.re"
+"pl(u,'\\n','').substring(0,97);l.s_oc=l[o];a[u]=a[u]?a[u]+1:1;x='';"
+"if(c.indexOf('.t(')>=0||c.indexOf('.tl(')>=0||c.indexOf('s_gs(')>=0"
+")x='var x=\".tl(\";';x+='s_objectID=\"'+u+'_'+a[u]+'\";return this."
+"s_oc?this.s_oc(e):true';if(s.isns&&s.apv>=5)l.setAttribute(o,x);l[o"
+"]=new Function('e',x)}}}s.wd.s_semaphore=0;return true");

/*
 * Plugin: downloadLinkHandler 0.5 - identify and report download links
 */
s_dell.downloadLinkHandler=new Function("p",""
+"var s=this,h=s.p_gh(),n='linkDownloadFileTypes',i,t;if(!h||(s.linkT"
+"ype&&(h||s.linkName)))return '';i=h.indexOf('?');t=s[n];s[n]=p?p:t;"
+"if(s.lt(h)=='d')s.linkType='d';else h='';s[n]=t;return h;");

/*
 * Utility Function: p_gh
 */
s_dell.p_gh=new Function(""
+"var s=this;if(!s.eo&&!s.lnk)return '';var o=s.eo?s.eo:s.lnk,y=s.ot("
+"o),n=s.oid(o),x=o.s_oidt;if(s.eo&&o==s.eo){while(o&&!n&&y!='BODY'){"
+"o=o.parentElement?o.parentElement:o.parentNode;if(!o)return '';y=s."
+"ot(o);n=s.oid(o);x=o.s_oidt}}return o.href?o.href:'';");

/*
 * Utility clearVars v0.1 - clear variable values (requires split 1.5)
 */
s_dell.clearVars=new Function("l","f",""
+"var s=this,vl,la,vla;l=l?l:'';f=f?f:'';vl='pageName,purchaseID,chan"
+"nel,server,pageType,campaign,state,zip,events,products';for(var n=1"
+";n<51;n++)vl+=',prop'+n+',eVar'+n+',hier'+n;if(l&&(f==1||f==2)){if("
+"f==1){vl=l}if(f==2){la=s.split(l,',');vla=s.split(vl,',');vl='';for"
+"(x in la){for(y in vla){if(la[x]==vla[y]){vla[y]=''}}}for(y in vla)"
+"{vl+=vla[y]?','+vla[y]:'';}}s.pt(vl,',','p_clr',0);return true}else"
+" if(l==''&&f==''){s.pt(vl,',','p_clr',0);return true}else{return fa"
+"lse}");
s_dell.p_clr=new Function("t","var s=this;s[t]=''");

/*
 * Plugin Utility: apl v1.1
 */
s_dell.apl=new Function("l","v","d","u",""
+"var s=this,m=0;if(!l)l='';if(u){var i,n,a=s.split(l,d);for(i=0;i<a."
+"length;i++){n=a[i];m=m||(u==1?(n==v):(n.toLowerCase()==v.toLowerCas"
+"e()));}}if(!m)l=l?l+d+v:v;return l");

/*
 * Utility: inList v1.0 - find out if a value is in a list
 */
s_dell.inList=new Function("v","l","d",""
+"var s=this,ar=Array(),i=0,d=(d)?d:',';if(typeof(l)=='string'){if(s."
+"split)ar=s.split(l,d);else if(l.split)ar=l.split(d);else return-1}e"
+"lse ar=l;while(i<ar.length){if(v==ar[i])return true;i++}return fals"
+"e;");

/*
 * Plugin Utility: split v1.5 (JS 1.0 compatible)
 */
s_dell.split=new Function("l","d",""
+"var i,x=0,a=new Array;while(l){i=l.indexOf(d);i=i>-1?i:l.length;a[x"
+"++]=l.substring(0,i);l=l.substring(i+d.length);}return a");

/*
 * Plugin Utility: replace v1.0
 */
s_dell.repl=new Function("x","o","n",""
+"var i=x.indexOf(o),l=n.length;while(x&&i>=0){x=x.substring(0,i)+n+x."
+"substring(i+o.length);i=x.indexOf(o,i+l)}return x");

/*
 * Utility manageVars v0.2 - clear variable values (requires split 1.5)
 */
s_dell.manageVars=new Function("c","l","f",""
+"var s=this,vl,la,vla;l=l?l:'';f=f?f:1 ;if(!s[c])return false;vl='pa"
+"geName,purchaseID,channel,server,pageType,campaign,state,zip,events"
+",products,transactionID';for(var n=1;n<51;n++){vl+=',prop'+n+',eVar"
+"'+n+',hier'+n;}if(l&&(f==1||f==2)){if(f==1){vl=l;}if(f==2){la=s.spl"
+"it(l,',');vla=s.split(vl,',');vl='';for(x in la){for(y in vla){if(l"
+"a[x]==vla[y]){vla[y]='';}}}for(y in vla){vl+=vla[y]?','+vla[y]:'';}"
+"}s.pt(vl,',',c,0);return true;}else if(l==''&&f==1){s.pt(vl,',',c,0"
+");return true;}else{return false;}");
s_dell.clearVars=new Function("t","var s=this;s[t]='';");
s_dell.lowercaseVars=new Function("t",""
+"var s=this;if(s[t]){s[t]=s[t].toLowerCase();}");

/*
 * Custom Dell Plugin: parseCookie for desired params, format as query string
 * (requires s.split, s.apl)
 */
s_dell.parseCookie=new Function("c","pl","d",""
+"var s=this,pla,ca,o='',j,l;c=s.c_r(c);if(c){pla=s.split(pl,d);ca=s.s"
+"plit(c,'&');for(x in pla){for(y in ca){j=pla[x]+'=';l=''+ca[y];l=l.t"
+"oLowerCase();l=l.indexOf(j.toLowerCase());if(l>-1)o=s.apl(o,ca[y],'&"
+"',0)}}if(o)o='?'+o;}return o");

/*
 * Custom Dell Plugin: dedupVal
 */
s_dell.dedupVal=new Function("c","v",""
+"var s=this,r;if(s.c_r(c)){r=s.c_r(c);if(v==r)return '';else s.c_w(c,"
+"v)}else{s.c_w(c,v)}return v");

/*
 * TNT Integration Plugin v1.0
 */
s_dell.trackTNT =new Function("v","p","b",""
+"var s=this,n='s_tnt',p=p?p:n,v=v?v:n,r='',pm=false,b=b?b:true;if(s."
+"getQueryParam){pm=s.getQueryParam(p);}if(pm){r+=(pm+',');}if(s.wd[v"
+"]!=undefined){r+=s.wd[v];}if(b){s.wd[v]='';}return r;");

/*
 * GenesisExchange v0.3.1 (compact)
 */
s_dell.createGEObject=new Function("s",""
+"var _g=new Object;_g.s=s;_g.p=new Object;_g.setPartnerEventHandler="
+"function(pId,eh){if(!this.p[pId]){this.p[pId]=new Object;}this.p[pI"
+"d].__eh=eh;};_g.firePartnerEvent=function(pId,eId,ePm){this.p[pId]."
+"__eh(eId,ePm);};_g.setExchangePageURL=function(pId,url){if(!this.p["
+"pId]){this.p[pId]=new Object;}this.p[pId].__ep=url;};_g.getPageData"
+"=function(pId){var q='';if(this.p[pId]&&this.p[pId].__ep){q+='ge_pI"
+"d='+this._euc(pId)+'&ge_url='+this._euc(this.p[pId].__ep)+'&pageURL"
+"='+this._euc(document.location.href);}var v='pageName,server,channe"
+"l,pageType,products,events,campaign,purchaseID,hier1,hier2,hier3,hi"
+"er4,hier5';for(var i=1;i<=50;i++){v+=',prop'+i+',eVar'+i;}var a=thi"
+"s._split(v,',');for(var i=0;i<a.length;i++){if(this.s[a[i]]){q+=(q?"
+"'&':'')+a[i]+'='+this._euc(this.s[a[i]]);}}return q;};_g.getObjectF"
+"romQueryString=function(qsParam){var v=this._getQParam(qsParam);var"
+" r=new Object;if(v){v=this._duc(v);l=this._split(v,'&');for(i=0;i<l"
+".length;i++){kv=this._split(l[i],'=');r[kv[0]]=this._duc(kv[1]);}}r"
+"eturn r;};_g.productsInsert=function(p,e,v){var i=0,j=0,r='',pd=thi"
+"s._split(p,',');for(i=0;i<pd.length;i++){if(i>0){r+=',';}var el=thi"
+"s._split(pd[i],';');for(j=0;j<6;j++){if(j<4){r+=(el.length>j?el[j]:"
+"'')+';';}else if(j==4){r+=(el[j]?el[j]+'|':'')+e+';';}else if(j==5)"
+"{r+=(el[j]?el[j]+'|':'')+v;}}}return r;};_g._getQParam=function(k,q"
+"){var m=this,l,i,kv;if(q==undefined||!q){q=window.location.href;}if"
+"(q){i=q.indexOf('?');if(i>=0){q=q.substring(i+1);}l=this._split(q,'"
+"&');for(i=0;i<l.length;i++){kv=this._split(l[i],'=');if(kv[0]==k){r"
+"eturn kv[1];}}}return '';};_g._euc=function(str){return typeof enco"
+"deURIComponent=='function'?encodeURIComponent(str):escape(str);};_g"
+"._duc=function(str){return typeof decodeURIComponent=='function'?de"
+"codeURIComponent(str):unescape(str);};_g._split=function(l,d){var i"
+",x=0,a=new Array;while(l){i=l.indexOf(d);i=i>-1?i:l.length;a[x++]=l"
+".substring(0,i);l=l.substring(i+d.length);}return a;};return _g;");
s_dell.GenesisExchange=s_dell.createGEObject(s_dell);

/*
 * Plugin getPercentPageViewed v1.4 - determine percent of page viewed
 */
s_dell.handlePPVevents=new Function (""
+"var s=s_c_il["+s_dell._in+"];"
+"if(!s.getPPVid)return;var dh=Math.max(Math.max(s.d.body.scrollHeigh"
+"t,s.d.documentElement.scrollHeight),Math.max(s.d.body.offsetHeight,"
+"s.d.documentElement.offsetHeight),Math.max(s.d.body.clientHeight,s."
+"d.documentElement.clientHeight));var vph=s.wd.innerHeight||(s.d.doc"
+"umentElement.clientHeight||s.d.body.clientHeight),st=s.wd.pageYOffs"
+"et||(s.wd.document.documentElement.scrollTop||s.wd.document.body.sc"
+"rollTop),vh=st+vph,pv=Math.min(Math.round(vh/dh*100),100),c=s.c_r('"
+"s_ppv'),a=(c.indexOf(',')>-1)?c.split(',',4):[],id=(a.length>0)?(a["
+"0]):escape(s.getPPVid),cv=(a.length>1)?parseInt(a[1]):(0),p0=(a.len"
+"gth>2)?parseInt(a[2]):(pv),cy=(a.length>3)?parseInt(a[3]):(0),cn=(p"
+"v>0)?(id+','+((pv>cv)?pv:cv)+','+p0+','+((vh>cy)?vh:cy)):('');s.c_w"
+"('s_ppv',cn);");

s_dell.getPercentPageViewed=new Function("pgid",""
+"var s=this,pgid=(arguments.length>0)?(arguments[0]):('-'),ist=(!s.ge"
+"tPPVid)?(true):(false);if(typeof(s.linkType)!='undefined'&&s.linkTy"
+"pe!='e')return'';var v=s.c_r('s_ppv'),a=(v.indexOf(',')>-1)?v.split"
+"(',',4):[];if(a.length<4){for(var i=3;i>0;i--)a[i]=(i<a.length)?(a["
+"i-1]):('');a[0]='';}a[0]=unescape(a[0]);s.getPPVpid=pgid;s.c_w('s_p"
+"pv',escape(pgid));if(ist){s.getPPVid=(pgid)?(pgid):(s.pageName?s.pa"
+"geName:document.location.href);s.c_w('s_ppv',escape(s.getPPVid));if"
+"(s.wd.addEventListener){s.wd.addEventListener('load',s.handlePPVeve"
+"nts,false);s.wd.addEventListener('scroll',s.handlePPVevents,false);"
+"s.wd.addEventListener('resize',s.handlePPVevents,false);}else if(s."
+"wd.attachEvent){s.wd.attachEvent('onload',s.handlePPVevents);s.wd.a"
+"ttachEvent('onscroll',s.handlePPVevents);s.wd.attachEvent('onresize"
+"',s.handlePPVevents);}}return(pgid!='-')?(a):(a[1]);");

/*
 * Plugin: clickPast v1.0
 */
s_dell.clickPast=new Function("scp","ct_ev","cp_ev","cpc",""
+"var s=this,scp,ct_ev,cp_ev,cpc,ev,tct;if(s.p_fo(ct_ev)==1){if(!cpc)"
+"{cpc='s_cpc';}ev=s.events?s.events+',':'';if(scp){s.events=ev+ct_ev"
+";s.c_w(cpc,1,0);}else{if(s.c_r(cpc)>=1){s.events=ev+cp_ev;s.c_w(cpc"
+",0,0);}}}");
s_dell.p_fo=new Function("n",""
+"var s=this;if(!s.__fo){s.__fo=new Object;}if(!s.__fo[n]){s.__fo[n]="
+"new Object;return 1;}else {return 0;}");

/*
 * Function: parseUri v1.0 - Parse URI components
 */
parseUri=new Function("u",""
+"var l={strictMode:false,key:['source','protocol','authority','userI"
+"nfo','user','password','host','port','relative','path','directory',"
+"'file','query','anchor'],U:{name:'queryKey',c:/(?:^|\&)([^\&=]*)=?("
+"[^\&]*)/g},c:{strict:/^(?:([^:\\/?#]+):)?(?:\\/\\/((?:(([^:@]*)(?::"
+"([^:@]*))?)?@)?([^:\\/?#]*)(?::(\\d*))?))?((((?:[^?#\\/]*\\/)*)([^?"
+"#]*))(?:\\?([^#]*))?(?:#(.*))?)/,loose:/^(?:(?![^:@]+:[^:@\\/]*@)(["
+"^:\\/?#.]+):)?(?:\\/\\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\\/?#]"
+"*)(?::(\\d*))?)(((\\/(?:[^?#](?![^?#\\/]*\\.[^?#\\/.]+(?:[?#]|$)))*"
+"\\/?)?([^?#\\/]*))(?:\\?([^#]*))?(?:#(.*))?)/}},t=l.c[l.strictMode?"
+"'strict':'loose'].exec(u),p={},b=14;while(b--)p[l.key[b]]=t[b]||'';"
+"p[l.U.name]={};p[l.key[12]].replace(l.U.c,function($0,$1,$2){if($1)"
+"{p[l.U.name][$1]=$2}});return p");

/*
 * Function: Vanilla cookies v1.0
 */
sC=new Function("b","s",""
+"document.cookie=b+'='+escape(s)+'; '+' expires='+(arguments.length>"
+"=3?arguments[2].toGMTString():'')+'; path=/; domain=.'+getDomainLev"
+"els()+';'");
gC=new Function("b",""
+"var q=document.cookie,v=b+'=',m=q.indexOf(v);if(m!=0)m=q.indexOf(';"
+" '+v);if(m==-1)return '';v=q.substring(m);v=v.substring(v.indexOf('"
+"=')+1);m=v.indexOf(';');if(m!=-1)v=v.substring(0,m);return unescape"
+"(v)");

/*
 * Function: getDomainLevels([domain][,levels]) v1.0
 * (Requires parseUri)
 */
getDomainLevels=new Function(""
+"var z;if(arguments.length>0){z=arguments[0]}else{if(typeof document"
+".location.href=='undefined')return'';z=document.location.href}var r"
+"=parseUri(z).host.toLowerCase();var c=r.split('.'.toString());if(ar"
+"guments.length>=2){var w=arguments[1];for(var b=1,i='';b<=w;b++){if"
+"(c.length>=b){i=c[c.length-b]+(b>1?'.':'')+i}}}else{var i=c.length>"
+"=1?c[c.length-1]:'';var n=c.length>=2?c[c.length-2]:'';var w=i.leng"
+"th==2&&(n.length==2||n=='com')?3:2;for(var b=2;b<=w;b++){if(c.lengt"
+"h>=b){i=c[c.length-b]+(b>1?'.':'')+i}}}return i");
/*
 * Plugin: getActionDepth v1.0 - Returns the current
 * page number of the visit
 */
s_dell.getActionDepth=new Function("c",""
+ "var s=this,v=1,t=new Date;t.setTime(t.getTime()+1800000);"
+ "if(!s.c_r(c)){v=1}if(s.c_r(c)){v=s.c_r(c);v++}"
+ "if(!s.c_w(c,v,t)){s.c_w(c,v,0)}return v;");
/*
 * Plugin: tCall v1.0 - Is a t() call in progress?
 */
s_dell.tCall=new Function("",
"var t=this.linkType;return typeof(t)=='undefined'||typeof(t)==''");

/*
 * Plugin: isInternal(url) v1.0 - Url internal per linkInternalFilters?
 * (Requires matchList)
 */
s_dell.isInternal=new Function("v",""
+"return matchList(((!v)?document.location.href:v.toString().toLowerC"
+"ase()),s_dell.linkInternalFilters)");

/*
 * Plugin: hostedLocally(url) v1.0 - Url local per localDoms?
 * (Requires matchList)
 */
s_dell.hostedLocally=new Function("v",""
+"return matchList(((!v)?document.location.href:v.toString().toLowerC"
+"ase()),s_dell.localDoms)");

/*
 * Plugin: matchList v1.0 - Does a url match a regex pattern in a list?
 * (Requires parseUri)
 */
matchList=new Function("v","l",""
+"v=v.toString().toLowerCase();if(typeof(v)!=\'string\'||typeof(l)!="
+"\'string\')return 0;var m=parseUri(v).protocol,h=parseUri(v).host;i"
+"f(m.indexOf(\'http\')!=0\&\&m.indexOf(\'ftp\')!=0)return 1;return h"
+".match(\'(\'+l.toLowerCase().replace(\x2F\\.(?![*+?])\x2Fgi,\'\\\\."
+"\').replace(\x2F,(?![*+?])\x2Fgi,\'|\')+\')\')?2:0");
/*
 * channelManager v2.4 - Tracking External Traffic
 */
s_dell.channelManager=new Function("a","b","c","d","e","f",""
+"var s=this,A,B,g,l,m,M,p,q,P,h,k,u,S,i,O,T,j,r,t,D,E,F,G,H,N,U,v=0,"
+"X,Y,W,n=new Date;n.setTime(n.getTime()+1800000);if(e){v=1;if(s.c_r("
+"e)){v=0}if(!s.c_w(e,1,n)){s.c_w(e,1,0)}if(!s.c_r(e)){v=0}}g=s.refer"
+"rer?s.referrer:document.referrer;g=g.toLowerCase();if(!g){h=1}i=g.i"
+"ndexOf('?')>-1?g.indexOf('?'):g.length;j=g.substring(0,i);k=s.linkI"
+"nternalFilters.toLowerCase();k=s.split(k,',');l=k.length;for(m=0;m<"
+"l;m++){B=j.indexOf(k[m])==-1?'':g;if(B)O=B}if(!O&&!h){p=g;U=g.index"
+"Of('//');q=U>-1?U+2:0;Y=g.indexOf('/',q);r=Y>-1?Y:i;t=g.substring(q"
+",r);t=t.toLowerCase();u=t;P='Referrers';S=s.seList+'>'+s._extraSear"
+"chEngines;if(d==1){j=s.repl(j,'oogle','%');j=s.repl(j,'ahoo','^');g"
+"=s.repl(g,'as_q','*')}A=s.split(S,'>');T=A.length;for(i=0;i<T;i++){"
+"D=A[i];D=s.split(D,'|');E=s.split(D[0],',');F=E.length;for(G=0;G<F;"
+"G++){H=j.indexOf(E[G]);if(H>-1){i=s.split(D[1],',');U=i.length;for("
+"k=0;k<U;k++){l=s.getQueryParam(i[k],'',g);if(l){l=l.toLowerCase();M"
+"=l;if(D[2]){u=D[2];N=D[2]}else{N=t}if(d==1){N=s.repl(N,'#',' - ');g"
+"=s.repl(g,'*','as_q');N=s.repl(N,'^','ahoo');N=s.repl(N,'%','oogle'"
+");}}}}}}}if(!O||f!='1'){O=s.getQueryParam(a,b);if(O){u=O;if(M){P='P"
+"aid Search'}else{P='Paid Non-Search';}}if(!O&&M){u=N;P='Natural Sea"
+"rch'}}if(h==1&&!O&&v==1){u=P=t=p='Direct Load'}X=M+u+t;c=c?c:'c_m';"
+"if(c!='0'){X=s.getValOnce(X,c,0);}g=s._channelDomain;if(g&&X){k=s.s"
+"plit(g,'>');l=k.length;for(m=0;m<l;m++){q=s.split(k[m],'|');r=s.spl"
+"it(q[1],',');S=r.length;for(T=0;T<S;T++){Y=r[T];Y=Y.toLowerCase();i"
+"=j.indexOf(Y);if(i>-1)P=q[0]}}}g=s._channelParameter;if(g&&X){k=s.s"
+"plit(g,'>');l=k.length;for(m=0;m<l;m++){q=s.split(k[m],'|');r=s.spl"
+"it(q[1],',');S=r.length;for(T=0;T<S;T++){U=s.getQueryParam(r[T]);if"
+"(U)P=q[0]}}}g=s._channelPattern;if(g&&X){k=s.split(g,'>');l=k.lengt"
+"h;for(m=0;m<l;m++){q=s.split(k[m],'|');r=s.split(q[1],',');S=r.leng"
+"th;for(T=0;T<S;T++){Y=r[T];Y=Y.toLowerCase();i=O.toLowerCase();H=i."
+"indexOf(Y);if(H==0)P=q[0]}}}if(X)M=M?M:'n/a';p=X&&p?p:'';t=X&&t?t:'"
+"';N=X&&N?N:'';O=X&&O?O:'';u=X&&u?u:'';M=X&&M?M:'';P=X&&P?P:'';s._re"
+"ferrer=p;s._referringDomain=t;s._partner=N;s._campaignID=O;s._campa"
+"ign=u;s._keywords=M;s._channel=P");
/* Top 130 - Grouped */
s_dell.seList="search`|qu|7search.com>search.about`|terms|About.com>alltheweb`|query,q|All The Web>altavista.co|q,r|AltaVista>dk.altavista`|q|AltaVista#Denmark>fr.altavista`|q,r|AltaVista#France>it.altavista`|q,r|AltaVista#Italy>nl.altavista`|q|AltaVista#Netherlands>no.altavista`|q|AltaVista#Norway>es.altavista`|q,r|AltaVista#Spain>se.altavista`|q,r|AltaVista#Sweden>ch.altavista`|q,r|AltaVista#Switzerland>ananzi.co.za|qt|Ananzi>aol.fr|q|AOL#France>suche.aol.de,suche.aolsvc.de|q|AOL#Germany>aol.co.uk,search.aol.co.uk|query|AOL#United Kingdom>search.aol`,search.aol.ca|query,q|AOL.com Search>aport.ru|r|Aport>ask`,ask.co.uk|ask,q|Ask Jeeves>www.baidu`|wd,word|Baidu>www.baidu.jp|wd,word|Baidu Japan>search.biglobe.ne.jp|q|Biglobe>buscapique`|phrase|BUSCApique>business`/search|query|Business.com>centrum.cz|q|Centrum.cz>clix.pt|question|Clix>daum.net,search.daum.net|q|Daum>Dictionary`,Dictionary|term,query,q|Dictionary.com>directhit`|qry,q|DirectHit>eniro.dk|search_word|Eniro>eniro.fi|search_word|Eniro#Finland>eniro.se|search_word|Eniro#Sweden>euroseek`|query,string|Euroseek>excite.fr|search,q|Excite#France>excite.co.jp|search,s|Excite#Japan>fireball.de|q,query|Fireball>search.fresheye`|ord,kw|FreshEye>goo.ne.jp|MT|Goo (Jp.)>g%.co,g%syndication`|q,*|G%>g%`.af|q,*|G%#Afghanistan>g%.as|q,*|G%#American Samoa>g%`.ai|q,*|G%#Anguilla>g%`.ag|q,*|G%#Antigua and Barbuda>g%`.ar|q,*|G%#Argentina>g%.am|q,*|G%#Armenia>g%`.au|q,*|G%#Australia>g%.at|q,*|G%#Austria>g%.az|q,*|G%#Azerbaijan>g%`.bh|q,*|G%#Bahrain>g%`.bd|q,*|G%#Bangladesh>g%`.by|q,*|G%#Belarus>g%.be|q,*|G%#Belgium>g%`.bz|q,*|G%#Belize>g%`.bo|q,*|G%#Bolivia>g%.ba|q,*|G%#Bosnia-Hercegovina>g%.co.bw|q,*|G%#Botswana>g%`.br|q,*|G%#Brasil>g%.vg|q,*|G%#British Virgin Islands>g%`.bn|q,*|G%#Brunei>g%.bg|q,*|G%#Bulgaria>g%.bi|q,*|G%#Burundi>g%`.kh|q,*|G%#Cambodia>g%.ca|q,*|G%#Canada>g%.cl|q,*|G%#Chile>g%.cn|q,*|G%#China>g%`.co|q,*|G%#Colombia>g%.co.ck|q,*|G%#Cook Islands>g%.co.cr|q,*|G%#Costa Rica>g%.ci|q,*|G%#Cote D\'Ivoire>g%.hr|q,*|G%#Croatia>g%`.cu|q,*|G%#Cuba>g%.cz|q,*|G%#Czech Republic>g%.dk|q,*|G%#Denmark>g%.dj|q,*|G%#Djibouti>g%.dm|q,*|G%#Dominica>g%`.do|q,*|G%#Dominican Republic>g%`.ec|q,*|G%#Ecuador>g%`.eg|q,*|G%#Egypt>g%`.sv|q,*|G%#El Salvador>g%.ee|q,*|G%#Estonia>g%`.et|q,*|G%#Ethiopia>g%`.fj|q,*|G%#Fiji>g%.fi|q,*|G%#Finland>g%.fr|q,*|G%#France>g%.de|q,*|G%#Germany>g%.gr|q,*|G%#Greece>g%.gl|q,*|G%#Greenland>g%.gp|q,*|G%#Guadeloupe>g%`.gt|q,*|G%#Guatemala>g%.gg|q,*|G%#Guernsey>g%.gy|q,*|G%#Guyana>g%.ht|q,*|G%#Haiti>g%.hn|q,*|G%#Honduras>g%`.hk|q,*|G%#Hong Kong>g%.hu|q,*|G%#Hungary>g%.co.in|q,*|G%#India>g%.co.id|q,*|G%#Indonesia>g%.ie|q,*|G%#Ireland>g%.is|q,*|G%#Island>g%`.gi|q,*|G%#Isle of Gibraltar>g%.im|q,*|G%#Isle of Man>g%.co.il|q,*|G%#Israel>g%.it|q,*|G%#Italy>g%`.jm|q,*|G%#Jamaica>g%.co.jp|q,*|G%#Japan>g%.je|q,*|G%#Jersey>g%.jo|q,*|G%#Jordan>g%.kz|q,*|G%#Kazakhstan>g%.co.ke|q,*|G%#Kenya>g%.ki|q,*|G%#Kiribati>g%.co.kr|q,*|G%#Korea>g%.kg|q,*|G%#Kyrgyzstan>g%.la|q,*|G%#Laos>g%.lv|q,*|G%#Latvia>g%.co.ls|q,*|G%#Lesotho>g%`.ly|q,*|G%#Libya>g%.li|q,*|G%#Liechtenstein>g%.lt|q,*|G%#Lithuania>g%.lu|q,*|G%#Luxembourg>g%.mw|q,*|G%#Malawi>g%`.my|q,*|G%#Malaysia>g%.mv|q,*|G%#Maldives>g%`.mt|q,*|G%#Malta>g%.mu|q,*|G%#Mauritius>g%`.mx|q,*|G%#Mexico>g%.fm|q,*|G%#Micronesia>g%.md|q,*|G%#Moldova>g%.mn|q,*|G%#Mongolia>g%.ms|q,*|G%#Montserrat>g%.co.ma|q,*|G%#Morocco>g%`.na|q,*|G%#Namibia>g%.nr|q,*|G%#Nauru>g%`.np|q,*|G%#Nepal>g%.nl|q,*|G%#Netherlands>startg%.startpagina.nl|q|G%#Netherlands (Startpagina)>g%.co.nz|q,*|G%#New Zealand>g%`.ni|q,*|G%#Nicaragua>g%`.ng|q,*|G%#Nigeria>g%.nu|q,*|G%#Niue>g%`.nf|q,*|G%#Norfolk Island>g%.no|q,*|G%#Norway>g%`.om|q,*|G%#Oman>g%`.pk|q,*|G%#Pakistan>g%`.pa|q,*|G%#Panama>g%`.py|q,*|G%#Paraguay>g%`.pe|q,*|G%#Peru>g%`.ph|q,*|G%#Philippines>g%.pn|q,*|G%#Pitcairn Islands>g%.pl|q,*|G%#Poland>g%.pt|q,*|G%#Portugal>g%`.pr|q,*|G%#Puerto Rico>g%`.qa|q,*|G%#Qatar>g%.cd|q,*|G%#Rep. Dem. du Congo>g%.cg|q,*|G%#Rep. du Congo>g%.ge|q,*|G%#Repulic of Georgia>g%.ro|q,*|G%#Romania>g%.ru|q,*|G%#Russia>g%.rw|q,*|G%#Rwanda>g%.sh|q,*|G%#Saint Helena>g%`.vc|q,*|G%#Saint Vincent and the Grenadine>g%.ws|q,*|G%#Samoa>g%.sm|q,*|G%#San Marino>g%.st|q,*|G%#Sao Tome and Principe>g%`.sa|q,*|G%#Saudi Arabia>g%.sn|q,*|G%#Senegal>g%.sc|q,*|G%#Seychelles>g%`.sg|q,*|G%#Singapore>g%.sk|q,*|G%#Slovakia>g%.si|q,*|G%#Slovenia>g%`.sb|q,*|G%#Solomon Islands>g%.co.za|q,*|G%#South Africa>g%.es|q,*|G%#Spain>g%.lk|q,*|G%#Sri Lanka>g%.se|q,*|G%#Sweden>g%.ch|q,*|G%#Switzerland>g%`.tw|q,*|G%#Taiwan>g%`.tj|q,*|G%#Tajikistan>g%.co.th|q,*|G%#Thailand>g%.bs|q,*|G%#The Bahamas>g%.gm|q,*|G%#The Gambia>g%.tk|q,*|G%#Tokelau>g%.to|q,*|G%#Tonga>g%.tt|q,*|G%#Trinidad and Tobago>g%`.tr|q,*|G%#Turkey>g%.tm|q,*|G%#Turkmenistan>g%.co.ug|q,*|G%#Uganda>g%`.ua|q,*|G%#Ukraine>g%.ae|q,*|G%#United Arab Emirates>g%.co.uk|q,*|G%#United Kingdom>g%`.uy|q,*|G%#Uruguay>g%.co.uz|q,*|G%#Uzbekiston>g%.vu|q,*|G%#Vanuatu>g%.co.ve|q,*|G%#Venezuela>g%`.vn|q,*|G%#Viet Nam>g%.co.vi|q,*|G%#Virgin Islands>g%.co.zm|q,*|G%#Zambia>g%.co.zw|q,*|G%#Zimbabwe>hispavista`|cadena|HispaVista>icqit`|q|icq>infoseek.co.jp|qt|Infoseek#Japan>iwon`|searchfor|iWon>ixquick`|query|ixquick>kakaku.com|query|Kakaku>kelkoo.se|siteSearchQuery|Kelkoo#Sweden>kvasir.no|q,searchExpr|Kvasir>libero.it|query|Libero>arianna.libero.it|query|Libero-Ricerca>bing`|q|Microsoft Bing>search.livedoor`|q|Livedoor.com>www.lycos`,search.lycos`|query|Lycos>lycos.fr|query|Lycos#France>lycol.de,search.lycos.de|query|Lycos#Germany>lycos.it|query|Lycos#Italy>lycos.es|query|Lycos#Spain>lycos.co.uk|query|Lycos#United Kingdom>m.bing.com|Q|m.bing>mail.ru/search,go.mail.ru/search|q|Mail.ru>marchsearch`,search.curryguide`|query|MarchSearch>bing`|q|Microsoft Bing>myway`|searchfor|MyWay.com>search.mywebsearch.com|searchfor|mywebsearch>nate`,search.nate`|query|Nate.com>naver`,search.naver`|query|Naver>netscape`|query,search|Netscape Search>search.nifty`|q|Nifty>odn.excite.co.jp|search|ODN>oingo`|s,q|Oingo>overture`|Keywords|Overture>ozu.es|q|Ozu>qksearch`|query|QkSearch>rambler.ru/srch|words|Rambler>reference`|q|Reference.com>search.ch|q|Search.ch>searchalot`|query,q|Searchalot>sensis`.au|find|Sensis.com.au>seznam|w|Seznam.cz>g%.sina`.tw|kw|Sina#Taiwan>sogou.com|query|Sogou>soso.com|w|SoSo>starmedia`|q|Starmedia>abcsok.no|q|Startsiden>suchmaschine`|suchstr|Suchmaschine>teoma`|q|Teoma>terra.es|query|Terra>tiscali.it|key|Tiscali>toile`|query,q|Toile du Quebec>busca.uol`.br|q|UOL Busca>usseek`|string|Usseek>vinden.nl|query|Vinden>vindex.nl|search_for|Vindex>virgilio.it|qs|Virgilio>voila.fr|kw|Voila>walla.co.il|q|Walla>web.de|su|Web.de>webalta.ru|q|Webalta>wp.pl|szukaj|Wirtualna Polska>wow.pl|q|WOW>y^`,search.y^`|p|Y^!>ar.y^`,ar.search.y^`|p|Y^!#Argentina>asia.y^`,asia.search.y^`|p|Y^!#Asia>au.y^`,au.search.y^`|p|Y^!#Australia>at.search.y^`|p|Y^!#Austria>br.y^`,br.search.y^`|p|Y^!#Brazil>ca.y^`,ca.search.y^`|p|Y^!#Canada>qc.y^`,cf.search.y^`|p|Y^!#Canada (French)>cn.y^`,search.cn.y^`|p|Y^!#China>dk.y^`,dk.search.y^`|p|Y^!#Denmark>fi.search.y^`|p|Y^!#Finland>fr.y^`,fr.search.y^`|p|Y^!#France>de.y^`,de.search.y^`|p|Y^!#Germany>hk.y^`,hk.search.y^`|p|Y^!#Hong Kong>in.y^`,in.search.y^`|p|Y^!#India>id.y^`,id.search.y^`|p|Y^!#Indonesia>it.y^`,it.search.y^`|p|Y^!#Italy>y^.co.jp,search.y^.co.jp|p,va|Y^!#Japan>kr.y^`,kr.search.y^`|p|Y^!#Korea>malaysia.y^`,malaysia.search.y^`|p|Y^!#Malaysia>mx.y^`,mx.search.y^`|p|Y^!#Mexico>nl.y^`,nl.search.y^`|p|Y^!#Netherlands>nz.y^`,nz.search.y^`|p|Y^!#New Zealand>no.y^`,no.search.y^`|p|Y^!#Norway>ph.y^`,ph.search.y^`|p|Y^!#Philippines>ru.y^`,ru.search.y^`|p|Y^!#Russia>sg.y^`,sg.search.y^`|p|Y^!#Singapore>es.y^`,es.search.y^`|p|Y^!#Spain>telemundo.y^`,espanol.search.y^`|p|Y^!#Spanish (US : Telemundo)>se.y^`,se.search.y^`|p|Y^!#Sweden>ch.search.y^`|p|Y^!#Switzerland>tw.y^`,tw.search.y^`|p|Y^!#Taiwan>th.y^`,th.search.y^`|p|Y^!#Thailand>uk.y^`,uk.search.y^`|p|Y^!#UK and Ireland>vn.y^`,vn.search.y^`|p|Y^!#Viet Nam>mobile.y^.co.jp|p|Y^Japan#Mobile>yandex|text|Yandex.ru>zbozi.cz|q|Zbozi.cz>www.zoeken.nl/|query|zoeken.nl";
/*
 *	Plug-in: crossVisitParticipation v1.7 - stacks values from
 *	specified variable in cookie and returns value
 */
s_dell.crossVisitParticipation=new Function("v","cn","ex","ct","dl","ev","dv",""
+"var s=this,ce;if(typeof(dv)==='undefined')dv=0;if(s.events&&ev){var"
+" ay=s.split(ev,',');var ea=s.split(s.events,',');for(var u=0;u<ay.l"
+"ength;u++){for(var x=0;x<ea.length;x++){if(ay[u]==ea[x]){ce=1;}}}}i"
+"f(!v||v==''){if(ce){s.c_w(cn,'');return'';}else return'';}v=escape("
+"v);var arry=new Array(),a=new Array(),c=s.c_r(cn),g=0,h=new Array()"
+";if(c&&c!=''){arry=s.split(c,'],[');for(q=0;q<arry.length;q++){z=ar"
+"ry[q];z=s.repl(z,'[','');z=s.repl(z,']','');z=s.repl(z,\"'\",'');arry"
+"[q]=s.split(z,',')}}var e=new Date();e.setFullYear(e.getFullYear()+"
+"5);if(dv==0&&arry.length>0&&arry[arry.length-1][0]==v)arry[arry.len"
+"gth-1]=[v,new Date().getTime()];else arry[arry.length]=[v,new Date("
+").getTime()];var start=arry.length-ct<0?0:arry.length-ct;var td=new"
+" Date();for(var x=start;x<arry.length;x++){var diff=Math.round((td."
+"getTime()-arry[x][1])/86400000);if(diff<ex){h[g]=unescape(arry[x][0"
+"]);a[g]=[arry[x][0],arry[x][1]];g++;}}var data=s_dell.join(a,{delim:',',"
+"front:'[',back:']',wrap:\"'\"});s.c_w(cn,data,e);var r=s_dell.join(h,{deli"
+"m:dl});if(ce)s.c_w(cn,'');return r;");
/*
 * s.join: 1.0 - Joins an array into a string
 */
s_dell.join = new Function("v","p",""
+"var s = this;var f,b,d,w;if(p){f=p.front?p.front:'';b=p.back?p.back"
+":'';d=p.delim?p.delim:'';w=p.wrap?p.wrap:'';}var str='';for(var x=0"
+";x<v.length;x++){if(typeof(v[x])=='object' )str+=s.join( v[x],p);el"
+"se str+=w+v[x]+w;if(x<v.length-1)str+=d;}return f+str+b;");


/*********************************************************************
 * s.createData, s.getTimeStamp, s.updateData - Jason Case 4 Nov 11
 * Used to create and read the profiling cookie which is used by Dell
 * with T&T for live profiling
 ********************************************************************/
s_dell.createData=new Function("",""
+"var s=this,dataArray,ts,seg,pv,pc,pd,cs,odg,ca,pt,st,tos,pp,ic;var "
+"expDate=new Date();s.c_w('sessionTime',expDate.getFullYear()+','+ex"
+"pDate.getMonth()+','+expDate.getDate()+','+expDate.getHours()+','+e"
+"xpDate.getMinutes()+','+expDate.getSeconds()+','+expDate.getMillise"
+"conds(),0);ts=s.getTimeStamp();seg=s.prop6?s.prop6:'null';pv='null'"
+";cs=s.events.indexOf('scCheckout')>-1?'Y':'N';pc=s.events.indexOf('"
+"purchase')>-1?'Y':'N';if(s.inList('event2',s.events,',')){if(s.prod"
+"ucts!=undefined)var splitProd=s.products.split(',');if(splitProd.le"
+"ngth>0&&splitProd[0]!=undefined&&splitProd[0]!=null){var splitProd="
+"splitProd[0].split(';');pd=splitProd[1];}}else{pd='null';}pp='null'"
+";odg=s.eVar2?s.eVar2:'null';ca=s.events.indexOf('scAdd')>-1?'Y':'N'"
+";ic='null';pt=s.eVar10?s.eVar10:'null';st=s.prop17?s.prop17:'null';"
+"tos=0;var profile=seg+'||'+pv+'||'+ts+'||'+cs+'||'+pc+'||'+pd+'||'+"
+"tos+'||'+pp+'||'+odg+'||'+ca+'||'+ic+'||'+pt+'||'+st;expDate.setDat"
+"e(expDate.getDate()+365);s.c_w('s_hwp',profile,expDate);");
s_dell.getTimeStamp=new Function("",""
+"var d=new Date();return d.getDate()+':'+(d.getMonth()+1)+':'+d.getF"
+"ullYear()+':'+d.getHours()+':'+d.getMinutes();");
s_dell.updateData=new Function("",""
+"var s=this,dataArray,ts,seg,pv,pc,pd,cs,odg,ca,pt,st,tos,pp,ic;var "
+"expDate=new Date();expDate.setDate(expDate.getDate()+365);dataArray"
+"=(s.c_r('s_hwp')).split('||');ts=s.getTimeStamp();seg=s.prop6?s.pro"
+"p6:dataArray[0];s.pageName.indexOf('productdetails')>-1?(pv=(s.page"
+"Name.split('productdetails:'))[1]):pv=dataArray[1];dataArray[3]=='Y"
+"'?cs='Y':cs=s.events.indexOf('scCheckout')>-1?'Y':'N';dataArray[4]="
+"='Y'?pc='Y':pc=s.events.indexOf('purchase')>-1?'Y':'N';if(s.inList("
+"'event2',s.events,',')){if(s.products!=undefined)var splitProd=s.pr"
+"oducts.split(',');if(splitProd.length>0&&splitProd[0]!=undefined&&s"
+"plitProd[0]!=null){var splitProd=splitProd[0].split(';');pd=splitPr"
+"od[1];}}else{pd=dataArray[5];}odg=s.eVar2?s.eVar2:dataArray[8];data"
+"Array[9]=='Y'?ca='Y':ca=s.events.indexOf('scAdd')>-1?'Y':'N';pt=s.e"
+"Var10?s.eVar10:'null';st=s.prop17?s.prop17:dataArray[12];var today="
+"new Date();if(s.c_r('sessionTime')){var oldTime=s.c_r('sessionTime'"
+");oldTime=oldTime.split(',');oldTime=new Date(oldTime[0],oldTime[1]"
+",oldTime[2],oldTime[3],oldTime[4],oldTime[5],oldTime[6]);tos=Math.r"
+"ound(((today-oldTime)/1000)/60);}else{s.c_w('sessionTime',today,0);"
+"tos=0;}if(pc=='Y'){if(s.products!=undefined)var prodArray=s.product"
+"s.split(',');if(prodArray&&prodArray.length>0&&prodArray[0]!=undefi"
+"ned&&prodArray[0]!=null){pp=(prodArray[0].split(';'))[1];if(pp==''|"
+"|pp==null){pp=dataArray[7];}}}else{pp='null';}if(s.events.indexOf('"
+"purchase')>-1){if(s.products!=undefined)var product=(s.products.spl"
+"it(','))[0];if(product!=undefined&&product!=null){var cartArray=pro"
+"duct.split(';');}if(cartArray.length>0)ic=cartArray[1];if(cartArray"
+".length>1)ic=ic+','+cartArray[2];if(cartArray.length>2)ic=ic+','+ca"
+"rtArray[3];}else if(dataArray[10]!='null'){ic=dataArray[10];}else i"
+"c='null';var profile=seg+'||'+pv+'||'+ts+'||'+cs+'||'+pc+'||'+pd+'|"
+"|'+tos+'||'+pp+'||'+odg+'||'+ca+'||'+ic+'||'+pt+'||'+st;s.c_w('s_hw"
+"p',profile,expDate);");

/* ******************** DELL CUSTOM PLUGINS ********************** */

/*
 * determineCMS() - Determine CMS (Storm, NextGen, or OLR)
 */
function s_dell_determineCMS(){
	var s=s_dell;
	if(!s.CMS){
		s.CMS='unknown';
		var gen=s.getHTMLtag('meta','generator').toLowerCase();
		if(gen.indexOf(' ')>0)gen=gen.substring(0,gen.indexOf(' '));
		if(gen.indexOf('ng')==0)s.CMS='nextgen';
		if(gen.indexOf('build:')==0||gen.indexOf('mshtml')==0)s.CMS='olr';
		if(gen.indexOf('storm')==0)s.CMS='storm';
		if(gen.indexOf('telligent')==0)s.CMS='telligent';
		if(s.CMS=='unknown'&&s.getHTMLtag('meta','waapplicationname'))s.CMS='olr';
	}
	return s.CMS;
}
s_dell.determineCMS=s_dell_determineCMS;

/*
 * onDellCMS() - Determine if on a page created by a Dell CMS
 */
function s_dell_onDellCMS(){
	return (s_dell.determineCMS()=='storm')||(s_dell.determineCMS()=='nextgen')||(s_dell.determineCMS()=='olr')||(s_dell.determineCMS()=='telligent');
}
s_dell.onDellCMS=s_dell_onDellCMS;

/*
 * processLWP() - "Consolidated LWP variable processing"
 * Set LWP variables by looking in URL, the LWP cookie, and referrer for third-party sites
 */
function s_dell_processLWP(){
	var s=s_dell;
	if(document.location.search)s.setLWPvarsFromStr(document.location.search);
	s.setLWPvarsFromMetaTags();
	if(!s.onDellCMS()){
		if(s.prop49)s.setLWPvarsFromStr(s.prop49);
		if(s.hostedLocally(document.referrer))s.setLWPvarsFromStr(parseUri(document.referrer).query);
	}
	var lwpc=s.readLWPcookie();
	if(lwpc){
		s.setLWPvarsFromStr(lwpc);
	}else{
		s.setLWPvarsFromStr(s.readProp49cookie());
	}
	s.setCCfromURL();
	var lv=s.getLWPvariables();
	if(lv){
		s.prop49='?'+lv;
		s.writeProp49cookie(lv);
	}
}
s_dell.processLWP=s_dell_processLWP;

/*
 * setLWPvarsFromMetaTags() - Try to assign LWP variables from META TAGs
 */
function s_dell_setLWPvarsFromMetaTags(){
	var s=s_dell;
	//prop2: 2 letter country code
	if(!s.prop2)s.prop2=s.getHTMLtag('meta','country');
	if(!s.prop2)s.prop2=s.getHTMLtag('meta','documentcountrycode');
	//prop3: 2 letter language code
	if(!s.prop3)s.prop3=s.getHTMLtag('meta','language');
	//evar32: segment
	if(!s.eVar32)s.eVar32=s.getHTMLtag('meta','segment');
	//evar6: customer set
	if(!s.prop6)s.prop6=s.getHTMLtag('meta','customerset');
}
s_dell.setLWPvarsFromMetaTags=s_dell_setLWPvarsFromMetaTags;

/*
 * getHTMLtag(name) - Get the specified META TAG's value
 */
function s_dell_getHTMLtag(tg,nm){
	var k=(arguments.length>2)?arguments[2]:'NAME',
		v=(arguments.length>3)?arguments[3]:'CONTENT',
		metas=document.getElementsByTagName?document.getElementsByTagName(tg):'';
	for(var i=metas.length-1;i>=0;i--){
		var n=metas[i].getAttribute(k);
		n=n?n.toLowerCase():'';
		if(n==nm)return metas[i].getAttribute(v).toLowerCase();
	}
	return '';
}
s_dell.getHTMLtag=s_dell_getHTMLtag;

/*
 * setLWPvarsFromStr(str) - Try to assign LWP variables from formatted string
 */
function s_dell_setLWPvarsFromStr(v){
	var s=s_dell;
	if(!v)return;
	v=v.toString().toLowerCase();
	if(v.substring(0,1)=='&')v='?'+v.substring(1);
	if(v.substring(0,1)!='?')v='?'+v;
	//prop2: 2 letter country code
	if(!s.prop2)s.prop2=s.getQueryParam('shopper_country','',v);
	if(!s.prop2)s.prop2=s.getQueryParam('ctry_id','',v);
	if(!s.prop2)s.prop2=s.getQueryParam('c','',v);
	//prop3: 2 letter language code
	if(!s.prop3)s.prop3=s.getQueryParam('l','',v);
	//evar32: segment
	if(!s.eVar32)s.eVar32=s.getQueryParam('s','',v);
	if(!s.eVar32)s.eVar32=s.getQueryParam('shopper_segment','',v);
	//prop6: customer set
	if(!s.prop6)s.prop6=s.getQueryParam('customer_id','',v);
	if(!s.prop6)s.prop6=s.getQueryParam('cs','',v);
	//prop17: service tag
	if(!s.prop17)s.prop17=s.getQueryParam('svctag','',v);
	if(!s.prop17)s.prop17=s.getQueryParam('servicetag','',v);
	if(!s.prop17)s.prop17=s.getQueryParam('st55','',v);
	if(!s.prop17)s.prop17=s.getQueryParam('tag','',v);
	//prop18: systemid
	if(!s.prop18)s.prop18=s.getQueryParam('systemid','',v);
}
s_dell.setLWPvarsFromStr=s_dell_setLWPvarsFromStr;

/*
 * getLWPvariables() - Return LWP variables as formatted string
 */
function s_dell_getLWPvariables(){
	var v='',s=this;
	if(s.prop2)v+='&c='+s.prop2;
	if(s.prop3)v+='&l='+s.prop3;
	if(s.eVar32)v+='&s='+s.eVar32;
	if(s.prop6)v+='&cs='+s.prop6;
	if(s.prop17)v+='&servicetag='+s.prop17;
	if(s.prop18)v+='&systemid='+s.prop18;
	if(v)return v.substring(1);
	return '';
}
s_dell.getLWPvariables=s_dell_getLWPvariables;

/*
 * setCCfromURL() - Added 07/09/10: Try to get country code from domain or path
 */
s_dell.cCodes=[
'ae','ag','ai','al','am','an','ao','ar','at','au',
'aw','az','ba','bb','bd','be','bg','bh','bm','bo',
'br','bs','bw','by','bz','ca','ch','cl','cm','cn',
'co','cr','cy','cz','de','dk','dm','do','dz','ec',
'ed','ee','eg','es','et','eu','fi','fj','fr','gb',
'gd','ge','gh','gr','gt','gy','hk','hn','hr','ht',
'hu','id','ie','il','in','ir','is','it','jm','jo',
'jp','ke','kn','kr','kw','ky','kz','lb','lc','li',
'lk','lt','lu','lv','ma','md','me','mk','ml','mq',
'ms','mt','mu','mx','my','mz','na','ng','ni','nl',
'no','nz','om','pa','pe','ph','pk','pl','pr','pt',
'py','qa','ro','rs','ru','ru','rw','sa','se','sg',
'si','sk','sn','sr','sv','sy','tc','td','th','tm',
'tn','tr','tt','tw','tz','ua','ug','uk','us','uy',
'uz','vc','ve','vg','vi','vn','ye','yu','za','zm',
'zw'];
function s_dell_setCCfromURL(){
	var s=s_dell;
	if(s.prop2)return;
	if(arguments.length>0){
		var r=arguments[0];
	}else{
		if(typeof(document.location.href)=='undefined')return;
		var r=document.location.href;
	}
	var h=parseUri(r).host.split('.');
	var d=(h.length>=3)?h[h.length-1]:'';
	if(d.length==2&&s.inList(d,s.cCodes)){s.prop2=d;return;}
	for(var i=1;i<h.length;i++){
		if(h[i]=='dell'){
			d=h[i-1];
			if(s.inList(d,s.cCodes)){s.prop2=d;return;}
		}
	}
	var p=parseUri(r).directory;
	if(p.length<4||p[3]!='/')return;
	var p1=p.substring(1,3);
	if(s.inList(p1,s.cCodes)){s.prop2=p1;return;}
}
s_dell.setCCfromURL=s_dell_setCCfromURL;

/*
 * readLWPcookie() - Get value of the Dell LWP cookie
 */
function s_dell_readLWPcookie(){
	return gC('lwp');
}
s_dell.readLWPcookie=s_dell_readLWPcookie;

/*
 * readProp49cookie() - Get value of the SiteCatalyst prop49 cookie
 */
function s_dell_readProp49cookie(){
	return gC('s_c49');
}
s_dell.readProp49cookie=s_dell_readProp49cookie;

/*
 * writeProp49cookie() - Write value of the SiteCatalyst prop49 cookie
 */
function s_dell_writeProp49cookie(){
	var v=s_dell.getLWPvariables();
	if(v)sC('s_c49',v);
}
s_dell.writeProp49cookie=s_dell_writeProp49cookie;

/*
 * getPNfromURL() - Construct pageName from URL host and path, removing index page name, page extension, anchor tag
 */
function s_dell_getPNfromURL(){
	var s=s_dell,p=document.location.protocol;
	if(p.indexOf('http')==0){
		var pn=parseUri(document.location.href).host.replace(/^www[0-9]*\./i,'') +parseUri(document.location.href).path.replace(/\.(aspx?|s?html?|cgi|php[0-9]|wml)/i,'').replace(/\/(default|home|index|welcome)/i,'');
		if(pn.indexOf('/')==-1)pn=pn+'/';
		sku=s.getQueryParam('sku','',document.location.search);
		if(!sku)sku=s.getQueryParam('channel-product-id','',document.location.search);
		if(sku)pn+='[sku='+sku+']';
	}else{
		pn=p;
	}
	return pn.toLowerCase();
}
s_dell.getPNfromURL=s_dell_getPNfromURL;

/*
 * getObjectID(o)
 */
function s_dell_getObjectID(o){
	return o.href;
}
s_dell.getObjectID=s_dell_getObjectID;

/*
* SiteCatalyst Ad Track
*/

function adTrackClickThroughs() {
    var s = s_dell;
    var q = (s.determineCMS() == 'nextgen') ? '.omnitureADTrack[omnitureadid]' : '.omnitureADTrack[@omnitureadid]'; //Added 07/09/10: removed "@" for nextgen pages only
    try {
        jQuery(q).each(function () {
            jQuery(this).click(function () {
                try {
                    s.eVar6 = jQuery(this).attr('omnitureadid');
                    s.prop28 = '';
                    s.linkTrackVars = s.apl(s.linkTrackVars, 'eVar6', ',', 2);
                    s.tl(this, 'o', 'ADTrack');
                    s.eVar6 = '';
                }
                catch (e) { }
            });
        });
    }
    catch (e) { }
}

function adTrackImpressions() {
    var s = s_dell;
    var q = (s.determineCMS() == 'nextgen') ? '.omnitureADTrack[omnitureadid]' : '.omnitureADTrack[@omnitureadid]'; //Added 07/09/10: removed "@" for nextgen pages only
    try {
        var adImpressionsArray = new Array();

        jQuery(q).each(function () {
            if (adImpressionsArray != null) {
                var omnitureadid = jQuery(this).attr('omnitureadid');
                // Only insert ad id into array if it doesn't already exists. We don't want duplicates.
                // Also, can only allow maximum of 11 ad ids so that we don't overrun 100 char limit
                // for omniture property once we join together and report to prop28.
                if ((adImpressionsArray.indexOf(omnitureadid) == -1) && adImpressionsArray.length < 11) {
                    adImpressionsArray.push(omnitureadid);
                }
            }
        });

        s.prop28 = adImpressionsArray.join('|');
    }
    catch (e) { }
}

/* WARNING: Changing any of the below variables will cause drastic
changes to how your visitor data is collected. Changes should only be
made when instructed to do so by your account manager.*/
s_dell.visitorNamespace='dell';
if(s_account.substring(s_account.length-3)!='dev'){
	s_dell.trackingServer='nsm.dell.com';
	s_dell.trackingServerSecure='sm.dell.com';
}
s_dell.dc=112;

/* Survey Variables */
var s_sv_dynamic_root = "survey.112.2o7.net/survey/dynamic"
var s_sv_gather_root = "survey.112.2o7.net/survey/gather"


/* Load the Media Module */
s_dell.loadModule('Media')
s_dell.Media.autoTrack=false;
s_dell.Media.trackWhilePlaying=false;
s_dell.Media.trackVars='None';
s_dell.Media.trackEvents='None';

/* **************************** MODULES *************************** */

/* Module: Media */
s_dell.m_Media_c="var m=s.m_i('Media');m.cn=function(n){var m=this;return m.s.rep(m.s.rep(m.s.rep(n,\"\\n\",''),\"\\r\",''),'--**--','')};m.open=function(n,l,p,b){var m=this,i=new Object,tm=new Date,"
+"a='',x;n=m.cn(n);l=parseInt(l);if(!l)l=1;if(n&&p){if(!m.l)m.l=new Object;if(m.l[n])m.close(n);if(b&&b.id)a=b.id;for (x in m.l)if(m.l[x]&&m.l[x].a==a)m.close(m.l[x].n);i.n=n;i.l=l;i.p=m.cn(p);i.a=a;"
+"i.t=0;i.ts=0;i.s=Math.floor(tm.getTime()/1000);i.lx=0;i.lt=i.s;i.lo=0;i.e='';i.to=-1;m.l[n]=i}};m.close=function(n){this.e(n,0,-1)};m.play=function(n,o){var m=this,i;i=m.e(n,1,o);i.m=new Function('"
+"var m=s_c_il['+m._in+'],i;if(m.l){i=m.l[\"'+m.s.rep(i.n,'\"','\\\\\"')+'\"];if(i){if(i.lx==1)m.e(i.n,3,-1);i.mt=setTimeout(i.m,5000)}}');i.m()};m.stop=function(n,o){this.e(n,2,o)};m.track=function("
+"n){var m=this;if (m.trackWhilePlaying) {m.e(n,4,-1)}};m.e=function(n,x,o){var m=this,i,tm=new Date,ts=Math.floor(tm.getTime()/1000),ti=m.trackSeconds,tp=m.trackMilestones,z=new Array,j,d='--**--',t"
+"=1,b,v=m.trackVars,e=m.trackEvents,pe='media',pev3,w=new Object,vo=new Object;n=m.cn(n);i=n&&m.l&&m.l[n]?m.l[n]:0;if(i){w.name=n;w.length=i.l;w.playerName=i.p;if(i.to<0)w.event=\"OPEN\";else w.even"
+"t=(x==1?\"PLAY\":(x==2?\"STOP\":(x==3?\"MONITOR\":\"CLOSE\")));w.openTime=new Date();w.openTime.setTime(i.s*1000);if(x>2||(x!=i.lx&&(x!=2||i.lx==1))) {b=\"Media.\"+name;pev3 = m.s.ape(i.n)+d+i.l+d+"
+"m.s.ape(i.p)+d;if(x){if(o<0&&i.lt>0){o=(ts-i.lt)+i.lo;o=o<i.l?o:i.l-1}o=Math.floor(o);if(x>=2&&i.lo<o){i.t+=o-i.lo;i.ts+=o-i.lo;}if(x<=2){i.e+=(x==1?'S':'E')+o;i.lx=x;}else if(i.lx!=1)m.e(n,1,o);i."
+"lt=ts;i.lo=o;pev3+=i.t+d+i.s+d+(m.trackWhilePlaying&&i.to>=0?'L'+i.to:'')+i.e+(x!=2?(m.trackWhilePlaying?'L':'E')+o:'');if(m.trackWhilePlaying){b=0;pe='m_o';if(x!=4){w.offset=o;w.percent=((w.offset"
+"+1)/w.length)*100;w.percent=w.percent>100?100:Math.floor(w.percent);w.timePlayed=i.t;if(m.monitor)m.monitor(m.s,w)}if(i.to<0)pe='m_s';else if(x==4)pe='m_i';else{t=0;v=e='None';ti=ti?parseInt(ti):0;"
+"z=tp?m.s.sp(tp,','):0;if(ti&&i.ts>=ti)t=1;else if(z){if(o<i.to)i.to=o;else{for(j=0;j<z.length;j++){ti=z[j]?parseInt(z[j]):0;if(ti&&((i.to+1)/i.l<ti/100)&&((o+1)/i.l>=ti/100)){t=1;j=z.length}}}}}}}e"
+"lse{m.e(n,2,-1);if(m.trackWhilePlaying){w.offset=i.lo;w.percent=((w.offset+1)/w.length)*100;w.percent=w.percent>100?100:Math.floor(w.percent);w.timePlayed=i.t;if(m.monitor)m.monitor(m.s,w)}m.l[n]=0"
+";if(i.e){pev3+=i.t+d+i.s+d+(m.trackWhilePlaying&&i.to>=0?'L'+i.to:'')+i.e;if(m.trackWhilePlaying){v=e='None';pe='m_o'}else{t=0;m.s.fbr(b)}}else t=0;b=0}if(t){vo.linkTrackVars=v;vo.linkTrackEvents=e"
+";vo.pe=pe;vo.pev3=pev3;m.s.t(vo,b);if(m.trackWhilePlaying){i.ts=0;i.to=o;i.e=''}}}}return i};m.ae=function(n,l,p,x,o,b){if(n&&p){var m=this;if(!m.l||!m.l[n])m.open(n,l,p,b);m.e(n,x,o)}};m.a=functio"
+"n(o,t){var m=this,i=o.id?o.id:o.name,n=o.name,p=0,v,c,c1,c2,xc=m.s.h,x,e,f1,f2='s_media_'+m._in+'_oc',f3='s_media_'+m._in+'_t',f4='s_media_'+m._in+'_s',f5='s_media_'+m._in+'_l',f6='s_media_'+m._in+"
+"'_m',f7='s_media_'+m._in+'_c',tcf,w;if(!i){if(!m.c)m.c=0;i='s_media_'+m._in+'_'+m.c;m.c++}if(!o.id)o.id=i;if(!o.name)o.name=n=i;if(!m.ol)m.ol=new Object;if(m.ol[i])return;m.ol[i]=o;if(!xc)xc=m.s.b;"
+"tcf=new Function('o','var e,p=0;try{if(o.versionInfo&&o.currentMedia&&o.controls)p=1}catch(e){p=0}return p');p=tcf(o);if(!p){tcf=new Function('o','var e,p=0,t;try{t=o.GetQuickTimeVersion();if(t)p=2"
+"}catch(e){p=0}return p');p=tcf(o);if(!p){tcf=new Function('o','var e,p=0,t;try{t=o.GetVersionInfo();if(t)p=3}catch(e){p=0}return p');p=tcf(o)}}v=\"var m=s_c_il[\"+m._in+\"],o=m.ol['\"+i+\"']\";if(p"
+"==1){p='Windows Media Player '+o.versionInfo;c1=v+',n,p,l,x=-1,cm,c,mn;if(o){cm=o.currentMedia;c=o.controls;if(cm&&c){mn=cm.name?cm.name:c.URL;l=cm.duration;p=c.currentPosition;n=o.playState;if(n){"
+"if(n==8)x=0;if(n==3)x=1;if(n==1||n==2||n==4||n==5||n==6)x=2;}';c2='if(x>=0)m.ae(mn,l,\"'+p+'\",x,x!=2?p:-1,o)}}';c=c1+c2;if(m.s.isie&&xc){x=m.s.d.createElement('script');x.language='jscript';x.type"
+"='text/javascript';x.htmlFor=i;x.event='PlayStateChange(NewState)';x.defer=true;x.text=c;xc.appendChild(x);o[f6]=new Function(c1+'if(n==3){x=3;'+c2+'}setTimeout(o.'+f6+',5000)');o[f6]()}}if(p==2){p"
+"='QuickTime Player '+(o.GetIsQuickTimeRegistered()?'Pro ':'')+o.GetQuickTimeVersion();f1=f2;c=v+',n,x,t,l,p,p2,mn;if(o){mn=o.GetMovieName()?o.GetMovieName():o.GetURL();n=o.GetRate();t=o.GetTimeScal"
+"e();l=o.GetDuration()/t;p=o.GetTime()/t;p2=o.'+f5+';if(n!=o.'+f4+'||p<p2||p-p2>5){x=2;if(n!=0)x=1;else if(p>=l)x=0;if(p<p2||p-p2>5)m.ae(mn,l,\"'+p+'\",2,p2,o);m.ae(mn,l,\"'+p+'\",x,x!=2?p:-1,o)}if("
+"n>0&&o.'+f7+'>=10){m.ae(mn,l,\"'+p+'\",3,p,o);o.'+f7+'=0}o.'+f7+'++;o.'+f4+'=n;o.'+f5+'=p;setTimeout(\"'+v+';o.'+f2+'(0,0)\",500)}';o[f1]=new Function('a','b',c);o[f4]=-1;o[f7]=0;o[f1](0,0)}if(p==3"
+"){p='RealPlayer '+o.GetVersionInfo();f1=n+'_OnPlayStateChange';c1=v+',n,x=-1,l,p,mn;if(o){mn=o.GetTitle()?o.GetTitle():o.GetSource();n=o.GetPlayState();l=o.GetLength()/1000;p=o.GetPosition()/1000;i"
+"f(n!=o.'+f4+'){if(n==3)x=1;if(n==0||n==2||n==4||n==5)x=2;if(n==0&&(p>=l||p==0))x=0;if(x>=0)m.ae(mn,l,\"'+p+'\",x,x!=2?p:-1,o)}if(n==3&&(o.'+f7+'>=10||!o.'+f3+')){m.ae(mn,l,\"'+p+'\",3,p,o);o.'+f7+'"
+"=0}o.'+f7+'++;o.'+f4+'=n;';c2='if(o.'+f2+')o.'+f2+'(o,n)}';if(m.s.wd[f1])o[f2]=m.s.wd[f1];m.s.wd[f1]=new Function('a','b',c1+c2);o[f1]=new Function('a','b',c1+'setTimeout(\"'+v+';o.'+f1+'(0,0)\",o."
+"'+f3+'?500:5000);'+c2);o[f4]=-1;if(m.s.isie)o[f3]=1;o[f7]=0;o[f1](0,0)}};m.as=new Function('e','var m=s_c_il['+m._in+'],l,n;if(m.autoTrack&&m.s.d.getElementsByTagName){l=m.s.d.getElementsByTagName("
+"m.s.isie?\"OBJECT\":\"EMBED\");if(l)for(n=0;n<l.length;n++)m.a(l[n]);}');if(s.wd.attachEvent)s.wd.attachEvent('onload',m.as);else if(s.wd.addEventListener)s.wd.addEventListener('load',m.as,false)";
s_dell.m_i("Media");

/* Module: Survey */
s_dell.m_Survey_c="var m=s.m_i(\"Survey\");m.launch=function(i,e,c,o,f){this._boot();var m=this,g=window.s_sv_globals||{},l,j;if(g.unloaded||m._blocked())return 0;i=i&&i.constructor&&i.constructor==A"
+"rray?i:[i];l=g.manualTriggers;for(j=0;j<i.length;++j)l[l.length]={l:m._suites,i:i[j],e:e||0,c:c||0,o:o||0,f:f||0};m._execute();return 1;};m._t=function(){this._boot();var m=this,s=m.s,g=window.s_sv"
+"_globals||{},l;if(m._blocked())return;l=g.pageImpressions;l[l.length]={l:m._suites,n:s.pageName||\"\",u:s.pageURL||\"\",r:s.referrer||\"\",c:s.campaign||\"\"};m._execute();};m._rr=function(){var g="
+"window.s_sv_globals||{},f=g.onScQueueEmpty||0;if(f)f();};m._blocked=function(){var m=this,g=window.s_sv_globals||{};return !m._booted||g.stop||!g.pending&&!g.triggerRequested;};m._execute=function("
+"){if(s_sv_globals.execute)setTimeout(\"s_sv_globals.execute();\",0);};m._boot=function(){var m=this,s=m.s,w=window,g,c,d=s.dc,e=s.visitorNamespace,n=navigator.appName.toLowerCase(),a=navigator.user"
+"Agent,v=navigator.appVersion,h,i,j,k,l,b;if(w.s_sv_globals)return;if(!((b=v.match(/AppleWebKit\\/([0-9]+)/))?521<b[1]:n==\"netscape\"?a.match(/gecko\\//i):(b=a.match(/opera[ \\/]?([0-9]+).[0-9]+/i)"
+")?7<b[1]:n==\"microsoft internet explorer\"&&!v.match(/macintosh/i)&&(b=v.match(/msie ([0-9]+).([0-9]+)/i))&&(5<b[1]||b[1]==5&&4<b[2])))return;g=w.s_sv_globals={};g.module=m;g.pending=0;g.incomingL"
+"ists=[];g.pageImpressions=[];g.manualTriggers=[];e=\"survey\";c=g.config={};m._param(c,\"dynamic_root\",(e?e+\".\":\"\")+d+\".2o7.net/survey/dynamic\");m._param(c,\"gather_root\",(e?e+\".\":\"\")+d"
+"+\".2o7.net/survey/gather\");g.url=location.protocol+\"//\"+c.dynamic_root;g.gatherUrl=location.protocol+\"//\"+c.gather_root;g.dataCenter=d;g.onListLoaded=new Function(\"r\",\"b\",\"d\",\"i\",\"l"
+"\",\"s_sv_globals.module._loaded(r,b,d,i,l);\");m._suites=(m.suites||s.un).toLowerCase().split(\",\");l=m._suites;b={};for(j=0;j<l.length;++j){i=l[j];if(i&&!b[i]){h=i.length;for(k=0;k<i.length;++k)"
+"h=(h&0x03ffffff)<<5^h>>26^i.charCodeAt(k);b[i]={url:g.url+\"/suites/\"+(h%251+100)+\"/\"+encodeURIComponent(i.replace(/\\|/,\"||\").replace(/\\//,\"|-\"))};++g.pending;}}g.suites=b;setTimeout(\"s_s"
+"v_globals.module._load();\",0);m._booted=1;};m._param=function(c,n,v){var p=\"s_sv_\",w=window,u=\"undefined\";if(typeof c[n]==u)c[n]=typeof w[p+n]==u?v:w[p+n];};m._load=function(){var m=this,g=s_s"
+"v_globals,q=g.suites,r,i,n=\"s_sv_sid\",b=m.s.c_r(n);if(!b){b=parseInt((new Date()).getTime()*Math.random());m.s.c_w(n,b);}for(i in q){r=q[i];if(!r.requested){r.requested=1;m._script(r.url+\"/list."
+"js?\"+b);}}};m._loaded=function(r,b,d,i,l){var m=this,g=s_sv_globals,n=g.incomingLists;--g.pending;if(!g.commonRevision){g.bulkRevision=b;g.commonRevision=r;g.commonUrl=g.url+\"/common/\"+b;}else i"
+"f(g.commonRevision!=r)return;if(!l.length)return;n[n.length]={r:i,l:l};if(g.execute)g.execute();else if(!g.triggerRequested){g.triggerRequested=1;m._script(g.commonUrl+\"/trigger.js\");}};m._script"
+"=function(u){var d=document,e=d.createElement(\"script\");e.type=\"text/javascript\";e.src=u;d.getElementsByTagName(\"head\")[0].appendChild(e);};if(m.onLoad)m.onLoad(s,m)";
s_dell.m_i("Survey");

/************* DO NOT ALTER ANYTHING BELOW THIS LINE ! **************/
var s_code='',s_objectID;function s_gi(un,pg,ss){var c="s.version='H.24.1';s.an=s_an;s.logDebug=function(m){var s=this,tcf=new Function('var e;try{console.log(\"'+s.rep(s.rep(m,\"\\n\",\"\\\\n\"),\""
+"\\\"\",\"\\\\\\\"\")+'\");}catch(e){}');tcf()};s.cls=function(x,c){var i,y='';if(!c)c=this.an;for(i=0;i<x.length;i++){n=x.substring(i,i+1);if(c.indexOf(n)>=0)y+=n}return y};s.fl=function(x,l){retur"
+"n x?(''+x).substring(0,l):x};s.co=function(o){if(!o)return o;var n=new Object,x;for(x in o)if(x.indexOf('select')<0&&x.indexOf('filter')<0)n[x]=o[x];return n};s.num=function(x){x=''+x;for(var p=0;p"
+"<x.length;p++)if(('0123456789').indexOf(x.substring(p,p+1))<0)return 0;return 1};s.rep=s_rep;s.sp=s_sp;s.jn=s_jn;s.ape=function(x){var s=this,h='0123456789ABCDEF',i,c=s.charSet,n,l,e,y='';c=c?c.toU"
+"pperCase():'';if(x){x=''+x;if(s.em==3)x=encodeURIComponent(x);else if(c=='AUTO'&&('').charCodeAt){for(i=0;i<x.length;i++){c=x.substring(i,i+1);n=x.charCodeAt(i);if(n>127){l=0;e='';while(n||l<4){e=h"
+".substring(n%16,n%16+1)+e;n=(n-n%16)/16;l++}y+='%u'+e}else if(c=='+')y+='%2B';else y+=escape(c)}x=y}else x=escape(''+x);x=s.rep(x,'+','%2B');if(c&&c!='AUTO'&&s.em==1&&x.indexOf('%u')<0&&x.indexOf('"
+"%U')<0){i=x.indexOf('%');while(i>=0){i++;if(h.substring(8).indexOf(x.substring(i,i+1).toUpperCase())>=0)return x.substring(0,i)+'u00'+x.substring(i);i=x.indexOf('%',i)}}}return x};s.epa=function(x)"
+"{var s=this;if(x){x=s.rep(''+x,'+',' ');return s.em==3?decodeURIComponent(x):unescape(x)}return x};s.pt=function(x,d,f,a){var s=this,t=x,z=0,y,r;while(t){y=t.indexOf(d);y=y<0?t.length:y;t=t.substri"
+"ng(0,y);r=s[f](t,a);if(r)return r;z+=y+d.length;t=x.substring(z,x.length);t=z<x.length?t:''}return ''};s.isf=function(t,a){var c=a.indexOf(':');if(c>=0)a=a.substring(0,c);c=a.indexOf('=');if(c>=0)a"
+"=a.substring(0,c);if(t.substring(0,2)=='s_')t=t.substring(2);return (t!=''&&t==a)};s.fsf=function(t,a){var s=this;if(s.pt(a,',','isf',t))s.fsg+=(s.fsg!=''?',':'')+t;return 0};s.fs=function(x,f){var"
+" s=this;s.fsg='';s.pt(x,',','fsf',f);return s.fsg};s.si=function(){var s=this,i,k,v,c=s_gi+'var s=s_gi(\"'+s.oun+'\");s.sa(\"'+s.un+'\");';for(i=0;i<s.va_g.length;i++){k=s.va_g[i];v=s[k];if(v!=unde"
+"fined){if(typeof(v)!='number')c+='s.'+k+'=\"'+s_fe(v)+'\";';else c+='s.'+k+'='+v+';'}}c+=\"s.lnk=s.eo=s.linkName=s.linkType=s.wd.s_objectID=s.ppu=s.pe=s.pev1=s.pev2=s.pev3='';\";return c};s.c_d='';"
+"s.c_gdf=function(t,a){var s=this;if(!s.num(t))return 1;return 0};s.c_gd=function(){var s=this,d=s.wd.location.hostname,n=s.fpCookieDomainPeriods,p;if(!n)n=s.cookieDomainPeriods;if(d&&!s.c_d){n=n?pa"
+"rseInt(n):2;n=n>2?n:2;p=d.lastIndexOf('.');if(p>=0){while(p>=0&&n>1){p=d.lastIndexOf('.',p-1);n--}s.c_d=p>0&&s.pt(d,'.','c_gdf',0)?d.substring(p):d}}return s.c_d};s.c_r=function(k){var s=this;k=s.a"
+"pe(k);var c=' '+s.d.cookie,i=c.indexOf(' '+k+'='),e=i<0?i:c.indexOf(';',i),v=i<0?'':s.epa(c.substring(i+2+k.length,e<0?c.length:e));return v!='[[B]]'?v:''};s.c_w=function(k,v,e){var s=this,d=s.c_gd"
+"(),l=s.cookieLifetime,t;v=''+v;l=l?(''+l).toUpperCase():'';if(e&&l!='SESSION'&&l!='NONE'){t=(v!=''?parseInt(l?l:0):-60);if(t){e=new Date;e.setTime(e.getTime()+(t*1000))}}if(k&&l!='NONE'){s.d.cookie"
+"=k+'='+s.ape(v!=''?v:'[[B]]')+'; path=/;'+(e&&l!='SESSION'?' expires='+e.toGMTString()+';':'')+(d?' domain='+d+';':'');return s.c_r(k)==v}return 0};s.eh=function(o,e,r,f){var s=this,b='s_'+e+'_'+s."
+"_in,n=-1,l,i,x;if(!s.ehl)s.ehl=new Array;l=s.ehl;for(i=0;i<l.length&&n<0;i++){if(l[i].o==o&&l[i].e==e)n=i}if(n<0){n=i;l[n]=new Object}x=l[n];x.o=o;x.e=e;f=r?x.b:f;if(r||f){x.b=r?0:o[e];x.o[e]=f}if("
+"x.b){x.o[b]=x.b;return b}return 0};s.cet=function(f,a,t,o,b){var s=this,r,tcf;if(s.apv>=5&&(!s.isopera||s.apv>=7)){tcf=new Function('s','f','a','t','var e,r;try{r=s[f](a)}catch(e){r=s[t](e)}return "
+"r');r=tcf(s,f,a,t)}else{if(s.ismac&&s.u.indexOf('MSIE 4')>=0)r=s[b](a);else{s.eh(s.wd,'onerror',0,o);r=s[f](a);s.eh(s.wd,'onerror',1)}}return r};s.gtfset=function(e){var s=this;return s.tfs};s.gtfs"
+"oe=new Function('e','var s=s_c_il['+s._in+'],c;s.eh(window,\"onerror\",1);s.etfs=1;c=s.t();if(c)s.d.write(c);s.etfs=0;return true');s.gtfsfb=function(a){return window};s.gtfsf=function(w){var s=thi"
+"s,p=w.parent,l=w.location;s.tfs=w;if(p&&p.location!=l&&p.location.host==l.host){s.tfs=p;return s.gtfsf(s.tfs)}return s.tfs};s.gtfs=function(){var s=this;if(!s.tfs){s.tfs=s.wd;if(!s.etfs)s.tfs=s.cet"
+"('gtfsf',s.tfs,'gtfset',s.gtfsoe,'gtfsfb')}return s.tfs};s.mrq=function(u){var s=this,l=s.rl[u],n,r;s.rl[u]=0;if(l)for(n=0;n<l.length;n++){r=l[n];s.mr(0,0,r.r,r.t,r.u)}};s.flushBufferedRequests=fun"
+"ction(){};s.mr=function(sess,q,rs,ta,u){var s=this,dc=s.dc,t1=s.trackingServer,t2=s.trackingServerSecure,tb=s.trackingServerBase,p='.sc',ns=s.visitorNamespace,un=s.cls(u?u:(ns?ns:s.fun)),r=new Obje"
+"ct,l,imn='s_i_'+(un),im,b,e;if(!rs){if(t1){if(t2&&s.ssl)t1=t2}else{if(!tb)tb='2o7.net';if(dc)dc=(''+dc).toLowerCase();else dc='d1';if(tb=='2o7.net'){if(dc=='d1')dc='112';else if(dc=='d2')dc='122';p"
+"=''}t1=un+'.'+dc+'.'+p+tb}rs='http'+(s.ssl?'s':'')+'://'+t1+'/b/ss/'+s.un+'/'+(s.mobile?'5.1':'1')+'/'+s.version+(s.tcn?'T':'')+'/'+sess+'?AQB=1&ndh=1'+(q?q:'')+'&AQE=1';if(s.isie&&!s.ismac)rs=s.fl"
+"(rs,2047)}if(s.d.images&&s.apv>=3&&(!s.isopera||s.apv>=7)&&(s.ns6<0||s.apv>=6.1)){if(!s.rc)s.rc=new Object;if(!s.rc[un]){s.rc[un]=1;if(!s.rl)s.rl=new Object;s.rl[un]=new Array;setTimeout('if(window"
+".s_c_il)window.s_c_il['+s._in+'].mrq(\"'+un+'\")',750)}else{l=s.rl[un];if(l){r.t=ta;r.u=un;r.r=rs;l[l.length]=r;return ''}imn+='_'+s.rc[un];s.rc[un]++}im=s.wd[imn];if(!im)im=s.wd[imn]=new Image;im."
+"s_l=0;im.onload=new Function('e','this.s_l=1;var wd=window,s;if(wd.s_c_il){s=wd.s_c_il['+s._in+'];s.mrq(\"'+un+'\");s.nrs--;if(!s.nrs)s.m_m(\"rr\")}');if(!s.nrs){s.nrs=1;s.m_m('rs')}else s.nrs++;if"
+"(s.debugTracking){var d='AppMeasurement Debug: '+rs,dl=s.sp(rs,'&'),dln;for(dln=0;dln<dl.length;dln++)d+=\"\\n\\t\"+s.epa(dl[dln]);s.logDebug(d)}im.src=rs;if((!ta||ta=='_self'||ta=='_top'||(s.wd.na"
+"me&&ta==s.wd.name))&&rs.indexOf('&pe=')>=0){b=e=new Date;while(!im.s_l&&e.getTime()-b.getTime()<500)e=new Date}return ''}return '<im'+'g sr'+'c=\"'+rs+'\" width=1 height=1 border=0 alt=\"\">'};s.gg"
+"=function(v){var s=this;if(!s.wd['s_'+v])s.wd['s_'+v]='';return s.wd['s_'+v]};s.glf=function(t,a){if(t.substring(0,2)=='s_')t=t.substring(2);var s=this,v=s.gg(t);if(v)s[t]=v};s.gl=function(v){var s"
+"=this;if(s.pg)s.pt(v,',','glf',0)};s.rf=function(x){var s=this,y,i,j,h,p,l=0,q,a,b='',c='',t;if(x&&x.length>255){y=''+x;i=y.indexOf('?');if(i>0){q=y.substring(i+1);y=y.substring(0,i);h=y.toLowerCas"
+"e();j=0;if(h.substring(0,7)=='http://')j+=7;else if(h.substring(0,8)=='https://')j+=8;i=h.indexOf(\"/\",j);if(i>0){h=h.substring(j,i);p=y.substring(i);y=y.substring(0,i);if(h.indexOf('google')>=0)l"
+"=',q,ie,start,search_key,word,kw,cd,';else if(h.indexOf('yahoo.co')>=0)l=',p,ei,';if(l&&q){a=s.sp(q,'&');if(a&&a.length>1){for(j=0;j<a.length;j++){t=a[j];i=t.indexOf('=');if(i>0&&l.indexOf(','+t.su"
+"bstring(0,i)+',')>=0)b+=(b?'&':'')+t;else c+=(c?'&':'')+t}if(b&&c)q=b+'&'+c;else c=''}i=253-(q.length-c.length)-y.length;x=y+(i>0?p.substring(0,i):'')+'?'+q}}}}return x};s.s2q=function(k,v,vf,vfp,f"
+"){var s=this,qs='',sk,sv,sp,ss,nke,nk,nf,nfl=0,nfn,nfm;if(k==\"contextData\")k=\"c\";if(v){for(sk in v) {if((!f||sk.substring(0,f.length)==f)&&v[sk]&&(!vf||vf.indexOf(','+(vfp?vfp+'.':'')+sk+',')>="
+"0)){nfm=0;if(nfl)for(nfn=0;nfn<nfl.length;nfn++)if(sk.substring(0,nfl[nfn].length)==nfl[nfn])nfm=1;if(!nfm){if(qs=='')qs+='&'+k+'.';sv=v[sk];if(f)sk=sk.substring(f.length);if(sk.length>0){nke=sk.in"
+"dexOf('.');if(nke>0){nk=sk.substring(0,nke);nf=(f?f:'')+nk+'.';if(!nfl)nfl=new Array;nfl[nfl.length]=nf;qs+=s.s2q(nk,v,vf,vfp,nf)}else{if(typeof(sv)=='boolean'){if(sv)sv='true';else sv='false'}if(s"
+"v){if(vfp=='retrieveLightData'&&f.indexOf('.contextData.')<0){sp=sk.substring(0,4);ss=sk.substring(4);if(sk=='transactionID')sk='xact';else if(sk=='channel')sk='ch';else if(sk=='campaign')sk='v0';e"
+"lse if(s.num(ss)){if(sp=='prop')sk='c'+ss;else if(sp=='eVar')sk='v'+ss;else if(sp=='list')sk='l'+ss;else if(sp=='hier'){sk='h'+ss;sv=sv.substring(0,255)}}}qs+='&'+s.ape(sk)+'='+s.ape(sv)}}}}}}if(qs"
+"!='')qs+='&.'+k}return qs};s.hav=function(){var s=this,qs='',l,fv='',fe='',mn,i,e;if(s.lightProfileID){l=s.va_m;fv=s.lightTrackVars;if(fv)fv=','+fv+','+s.vl_mr+','}else{l=s.va_t;if(s.pe||s.linkType"
+"){fv=s.linkTrackVars;fe=s.linkTrackEvents;if(s.pe){mn=s.pe.substring(0,1).toUpperCase()+s.pe.substring(1);if(s[mn]){fv=s[mn].trackVars;fe=s[mn].trackEvents}}}if(fv)fv=','+fv+','+s.vl_l+','+s.vl_l2;"
+"if(fe){fe=','+fe+',';if(fv)fv+=',events,'}if (s.events2)e=(e?',':'')+s.events2}for(i=0;i<l.length;i++){var k=l[i],v=s[k],b=k.substring(0,4),x=k.substring(4),n=parseInt(x),q=k;if(!v)if(k=='events'&&"
+"e){v=e;e=''}if(v&&(!fv||fv.indexOf(','+k+',')>=0)&&k!='linkName'&&k!='linkType'){if(k=='timestamp')q='ts';else if(k=='dynamicVariablePrefix')q='D';else if(k=='visitorID')q='vid';else if(k=='pageURL"
+"'){q='g';v=s.fl(v,255)}else if(k=='referrer'){q='r';v=s.fl(s.rf(v),255)}else if(k=='vmk'||k=='visitorMigrationKey')q='vmt';else if(k=='visitorMigrationServer'){q='vmf';if(s.ssl&&s.visitorMigrationS"
+"erverSecure)v=''}else if(k=='visitorMigrationServerSecure'){q='vmf';if(!s.ssl&&s.visitorMigrationServer)v=''}else if(k=='charSet'){q='ce';if(v.toUpperCase()=='AUTO')v='ISO8859-1';else if(s.em==2||s"
+".em==3)v='UTF-8'}else if(k=='visitorNamespace')q='ns';else if(k=='cookieDomainPeriods')q='cdp';else if(k=='cookieLifetime')q='cl';else if(k=='variableProvider')q='vvp';else if(k=='currencyCode')q='"
+"cc';else if(k=='channel')q='ch';else if(k=='transactionID')q='xact';else if(k=='campaign')q='v0';else if(k=='resolution')q='s';else if(k=='colorDepth')q='c';else if(k=='javascriptVersion')q='j';els"
+"e if(k=='javaEnabled')q='v';else if(k=='cookiesEnabled')q='k';else if(k=='browserWidth')q='bw';else if(k=='browserHeight')q='bh';else if(k=='connectionType')q='ct';else if(k=='homepage')q='hp';else"
+" if(k=='plugins')q='p';else if(k=='events'){if(e)v+=(v?',':'')+e;if(fe)v=s.fs(v,fe)}else if(k=='events2')v='';else if(k=='contextData'){qs+=s.s2q('c',s[k],fv,k,0);v=''}else if(k=='lightProfileID')q"
+"='mtp';else if(k=='lightStoreForSeconds'){q='mtss';if(!s.lightProfileID)v=''}else if(k=='lightIncrementBy'){q='mti';if(!s.lightProfileID)v=''}else if(k=='retrieveLightProfiles')q='mtsr';else if(k=="
+"'deleteLightProfiles')q='mtsd';else if(k=='retrieveLightData'){if(s.retrieveLightProfiles)qs+=s.s2q('mts',s[k],fv,k,0);v=''}else if(s.num(x)){if(b=='prop')q='c'+n;else if(b=='eVar')q='v'+n;else if("
+"b=='list')q='l'+n;else if(b=='hier'){q='h'+n;v=s.fl(v,255)}}if(v)qs+='&'+s.ape(q)+'='+(k.substring(0,3)!='pev'?s.ape(v):v)}}return qs};s.ltdf=function(t,h){t=t?t.toLowerCase():'';h=h?h.toLowerCase("
+"):'';var qi=h.indexOf('?');h=qi>=0?h.substring(0,qi):h;if(t&&h.substring(h.length-(t.length+1))=='.'+t)return 1;return 0};s.ltef=function(t,h){t=t?t.toLowerCase():'';h=h?h.toLowerCase():'';if(t&&h."
+"indexOf(t)>=0)return 1;return 0};s.lt=function(h){var s=this,lft=s.linkDownloadFileTypes,lef=s.linkExternalFilters,lif=s.linkInternalFilters;lif=lif?lif:s.wd.location.hostname;h=h.toLowerCase();if("
+"s.trackDownloadLinks&&lft&&s.pt(lft,',','ltdf',h))return 'd';if(s.trackExternalLinks&&h.substring(0,1)!='#'&&(lef||lif)&&(!lef||s.pt(lef,',','ltef',h))&&(!lif||!s.pt(lif,',','ltef',h)))return 'e';r"
+"eturn ''};s.lc=new Function('e','var s=s_c_il['+s._in+'],b=s.eh(this,\"onclick\");s.lnk=s.co(this);s.t();s.lnk=0;if(b)return this[b](e);return true');s.bc=new Function('e','var s=s_c_il['+s._in+'],"
+"f,tcf;if(s.d&&s.d.all&&s.d.all.cppXYctnr)return;s.eo=e.srcElement?e.srcElement:e.target;tcf=new Function(\"s\",\"var e;try{if(s.eo&&(s.eo.tagName||s.eo.parentElement||s.eo.parentNode))s.t()}catch(e"
+"){}\");tcf(s);s.eo=0');s.oh=function(o){var s=this,l=s.wd.location,h=o.href?o.href:'',i,j,k,p;i=h.indexOf(':');j=h.indexOf('?');k=h.indexOf('/');if(h&&(i<0||(j>=0&&i>j)||(k>=0&&i>k))){p=o.protocol&"
+"&o.protocol.length>1?o.protocol:(l.protocol?l.protocol:'');i=l.pathname.lastIndexOf('/');h=(p?p+'//':'')+(o.host?o.host:(l.host?l.host:''))+(h.substring(0,1)!='/'?l.pathname.substring(0,i<0?0:i)+'/"
+"':'')+h}return h};s.ot=function(o){var t=o.tagName;if(o.tagUrn||(o.scopeName&&o.scopeName.toUpperCase()!='HTML'))return '';t=t&&t.toUpperCase?t.toUpperCase():'';if(t=='SHAPE')t='';if(t){if((t=='INP"
+"UT'||t=='BUTTON')&&o.type&&o.type.toUpperCase)t=o.type.toUpperCase();else if(!t&&o.href)t='A';}return t};s.oid=function(o){var s=this,t=s.ot(o),p,c,n='',x=0;if(t&&!o.s_oid){p=o.protocol;c=o.onclick"
+";if(o.href&&(t=='A'||t=='AREA')&&(!c||!p||p.toLowerCase().indexOf('javascript')<0))n=s.oh(o);else if(c){n=s.rep(s.rep(s.rep(s.rep(''+c,\"\\r\",''),\"\\n\",''),\"\\t\",''),' ','');x=2}else if(t=='IN"
+"PUT'||t=='SUBMIT'){if(o.value)n=o.value;else if(o.innerText)n=o.innerText;else if(o.textContent)n=o.textContent;x=3}else if(o.src&&t=='IMAGE')n=o.src;if(n){o.s_oid=s.fl(n,100);o.s_oidt=x}}return o."
+"s_oid};s.rqf=function(t,un){var s=this,e=t.indexOf('='),u=e>=0?t.substring(0,e):'',q=e>=0?s.epa(t.substring(e+1)):'';if(u&&q&&(','+u+',').indexOf(','+un+',')>=0){if(u!=s.un&&s.un.indexOf(',')>=0)q="
+"'&u='+u+q+'&u=0';return q}return ''};s.rq=function(un){if(!un)un=this.un;var s=this,c=un.indexOf(','),v=s.c_r('s_sq'),q='';if(c<0)return s.pt(v,'&','rqf',un);return s.pt(un,',','rq',0)};s.sqp=funct"
+"ion(t,a){var s=this,e=t.indexOf('='),q=e<0?'':s.epa(t.substring(e+1));s.sqq[q]='';if(e>=0)s.pt(t.substring(0,e),',','sqs',q);return 0};s.sqs=function(un,q){var s=this;s.squ[un]=q;return 0};s.sq=fun"
+"ction(q){var s=this,k='s_sq',v=s.c_r(k),x,c=0;s.sqq=new Object;s.squ=new Object;s.sqq[q]='';s.pt(v,'&','sqp',0);s.pt(s.un,',','sqs',q);v='';for(x in s.squ)if(x&&(!Object||!Object.prototype||!Object"
+".prototype[x]))s.sqq[s.squ[x]]+=(s.sqq[s.squ[x]]?',':'')+x;for(x in s.sqq)if(x&&(!Object||!Object.prototype||!Object.prototype[x])&&s.sqq[x]&&(x==q||c<2)){v+=(v?'&':'')+s.sqq[x]+'='+s.ape(x);c++}re"
+"turn s.c_w(k,v,0)};s.wdl=new Function('e','var s=s_c_il['+s._in+'],r=true,b=s.eh(s.wd,\"onload\"),i,o,oc;if(b)r=this[b](e);for(i=0;i<s.d.links.length;i++){o=s.d.links[i];oc=o.onclick?\"\"+o.onclick"
+":\"\";if((oc.indexOf(\"s_gs(\")<0||oc.indexOf(\".s_oc(\")>=0)&&oc.indexOf(\".tl(\")<0)s.eh(o,\"onclick\",0,s.lc);}return r');s.wds=function(){var s=this;if(s.apv>3&&(!s.isie||!s.ismac||s.apv>=5)){i"
+"f(s.b&&s.b.attachEvent)s.b.attachEvent('onclick',s.bc);else if(s.b&&s.b.addEventListener)s.b.addEventListener('click',s.bc,false);else s.eh(s.wd,'onload',0,s.wdl)}};s.vs=function(x){var s=this,v=s."
+"visitorSampling,g=s.visitorSamplingGroup,k='s_vsn_'+s.un+(g?'_'+g:''),n=s.c_r(k),e=new Date,y=e.getYear();e.setYear(y+10+(y<1900?1900:0));if(v){v*=100;if(!n){if(!s.c_w(k,x,e))return 0;n=x}if(n%1000"
+"0>v)return 0}return 1};s.dyasmf=function(t,m){if(t&&m&&m.indexOf(t)>=0)return 1;return 0};s.dyasf=function(t,m){var s=this,i=t?t.indexOf('='):-1,n,x;if(i>=0&&m){var n=t.substring(0,i),x=t.substring"
+"(i+1);if(s.pt(x,',','dyasmf',m))return n}return 0};s.uns=function(){var s=this,x=s.dynamicAccountSelection,l=s.dynamicAccountList,m=s.dynamicAccountMatch,n,i;s.un=s.un.toLowerCase();if(x&&l){if(!m)"
+"m=s.wd.location.host;if(!m.toLowerCase)m=''+m;l=l.toLowerCase();m=m.toLowerCase();n=s.pt(l,';','dyasf',m);if(n)s.un=n}i=s.un.indexOf(',');s.fun=i<0?s.un:s.un.substring(0,i)};s.sa=function(un){var s"
+"=this;s.un=un;if(!s.oun)s.oun=un;else if((','+s.oun+',').indexOf(','+un+',')<0)s.oun+=','+un;s.uns()};s.m_i=function(n,a){var s=this,m,f=n.substring(0,1),r,l,i;if(!s.m_l)s.m_l=new Object;if(!s.m_nl"
+")s.m_nl=new Array;m=s.m_l[n];if(!a&&m&&m._e&&!m._i)s.m_a(n);if(!m){m=new Object,m._c='s_m';m._in=s.wd.s_c_in;m._il=s._il;m._il[m._in]=m;s.wd.s_c_in++;m.s=s;m._n=n;m._l=new Array('_c','_in','_il','_"
+"i','_e','_d','_dl','s','n','_r','_g','_g1','_t','_t1','_x','_x1','_rs','_rr','_l');s.m_l[n]=m;s.m_nl[s.m_nl.length]=n}else if(m._r&&!m._m){r=m._r;r._m=m;l=m._l;for(i=0;i<l.length;i++)if(m[l[i]])r[l"
+"[i]]=m[l[i]];r._il[r._in]=r;m=s.m_l[n]=r}if(f==f.toUpperCase())s[n]=m;return m};s.m_a=new Function('n','g','e','if(!g)g=\"m_\"+n;var s=s_c_il['+s._in+'],c=s[g+\"_c\"],m,x,f=0;if(!c)c=s.wd[\"s_\"+g+"
+"\"_c\"];if(c&&s_d)s[g]=new Function(\"s\",s_ft(s_d(c)));x=s[g];if(!x)x=s.wd[\\'s_\\'+g];if(!x)x=s.wd[g];m=s.m_i(n,1);if(x&&(!m._i||g!=\"m_\"+n)){m._i=f=1;if((\"\"+x).indexOf(\"function\")>=0)x(s);e"
+"lse s.m_m(\"x\",n,x,e)}m=s.m_i(n,1);if(m._dl)m._dl=m._d=0;s.dlt();return f');s.m_m=function(t,n,d,e){t='_'+t;var s=this,i,x,m,f='_'+t,r=0,u;if(s.m_l&&s.m_nl)for(i=0;i<s.m_nl.length;i++){x=s.m_nl[i]"
+";if(!n||x==n){m=s.m_i(x);u=m[t];if(u){if((''+u).indexOf('function')>=0){if(d&&e)u=m[t](d,e);else if(d)u=m[t](d);else u=m[t]()}}if(u)r=1;u=m[t+1];if(u&&!m[f]){if((''+u).indexOf('function')>=0){if(d&"
+"&e)u=m[t+1](d,e);else if(d)u=m[t+1](d);else u=m[t+1]()}}m[f]=1;if(u)r=1}}return r};s.m_ll=function(){var s=this,g=s.m_dl,i,o;if(g)for(i=0;i<g.length;i++){o=g[i];if(o)s.loadModule(o.n,o.u,o.d,o.l,o."
+"e,1);g[i]=0}};s.loadModule=function(n,u,d,l,e,ln){var s=this,m=0,i,g,o=0,f1,f2,c=s.h?s.h:s.b,b,tcf;if(n){i=n.indexOf(':');if(i>=0){g=n.substring(i+1);n=n.substring(0,i)}else g=\"m_\"+n;m=s.m_i(n)}i"
+"f((l||(n&&!s.m_a(n,g)))&&u&&s.d&&c&&s.d.createElement){if(d){m._d=1;m._dl=1}if(ln){if(s.ssl)u=s.rep(u,'http:','https:');i='s_s:'+s._in+':'+n+':'+g;b='var s=s_c_il['+s._in+'],o=s.d.getElementById(\""
+"'+i+'\");if(s&&o){if(!o.l&&s.wd.'+g+'){o.l=1;if(o.i)clearTimeout(o.i);o.i=0;s.m_a(\"'+n+'\",\"'+g+'\"'+(e?',\"'+e+'\"':'')+')}';f2=b+'o.c++;if(!s.maxDelay)s.maxDelay=250;if(!o.l&&o.c<(s.maxDelay*2)"
+"/100)o.i=setTimeout(o.f2,100)}';f1=new Function('e',b+'}');tcf=new Function('s','c','i','u','f1','f2','var e,o=0;try{o=s.d.createElement(\"script\");if(o){o.type=\"text/javascript\";'+(n?'o.id=i;o."
+"defer=true;o.onload=o.onreadystatechange=f1;o.f2=f2;o.l=0;':'')+'o.src=u;c.appendChild(o);'+(n?'o.c=0;o.i=setTimeout(f2,100)':'')+'}}catch(e){o=0}return o');o=tcf(s,c,i,u,f1,f2)}else{o=new Object;o"
+".n=n+':'+g;o.u=u;o.d=d;o.l=l;o.e=e;g=s.m_dl;if(!g)g=s.m_dl=new Array;i=0;while(i<g.length&&g[i])i++;g[i]=o}}else if(n){m=s.m_i(n);m._e=1}return m};s.voa=function(vo,r){var s=this,l=s.va_g,i,k,v,x;f"
+"or(i=0;i<l.length;i++){k=l[i];v=vo[k];if(v||vo['!'+k]){if(!r&&(k==\"contextData\"||k==\"retrieveLightData\")&&s[k])for(x in s[k])if(!v[x])v[x]=s[k][x];s[k]=v}}};s.vob=function(vo){var s=this,l=s.va"
+"_g,i,k;for(i=0;i<l.length;i++){k=l[i];vo[k]=s[k];if(!vo[k])vo['!'+k]=1}};s.dlt=new Function('var s=s_c_il['+s._in+'],d=new Date,i,vo,f=0;if(s.dll)for(i=0;i<s.dll.length;i++){vo=s.dll[i];if(vo){if(!"
+"s.m_m(\"d\")||d.getTime()-vo._t>=s.maxDelay){s.dll[i]=0;s.t(vo)}else f=1}}if(s.dli)clearTimeout(s.dli);s.dli=0;if(f){if(!s.dli)s.dli=setTimeout(s.dlt,s.maxDelay)}else s.dll=0');s.dl=function(vo){va"
+"r s=this,d=new Date;if(!vo)vo=new Object;s.vob(vo);vo._t=d.getTime();if(!s.dll)s.dll=new Array;s.dll[s.dll.length]=vo;if(!s.maxDelay)s.maxDelay=250;s.dlt()};s.track=s.t=function(vo){var s=this,trk="
+"1,tm=new Date,sed=Math&&Math.random?Math.floor(Math.random()*10000000000000):tm.getTime(),sess='s'+Math.floor(tm.getTime()/10800000)%10+sed,y=tm.getYear(),vt=tm.getDate()+'/'+tm.getMonth()+'/'+(y<1"
+"900?y+1900:y)+' '+tm.getHours()+':'+tm.getMinutes()+':'+tm.getSeconds()+' '+tm.getDay()+' '+tm.getTimezoneOffset(),tcf,tfs=s.gtfs(),ta=-1,q='',qs='',code='',vb=new Object;s.gl(s.vl_g);s.uns();s.m_l"
+"l();if(!s.td){var tl=tfs.location,a,o,i,x='',c='',v='',p='',bw='',bh='',j='1.0',k=s.c_w('s_cc','true',0)?'Y':'N',hp='',ct='',pn=0,ps;if(String&&String.prototype){j='1.1';if(j.match){j='1.2';if(tm.s"
+"etUTCDate){j='1.3';if(s.isie&&s.ismac&&s.apv>=5)j='1.4';if(pn.toPrecision){j='1.5';a=new Array;if(a.forEach){j='1.6';i=0;o=new Object;tcf=new Function('o','var e,i=0;try{i=new Iterator(o)}catch(e){"
+"}return i');i=tcf(o);if(i&&i.next)j='1.7'}}}}}if(s.apv>=4)x=screen.width+'x'+screen.height;if(s.isns||s.isopera){if(s.apv>=3){v=s.n.javaEnabled()?'Y':'N';if(s.apv>=4){c=screen.pixelDepth;bw=s.wd.in"
+"nerWidth;bh=s.wd.innerHeight}}s.pl=s.n.plugins}else if(s.isie){if(s.apv>=4){v=s.n.javaEnabled()?'Y':'N';c=screen.colorDepth;if(s.apv>=5){bw=s.d.documentElement.offsetWidth;bh=s.d.documentElement.of"
+"fsetHeight;if(!s.ismac&&s.b){tcf=new Function('s','tl','var e,hp=0;try{s.b.addBehavior(\"#default#homePage\");hp=s.b.isHomePage(tl)?\"Y\":\"N\"}catch(e){}return hp');hp=tcf(s,tl);tcf=new Function('"
+"s','var e,ct=0;try{s.b.addBehavior(\"#default#clientCaps\");ct=s.b.connectionType}catch(e){}return ct');ct=tcf(s)}}}else r=''}if(s.pl)while(pn<s.pl.length&&pn<30){ps=s.fl(s.pl[pn].name,100)+';';if("
+"p.indexOf(ps)<0)p+=ps;pn++}s.resolution=x;s.colorDepth=c;s.javascriptVersion=j;s.javaEnabled=v;s.cookiesEnabled=k;s.browserWidth=bw;s.browserHeight=bh;s.connectionType=ct;s.homepage=hp;s.plugins=p;"
+"s.td=1}if(vo){s.vob(vb);s.voa(vo)}if((vo&&vo._t)||!s.m_m('d')){if(s.usePlugins)s.doPlugins(s);var l=s.wd.location,r=tfs.document.referrer;if(!s.pageURL)s.pageURL=l.href?l.href:l;if(!s.referrer&&!s."
+"_1_referrer){s.referrer=r;s._1_referrer=1}s.m_m('g');if(s.lnk||s.eo){var o=s.eo?s.eo:s.lnk,p=s.pageName,w=1,t=s.ot(o),n=s.oid(o),x=o.s_oidt,h,l,i,oc;if(s.eo&&o==s.eo){while(o&&!n&&t!='BODY'){o=o.pa"
+"rentElement?o.parentElement:o.parentNode;if(o){t=s.ot(o);n=s.oid(o);x=o.s_oidt}}if(o){oc=o.onclick?''+o.onclick:'';if((oc.indexOf('s_gs(')>=0&&oc.indexOf('.s_oc(')<0)||oc.indexOf('.tl(')>=0)o=0}}if"
+"(o){if(n)ta=o.target;h=s.oh(o);i=h.indexOf('?');h=s.linkLeaveQueryString||i<0?h:h.substring(0,i);l=s.linkName;t=s.linkType?s.linkType.toLowerCase():s.lt(h);if(t&&(h||l)){s.pe='lnk_'+(t=='d'||t=='e'"
+"?t:'o');q+='&pe='+s.pe+(h?'&pev1='+s.ape(h):'')+(l?'&pev2='+s.ape(l):'');}else trk=0;if(s.trackInlineStats){if(!p){p=s.pageURL;w=0}t=s.ot(o);i=o.sourceIndex;if(s.gg('objectID')){n=s.gg('objectID');"
+"x=1;i=1}if(p&&n&&t)qs='&pid='+s.ape(s.fl(p,255))+(w?'&pidt='+w:'')+'&oid='+s.ape(s.fl(n,100))+(x?'&oidt='+x:'')+'&ot='+s.ape(t)+(i?'&oi='+i:'')}}else trk=0}if(trk||qs){s.sampled=s.vs(sed);if(trk){i"
+"f(s.sampled)code=s.mr(sess,(vt?'&t='+s.ape(vt):'')+s.hav()+q+(qs?qs:s.rq()),0,ta);qs='';s.m_m('t');if(s.p_r)s.p_r();s.referrer=s.lightProfileID=s.retrieveLightProfiles=s.deleteLightProfiles=''}s.sq"
+"(qs)}}else s.dl(vo);if(vo)s.voa(vb,1);s.lnk=s.eo=s.linkName=s.linkType=s.wd.s_objectID=s.ppu=s.pe=s.pev1=s.pev2=s.pev3='';if(s.pg)s.wd.s_lnk=s.wd.s_eo=s.wd.s_linkName=s.wd.s_linkType='';return code"
+"};s.trackLink=s.tl=function(o,t,n,vo){var s=this;s.lnk=s.co(o);s.linkType=t;s.linkName=n;s.t(vo)};s.trackLight=function(p,ss,i,vo){var s=this;s.lightProfileID=p;s.lightStoreForSeconds=ss;s.lightInc"
+"rementBy=i;s.t(vo)};s.setTagContainer=function(n){var s=this,l=s.wd.s_c_il,i,t,x,y;s.tcn=n;if(l)for(i=0;i<l.length;i++){t=l[i];if(t&&t._c=='s_l'&&t.tagContainerName==n){s.voa(t);if(t.lmq)for(i=0;i<"
+"t.lmq.length;i++){x=t.lmq[i];y='m_'+x.n;if(!s[y]&&!s[y+'_c']){s[y]=t[y];s[y+'_c']=t[y+'_c']}s.loadModule(x.n,x.u,x.d)}if(t.ml)for(x in t.ml)if(s[x]){y=s[x];x=t.ml[x];for(i in x)if(!Object.prototype"
+"[i]){if(typeof(x[i])!='function'||(''+x[i]).indexOf('s_c_il')<0)y[i]=x[i]}}if(t.mmq)for(i=0;i<t.mmq.length;i++){x=t.mmq[i];if(s[x.m]){y=s[x.m];if(y[x.f]&&typeof(y[x.f])=='function'){if(x.a)y[x.f].a"
+"pply(y,x.a);else y[x.f].apply(y)}}}if(t.tq)for(i=0;i<t.tq.length;i++)s.t(t.tq[i]);t.s=s;return}}};s.wd=window;s.ssl=(s.wd.location.protocol.toLowerCase().indexOf('https')>=0);s.d=document;s.b=s.d.b"
+"ody;if(s.d.getElementsByTagName){s.h=s.d.getElementsByTagName('HEAD');if(s.h)s.h=s.h[0]}s.n=navigator;s.u=s.n.userAgent;s.ns6=s.u.indexOf('Netscape6/');var apn=s.n.appName,v=s.n.appVersion,ie=v.ind"
+"exOf('MSIE '),o=s.u.indexOf('Opera '),i;if(v.indexOf('Opera')>=0||o>0)apn='Opera';s.isie=(apn=='Microsoft Internet Explorer');s.isns=(apn=='Netscape');s.isopera=(apn=='Opera');s.ismac=(s.u.indexOf("
+"'Mac')>=0);if(o>0)s.apv=parseFloat(s.u.substring(o+6));else if(ie>0){s.apv=parseInt(i=v.substring(ie+5));if(s.apv>3)s.apv=parseFloat(i)}else if(s.ns6>0)s.apv=parseFloat(s.u.substring(s.ns6+10));els"
+"e s.apv=parseFloat(v);s.em=0;if(s.em.toPrecision)s.em=3;else if(String.fromCharCode){i=escape(String.fromCharCode(256)).toUpperCase();s.em=(i=='%C4%80'?2:(i=='%U0100'?1:0))}if(s.oun)s.sa(s.oun);s.s"
+"a(un);s.vl_l='dynamicVariablePrefix,visitorID,vmk,visitorMigrationKey,visitorMigrationServer,visitorMigrationServerSecure,ppu,charSet,visitorNamespace,cookieDomainPeriods,cookieLifetime,pageName,pa"
+"geURL,referrer,currencyCode';s.va_l=s.sp(s.vl_l,',');s.vl_mr=s.vl_m='charSet,visitorNamespace,cookieDomainPeriods,cookieLifetime,contextData,lightProfileID,lightStoreForSeconds,lightIncrementBy';s."
+"vl_t=s.vl_l+',variableProvider,channel,server,pageType,transactionID,purchaseID,campaign,state,zip,events,events2,products,linkName,linkType,contextData,lightProfileID,lightStoreForSeconds,lightInc"
+"rementBy,retrieveLightProfiles,deleteLightProfiles,retrieveLightData';var n;for(n=1;n<=75;n++){s.vl_t+=',prop'+n+',eVar'+n;s.vl_m+=',prop'+n+',eVar'+n}for(n=1;n<=5;n++)s.vl_t+=',hier'+n;for(n=1;n<="
+"3;n++)s.vl_t+=',list'+n;s.va_m=s.sp(s.vl_m,',');s.vl_l2=',tnt,pe,pev1,pev2,pev3,resolution,colorDepth,javascriptVersion,javaEnabled,cookiesEnabled,browserWidth,browserHeight,connectionType,homepage"
+",plugins';s.vl_t+=s.vl_l2;s.va_t=s.sp(s.vl_t,',');s.vl_g=s.vl_t+',trackingServer,trackingServerSecure,trackingServerBase,fpCookieDomainPeriods,disableBufferedRequests,mobile,visitorSampling,visitor"
+"SamplingGroup,dynamicAccountSelection,dynamicAccountList,dynamicAccountMatch,trackDownloadLinks,trackExternalLinks,trackInlineStats,linkLeaveQueryString,linkDownloadFileTypes,linkExternalFilters,li"
+"nkInternalFilters,linkTrackVars,linkTrackEvents,linkNames,lnk,eo,lightTrackVars,_1_referrer,un';s.va_g=s.sp(s.vl_g,',');s.pg=pg;s.gl(s.vl_g);s.contextData=new Object;s.retrieveLightData=new Object;"
+"if(!ss)s.wds();if(pg){s.wd.s_co=function(o){s_gi(\"_\",1,1).co(o)};s.wd.s_gs=function(un){s_gi(un,1,1).t()};s.wd.s_dc=function(un){s_gi(un,1).t()}}",
w=window,l=w.s_c_il,n=navigator,u=n.userAgent,v=n.appVersion,e=v.indexOf('MSIE '),m=u.indexOf('Netscape6/'),a,i,j,x,s;if(un){un=un.toLowerCase();if(l)for(j=0;j<2;j++)for(i=0;i<l.length;i++){s=l[i];x=s._c;if((!x||x=='s_c'||(j>0&&x=='s_l'))&&(s.oun==un||(s.fs&&s.sa&&s.fs(s.oun,un)))){if(s.sa)s.sa(un);if(x=='s_c')return s}else s=0}}w.s_an='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
w.s_sp=new Function("x","d","var a=new Array,i=0,j;if(x){if(x.split)a=x.split(d);else if(!d)for(i=0;i<x.length;i++)a[a.length]=x.substring(i,i+1);else while(i>=0){j=x.indexOf(d,i);a[a.length]=x.subst"
+"ring(i,j<0?x.length:j);i=j;if(i>=0)i+=d.length}}return a");
w.s_jn=new Function("a","d","var x='',i,j=a.length;if(a&&j>0){x=a[0];if(j>1){if(a.join)x=a.join(d);else for(i=1;i<j;i++)x+=d+a[i]}}return x");
w.s_rep=new Function("x","o","n","return s_jn(s_sp(x,o),n)");
w.s_d=new Function("x","var t='`^@$#',l=s_an,l2=new Object,x2,d,b=0,k,i=x.lastIndexOf('~~'),j,v,w;if(i>0){d=x.substring(0,i);x=x.substring(i+2);l=s_sp(l,'');for(i=0;i<62;i++)l2[l[i]]=i;t=s_sp(t,'');d"
+"=s_sp(d,'~');i=0;while(i<5){v=0;if(x.indexOf(t[i])>=0) {x2=s_sp(x,t[i]);for(j=1;j<x2.length;j++){k=x2[j].substring(0,1);w=t[i]+k;if(k!=' '){v=1;w=d[b+l2[k]]}x2[j]=w+x2[j].substring(1)}}if(v)x=s_jn("
+"x2,'');else{w=t[i]+' ';if(x.indexOf(w)>=0)x=s_rep(x,w,t[i]);i++;b+=62}}}return x");
w.s_fe=new Function("c","return s_rep(s_rep(s_rep(c,'\\\\','\\\\\\\\'),'\"','\\\\\"'),\"\\n\",\"\\\\n\")");
w.s_fa=new Function("f","var s=f.indexOf('(')+1,e=f.indexOf(')'),a='',c;while(s>=0&&s<e){c=f.substring(s,s+1);if(c==',')a+='\",\"';else if((\"\\n\\r\\t \").indexOf(c)<0)a+=c;s++}return a?'\"'+a+'\"':"
+"a");
w.s_ft=new Function("c","c+='';var s,e,o,a,d,q,f,h,x;s=c.indexOf('=function(');while(s>=0){s++;d=1;q='';x=0;f=c.substring(s);a=s_fa(f);e=o=c.indexOf('{',s);e++;while(d>0){h=c.substring(e,e+1);if(q){i"
+"f(h==q&&!x)q='';if(h=='\\\\')x=x?0:1;else x=0}else{if(h=='\"'||h==\"'\")q=h;if(h=='{')d++;if(h=='}')d--}if(d>0)e++}c=c.substring(0,s)+'new Function('+(a?a+',':'')+'\"'+s_fe(c.substring(o+1,e))+'\")"
+"'+c.substring(e+1);s=c.indexOf('=function(')}return c;");
c=s_d(c);if(e>0){a=parseInt(i=v.substring(e+5));if(a>3)a=parseFloat(i)}else if(m>0)a=parseFloat(u.substring(m+10));else a=parseFloat(v);if(a<5||v.indexOf('Opera')>=0||u.indexOf('Opera')>=0)c=s_ft(c);if(!s){s=new Object;if(!w.s_c_in){w.s_c_il=new Array;w.s_c_in=0}s._il=w.s_c_il;s._in=w.s_c_in;s._il[s._in]=s;w.s_c_in++;}s._c='s_c';(new Function("s","un","pg","ss",c))(s,un,pg,ss);return s}
function s_giqf(){var w=window,q=w.s_giq,i,t,s;if(q)for(i=0;i<q.length;i++){t=q[i];s=s_gi(t.oun);s.sa(t.un);s.setTagContainer(t.tagContainerName)}w.s_giq=0}s_giqf()

if (window.console){console.log('ex time: s_code_dell_PROD_2012_02_01_v8.js', new Date().getTime() - startTScript);}



/*script:jquery-ui-1.8.custom.min.js*/
var startTScript=new Date().getTime ();
/*!
 * jQuery UI 1.8.1
 *
 * Copyright (c) 2010 AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://docs.jquery.com/UI
 */
jQuery.ui||function(c){c.ui={version:"1.8.1",plugin:{add:function(a,b,d){a=c.ui[a].prototype;for(var e in d){a.plugins[e]=a.plugins[e]||[];a.plugins[e].push([b,d[e]])}},call:function(a,b,d){if((b=a.plugins[b])&&a.element[0].parentNode)for(var e=0;e<b.length;e++)a.options[b[e][0]]&&b[e][1].apply(a.element,d)}},contains:function(a,b){return document.compareDocumentPosition?a.compareDocumentPosition(b)&16:a!==b&&a.contains(b)},hasScroll:function(a,b){if(c(a).css("overflow")=="hidden")return false;
b=b&&b=="left"?"scrollLeft":"scrollTop";var d=false;if(a[b]>0)return true;a[b]=1;d=a[b]>0;a[b]=0;return d},isOverAxis:function(a,b,d){return a>b&&a<b+d},isOver:function(a,b,d,e,f,g){return c.ui.isOverAxis(a,d,f)&&c.ui.isOverAxis(b,e,g)},keyCode:{ALT:18,BACKSPACE:8,CAPS_LOCK:20,COMMA:188,CONTROL:17,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,INSERT:45,LEFT:37,NUMPAD_ADD:107,NUMPAD_DECIMAL:110,NUMPAD_DIVIDE:111,NUMPAD_ENTER:108,NUMPAD_MULTIPLY:106,NUMPAD_SUBTRACT:109,PAGE_DOWN:34,PAGE_UP:33,
PERIOD:190,RIGHT:39,SHIFT:16,SPACE:32,TAB:9,UP:38}};c.fn.extend({_focus:c.fn.focus,focus:function(a,b){return typeof a==="number"?this.each(function(){var d=this;setTimeout(function(){c(d).focus();b&&b.call(d)},a)}):this._focus.apply(this,arguments)},enableSelection:function(){return this.attr("unselectable","off").css("MozUserSelect","")},disableSelection:function(){return this.attr("unselectable","on").css("MozUserSelect","none")},scrollParent:function(){var a;a=c.browser.msie&&/(static|relative)/.test(this.css("position"))||
/absolute/.test(this.css("position"))?this.parents().filter(function(){return/(relative|absolute|fixed)/.test(c.curCSS(this,"position",1))&&/(auto|scroll)/.test(c.curCSS(this,"overflow",1)+c.curCSS(this,"overflow-y",1)+c.curCSS(this,"overflow-x",1))}).eq(0):this.parents().filter(function(){return/(auto|scroll)/.test(c.curCSS(this,"overflow",1)+c.curCSS(this,"overflow-y",1)+c.curCSS(this,"overflow-x",1))}).eq(0);return/fixed/.test(this.css("position"))||!a.length?c(document):a},zIndex:function(a){if(a!==
undefined)return this.css("zIndex",a);if(this.length){a=c(this[0]);for(var b;a.length&&a[0]!==document;){b=a.css("position");if(b=="absolute"||b=="relative"||b=="fixed"){b=parseInt(a.css("zIndex"));if(!isNaN(b)&&b!=0)return b}a=a.parent()}}return 0}});c.extend(c.expr[":"],{data:function(a,b,d){return!!c.data(a,d[3])},focusable:function(a){var b=a.nodeName.toLowerCase(),d=c.attr(a,"tabindex");return(/input|select|textarea|button|object/.test(b)?!a.disabled:"a"==b||"area"==b?a.href||!isNaN(d):!isNaN(d))&&
!c(a)["area"==b?"parents":"closest"](":hidden").length},tabbable:function(a){var b=c.attr(a,"tabindex");return(isNaN(b)||b>=0)&&c(a).is(":focusable")}})}(jQuery);
;/*!
 * jQuery UI Widget 1.8.1
 *
 * Copyright (c) 2010 AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://docs.jquery.com/UI/Widget
 */
(function(b){var j=b.fn.remove;b.fn.remove=function(a,c){return this.each(function(){if(!c)if(!a||b.filter(a,[this]).length)b("*",this).add(this).each(function(){b(this).triggerHandler("remove")});return j.call(b(this),a,c)})};b.widget=function(a,c,d){var e=a.split(".")[0],f;a=a.split(".")[1];f=e+"-"+a;if(!d){d=c;c=b.Widget}b.expr[":"][f]=function(h){return!!b.data(h,a)};b[e]=b[e]||{};b[e][a]=function(h,g){arguments.length&&this._createWidget(h,g)};c=new c;c.options=b.extend({},c.options);b[e][a].prototype=
b.extend(true,c,{namespace:e,widgetName:a,widgetEventPrefix:b[e][a].prototype.widgetEventPrefix||a,widgetBaseClass:f},d);b.widget.bridge(a,b[e][a])};b.widget.bridge=function(a,c){b.fn[a]=function(d){var e=typeof d==="string",f=Array.prototype.slice.call(arguments,1),h=this;d=!e&&f.length?b.extend.apply(null,[true,d].concat(f)):d;if(e&&d.substring(0,1)==="_")return h;e?this.each(function(){var g=b.data(this,a),i=g&&b.isFunction(g[d])?g[d].apply(g,f):g;if(i!==g&&i!==undefined){h=i;return false}}):this.each(function(){var g=
b.data(this,a);if(g){d&&g.option(d);g._init()}else b.data(this,a,new c(d,this))});return h}};b.Widget=function(a,c){arguments.length&&this._createWidget(a,c)};b.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",options:{disabled:false},_createWidget:function(a,c){this.element=b(c).data(this.widgetName,this);this.options=b.extend(true,{},this.options,b.metadata&&b.metadata.get(c)[this.widgetName],a);var d=this;this.element.bind("remove."+this.widgetName,function(){d.destroy()});this._create();
this._init()},_create:function(){},_init:function(){},destroy:function(){this.element.unbind("."+this.widgetName).removeData(this.widgetName);this.widget().unbind("."+this.widgetName).removeAttr("aria-disabled").removeClass(this.widgetBaseClass+"-disabled ui-state-disabled")},widget:function(){return this.element},option:function(a,c){var d=a,e=this;if(arguments.length===0)return b.extend({},e.options);if(typeof a==="string"){if(c===undefined)return this.options[a];d={};d[a]=c}b.each(d,function(f,
h){e._setOption(f,h)});return e},_setOption:function(a,c){this.options[a]=c;if(a==="disabled")this.widget()[c?"addClass":"removeClass"](this.widgetBaseClass+"-disabled ui-state-disabled").attr("aria-disabled",c);return this},enable:function(){return this._setOption("disabled",false)},disable:function(){return this._setOption("disabled",true)},_trigger:function(a,c,d){var e=this.options[a];c=b.Event(c);c.type=(a===this.widgetEventPrefix?a:this.widgetEventPrefix+a).toLowerCase();d=d||{};if(c.originalEvent){a=
b.event.props.length;for(var f;a;){f=b.event.props[--a];c[f]=c.originalEvent[f]}}this.element.trigger(c,d);return!(b.isFunction(e)&&e.call(this.element[0],c,d)===false||c.isDefaultPrevented())}}})(jQuery);
;/*!
 * jQuery UI Mouse 1.8.1
 *
 * Copyright (c) 2010 AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://docs.jquery.com/UI/Mouse
 *
 * Depends:
 *	jquery.ui.widget.js
 */
(function(c){c.widget("ui.mouse",{options:{cancel:":input,option",distance:1,delay:0},_mouseInit:function(){var a=this;this.element.bind("mousedown."+this.widgetName,function(b){return a._mouseDown(b)}).bind("click."+this.widgetName,function(b){if(a._preventClickEvent){a._preventClickEvent=false;b.stopImmediatePropagation();return false}});this.started=false},_mouseDestroy:function(){this.element.unbind("."+this.widgetName)},_mouseDown:function(a){a.originalEvent=a.originalEvent||{};if(!a.originalEvent.mouseHandled){this._mouseStarted&&
this._mouseUp(a);this._mouseDownEvent=a;var b=this,e=a.which==1,f=typeof this.options.cancel=="string"?c(a.target).parents().add(a.target).filter(this.options.cancel).length:false;if(!e||f||!this._mouseCapture(a))return true;this.mouseDelayMet=!this.options.delay;if(!this.mouseDelayMet)this._mouseDelayTimer=setTimeout(function(){b.mouseDelayMet=true},this.options.delay);if(this._mouseDistanceMet(a)&&this._mouseDelayMet(a)){this._mouseStarted=this._mouseStart(a)!==false;if(!this._mouseStarted){a.preventDefault();
return true}}this._mouseMoveDelegate=function(d){return b._mouseMove(d)};this._mouseUpDelegate=function(d){return b._mouseUp(d)};c(document).bind("mousemove."+this.widgetName,this._mouseMoveDelegate).bind("mouseup."+this.widgetName,this._mouseUpDelegate);c.browser.safari||a.preventDefault();return a.originalEvent.mouseHandled=true}},_mouseMove:function(a){if(c.browser.msie&&!a.button)return this._mouseUp(a);if(this._mouseStarted){this._mouseDrag(a);return a.preventDefault()}if(this._mouseDistanceMet(a)&&
this._mouseDelayMet(a))(this._mouseStarted=this._mouseStart(this._mouseDownEvent,a)!==false)?this._mouseDrag(a):this._mouseUp(a);return!this._mouseStarted},_mouseUp:function(a){c(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate);if(this._mouseStarted){this._mouseStarted=false;this._preventClickEvent=a.target==this._mouseDownEvent.target;this._mouseStop(a)}return false},_mouseDistanceMet:function(a){return Math.max(Math.abs(this._mouseDownEvent.pageX-
a.pageX),Math.abs(this._mouseDownEvent.pageY-a.pageY))>=this.options.distance},_mouseDelayMet:function(){return this.mouseDelayMet},_mouseStart:function(){},_mouseDrag:function(){},_mouseStop:function(){},_mouseCapture:function(){return true}})})(jQuery);
;
if (window.console){console.log('ex time: jquery-ui-1.8.custom.min.js', new Date().getTime() - startTScript);}



/*script:jquery.easing.1.3.js*/
var startTScript=new Date().getTime ();
/*
 * jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
 *
 * Uses the built in easing capabilities added In jQuery 1.1
 * to offer multiple easing options
 *
 * TERMS OF USE - jQuery Easing
 * 
 * Open source under the BSD License. 
 * 
 * Copyright © 2008 George McGinley Smith
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
*/

// t: current time, b: begInnIng value, c: change In value, d: duration
jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutQuad',
	swing: function (x, t, b, c, d) {
		//alert(jQuery.easing.default);
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeInQuad: function (x, t, b, c, d) {
		return c*(t/=d)*t + b;
	},
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeInOutQuad: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t + b;
		return -c/2 * ((--t)*(t-2) - 1) + b;
	},
	easeInCubic: function (x, t, b, c, d) {
		return c*(t/=d)*t*t + b;
	},
	easeOutCubic: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t + 1) + b;
	},
	easeInOutCubic: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
	},
	easeInQuart: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t + b;
	},
	easeOutQuart: function (x, t, b, c, d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	},
	easeInOutQuart: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
	},
	easeInQuint: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t*t + b;
	},
	easeOutQuint: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t*t*t + 1) + b;
	},
	easeInOutQuint: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
	},
	easeInSine: function (x, t, b, c, d) {
		return -c * Math.cos(t/d * (Math.PI/2)) + c + b;
	},
	easeOutSine: function (x, t, b, c, d) {
		return c * Math.sin(t/d * (Math.PI/2)) + b;
	},
	easeInOutSine: function (x, t, b, c, d) {
		return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
	},
	easeInExpo: function (x, t, b, c, d) {
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeInOutExpo: function (x, t, b, c, d) {
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	},
	easeInCirc: function (x, t, b, c, d) {
		return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
	},
	easeOutCirc: function (x, t, b, c, d) {
		return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
	},
	easeInOutCirc: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
		return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
	},
	easeInElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
	},
	easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158; 
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	},
	easeInBounce: function (x, t, b, c, d) {
		return c - jQuery.easing.easeOutBounce (x, d-t, 0, c, d) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	},
	easeInOutBounce: function (x, t, b, c, d) {
		if (t < d/2) return jQuery.easing.easeInBounce (x, t*2, 0, c, d) * .5 + b;
		return jQuery.easing.easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
	}
});

/*
 *
 * TERMS OF USE - EASING EQUATIONS
 * 
 * Open source under the BSD License. 
 * 
 * Copyright © 2001 Robert Penner
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
 */
if (window.console){console.log('ex time: jquery.easing.1.3.js', new Date().getTime() - startTScript);}



/*script:jquery.autocomplete.js*/
var startTScript=new Date().getTime ();
/*
 * Autocomplete - jQuery plugin 1.1pre
 *
 * Copyright (c) 2007 Dylan Verheul, Dan G. Switzer, Anjesh Tuladhar, Jörn Zaefferer
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 * Revision: $Id: jquery.autocomplete.js 5785 2008-07-12 10:37:33Z joern.zaefferer $
 *
 */

;(function($) {
	
$.fn.extend({
	autocomplete: function(urlOrData, options) {
		var isUrl = typeof urlOrData == "string";
		options = $.extend({}, $.Autocompleter.defaults, {
			url: isUrl ? urlOrData : null,
			data: isUrl ? null : urlOrData,
			delay: isUrl ? $.Autocompleter.defaults.delay : 10,
			max: options && !options.scroll ? 10 : 150
		}, options);
		
		// if highlight is set to false, replace it with a do-nothing function
		options.highlight = options.highlight || function(value) { return value; };
		
		// if the formatMatch option is not specified, then use formatItem for backwards compatibility
		options.formatMatch = options.formatMatch || options.formatItem;
		
		return this.each(function() {
			new $.Autocompleter(this, options);
		});
	},
	result: function(handler) {
		return this.bind("result", handler);
	},
	search: function(handler) {
		return this.trigger("search", [handler]);
	},
	flushCache: function() {
		return this.trigger("flushCache");
	},
	setOptions: function(options){
		return this.trigger("setOptions", [options]);
	},
	unautocomplete: function() {
		return this.trigger("unautocomplete");
	}
});

$.Autocompleter = function(input, options) {

	var KEY = {
		UP: 38,
		DOWN: 40,
		DEL: 46,
		TAB: 9,
		RETURN: 13,
		ESC: 27,
		COMMA: 188,
		PAGEUP: 33,
		PAGEDOWN: 34,
		BACKSPACE: 8
	};

	// Create $ object for input element
	var $input = $(input).attr("autocomplete", "off").addClass(options.inputClass);

	var timeout;
	var previousValue = "";
	var cache = $.Autocompleter.Cache(options);
	var hasFocus = 0;
	var lastKeyPressCode;
	var config = {
		mouseDownOnSelect: false
	};
	var select = $.Autocompleter.Select(options, input, selectCurrent, config);
	
	var blockSubmit;
	
	// prevent form submit in opera when selecting with return key
	$.browser.opera && $(input.form).bind("submit.autocomplete", function() {
		if (blockSubmit) {
			blockSubmit = false;
			return false;
		}
	});
	
	// only opera doesn't trigger keydown multiple times while pressed, others don't work with keypress at all
	$input.bind(($.browser.opera ? "keypress" : "keydown") + ".autocomplete", function(event) {
		// track last key pressed
		lastKeyPressCode = event.keyCode;
		switch(event.keyCode) {
		
			case KEY.UP:
				event.preventDefault();
				if ( select.visible() ) {
					select.prev();
				} else {
					onChange(0, true);
				}
				break;
				
			case KEY.DOWN:
				event.preventDefault();
				if ( select.visible() ) {
					select.next();
				} else {
					onChange(0, true);
				}
				break;
				
			case KEY.PAGEUP:
				event.preventDefault();
				if ( select.visible() ) {
					select.pageUp();
				} else {
					onChange(0, true);
				}
				break;
				
			case KEY.PAGEDOWN:
				event.preventDefault();
				if ( select.visible() ) {
					select.pageDown();
				} else {
					onChange(0, true);
				}
				break;
			
			// matches also semicolon
			case options.multiple && $.trim(options.multipleSeparator) == "," && KEY.COMMA:
			case KEY.TAB:
			case KEY.RETURN:
				if( selectCurrent() ) {
					// stop default to prevent a form submit, Opera needs special handling
					event.preventDefault();
					blockSubmit = true;
					return false;
				}
				break;
				
			case KEY.ESC:
				select.hide();
				break;
				
			default:
				clearTimeout(timeout);
				timeout = setTimeout(onChange, options.delay);
				break;
		}
	}).focus(function(){
		// track whether the field has focus, we shouldn't process any
		// results if the field no longer has focus
		hasFocus++;
	}).blur(function() {
		hasFocus = 0;
		if (!config.mouseDownOnSelect) {
			hideResults();
		}
	}).click(function() {
		// show select when clicking in a focused field
		if ( hasFocus++ > 1 && !select.visible() ) {
			onChange(0, true);
		}
	}).bind("search", function() {
		// TODO why not just specifying both arguments?
		var fn = (arguments.length > 1) ? arguments[1] : null;
		function findValueCallback(q, data) {
			var result;
			if( data && data.length ) {
				for (var i=0; i < data.length; i++) {
					if( data[i].result.toLowerCase() == q.toLowerCase() ) {
						result = data[i];
						break;
					}
				}
			}
			if( typeof fn == "function" ) fn(result);
			else $input.trigger("result", result && [result.data, result.value]);
		}
		$.each(trimWords($input.val()), function(i, value) {
			request(value, findValueCallback, findValueCallback);
		});
	}).bind("flushCache", function() {
		cache.flush();
	}).bind("setOptions", function() {
		$.extend(options, arguments[1]);
		// if we've updated the data, repopulate
		if ( "data" in arguments[1] )
			cache.populate();
	}).bind("unautocomplete", function() {
		select.unbind();
		$input.unbind();
		$(input.form).unbind(".autocomplete");
	});
	
	
	function selectCurrent() {
		var selected = select.selected();
		if( !selected )
			return false;
		
		var v = selected.result;
		previousValue = v;
		
		if ( options.multiple ) {
			var words = trimWords($input.val());
			if ( words.length > 1 ) {
				v = words.slice(0, words.length - 1).join( options.multipleSeparator ) + options.multipleSeparator + v;
			}
			v += options.multipleSeparator;
		}
		
		$input.val(v);
		hideResultsNow();
		$input.trigger("result", [selected.data, selected.value]);
		return true;
	}
	
	function onChange(crap, skipPrevCheck) {
		if( lastKeyPressCode == KEY.DEL ) {
			select.hide();
			return;
		}
		
		var currentValue = $input.val();
		
		if ( !skipPrevCheck && currentValue == previousValue )
			return;
		
		previousValue = currentValue;
		
		currentValue = lastWord(currentValue);
		if ( currentValue.length >= options.minChars) {
			$input.addClass(options.loadingClass);
			if (!options.matchCase)
				currentValue = currentValue.toLowerCase();
			request(currentValue, receiveData, hideResultsNow);
		} else {
			stopLoading();
			select.hide();
		}
	};
	
	function trimWords(value) {
		if ( !value ) {
			return [""];
		}
		var words = value.split( options.multipleSeparator );
		var result = [];
		$.each(words, function(i, value) {
			if ( $.trim(value) )
				result[i] = $.trim(value);
		});
		return result;
	}
	
	function lastWord(value) {
		if ( !options.multiple )
			return value;
		var words = trimWords(value);
		return words[words.length - 1];
	}
	
	// fills in the input box w/the first match (assumed to be the best match)
	// q: the term entered
	// sValue: the first matching result
	function autoFill(q, sValue){
		// autofill in the complete box w/the first match as long as the user hasn't entered in more data
		// if the last user key pressed was backspace, don't autofill
		if( options.autoFill && (lastWord($input.val()).toLowerCase() == q.toLowerCase()) && lastKeyPressCode != KEY.BACKSPACE ) {
			// fill in the value (keep the case the user has typed)
			$input.val($input.val() + sValue.substring(lastWord(previousValue).length));
			// select the portion of the value not typed by the user (so the next character will erase)
			$.Autocompleter.Selection(input, previousValue.length, previousValue.length + sValue.length);
		}
	};

	function hideResults() {
		clearTimeout(timeout);
		timeout = setTimeout(hideResultsNow, 200);
	};

	function hideResultsNow() {
		var wasVisible = select.visible();
		select.hide();
		clearTimeout(timeout);
		stopLoading();
		if (options.mustMatch) {
			// call search and run callback
			$input.search(
				function (result){
					// if no value found, clear the input box
					if( !result ) {
						if (options.multiple) {
							var words = trimWords($input.val()).slice(0, -1);
							$input.val( words.join(options.multipleSeparator) + (words.length ? options.multipleSeparator : "") );
						}
						else
							$input.val( "" );
					}
				}
			);
		}
		if (wasVisible)
			// position cursor at end of input field
			$.Autocompleter.Selection(input, input.value.length, input.value.length);
	};

	function receiveData(q, data) {
		if ( data && data.length && hasFocus ) {
			stopLoading();
			select.display(data, q);
			autoFill(q, data[0].value);
			select.show();
		} else {
			hideResultsNow();
		}
	};

	function request(term, success, failure) {
		if (!options.matchCase)
			term = term.toLowerCase();
		var data = cache.load(term);
		// recieve the cached data
		if (data && data.length) {
			success(term, data);
		// if an AJAX url has been supplied, try loading the data now
		} else if( (typeof options.url == "string") && (options.url.length > 0) ){
			
			var extraParams = {
				timestamp: +new Date()
			};
			$.each(options.extraParams, function(key, param) {
				extraParams[key] = typeof param == "function" ? param() : param;
			});
			
			$.ajax({
				// try to leverage ajaxQueue plugin to abort previous requests
				mode: "abort",
				// limit abortion to this input
				port: "autocomplete" + input.name,
				dataType: options.dataType,
				url: options.url,
				data: $.extend({
					q: lastWord(term),
					limit: options.max
				}, extraParams),
				success: function(data) {
					var parsed = options.parse && options.parse(data) || parse(data);
					cache.add(term, parsed);
					success(term, parsed);
				}
			});
		} else {
			// if we have a failure, we need to empty the list -- this prevents the the [TAB] key from selecting the last successful match
			select.emptyList();
			failure(term);
		}
	};
	
	function parse(data) {
		var parsed = [];
		var rows = data.split("\n");
		for (var i=0; i < rows.length; i++) {
			var row = $.trim(rows[i]);
			if (row) {
				row = row.split("|");
				parsed[parsed.length] = {
					data: row,
					value: row[0],
					result: options.formatResult && options.formatResult(row, row[0]) || row[0]
				};
			}
		}
		return parsed;
	};

	function stopLoading() {
		$input.removeClass(options.loadingClass);
	};

};

$.Autocompleter.defaults = {
	inputClass: "ac_input",
	resultsClass: "ac_results",
	loadingClass: "ac_loading",
	minChars: 1,
	delay: 400,
	matchCase: false,
	matchSubset: true,
	matchContains: false,
	cacheLength: 10,
	max: 100,
	mustMatch: false,
	extraParams: {},
	selectFirst: true,
	formatItem: function(row) { return row[0]; },
	formatMatch: null,
	autoFill: false,
	width: 0,
	multiple: false,
	multipleSeparator: ", ",
	highlight: function(value, term) {
		return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
	},
    scroll: true,
    scrollHeight: 180
};

$.Autocompleter.Cache = function(options) {

	var data = {};
	var length = 0;
	
	function matchSubset(s, sub) {
		if (!options.matchCase) 
			s = s.toLowerCase();
		var i = s.indexOf(sub);
		if (options.matchContains == "word"){
			i = s.toLowerCase().search("\\b" + sub.toLowerCase());
		}
		if (i == -1) return false;
		return i == 0 || options.matchContains;
	};
	
	function add(q, value) {
		if (length > options.cacheLength){
			flush();
		}
		if (!data[q]){ 
			length++;
		}
		data[q] = value;
	}
	
	function populate(){
		if( !options.data ) return false;
		// track the matches
		var stMatchSets = {},
			nullData = 0;

		// no url was specified, we need to adjust the cache length to make sure it fits the local data store
		if( !options.url ) options.cacheLength = 1;
		
		// track all options for minChars = 0
		stMatchSets[""] = [];
		
		// loop through the array and create a lookup structure
		for ( var i = 0, ol = options.data.length; i < ol; i++ ) {
			var rawValue = options.data[i];
			// if rawValue is a string, make an array otherwise just reference the array
			rawValue = (typeof rawValue == "string") ? [rawValue] : rawValue;
			
			var value = options.formatMatch(rawValue, i+1, options.data.length);
			if ( value === false )
				continue;
				
			var firstChar = value.charAt(0).toLowerCase();
			// if no lookup array for this character exists, look it up now
			if( !stMatchSets[firstChar] ) 
				stMatchSets[firstChar] = [];

			// if the match is a string
			var row = {
				value: value,
				data: rawValue,
				result: options.formatResult && options.formatResult(rawValue) || value
			};
			
			// push the current match into the set list
			stMatchSets[firstChar].push(row);

			// keep track of minChars zero items
			if ( nullData++ < options.max ) {
				stMatchSets[""].push(row);
			}
		};

		// add the data items to the cache
		$.each(stMatchSets, function(i, value) {
			// increase the cache size
			options.cacheLength++;
			// add to the cache
			add(i, value);
		});
	}
	
	// populate any existing data
	setTimeout(populate, 25);
	
	function flush(){
		data = {};
		length = 0;
	}
	
	return {
		flush: flush,
		add: add,
		populate: populate,
		load: function(q) {
			if (!options.cacheLength || !length)
				return null;
			/* 
			 * if dealing w/local data and matchContains than we must make sure
			 * to loop through all the data collections looking for matches
			 */
			if( !options.url && options.matchContains ){
				// track all matches
				var csub = [];
				// loop through all the data grids for matches
				for( var k in data ){
					// don't search through the stMatchSets[""] (minChars: 0) cache
					// this prevents duplicates
					if( k.length > 0 ){
						var c = data[k];
						$.each(c, function(i, x) {
							// if we've got a match, add it to the array
							if (matchSubset(x.value, q)) {
								csub.push(x);
							}
						});
					}
				}				
				return csub;
			} else 
			// if the exact item exists, use it
			if (data[q]){
				return data[q];
			} else
			if (options.matchSubset) {
				for (var i = q.length - 1; i >= options.minChars; i--) {
					var c = data[q.substr(0, i)];
					if (c) {
						var csub = [];
						$.each(c, function(i, x) {
							if (matchSubset(x.value, q)) {
								csub[csub.length] = x;
							}
						});
						return csub;
					}
				}
			}
			return null;
		}
	};
};

$.Autocompleter.Select = function (options, input, select, config) {
	var CLASSES = {
		ACTIVE: "ac_over"
	};
	
	var listItems,
		active = -1,
		data,
		term = "",
		needsInit = true,
		element,
		list;
	
	// Create results
	function init() {
		if (!needsInit)
			return;
		element = $("<div/>")
		.hide()
		.addClass(options.resultsClass)
		.css("position", "absolute")
		.appendTo(document.body);
	
		list = $("<ul/>").appendTo(element).mouseover( function(event) {
			if(target(event).nodeName && target(event).nodeName.toUpperCase() == 'LI') {
	            active = $("li", list).removeClass(CLASSES.ACTIVE).index(target(event));
			    $(target(event)).addClass(CLASSES.ACTIVE);            
	        }
		}).click(function(event) {
			$(target(event)).addClass(CLASSES.ACTIVE);
			select();
			// TODO provide option to avoid setting focus again after selection? useful for cleanup-on-focus
			input.focus();
			return false;
		}).mousedown(function() {
			config.mouseDownOnSelect = true;
		}).mouseup(function() {
			config.mouseDownOnSelect = false;
		});
		
		if( options.width > 0 )
			element.css("width", options.width);
			
		needsInit = false;
	} 
	
	function target(event) {
		var element = event.target;
		while(element && element.tagName != "LI")
			element = element.parentNode;
		// more fun with IE, sometimes event.target is empty, just ignore it then
		if(!element)
			return [];
		return element;
	}

	function moveSelect(step) {
		listItems.slice(active, active + 1).removeClass(CLASSES.ACTIVE);
		movePosition(step);
        var activeItem = listItems.slice(active, active + 1).addClass(CLASSES.ACTIVE);
        if(options.scroll) {
            var offset = 0;
            listItems.slice(0, active).each(function() {
				offset += this.offsetHeight;
			});
            if((offset + activeItem[0].offsetHeight - list.scrollTop()) > list[0].clientHeight) {
                list.scrollTop(offset + activeItem[0].offsetHeight - list.innerHeight());
            } else if(offset < list.scrollTop()) {
                list.scrollTop(offset);
            }
        }
	};
	
	function movePosition(step) {
		active += step;
		if (active < 0) {
			active = listItems.size() - 1;
		} else if (active >= listItems.size()) {
			active = 0;
		}
	}
	
	function limitNumberOfItems(available) {
		return options.max && options.max < available
			? options.max
			: available;
	}
	
	function fillList() {
		list.empty();
		var max = limitNumberOfItems(data.length);
		for (var i=0; i < max; i++) {
			if (!data[i])
				continue;
			var formatted = options.formatItem(data[i].data, i+1, max, data[i].value, term);
			if ( formatted === false )
				continue;
			var li = $("<li/>").html( options.highlight(formatted, term) ).addClass(i%2 == 0 ? "ac_even" : "ac_odd").appendTo(list)[0];
			$.data(li, "ac_data", data[i]);
		}
		listItems = list.find("li");
		if ( options.selectFirst ) {
			listItems.slice(0, 1).addClass(CLASSES.ACTIVE);
			active = 0;
		}
		// apply bgiframe if available
		if ( $.fn.bgiframe )
			list.bgiframe();
	}
	
	return {
		display: function(d, q) {
			init();
			data = d;
			term = q;
			fillList();
		},
		next: function() {
			moveSelect(1);
		},
		prev: function() {
			moveSelect(-1);
		},
		pageUp: function() {
			if (active != 0 && active - 8 < 0) {
				moveSelect( -active );
			} else {
				moveSelect(-8);
			}
		},
		pageDown: function() {
			if (active != listItems.size() - 1 && active + 8 > listItems.size()) {
				moveSelect( listItems.size() - 1 - active );
			} else {
				moveSelect(8);
			}
		},
		hide: function() {
			element && element.hide();
			listItems && listItems.removeClass(CLASSES.ACTIVE);
			active = -1;
		},
		visible : function() {
			return element && element.is(":visible");
		},
		current: function() {
			return this.visible() && (listItems.filter("." + CLASSES.ACTIVE)[0] || options.selectFirst && listItems[0]);
		},
		show: function() {
			var offset = $(input).offset();
			element.css({
				width: typeof options.width == "string" || options.width > 0 ? options.width : $(input).width(),
				top: offset.top + input.offsetHeight,
				left: offset.left
			}).show();
            if(options.scroll) {
                list.scrollTop(0);
                list.css({
					maxHeight: options.scrollHeight,
					overflow: 'auto'
				});
				
                if($.browser.msie && typeof document.body.style.maxHeight === "undefined") {
					var listHeight = 0;
					listItems.each(function() {
						listHeight += this.offsetHeight;
					});
					var scrollbarsVisible = listHeight > options.scrollHeight;
                    list.css('height', scrollbarsVisible ? options.scrollHeight : listHeight );
					if (!scrollbarsVisible) {
						// IE doesn't recalculate width when scrollbar disappears
						listItems.width( list.width() - parseInt(listItems.css("padding-left")) - parseInt(listItems.css("padding-right")) );
					}
                }
                
            }
		},
		selected: function() {
			var selected = listItems && listItems.filter("." + CLASSES.ACTIVE).removeClass(CLASSES.ACTIVE);
			return selected && selected.length && $.data(selected[0], "ac_data");
		},
		emptyList: function (){
			list && list.empty();
		},
		unbind: function() {
			element && element.remove();
		}
	};
};

$.Autocompleter.Selection = function(field, start, end) {
	if( field.createTextRange ){
		var selRange = field.createTextRange();
		selRange.collapse(true);
		selRange.moveStart("character", start);
		selRange.moveEnd("character", end);
		selRange.select();
	} else if( field.setSelectionRange ){
		field.setSelectionRange(start, end);
	} else {
		if( field.selectionStart ){
			field.selectionStart = start;
			field.selectionEnd = end;
		}
	}
	field.focus();
};

})(jQuery);
if (window.console){console.log('ex time: jquery.autocomplete.js', new Date().getTime() - startTScript);}



/*script:jquery.scrollTo-min.js*/
var startTScript=new Date().getTime ();
/**
 * jQuery.ScrollTo - Easy element scrolling using jQuery.
 * Copyright (c) 2007-2009 Ariel Flesler - aflesler(at)gmail(dot)com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * Date: 5/25/2009
 * @author Ariel Flesler
 * @version 1.4.2
 *
 * http://flesler.blogspot.com/2007/10/jqueryscrollto.html
 */
;(function(d){var k=d.scrollTo=function(a,i,e){d(window).scrollTo(a,i,e)};k.defaults={axis:'xy',duration:parseFloat(d.fn.jquery)>=1.3?0:1};k.window=function(a){return d(window)._scrollable()};d.fn._scrollable=function(){return this.map(function(){var a=this,i=!a.nodeName||d.inArray(a.nodeName.toLowerCase(),['iframe','#document','html','body'])!=-1;if(!i)return a;var e=(a.contentWindow||a).document||a.ownerDocument||a;return d.browser.safari||e.compatMode=='BackCompat'?e.body:e.documentElement})};d.fn.scrollTo=function(n,j,b){if(typeof j=='object'){b=j;j=0}if(typeof b=='function')b={onAfter:b};if(n=='max')n=9e9;b=d.extend({},k.defaults,b);j=j||b.speed||b.duration;b.queue=b.queue&&b.axis.length>1;if(b.queue)j/=2;b.offset=p(b.offset);b.over=p(b.over);return this._scrollable().each(function(){var q=this,r=d(q),f=n,s,g={},u=r.is('html,body');switch(typeof f){case'number':case'string':if(/^([+-]=)?\d+(\.\d+)?(px|%)?$/.test(f)){f=p(f);break}f=d(f,this);case'object':if(f.is||f.style)s=(f=d(f)).offset()}d.each(b.axis.split(''),function(a,i){var e=i=='x'?'Left':'Top',h=e.toLowerCase(),c='scroll'+e,l=q[c],m=k.max(q,i);if(s){g[c]=s[h]+(u?0:l-r.offset()[h]);if(b.margin){g[c]-=parseInt(f.css('margin'+e))||0;g[c]-=parseInt(f.css('border'+e+'Width'))||0}g[c]+=b.offset[h]||0;if(b.over[h])g[c]+=f[i=='x'?'width':'height']()*b.over[h]}else{var o=f[h];g[c]=o.slice&&o.slice(-1)=='%'?parseFloat(o)/100*m:o}if(/^\d+$/.test(g[c]))g[c]=g[c]<=0?0:Math.min(g[c],m);if(!a&&b.queue){if(l!=g[c])t(b.onAfterFirst);delete g[c]}});t(b.onAfter);function t(a){r.animate(g,j,b.easing,a&&function(){a.call(this,n,b)})}}).end()};k.max=function(a,i){var e=i=='x'?'Width':'Height',h='scroll'+e;if(!d(a).is('html,body'))return a[h]-d(a)[e.toLowerCase()]();var c='client'+e,l=a.ownerDocument.documentElement,m=a.ownerDocument.body;return Math.max(l[h],m[h])-Math.min(l[c],m[c])};function p(a){return typeof a=='object'?a:{top:a,left:a}}})(jQuery);
if (window.console){console.log('ex time: jquery.scrollTo-min.js', new Date().getTime() - startTScript);}



/*script:swfobject_min.js*/
var startTScript=new Date().getTime ();
/* SWFObject v2.1 <http://code.google.com/p/swfobject/>
	Copyright (c) 2007-2008 Geoff Stearns, Michael Williams, and Bobby van der Sluis
	This software is released under the MIT License <http://www.opensource.org/licenses/mit-license.php>
*/
var swfobject=function(){var b="undefined",Q="object",n="Shockwave Flash",p="ShockwaveFlash.ShockwaveFlash",P="application/x-shockwave-flash",m="SWFObjectExprInst",j=window,K=document,T=navigator,o=[],N=[],i=[],d=[],J,Z=null,M=null,l=null,e=false,A=false;var h=function(){var v=typeof K.getElementById!=b&&typeof K.getElementsByTagName!=b&&typeof K.createElement!=b,AC=[0,0,0],x=null;if(typeof T.plugins!=b&&typeof T.plugins[n]==Q){x=T.plugins[n].description;if(x&&!(typeof T.mimeTypes!=b&&T.mimeTypes[P]&&!T.mimeTypes[P].enabledPlugin)){x=x.replace(/^.*\s+(\S+\s+\S+$)/,"$1");AC[0]=parseInt(x.replace(/^(.*)\..*$/,"$1"),10);AC[1]=parseInt(x.replace(/^.*\.(.*)\s.*$/,"$1"),10);AC[2]=/r/.test(x)?parseInt(x.replace(/^.*r(.*)$/,"$1"),10):0}}else{if(typeof j.ActiveXObject!=b){var y=null,AB=false;try{y=new ActiveXObject(p+".7")}catch(t){try{y=new ActiveXObject(p+".6");AC=[6,0,21];y.AllowScriptAccess="always"}catch(t){if(AC[0]==6){AB=true}}if(!AB){try{y=new ActiveXObject(p)}catch(t){}}}if(!AB&&y){try{x=y.GetVariable("$version");if(x){x=x.split(" ")[1].split(",");AC=[parseInt(x[0],10),parseInt(x[1],10),parseInt(x[2],10)]}}catch(t){}}}}var AD=T.userAgent.toLowerCase(),r=T.platform.toLowerCase(),AA=/webkit/.test(AD)?parseFloat(AD.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):false,q=false,z=r?/win/.test(r):/win/.test(AD),w=r?/mac/.test(r):/mac/.test(AD);/*@cc_on q=true;@if(@_win32)z=true;@elif(@_mac)w=true;@end@*/return{w3cdom:v,pv:AC,webkit:AA,ie:q,win:z,mac:w}}();var L=function(){if(!h.w3cdom){return }f(H);if(h.ie&&h.win){try{K.write("<script id=__ie_ondomload defer=true src=//:><\/script>");J=C("__ie_ondomload");if(J){I(J,"onreadystatechange",S)}}catch(q){}}if(h.webkit&&typeof K.readyState!=b){Z=setInterval(function(){if(/loaded|complete/.test(K.readyState)){E()}},10)}if(typeof K.addEventListener!=b){K.addEventListener("DOMContentLoaded",E,null)}R(E)}();function S(){if(J.readyState=="complete"){J.parentNode.removeChild(J);E()}}function E(){if(e){return }if(h.ie&&h.win){var v=a("span");try{var u=K.getElementsByTagName("body")[0].appendChild(v);u.parentNode.removeChild(u)}catch(w){return }}e=true;if(Z){clearInterval(Z);Z=null}var q=o.length;for(var r=0;r<q;r++){o[r]()}}function f(q){if(e){q()}else{o[o.length]=q}}function R(r){if(typeof j.addEventListener!=b){j.addEventListener("load",r,false)}else{if(typeof K.addEventListener!=b){K.addEventListener("load",r,false)}else{if(typeof j.attachEvent!=b){I(j,"onload",r)}else{if(typeof j.onload=="function"){var q=j.onload;j.onload=function(){q();r()}}else{j.onload=r}}}}}function H(){var t=N.length;for(var q=0;q<t;q++){var u=N[q].id;if(h.pv[0]>0){var r=C(u);if(r){N[q].width=r.getAttribute("width")?r.getAttribute("width"):"0";N[q].height=r.getAttribute("height")?r.getAttribute("height"):"0";if(c(N[q].swfVersion)){if(h.webkit&&h.webkit<312){Y(r)}W(u,true)}else{if(N[q].expressInstall&&!A&&c("6.0.65")&&(h.win||h.mac)){k(N[q])}else{O(r)}}}}else{W(u,true)}}}function Y(t){var q=t.getElementsByTagName(Q)[0];if(q){var w=a("embed"),y=q.attributes;if(y){var v=y.length;for(var u=0;u<v;u++){if(y[u].nodeName=="DATA"){w.setAttribute("src",y[u].nodeValue)}else{w.setAttribute(y[u].nodeName,y[u].nodeValue)}}}var x=q.childNodes;if(x){var z=x.length;for(var r=0;r<z;r++){if(x[r].nodeType==1&&x[r].nodeName=="PARAM"){w.setAttribute(x[r].getAttribute("name"),x[r].getAttribute("value"))}}}t.parentNode.replaceChild(w,t)}}function k(w){A=true;var u=C(w.id);if(u){if(w.altContentId){var y=C(w.altContentId);if(y){M=y;l=w.altContentId}}else{M=G(u)}if(!(/%$/.test(w.width))&&parseInt(w.width,10)<230){w.width="230"}if(!(/%$/.test(w.height))&&parseInt(w.height,10)<137){w.height="137"}K.title=K.title.slice(0,47)+" - Flash Player Installation";var z=h.ie&&h.win?"ActiveX":"PlugIn",q=K.title,r="MMredirectURL="+j.location+"&MMplayerType="+z+"&MMdoctitle="+q,x=w.id;if(h.ie&&h.win&&u.readyState!=4){var t=a("div");x+="SWFObjectNew";t.setAttribute("id",x);u.parentNode.insertBefore(t,u);u.style.display="none";var v=function(){u.parentNode.removeChild(u)};I(j,"onload",v)}U({data:w.expressInstall,id:m,width:w.width,height:w.height},{flashvars:r},x)}}function O(t){if(h.ie&&h.win&&t.readyState!=4){var r=a("div");t.parentNode.insertBefore(r,t);r.parentNode.replaceChild(G(t),r);t.style.display="none";var q=function(){t.parentNode.removeChild(t)};I(j,"onload",q)}else{t.parentNode.replaceChild(G(t),t)}}function G(v){var u=a("div");if(h.win&&h.ie){u.innerHTML=v.innerHTML}else{var r=v.getElementsByTagName(Q)[0];if(r){var w=r.childNodes;if(w){var q=w.length;for(var t=0;t<q;t++){if(!(w[t].nodeType==1&&w[t].nodeName=="PARAM")&&!(w[t].nodeType==8)){u.appendChild(w[t].cloneNode(true))}}}}}return u}function U(AG,AE,t){var q,v=C(t);if(v){if(typeof AG.id==b){AG.id=t}if(h.ie&&h.win){var AF="";for(var AB in AG){if(AG[AB]!=Object.prototype[AB]){if(AB.toLowerCase()=="data"){AE.movie=AG[AB]}else{if(AB.toLowerCase()=="styleclass"){AF+=' class="'+AG[AB]+'"'}else{if(AB.toLowerCase()!="classid"){AF+=" "+AB+'="'+AG[AB]+'"'}}}}}var AD="";for(var AA in AE){if(AE[AA]!=Object.prototype[AA]){AD+='<param name="'+AA+'" value="'+AE[AA]+'" />'}}v.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+AF+">"+AD+"</object>";i[i.length]=AG.id;q=C(AG.id)}else{if(h.webkit&&h.webkit<312){var AC=a("embed");AC.setAttribute("type",P);for(var z in AG){if(AG[z]!=Object.prototype[z]){if(z.toLowerCase()=="data"){AC.setAttribute("src",AG[z])}else{if(z.toLowerCase()=="styleclass"){AC.setAttribute("class",AG[z])}else{if(z.toLowerCase()!="classid"){AC.setAttribute(z,AG[z])}}}}}for(var y in AE){if(AE[y]!=Object.prototype[y]){if(y.toLowerCase()!="movie"){AC.setAttribute(y,AE[y])}}}v.parentNode.replaceChild(AC,v);q=AC}else{var u=a(Q);u.setAttribute("type",P);for(var x in AG){if(AG[x]!=Object.prototype[x]){if(x.toLowerCase()=="styleclass"){u.setAttribute("class",AG[x])}else{if(x.toLowerCase()!="classid"){u.setAttribute(x,AG[x])}}}}for(var w in AE){if(AE[w]!=Object.prototype[w]&&w.toLowerCase()!="movie"){F(u,w,AE[w])}}v.parentNode.replaceChild(u,v);q=u}}}return q}function F(t,q,r){var u=a("param");u.setAttribute("name",q);u.setAttribute("value",r);t.appendChild(u)}function X(r){var q=C(r);if(q&&(q.nodeName=="OBJECT"||q.nodeName=="EMBED")){if(h.ie&&h.win){if(q.readyState==4){B(r)}else{j.attachEvent("onload",function(){B(r)})}}else{q.parentNode.removeChild(q)}}}function B(t){var r=C(t);if(r){for(var q in r){if(typeof r[q]=="function"){r[q]=null}}r.parentNode.removeChild(r)}}function C(t){var q=null;try{q=K.getElementById(t)}catch(r){}return q}function a(q){return K.createElement(q)}function I(t,q,r){t.attachEvent(q,r);d[d.length]=[t,q,r]}function c(t){var r=h.pv,q=t.split(".");q[0]=parseInt(q[0],10);q[1]=parseInt(q[1],10)||0;q[2]=parseInt(q[2],10)||0;return(r[0]>q[0]||(r[0]==q[0]&&r[1]>q[1])||(r[0]==q[0]&&r[1]==q[1]&&r[2]>=q[2]))?true:false}function V(v,r){if(h.ie&&h.mac){return }var u=K.getElementsByTagName("head")[0],t=a("style");t.setAttribute("type","text/css");t.setAttribute("media","screen");if(!(h.ie&&h.win)&&typeof K.createTextNode!=b){t.appendChild(K.createTextNode(v+" {"+r+"}"))}u.appendChild(t);if(h.ie&&h.win&&typeof K.styleSheets!=b&&K.styleSheets.length>0){var q=K.styleSheets[K.styleSheets.length-1];if(typeof q.addRule==Q){q.addRule(v,r)}}}function W(t,q){var r=q?"visible":"hidden";if(e&&C(t)){C(t).style.visibility=r}else{V("#"+t,"visibility:"+r)}}function g(s){var r=/[\\\"<>\.;]/;var q=r.exec(s)!=null;return q?encodeURIComponent(s):s}var D=function(){if(h.ie&&h.win){window.attachEvent("onunload",function(){var w=d.length;for(var v=0;v<w;v++){d[v][0].detachEvent(d[v][1],d[v][2])}var t=i.length;for(var u=0;u<t;u++){X(i[u])}for(var r in h){h[r]=null}h=null;for(var q in swfobject){swfobject[q]=null}swfobject=null})}}();return{registerObject:function(u,q,t){if(!h.w3cdom||!u||!q){return }var r={};r.id=u;r.swfVersion=q;r.expressInstall=t?t:false;N[N.length]=r;W(u,false)},getObjectById:function(v){var q=null;if(h.w3cdom){var t=C(v);if(t){var u=t.getElementsByTagName(Q)[0];if(!u||(u&&typeof t.SetVariable!=b)){q=t}else{if(typeof u.SetVariable!=b){q=u}}}}return q},embedSWF:function(x,AE,AB,AD,q,w,r,z,AC){if(!h.w3cdom||!x||!AE||!AB||!AD||!q){return }AB+="";AD+="";if(c(q)){W(AE,false);var AA={};if(AC&&typeof AC===Q){for(var v in AC){if(AC[v]!=Object.prototype[v]){AA[v]=AC[v]}}}AA.data=x;AA.width=AB;AA.height=AD;var y={};if(z&&typeof z===Q){for(var u in z){if(z[u]!=Object.prototype[u]){y[u]=z[u]}}}if(r&&typeof r===Q){for(var t in r){if(r[t]!=Object.prototype[t]){if(typeof y.flashvars!=b){y.flashvars+="&"+t+"="+r[t]}else{y.flashvars=t+"="+r[t]}}}}f(function(){U(AA,y,AE);if(AA.id==AE){W(AE,true)}})}else{if(w&&!A&&c("6.0.65")&&(h.win||h.mac)){A=true;W(AE,false);f(function(){var AF={};AF.id=AF.altContentId=AE;AF.width=AB;AF.height=AD;AF.expressInstall=w;k(AF)})}}},getFlashPlayerVersion:function(){return{major:h.pv[0],minor:h.pv[1],release:h.pv[2]}},hasFlashPlayerVersion:c,createSWF:function(t,r,q){if(h.w3cdom){return U(t,r,q)}else{return undefined}},removeSWF:function(q){if(h.w3cdom){X(q)}},createCSS:function(r,q){if(h.w3cdom){V(r,q)}},addDomLoadEvent:f,addLoadEvent:R,getQueryParamValue:function(v){var u=K.location.search||K.location.hash;if(v==null){return g(u)}if(u){var t=u.substring(1).split("&");for(var r=0;r<t.length;r++){if(t[r].substring(0,t[r].indexOf("="))==v){return g(t[r].substring((t[r].indexOf("=")+1)))}}}return""},expressInstallCallback:function(){if(A&&M){var q=C(m);if(q){q.parentNode.replaceChild(M,q);if(l){W(l,true);if(h.ie&&h.win){M.style.display="block"}}M=null;l=null;A=false}}}}}();
if (window.console){console.log('ex time: swfobject_min.js', new Date().getTime() - startTScript);}



/*script:utils.js*/
var startTScript=new Date().getTime ();
var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};var onload;(function($){(function(){var $this=this;this.Context={$BODY:null,$PRIMARYCONTAINER:null,$LEFTNAV:null};this.Initialize=function(onload){var init=function(onload){var methodName;for(methodName in onload){if(onload.hasOwnProperty(methodName)&&typeof onload[methodName]==='function'){onload[methodName]();}}};$(document).ready(function(){init(onload);});};this.GetURLParamVal=function(url,paramName){var paramValue="";if(url!=null&&(url.indexOf("?")>-1||url.indexOf("&")>-1)){url=url.replace(/&amp;/g,"&");var urlParams=url.substring(url.indexOf("?")+1).split("&");for(i=0;i<urlParams.length;i++){if(urlParams[i].substring(0,urlParams[i].indexOf("="))==paramName)
paramValue=urlParams[i].substring(urlParams[i].indexOf("=")+1);}}
return paramValue;};this.GetURLHashVal=function(url){var urlHash="";if(url!=null&&(url.indexOf("#")>-1)){var urlHashPos=url.lastIndexOf("#");urlHash=url.substr(urlHashPos+1,url.length);}
return urlHash;};this.ChangeURLParams=function(url,paramName,paramValue){var newUrl=url;var paramPos=url.search(new RegExp('[\?|&]'+paramName+'='));paramValue=paramValue.replace(/[\?|&]/g,'');paramValue=paramValue.replace(/[aA-zZ]+=/g,'');if(paramPos!=-1){var appenderChar=url.charAt(paramPos)
appenderChar=(appenderChar=='?')?"\\"+appenderChar:appenderChar;newUrl=url.replace(new RegExp(appenderChar+paramName+'=[aA-zZ0-9]+'),appenderChar+paramName+'='+paramValue)}else{var appenderChar=url.indexOf('?')!=-1?'&':'?';newUrl=url+appenderChar+paramName+'='+paramValue;}
return newUrl;}
this.getCookieKeyValue=function(cname,id,caseSensitive){try{var offset=1;var sid=id+"=";var sid1="?"+id+"=";var sid2="&"+id+"=";var lwp=$this.getCookie(cname);var startIdx=0;var endIdx=0;var kvalue=null;if(lwp.indexOf(sid1)!=-1){sid=sid1;offset=2;}
if(lwp.indexOf(sid2)!=-1){sid=sid2;offset=2;}
if(lwp.indexOf(sid)==-1){return null;}
else{startIdx=lwp.indexOf(sid)+id.length+offset;if(lwp.substring(startIdx).indexOf("&")==-1){return lwp.substring(startIdx);}
else{endIdx=lwp.substring(startIdx).indexOf("&")+startIdx;}}
kvalue=lwp.substring(startIdx,endIdx);}
catch(e)
{}
if(caseSensitive==true){return kvalue;}
else{if(kvalue===null)return null;return kvalue.toLowerCase();}};this.getCookie=function(NameOfCookie){if(document.cookie.length>0){begin=document.cookie.indexOf(NameOfCookie+"=");if(begin!=-1){begin+=NameOfCookie.length+1;end=document.cookie.indexOf(";",begin);if(end==-1){end=document.cookie.length;}
return unescape(document.cookie.substring(begin,end));}}
return"";};this.setCookie=function(name,value,expires,path,domain,secure){var curCookie=name+"="+escape(value)+
((expires)?";expires="+expires:"")+
((path)?";path="+path:"")+
((domain)?";domain="+domain:"")+
((secure)?";secure":"");document.cookie=curCookie;};this.deleteCookie=function(name,path,domain){if(DELL.com.Utils.getCookie(name)){document.cookie=name+"="+
((path)?";path="+path:"")+
((domain)?";domain="+domain:"");}};this.getLWP=function(){var psLWP=DELL.com.Delphi.PageSettings.lwp;var cntr=m_ctry||psLWP.Country;var segm=m_segval||psLWP.Segment;var lang=m_langval||psLWP.Language;var cs=m_csval||psLWP.CustomerSet;var lwp=new StringBuffer();if(cntr==null||cntr.length==0){cntr=$this.getCookieKeyValue("lwp","c");}
if(segm==null||segm.length==0){segm=$this.getCookieKeyValue("lwp","s");}
if(lang==null||lang.length==0){lang=$this.getCookieKeyValue("lwp","l");}
if(cs==null||cs.length==0){cs=$this.getCookieKeyValue("lwp","cs");}
if(cntr!=null&&cntr.length!=0){lwp.append("&c=");lwp.append(cntr);}
if(segm!=null&&segm.length!=0){lwp.append("&s=");lwp.append(segm);}
if(lang!=null&&lang.length!=0){lwp.append("&l=");lwp.append(lang);}
if(cs!=null&&cs.length!=0){lwp.append("&cs=");lwp.append(cs);}
return lwp.toString().split('#')[0];};this.rdyMarker=function(){var chrSet="BCDFGHJKLMNPQRSTVWXTZbcdfghklmnpqrstvwxz123456789";var uId="";for(var i=0;i<15;i++){var chrPos=Math.floor(Math.random()*chrSet.length);uId+=chrSet.substring(chrPos,chrPos+1);}
$("body").append("<img src=\"http://i.dell.com/images/global/general/doc-ready.gif?uid="+uId+"\" height=\"1\" width=\"1\"/>");};Array.max=function(array){return Math.max.apply(Math,array);};Array.min=function(array){return Math.min.apply(Math,array);};this.onload={initialize:function(){$this.Context.$BODY=$("body");$this.Context.$LEFTNAV=$("#navContent");$this.Context.$PRIMARYCONTAINER=$("#primaryContent, #franchisePrimaryContent");$this.rdyMarker();}};DELL.com.Utils.Initialize(this.onload);}).call(DELL.com.Utils);})(jQuery);
if (window.console){console.log('ex time: utils.js', new Date().getTime() - startTScript);}



/*script:package_handler.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.PackageHandler=DELL.com.Utils.PackageHandler||{};(function($){(function(){var matchCase='jsmin.ashx?set=core';var jsminVersion=null;var doc=document,htm=doc.documentElement,JS_ROOT=(window.location.host.match("localhost"))?"/ThunderaWeb/js/default/":"/js/default/",PACKAGES={ajax:{dependencies:[],source:'jsmin.ashx?set=ajax&theme=default&cmp=1&version=',onload:null,priority:1},banners:{dependencies:[],source:'jsmin.ashx?set=banners&theme=default&cmp=1&version=',onload:null,priority:1},baynote:{dependencies:[],source:'jsmin.ashx?set=baynote_core&theme=default&cmp=1&version=',onload:null,priority:1},carousel:{dependencies:[],source:'jsmin.ashx?set=carousel&theme=default&cmp=1&version=',onload:null,priority:1},eloqua:{dependencies:[],source:'jsmin.ashx?set=eloqua&theme=default&cmp=1&version=',onload:null,priority:1},fab4:{dependencies:[],source:'jsmin.ashx?set=fab4&theme=default&cmp=1&version=',onload:null,priority:1},expand_collapse_learn:{dependencies:[],source:'jsmin.ashx?set=expand_collapse_learn&theme=default&cmp=1&version=',onload:null,priority:1},fb:{dependencies:[],source:'jsmin.ashx?set=fb_core&theme=default&cmp=1&version=',onload:null,priority:1},gigya:{dependencies:[],source:'jsmin.ashx?set=gigya_core&theme=default&cmp=1&version=',onload:null,priority:1},mediaplex:{dependencies:[],source:'jsmin.ashx?set=mediaplex&theme=default&cmp=1&version=',onload:null,priority:2},tabschegory:{dependencies:[],source:'jsmin.ashx?set=tabschegory&theme=default&cmp=1&version=',onload:null,priority:2},modals:{dependencies:[DELL.com.Utils.ModalInit,DELL.com.Utils.AutoModal],source:'jsmin.ashx?set=modals&theme=default&cmp=1&version=',onload:function(callSource){DELL.com.Utils.ModalInit.initModal();DELL.com.Utils.AutoModal.init();if(callSource!=null){if(callSource.attr('name')=='modalPopup'||callSource.attr('submitName')=='modalPopup'||callSource.hasClass('technote')||callSource.attr('name')=='prefiltersModal')
$(callSource).trigger('click');else if(callSource.attr('name')=='modalRoll'||callSource.attr('submitName')=='modalRoll'||callSource.hasClass('tooltip')){$(callSource).trigger('mouseover');}}},priority:1},chat:{dependencies:[],source:"https://chatpro.us.dell.com/netagent/proactive/proactive.aspx",onload:null,priority:2}}
this.interval=0;this.packageCheck=function(packageName,callSource){var package=PACKAGES[packageName];if(package.dependencies.length>0&&DELL.com.Utils.PackageHandler.packageCheckDependencies(packageName)){DELL.com.Utils.PackageHandler.interval=setInterval(function(){if(DELL.com.Utils.PackageHandler.packageCheckDependencies(packageName)){clearInterval(DELL.com.Utils.PackageHandler.interval);DELL.com.Utils.PackageHandler.packageLoad(packageName,callSource);}},50);}else{DELL.com.Utils.PackageHandler.packageLoad(packageName,callSource);}}
this.packageCheckDependencies=function(packageName){var pkgReady=false;var package=PACKAGES[packageName];for(var i=0;i<package.dependencies.length;i++){if(typeof package.dependencies[i]!='undefined'&&package.dependencies[i]!=null)
pkgReady=true;}
return pkgReady;}
this.packageLoad=function(packageName,callSource){if(jQuery){var package=PACKAGES[packageName];var pckgURL=(package.source.indexOf("http")!=-1)?package.source:JS_ROOT+package.source+jsminVersion;$.ajax({url:pckgURL,dataType:"script",cache:true,success:function(response){if(package.onload&&typeof package.onload==='function'){package.onload(callSource);}}});}else{}};this.onload={initialize:function(){var jsminCoreSrc=$("script[src*='"+matchCase+"']").attr("src");jsminVersion=DELL.com.Utils.GetURLParamVal(jsminCoreSrc,'version');if(typeof DELL.com.Delphi.PageSettings.JSRoot!=='undefined')JS_ROOT=DELL.com.Delphi.PageSettings.JSRoot;if($(".pChat").length>0){PACKAGES["chat"].source=$(".pChat #pChatURL").val();DELL.com.Utils.PackageHandler.packageLoad("chat",null);}
if($(".delphiCarousel").length>0||$(".rssReaderContainer").length>0){DELL.com.Utils.PackageHandler.packageLoad("carousel",null);}
if($("#baynoteObsrv").length>0)DELL.com.Utils.PackageHandler.packageLoad("baynote",null);if($(".tron,.miniptron,.pokemontron,#rotatingBanner").length>0)DELL.com.Utils.PackageHandler.packageLoad('banners',null);$("a[name='modalPopup'],a[submitName='modalPopup'],a.technote,a[name='prefiltersModal']").unbind("click").live("click",function(e){if(DELL.com.ModalWindow==null){e.preventDefault();$(this).unbind('click');DELL.com.Utils.PackageHandler.packageCheck("modals",$(this));}});$("a[name='modalRoll'],a[submitName='modalRoll'],a.tooltip:not(.anavhmc)").unbind("mouseover").live("mouseover",function(e){if(DELL.com.ModalWindow==null){e.preventDefault();$(this).unbind('mouseover');DELL.com.Utils.PackageHandler.packageCheck("modals",$(this));}});if($("a[name='modalPopupOnLoad'],a.scene7PlayerEmbedLink").length>0){if(DELL.com.ModalWindow==null){DELL.com.Utils.PackageHandler.packageCheck("modals",null);}}
if($(".ajaxOC").length>0){DELL.com.Utils.PackageHandler.packageLoad("ajax",null);}
if($("#gigya,#gigyaWidgets").length>0){DELL.com.Utils.PackageHandler.packageLoad("gigya",null);}
if($("#fb-root").length>0){DELL.com.Utils.PackageHandler.packageLoad("fb",null);}
if($("#pianoKeys").length>0){DELL.com.Utils.PackageHandler.packageLoad("fab4",null);}
if($(".learnExpandCollapse").length>0){DELL.com.Utils.PackageHandler.packageLoad("expand_collapse_learn",null);}
if($(".eloqua").length>0){DELL.com.Utils.PackageHandler.packageLoad("eloqua",null);}
if($(".mediaplex").length>0){DELL.com.Utils.PackageHandler.packageLoad("mediaplex",null);}
if($("#tabschegoryTabContainer").length>0){DELL.com.Utils.PackageHandler.packageLoad("tabschegory",null);}
htm.className=htm.className.replace('no_js','');}};DELL.com.Utils.Initialize(this.onload);}).call(DELL.com.Utils.PackageHandler);})(jQuery);
if (window.console){console.log('ex time: package_handler.js', new Date().getTime() - startTScript);}



/*script:history.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.neoHistory=DELL.com.Utils.neoHistory||{};(function($){DELL.com.Utils.neoHistory=function(){this._curHash='';this._callback=function(hash){};this._loadFromHistory=false;this._iframeID="jQuery_history";if(document.domain.indexOf("dell.com.")==-1&&document.domain.indexOf("dell.com")!=-1)
document.domain="dell.com";else
document.domain=document.domain;};DELL.com.Utils.neoHistory.frameLoad=function(hash){$.history._loadFromHistory=true;$.history.load(hash);$.history._check();};$.extend(DELL.com.Utils.neoHistory.prototype,{init:function(callback){this._callback=callback;this._curHash=location.hash||"#!";this._callback(this._curHash.replace(/^#!|^#/,''));if($.browser.safari){this._historyBackStack=[];this._historyBackStack.length=history.length;this._historyForwardStack=[];this._isFirst=true;this._dontCheck=false;setInterval(this._check,500);}else if(!$.browser.msie){setInterval(this._check,500);}else{this._check();}},_check:function(){if($.browser.safari&&navigator.userAgent.toLowerCase().indexOf('chrome')==-1){if(!$.history._dontCheck){var historyDelta=history.length-$.history._historyBackStack.length;if(historyDelta){$.history._isFirst=false;if(historyDelta<0){for(var i=0;i<Math.abs(historyDelta);i++)$.history._historyForwardStack.unshift($.history._historyBackStack.pop());}else{for(var i=0;i<historyDelta;i++)$.history._historyBackStack.push($.history._historyForwardStack.shift());}
var cachedHash=$.history._historyBackStack[$.history._historyBackStack.length-1];if(cachedHash!=undefined){$.history._curHash=location.hash;$.history._callback(cachedHash);}}else if($.history._historyBackStack[$.history._historyBackStack.length-1]==undefined&&!$.history._isFirst){if(location.hash.indexOf('#!')>=0){$.history._callback(location.hash.split('#!')[1]);}else if(location.hash.indexOf('#')>=0){$.history._callback(location.hash.split('#')[1]);}else{$.history._callback('');}
$.history._isFirst=true;}}}else{var current_hash=location.hash;if(current_hash!=$.history._curHash){$.history._curHash=current_hash;$.history._callback(current_hash.replace(/^#!|^#/,''));}}},add:function(newHash){var $bckfrm=$("#"+$.history._iframeID),ts=new Date(),newSrc="";if($bckfrm.length){newSrc=$bckfrm.attr("src");if($bckfrm.attr("src").indexOf("?")!=-1)
newSrc=$bckfrm.attr("src").substring(0,$bckfrm.attr("src").indexOf("?"));newSrc=newSrc+"?ts="+ts.getMilliseconds()+newHash;$bckfrm.attr("src",newSrc);}},load:function(hash){var newhash=hash;if(!$.browser.safari){if(newhash.indexOf("#")==-1&&newhash!='')
newhash="#!"+hash;window.location.hash=newhash;}
this._curHash=newhash;if($.browser.safari){this._dontCheck=true;this._historyBackStack.push(hash);this._historyForwardStack.length=0;this._isFirst=true;var fn=function(){$.history._dontCheck=false;};window.setTimeout(fn,200);this._callback(hash);if(newhash.indexOf("#")==-1&&newhash!='')
newhash="#!"+hash;location.hash=newhash;}
else{this._callback(hash);if($.browser.msie){if(this._loadFromHistory==false){$.history.add(newhash);}else{this._loadFromHistory=false;}}}}});$.history=new DELL.com.Utils.neoHistory();})(jQuery);
if (window.console){console.log('ex time: history.js', new Date().getTime() - startTScript);}



/*script:history_manager.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.HistoryManager=DELL.com.Utils.HistoryManager||{};(function($){(function(){var CONSTANTS={SEPARATORS:{FRAG:'&',KEYVAL:'='},HASHTRIM:/^.*#!|^.*#/},callbacks=[],fragment='',prevFragment='',parseFragment=function(frag){var fragVals,i,l,keyAndVal,data={};frag=frag.replace(CONSTANTS.HASHTRIM,'');fragVals=frag.split(CONSTANTS.SEPARATORS.FRAG);if(fragVals.length===1&&fragVals[0]===''){return data;}
for(i=0,l=fragVals.length;i<l;i++){keyAndVal=fragVals[i].split(CONSTANTS.SEPARATORS.KEYVAL);data[keyAndVal[0]]=keyAndVal[1];}
return data;},keysHaveNewValues=function(keys){var state=parseFragment(fragment),prevState=parseFragment(prevFragment),atLeastOneKeyHasANewValue=false,i,l;for(i=0,l=keys.length;i<l;i++){if(prevState[keys[i]]!==state[keys[i]]){atLeastOneKeyHasANewValue=true;}}
return atLeastOneKeyHasANewValue;},invokeCallbackObj=function(callbackObj){var param={},state=parseFragment(fragment);$.each(callbackObj.keys,function(){param[this]=state[this];});callbackObj.callback(param);},handleFragmentChange=function(frag){var i,l;prevFragment=fragment;fragment=frag;for(i=0,l=callbacks.length;i<l;i++){if(keysHaveNewValues(callbacks[i].keys)){invokeCallbackObj(callbacks[i]);}}},getNewFragmentWithData=function(data){var s=fragment,re;$.each(data,function(key,value){if(s.indexOf(key+CONSTANTS.SEPARATORS.KEYVAL)!==-1){re=new RegExp('(&?'+key+CONSTANTS.SEPARATORS.KEYVAL+')[^&]*');if(value!==null){s=s.replace(re,'$1'+value);}else{s=s.replace(re,'');}}else if(value!==null){s+=(s===''?'':CONSTANTS.SEPARATORS.FRAG)+
key+CONSTANTS.SEPARATORS.KEYVAL+value;}});return s;},register=function(keys,callback){var callbackObj;if(typeof keys==='string'){keys=[keys];}
callbackObj={callback:callback,keys:keys};initHistory();callbacks.push(callbackObj);invokeCallbackObj(callbackObj);},load=function(data,loadWithoutNewHistoryEntry){var newFrag=getNewFragmentWithData(data);if(!loadWithoutNewHistoryEntry){$.history.load(newFrag);}else{handleFragmentChange(newFrag);}};initHistory=function(){var context=DELL.com.Utils.Context.$LEFTNAV||$("#navContent");if(context.size()<=0||this.HMFLoaded)
return;this.HMFLoaded=true;$.history.init(handleFragmentChange);};this.register=register;this.load=load;this.HMFLoaded=false;}).apply(DELL.com.Utils.HistoryManager);})(jQuery);
if (window.console){console.log('ex time: history_manager.js', new Date().getTime() - startTScript);}



/*script:search.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};(function($){DELL.com.Utils.search=function(){var search=function(object){var url,queryStrNavParam;var isSorting=false;object=object||{};if(typeof object==="string"){var string=object;object={filter:string};}
try{queryStrNavParam=jQuery.grep(document.location.search.substring(1).split('&'),function(n){return n.indexOf('navs=')===0;})[0].substring(5);}catch(e){queryStrNavParam='';}
var LWP=DELL.com.Utils.getLWP();var ps=DELL.com.Delphi.PageSettings;var prefix=vars.searchType=="product"?'ProductSearch.svc/search':'documentsearch.svc/t/';var params={root:object.root||ps.APIRoot,thunderaPrefix:prefix,category:object.category||$(CONSTANTS.SELECTORS.SEARCHCATEGORY).text()||ps.CategoryID,delphiPrefix:'/sq_delphi_listing',xform:object.xform||"search_results",filter:window.encodeURIComponent(object.filter)||queryStrNavParam,keyword:window.encodeURIComponent(object.keyword)||null,sort:object.sort||$(CONSTANTS.SELECTORS.SEARCHSORTDEFAULT).text()||"-docdatetime,-dt2",results:object.results||$(CONSTANTS.SELECTORS.SEARCHHITS).val()||$(CONSTANTS.SELECTORS.SEARCHHITS).text()||ps.pageSize,page:object.page||null,xsltParams:object.xsltParams||$(CONSTANTS.SELECTORS.XSLTPARAMS).val()||null,sortSelected:$(CONSTANTS.SELECTORS.SEARCHSORT).val()||null};if(object.keyword){params.filter+=window.encodeURIComponent("&k="+object.keyword);}
if(vars.defaultResultsPerPage==null)
vars.defaultResultsPerPage=params.results;if(params.filter==vars.currentFilter)
isSorting=true;else
vars.currentFilter=params.filter;if(vars.searchType=="product")
url=params.root+params.thunderaPrefix+"?catid="+params.category+"&cTemplate=search/anav_search_results"+"&sort="+params.sort+"&pageSize="+params.results+"&navs="+params.filter;else{params.filter=queryStrNavParam.length>0?queryStrNavParam+window.encodeURIComponent("&")+params.filter:params.filter;url=params.root+params.thunderaPrefix+params.category+params.delphiPrefix+"?hits="+params.results+"&xform="+params.xform+"&sort="+params.sort+"&sqp="+params.filter;}
if(params.xsltParams){url+='&xParams='+params.xsltParams;}
if(params.page){url+="&page="+params.page;}
url+=LWP;$.ajax({url:url,type:"GET",error:function(req){utils.unbindLoaderFromMouse();vars.$body.trigger("killAnimations");var HM=DELL.com.Utils.HistoryManager;var msg=$(CONSTANTS.HTML.ERROR),target=$("#"+CONSTANTS.IDS.TARGET);replacedContentExists=($('#'+CONSTANTS.IDS.REPLACED_CONTENT).children().length>0)
msg.find("#applicationContent").append(DELL.com.Utils.Localize('error_anav_search'));if(!($('#'+CONSTANTS.IDS.REPLACED_CONTENT).children().length>0)){target.children().appendTo('#'+CONSTANTS.IDS.REPLACED_CONTENT);}
HM.load({navigators:params.filter},true);utils.errorEventListener(msg);target.empty().append(msg);utils.fadeInBody(vars.searchType);DELL.com.FacetedNav.disableFacets(false);},success:function(req){utils.unbindLoaderFromMouse();vars.$body.trigger("killAnimations");utils.fadeInBody(vars.searchType);var container=CONSTANTS.HTML.CONTAINER,output=container.BEGIN+req+container.END,target=$("#"+CONSTANTS.IDS.TARGET),replacedContentExists=($('#'+CONSTANTS.IDS.REPLACED_CONTENT).children().length>0),selectVal,newSearch;var $output;if($(CONSTANTS.SELECTORS.SEARCHPREFIX).text()=="product"){var HM=DELL.com.Utils.HistoryManager,jsonObj="";if($().jquery.match(/1.4./gi))
jsonObj=req;else
jsonObj=(new Function("return"+req))();output=jsonObj.ProductsHtml;vars.currentResultOffset=(params.page-1)*params.results;HM.load({navigators:jsonObj.ValidNavigators.join(',')},true);$output=$(output);}
if(!object.page&&!object.sort){target.hide();}
if(params.sortSelected==null){if(object.sort){selectVal=object.sort;}else{selectVal=params.sort;}}else{if(object.sort){selectVal=object.sort;}else if(params.sort){selectVal=params.sort;}else{selectVal="-"+params.sortSelected;}}
newSearch=$output||$(output);utils.getSortElem(newSearch).val(selectVal);utils.getPerPageElem(newSearch).val(params.results);utils.errorEventListener(newSearch);if(!!object.target){replace=(object.target.find(CONSTANTS.SELECTORS.RESULTS).length>0);}else{if(!replacedContentExists){target.children().appendTo('#'+CONSTANTS.IDS.REPLACED_CONTENT);}
target.empty().append(newSearch).append('<input id="'+CONSTANTS.IDS.FILTER+'" type="hidden" value="'+params.filter+'" />');focusLink=$('<a href="" class="invisible" name="content">Content</a>');target.prepend(focusLink);focusLink.focus();}
if(!object.page&&!object.sort){target.fadeIn("slow");}
DELL.com.FacetedNav.disableFacets(false);utils.sortEventListener();utils.paginationEventListener();utils.resultsPerPageEventListener();try{DELL.com.Init.InitLinks();if(typeof optimizeButtonsForIE6!='undefined')optimizeButtonsForIE6(true);var newSearch=$('#newSearch');if(newSearch.length){keyParam=DELL.com.Utils.GetURLParamVal(window.location.toString(),"keyword"),keyword=keyParam!=""?"&k="+keyParam:"";var searchUrl="http://search.dell.com/results.aspx?&c="+ps.lwp.Country+"&l="+ps.lwp.Language+"&s="+ps.lwp.Segment+"&cs="+ps.lwp.CustomerSet+keyword+"&cat=all&x=0&y=8";newSearch.find("a").attr({href:searchUrl});}}catch(err){console.log(err);}}});},CONSTANTS={HTML:{CONTAINER:{BEGIN:'<div id="facetSearchResults" class="verticalSubsection">',END:'</div>'},LOADER:'<div id="loadingContainer" class="modalLoad"></div>',ERROR:'<div class="verticalSubsection"><div id="applicationContent"></div></div>'},IDS:{TARGET:"primaryAjaxHook",FILTER:"currentFilterType",REPLACED_CONTENT:"replacedContent",LOADER:"loadingContainer",PRIMARYCONTAINER:"primaryContent"},SELECTORS:{TARGET:"#primaryAjaxHook",RESULTS:".searchResults",SEARCHHITS:"#searchHits",SEARCHCATEGORY:"#searchCategory",SEARCHSORTDEFAULT:"#searchSortDefault",XSLTPARAMS:"#search_xsltparams",SEARCHPREFIX:"#searchPrefix",SEARCHRPP:".itemsPerPage",SEARCHSORTBY:".resultsSortBy",SEARCHSORT:"#searchSort"},LOADER:{XOFFSET:11,YOFFSET:26}},vars={$body:null,$leftNav:null,$primaryContainer:null,searchType:"document",recentResultsPerPage:null,currentResultOffset:null,isSorting:false,loaderContainer:null,mouseCoordinates:null},utils={sortEventListener:function(){var select=utils.getSortElem(),target=select.parents(".container").eq(0);select.bind("change",function(e){var sQuery={sort:this.value,p:1,navigators:null},oFacets=$("#searchFacets").attr("value")||"";if(oFacets.length>0){$.extend(sQuery,{facets:oFacets});}
DELL.com.Utils.HistoryManager.load(sQuery);});$(CONSTANTS.SELECTORS.SEARCHSORTBY).one("click",function(e){e.stopPropagation();utils.bindToMouse();});},resultsPerPageEventListener:function(){var select=utils.getPerPageElem();select.bind("change",function(e){var newPage=Math.floor(vars.currentResultOffset/this.value)+1;DELL.com.Utils.HistoryManager.load({results:this.value,p:newPage,navigators:null});});$(CONSTANTS.SELECTORS.SEARCHRPP).one("click",function(e){e.stopPropagation();utils.bindToMouse();});},paginationEventListener:function(){var link=$("#"+CONSTANTS.IDS.TARGET+" .pagination a"),target=link.parents(".container").eq(0);link.bind("click",function(e){var $obj=$(this),oUrl=$obj.attr("href"),oFacets=DELL.com.Utils.GetURLParamVal(oUrl,"facets"),oSort=utils.getSortElem(),sQuery={p:$obj.attr("rel"),navigators:null};vars.mouseCoordinates={x:e.pageX,y:e.pageY};e.preventDefault();if(oFacets.length>0){$.extend(sQuery,{facets:oFacets});}
if(oSort.length>0){if(oSort.get(0).value.length>0){$.extend(sQuery,{sort:oSort.get(0).value});}}
DELL.com.Utils.HistoryManager.load(sQuery);});},getSortElem:function(context){if(!context){context=$(CONSTANTS.SELECTORS.TARGET);}
var $dropdowns=context.find(CONSTANTS.SELECTORS.SEARCHSORTBY+" > select");if($dropdowns.size()>0)
return $dropdowns;else
return context.find("select#PREFIXsortbySearchResults");},getPerPageElem:function(context){if(!context)
context=$(CONSTANTS.SELECTORS.TARGET);return context.find(CONSTANTS.SELECTORS.SEARCHRPP+" > select");},errorEventListener:function(content){var b=content.find("a.invalidNavigatorsBack");if(b.size()>0){b.click(function(e){e.preventDefault();history.go(-1);});content.find("a.invalidNavigatorsReset").click(function(e){e.preventDefault();var HM=DELL.com.Utils.HistoryManager;HM.load({facets:"",p:1,sort:null,navigators:null,results:null});});}},stateChangeListener:function(data){var children,target=$(CONSTANTS.SELECTORS.TARGET);if(!data.facets&&!data.keyword&&!data.p&&!data.sort){children=$('#'+CONSTANTS.IDS.REPLACED_CONTENT).children();if(children.length>0){target.hide();target.empty().append(children);target.find("select#PREFIXsortbySearchResults").val('');target.fadeIn("slow",function(){vars.$body.trigger("restartAnimations");});}
return false;}
DELL.com.FacetedNav.disableFacets(true);if(vars.$body.find('#'+CONSTANTS.IDS.LOADER).size()<=0){vars.$body.prepend(CONSTANTS.HTML.LOADER);vars.loaderContainer=$('#'+CONSTANTS.IDS.LOADER);}
utils.unbindFromMouse();utils.bindLoaderToMouse();utils.fadeOutBody(vars.searchType);search({filter:DELL.com.FacetedNav.getSearchString(data.facets),keyword:data.keyword,sort:data.sort,page:data.p,results:data.results});if($(window)._scrollable().scrollTop()>target.offset().top){$.scrollTo(target.offset().top-10,{duration:1000,easing:'easeInOutQuad'});}},updateLoaderPosition:function(e){var xPos=e.pageX+e.data.offset.x;var yPos=e.pageY+e.data.offset.y;vars.loaderContainer.css({"left":xPos+"px","top":yPos+"px"});},bindLoaderToMouse:function(mousePosition){if(vars.loaderContainer==null)
vars.loaderContainer=$('#'+CONSTANTS.IDS.LOADER);utils.setStartingLoaderPosition();vars.loaderContainer.css("visibility","visible").show();vars.$body.bind('mousemove',{offset:{x:CONSTANTS.LOADER.XOFFSET,y:CONSTANTS.LOADER.YOFFSET}},utils.updateLoaderPosition);},unbindLoaderFromMouse:function(){vars.loaderContainer.hide();vars.$body.unbind('mousemove',utils.updateLoaderPosition);},bindToMouse:function(){vars.$body.bind('mousemove.combobox',utils.setMouseCoordinates);},unbindFromMouse:function(){vars.$body.unbind('mousemove.combobox',utils.setMouseCoordinates);},fadeOutBody:function(type){switch(type.toLowerCase()){case"product":$('#searchOverlay').css({"opacity":0,"display":"block","height":$("#applicationContent").height()+9}).fadeTo(500,0.5);break;default:DELL.com.Utils.Context.$PRIMARYCONTAINER.fadeTo(500,0.5);}},fadeInBody:function(type){switch(type.toLowerCase()){case"product":var obj=$('#searchOverlay');obj.fadeTo(500,0,function(){obj.css({"display":"none"});});break;default:DELL.com.Utils.Context.$PRIMARYCONTAINER.fadeTo(500,1,function(){if($.browser.msie)
var s=DELL.com.Utils.Context.$PRIMARYCONTAINER[0].style.removeAttribute("filter");});}},setStartingLoaderPosition:function(){var position=DELL.com.FacetedNav.getMouseClickCoordinates()||vars.mouseCoordinates;if(position!=null)
utils.updateLoaderPosition({pageX:position.x,pageY:position.y,data:{offset:{x:CONSTANTS.LOADER.XOFFSET,y:CONSTANTS.LOADER.YOFFSET}}});},setMouseCoordinates:function(params){var xPos=params.pageX||params.x;var yPos=params.pageY||params.y;try{vars.mouseCoordinates={x:xPos,y:yPos};}catch(err){}}},onload={initObjects:function(){vars.$body=DELL.com.Utils.Context.$BODY||$("body");vars.$leftNav=DELL.com.Utils.Context.$LEFTNAV||$("#navContent");vars.$primaryContainer=DELL.com.Utils.Context.$PRIMARYCONTAINER||$("#primaryContent, #franchisePrimaryContent");vars.searchType=$(CONSTANTS.SELECTORS.SEARCHPREFIX).text().toLowerCase();},initNoResultsLink:function(){var newSearch=vars.$primaryContainer.find('#newSearch');if(newSearch.length){var ps=DELL.com.Delphi.PageSettings;var searchUrl="http://search.dell.com/results.aspx?&c="+ps.lwp.Country+"&l="+ps.lwp.Language+"&s="+ps.lwp.Segment+"&cs="+ps.lwp.CustomerSet+"&k="+DELL.com.Utils.GetURLParamVal(window.location.toString(),"keyword")+"&cat=all&x=0&y=8";newSearch.find("a").attr({href:searchUrl});}},attachListeners:function(){try{utils.sortEventListener();utils.paginationEventListener();utils.resultsPerPageEventListener();}catch(e){};},registerHistoryCallbacks:function(){var HM=DELL.com.Utils.HistoryManager,keys=['facets','keyword','sort','p','results'];HM.register(keys,utils.stateChangeListener);},resetSearchSort:function(){try{if(!$("select#PREFIXsortbySearchResults:has(option[selected='selected'])")){utils.getSortElem().attr("selectedIndex",0);}}catch(e){};}};DELL.com.Utils.Initialize(onload);return search;}();})(jQuery);
if (window.console){console.log('ex time: search.js', new Date().getTime() - startTScript);}



/*script:localization.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};(function($){(function(){var undefined,L10n={stringTables:{}};if(DELL.com.Resources){JSTextBank='thundera-ui-js';L10n.stringTables=DELL.com.Resources[JSTextBank];DELL.com.Resources=undefined;}
L10n.localize=function(string){if(this.stringTables[string]!==undefined){return this.stringTables[string];}
return string;}
DELL.com.Utils.Localize=function(string){return L10n.localize(string);};})();})(jQuery);
if (window.console){console.log('ex time: localization.js', new Date().getTime() - startTScript);}



/*script:faceted_nav.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.FacetedNav=DELL.com.FacetedNav||{};DELL.com.FacetedNav.FacetsCollector={};(function($){(function(){var CONSTANTS={ACTIVECLASS:'active',DISABLEDCLASS:'disabled',CONFLICTCLASS:'conflict',SEARCHPREFIX:"#searchPrefix"},selectors={facetsLinks:'.group a'},searchType=$(CONSTANTS.SEARCHPREFIX).text().toLowerCase(),menuElement,activeFacets=[],maxVisibleElements=5,historyInitialized=false,disableFacets=false,mouseCoordinates=null,suppressCollector;function initialize(){menuElement=$('#menu1');suppressCollector=menuElement.is('.suppressCollector');menuElement.find('li.category').each(function(){var categoryContainer=$(this),categoryElement=categoryContainer.find('a.category'),facetsElements=categoryContainer.find('.group a'),categoryID=categoryElement.attr('rel'),isCollectable=!suppressCollector&&(facetsElements.length>maxVisibleElements);if(isCollectable){DELL.com.FacetedNav.FacetsCollector.implement(categoryContainer,facetsElements);}
facetsElements.each(function(){initializeFacetData($(this),{Category:categoryID,isCollectable:isCollectable});});categoryElement.click(function(e){e.preventDefault();toggleCategory(categoryContainer);return false;});});menuElement.find('.group a').live('click',DELL.com.FacetedNav.facetEventHandler);menuElement.find('.facetSearchBox');DELL.com.Utils.HistoryManager.register('facets',initializeMarkedFacets);DELL.com.Utils.HistoryManager.register('facets',onFacetUpdate);DELL.com.Utils.HistoryManager.register('navigators',onNavigatorUpdate);$('a.aNavClearAll').bind('click',function(e){DELL.com.Utils.HistoryManager.load({facets:null,p:null,navigators:null});e.preventDefault();});}
function initializeFacetData(facetLink,overrideData){var categoryID=facetLink.parent().attr('className'),facetID=facetLink.attr('rel');facetLink.data('FacetedNav',{Category:categoryID||overrideData.Category,Facet:facetID,isCollectable:overrideData.isCollectable});}
function onFacetUpdate(data){if(historyInitialized)
{var selectArr,facets=data.facets||'';selectArr=facets.split(',');if(facets.length<=0){activeFacets=[];}
menuElement.find(selectors.facetsLinks).each(function(){var $this=$(this),rel=$this.attr('rel'),fData=$this.data("FacetedNav");if($.inArray(rel,selectArr)!==-1){$this.addClass(CONSTANTS.ACTIVECLASS);if(fData!=null&&fData.Facet!=""&&$.inArray(fData,activeFacets)===-1){activeFacets.push(fData);}
if(fData!=null&&fData.isCollectable){DELL.com.FacetedNav.FacetsCollector.toggleItem($this);}}else{if(rel!=="keywordFacet"){$this.removeClass(CONSTANTS.ACTIVECLASS);}}});for(var i=0,l=activeFacets.length;i<l;i++)
{if(activeFacets[i]!=undefined)
{if($.inArray(activeFacets[i].Facet,selectArr)===-1)
activeFacets.splice(i,1);}}}}
function onNavigatorUpdate(data){if(data.navigators==undefined)
{menuElement.find(selectors.facetsLinks).each(function(){$(this).removeClass(CONSTANTS.DISABLEDCLASS+" "+CONSTANTS.CONFLICTCLASS);});return;}
var selectArr,validNavigators=data.navigators;selectArr=validNavigators.split(',');menuElement.find(selectors.facetsLinks).each(function(){var $this=$(this),rel=$this.attr('rel');if($.inArray(rel,selectArr)!==-1){$this.removeClass(CONSTANTS.DISABLEDCLASS+" "+CONSTANTS.CONFLICTCLASS);}else if($.inArray(rel,selectArr)==-1&&$this.hasClass(CONSTANTS.ACTIVECLASS)){$this.removeClass(CONSTANTS.DISABLEDCLASS);$this.addClass(CONSTANTS.CONFLICTCLASS);}else{$this.addClass(CONSTANTS.DISABLEDCLASS);}});}
function initializeMarkedFacets(data){if(historyInitialized){return false;}
historyInitialized=true;if(!data.facets){return false;}
var facets=data.facets.split(','),facetValue;for(var i=facets.length-1;i>=0;i--){facetValue=facets[i];toggleFacet(menuElement.find('a[rel='+facetValue+']'));}
var pageNum=DELL.com.Utils.GetURLParamVal(window.location.href,"p");dispatchSearch(pageNum);}
function toggleFacet(facetLink,logMetrics){if(logMetrics){if(facetLink.is('.disabled')){return false;}}
var facetData=facetLink.data('FacetedNav');facetLink.toggleClass('active');if(facetLink.is('.active')){activeFacets.push(facetData);}else{for(var i=activeFacets.length-1;i>=0;i--){if(activeFacets[i]==facetData){activeFacets.splice(i,1);break;}}
var selectionList=facetLink.parents('.facetsCollector').find('div.selectionList'),items=selectionList.find('ul'),item,facetData;facetData=facetLink.data('FacetedNav');items.find('a[rel='+facetData.Facet+']').parent().remove();if(activeFacets.length==0){$('div.selectionList').css('display','none');}}
if(logMetrics)
{var facetTitle=facetLink.parents("li.category:first").find("a.category:first").text(),metricsID=facetLink.text(),CurrentCategoryNode=DELL.com.Delphi.PageSettings.mi.CurrentCategoryNode;if(CurrentCategoryNode!=null&&CurrentCategoryNode!="")
facetTitle=CurrentCategoryNode+":"+facetTitle;DELL.com.Utils.Metrics.logAnavMetrics(facetTitle,metricsID);}}
function toggleCategory(categoryContainer){var categoryLink=categoryContainer.find('a.category');if(categoryLink.is('.disabled')){return false;}
categoryContainer.toggleClass('active');categoryLink.siblings().not(".tooltipanav").slideToggle('normal');if($.browser.msie){categoryLink[0].hideFocus=true;}}
function dispatchSearch(pageNum){var search,searchString=DELL.com.FacetedNav.getHistoryManagerString();if(searchString){search={facets:searchString,p:pageNum||1,navigators:null};}else{search={facets:null,p:null,sort:null,navigators:null};}
DELL.com.Utils.HistoryManager.load(search);}
this.facetEventHandler=function(e){e.preventDefault();var fl=$(this);if(fl.hasClass(CONSTANTS.DISABLEDCLASS)||disableFacets)
return false;toggleFacet(fl,true);dispatchSearch();mouseCoordinates={x:e.pageX,y:e.pageY};return false;}
this.getSearchString=function(data){var facets=data||'',searchString='',menuElement=menuElement||$('#menu1');if(searchType==="product")
{searchString=facets.split(',');}
else
{facets=facets.split(',');for(var i=0,l=facets.length;i<l;i++)
{var facet=facets[i];var fl=menuElement.find('a[rel='+facet+']');var catID=fl.parents("li.category:first").find("a.category:first").attr("rel");if(searchString.length>0)
searchString+="&";searchString+=catID+"="+facet;}}
return searchString;};this.disableFacets=function(val){disableFacets=val;if(!val)
{if(searchType!=="product")
onNavigatorUpdate({navigators:null});return;}
var menuElement=menuElement||$('#menu1'),facets=menuElement.find(selectors.facetsLinks);facets.each(function(){$(this).addClass(CONSTANTS.DISABLEDCLASS);});};this.getMouseClickCoordinates=function(){var temp=mouseCoordinates;mouseCoordinates=null;return temp;};this.getHistoryManagerString=function(){var searchString='';for(var i=activeFacets.length-1;i>=0;i--){searchString+=','+activeFacets[i].Facet;}
return searchString.substring(1);};var onload={init:initialize};DELL.com.Utils.Initialize(onload);}).call(DELL.com.FacetedNav);(function(){var collectorsInitialized=false,facetsCollector='<div class="facetsCollector">'+'<form class="searchBox"> <label>{find_a_value}</label> <div class="facetsSearchBox"><input value="{enter_text}" class="facetsSearch" /></div> <input type="submit" value="{search}" class="invisible" /> </form>'+'<div class="facetsPanel"> <span class="noMatches" style="display: none"></span></div>'+'<div class="selectionList" style="display: none"> <span>{currently_selected}</span> <ul class="group"></ul> </div> </div>',facetCollectorGroups=[],sNoMatches=DELL.com.Utils.Localize('text_no_matches');facetsCollected=[];facetsCollector=facetsCollector.replace('{find_a_value}',DELL.com.Utils.Localize('facets_find_a_value')).replace('{enter_text}',DELL.com.Utils.Localize('facets_find_content_type')).replace('{search}',DELL.com.Utils.Localize('facets_search')).replace('{currently_selected}',DELL.com.Utils.Localize('facets_currently_selected'));this.implement=function(categoryContainer,facetsElements){var facetsList=facetsElements.parents('ul.group').remove();facetCollectorGroups.push({searchBox:null,facetCollector:$(facetsCollector).find('.facetsPanel').append(facetsList).end().appendTo(categoryContainer),facetList:null,noMatches:null});collectorsInitialized=true;};this.toggleItem=function(facetLink){var selectionList=facetLink.parents('.facetsCollector').find('div.selectionList'),items=selectionList.find('ul'),item,facetData;if(facetLink.is('.active')){facetData=facetLink.data('FacetedNav');if(items.find('a[rel='+facetData.Facet+']').size()<=0){item=facetLink.parent().clone();var tmp=facetLink.parent().data("originalText");if(tmp!=null){item.find("a").html(tmp);}
item.click(function(e){return DELL.com.FacetedNav.facetEventHandler.call(facetLink,e);});items.append(item);}}else{facetData=facetLink.data('FacetedNav');items.find('a[rel='+facetData.Facet+']').parent().remove();}
selectionList.toggle(items.children().length>0);}
function setupInstances(){var searchBoxes=$('form.searchBox'),count=0,timeout=null;searchBoxes.submit(function(e){var $this=$(this),input=$this.find('.facetsSearch'),facets=$this.parents('div.facetsCollector').find('.facetsPanel li');facets.filter('.matchedFacet').find('a').click();input.val('');return false;}).find('.facetsSearch').each(function(){var $this=$(this);$this.data({defaultValue:$this.val(),group:count}).keydown(function(e){switch(e.which){case 37:case 38:case 39:case 40:case 9:case 13:break;default:if(timeout){clearTimeout(timeout);}
timeout=setTimeout(function(){filterResults($this);},10);break;}}).keyup(searchEventHandler).focus(function(){if($this.val()===$this.data('defaultValue')){$this.val('');$this.addClass('active');}}).blur(function(){if($this.val()===''){$this.val($this.data('defaultValue'));$this.removeClass('active');}});count++;});}
function completeField(){}
function filterResults(inputField){var groupObj=facetCollectorGroups[inputField.data("group")],partialText=inputField.val().toLowerCase(),group=groupObj.facetList,matchedText="",noMatchText=groupObj.noMatches;hasMatches=false;if(group==null)
{group=groupObj.facetList=$(groupObj.facetCollector).find(".facetsPanel li").map(function(){return $(this);});}
for(var i=0;i<group.length;i++)
{var obj=group[i],matchedText="",startIndex=-1;if(obj.data("originalText")==null){matchedText=obj.text();obj.data({originalText:obj.text()});}
else{matchedText=obj.data("originalText");}
startIndex=matchedText.toLowerCase().indexOf(partialText);if(startIndex>=0){var s=matchedText,l=startIndex+partialText.length,tmp=s.slice(0,startIndex)+"<span class=\"highlight\">"+s.slice(startIndex,l)+"</span>"+s.slice(l);if(obj.data("originalText")==null)
obj.data({originalText:s});obj.find("a").html(tmp);obj.show();hasMatches=true;}
else{obj.find("a").html(matchedText);obj.hide();}}
if(!hasMatches){if(noMatchText==null){noMatchText=groupObj.noMatches=$(groupObj.facetCollector.find(".noMatches"));}
noMatchText.html(sNoMatches+": '<span class=\"highlight\">"+partialText+"</span>'").show();}
else{if(noMatchText!=null){noMatchText.hide();}}}
function searchEventHandler(e){var $this=$(this),val=$this.val(),facets=$this.parents('div.facetsCollector').find('.facetsPanel a'),matchClasses={matched:'matchedFacet',unmatched:'unmatchedFacet'},searchString=new RegExp(val,'i');facets.parent().removeClass(matchClasses.matched+' '+matchClasses.unmatched);if(!val||val===$this.data('defaultVal')||e.keyCode===13){return;}
facets.each(function(){var $facet=$(this),match=$facet.text().match(searchString),classID=match?'matched':'unmatched'
$facet.parent().addClass(matchClasses[classID]);});$this.focus();}
DELL.com.Utils.Initialize({initialize:function(){if(collectorsInitialized){setupInstances();}}});}).call(DELL.com.FacetedNav.FacetsCollector);DELL.com.Utils.Initialize({initializeSearch:function(){var undefined,keywordSearch={initialized:false,module:$('#keywordSearch'),form:$('#keywordSearch form'),list:$('#keywordSearchList'),clearButton:$('#keywordSearchClearButton'),scope:[]};if(keywordSearch.module.length===0){return;}
function getKeywordId(keyword){return'keywordSearch-'+keyword.replace(/ /g,'');}
function getKeywordLink(keyword){var elementId=getKeywordId(keyword),cleanID=elementId,element=$('#'+cleanID);if(element.length===0){var keywordURL=encodeURIComponent(keyword),link=$('<a class="sublevel" rel="keywordFacet" href="#'+keywordURL+'" />'),listItem=$('<li id="'+cleanID+'" />');link.text(keyword.replace(/%20/g,' ')).click(function(){if($.inArray(keyword,keywordSearch.scope)>-1){keywordSearch.removeKeyword(keyword);}else{keywordSearch.addKeyword(keyword);}
return false;});element=listItem.append(link).appendTo(keywordSearch.list);}
return element.find('a');}
keywordSearch.execute=function(){var keywordSearch,search=this.scope.join('+');if(search.length===0){keywordSearch={keyword:null,p:null,sort:null,navigators:null}}else{keywordSearch={keyword:search,p:1,navigators:null};}
DELL.com.Utils.HistoryManager.load(keywordSearch);};keywordSearch.addKeyword=function(keyword,execute){if(!this.initialized){this.initialized=true;this.list.parent().add(this.clearButton).removeClass('hidden').show();}
getKeywordLink(keyword).addClass('active');this.scope.push(keyword);if(execute!==false){this.execute();}};keywordSearch.removeKeyword=function(keyword){for(var i=0;i<this.scope.length;++i){string=this.scope[i];if(string===keyword){this.scope.splice(i,1);getKeywordLink(keyword).removeClass('active');this.execute();return;}}};keywordSearch.clear=function(){this.initialized=false;this.scope=[];this.list.empty();this.execute();};keywordSearch.form.submit(function(event){var input=$('#keywordSearchInput'),pattern=/[\w]/gi,pattern1=/[a-zA-Z0-9]*[ \` \~ \! \@ \# \$ \% \^ \& \* \( \) \- \= \+ \{ \} \[ \] \\ \; \: \| \' \" \, \. \/ \< \> \? ]+[a-zA-Z0-9]*/,keyword="",keywords=input.val().toLowerCase().split(","),isNewKeyword=false;for(var i=0,l=keywords.length;i<l;i++)
{var executeSearch=(i+1)>=l?true:false;keyword=keywords[i];isNewKeyword=(keyword.length>0&&keyword!==input.data('defaultText')&&$.inArray(keyword,keywordSearch.scope)===-1);if(isNewKeyword){if((String(keyword).replace(pattern,"")).length===0)
{keywordSearch.addKeyword(keyword,executeSearch);input.val('');}
else
{keywordSearch.addKeyword(keyword,executeSearch);input.val('');}}}
return false;}).find('#keywordSearchInput').each(function(){var $this=$(this),defaultText=keywordSearch.form.find('label').text();$this.val(defaultText).data('defaultText',defaultText.toLowerCase()).focus(function(){if(jQuery.trim($this.val().toLowerCase())===jQuery.trim(defaultText).toLowerCase()){$this.val('');}}).blur(function(){if($this.val()===''){$this.val(defaultText);}}).click(function(){if($this.val()===defaultText){$this.val('');}});});keywordSearch.clearButton.click(function(){keywordSearch.list.parent().slideUp('slow',function(){keywordSearch.clear();});return false;});DELL.com.Utils.HistoryManager.register('keyword',function(data){if(data.keyword)
{var keywordArr=data.keyword.split('+');for(var i=0;i<keywordSearch.scope.length;i++){if($.inArray(keywordSearch.scope[i],keywordArr)===-1){keywordSearch.removeKeyword(keywordSearch.scope[i]);}}}
if(keywordSearch.initialized||!Boolean(data.keyword)){return true;}
var keywords=data.keyword.split('+'),count=keywords.length,keyword;for(var i=0;i<count;++i){keyword=keywords[i];keywordSearch.addKeyword(keyword,false);}});}});})(jQuery);
if (window.console){console.log('ex time: faceted_nav.js', new Date().getTime() - startTScript);}



/*script:prefilters.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Prefilters=DELL.com.Prefilters||{};(function($){(function(){var _this=this,undefined,context,$UIfilter,$UIfilters,$CTALink,$CTAButton,$disabledButton,queryString="",filterCollapsed=false,preConfigFilterQS=null,preConfigPagingQS=null,dataTableColHeight=new Array();vars={$globalCollapseControl:null,$similarCollapsedPanels:0,$collapsedPanels:0,$similars:new Array()}
CONSTANTS={FILTERQS:"filterCollapsed",REMOTECAROUSEL:"#remoteCarousel"},DELL.com.Prefilters.prefilterControl={init:function(){$(".modalContent").ready(function(){var productId=$("#productId",".modalContent").val();context=$("#prefiltersModal-"+productId);$CTALink=$("#linkFor3x",".modalContent").val();$CTAButton=$(".prefilterButtons a.btn",".modalContent");$disabledButton=$(".prefilterButtons #prefilterInactiveBtn",".modalContent");$("#prefilterButtons a").attr("href",$CTALink);$UIfilters=$(".navigators li select",".modalContent");$UIfilters.each(function(){$(this).unbind('change').bind('change',function(e){e.preventDefault();DELL.com.Prefilters.prefilterControl.updateURL($(this).attr('id'),$(this).val());var productId=$("#productId",".modalContent").val();var targetFilters=DELL.com.Prefilters.prefilterControl.getFilterValuesString();DELL.com.Prefilters.prefilterControl.callSalesCatalog(productId,targetFilters);DELL.com.Prefilters.prefilterControl.validateButton();})})})},getPrefilters:function(productID,linkElem){if($.trim($("div#prefilter-"+productID).text()).length>0){new DELL.com.ModalWindow(linkElem);this.validateButton();return false;}
$linkTo3x=$("a[name='linkTo3x-"+productID+"']").attr("href")||$(data).find("a.btn.purchase").attr("href");var params={cTemplate:'products/prefilter_modal',filters:'',productid:productID,uiParameters:null}
var successCallback=function(data){if($(data).find("select").length<=0){window.location.href=$linkTo3x;return false;}
$("#prefilter-"+productID).html(data);new DELL.com.ModalWindow(linkElem);}
var failCallback=function(){window.location.href=$linkTo3x;return false;}
DELL.com.SalesCat.call("configset",params,successCallback,failCallback);},updateURL:function(paramName,paramValue){var removeParam=false;if(paramValue.length==0)removeParam=true;var unescapedQuery=unescape(queryString);if(unescapedQuery.indexOf(paramName)>-1){var diff=removeParam?'&?':'';var mustBeReplaced=new RegExp(diff+''+paramName+'=[^&]+','ig');var withThis=removeParam?'':paramName+"="+paramValue;unescapedQuery=unescapedQuery.replace(mustBeReplaced,withThis);queryString=escape(unescapedQuery);}else{if(queryString.length>0)queryString+=escape("&");queryString+=escape(paramName+"="+paramValue);}
var navParam="";($CTALink.indexOf('?')>-1)?navParam="&3x_nav=":navParam="?3x_nav=";$CTAButton.attr('href',$CTALink+navParam+queryString+'&3x_page=1');},validateButton:function(){var allFiltersSelected=true;$UIfilters.each(function(){if($(this).get(0).selectedIndex==0){allFiltersSelected=false;return;}})
if((allFiltersSelected&&$CTAButton.css("display")=="none")||(!allFiltersSelected&&$CTAButton.css("display")=="inline-block"))DELL.com.Prefilters.prefilterControl.toggleButton();},toggleButton:function(){if($CTAButton.css("display")=="inline-block"){$CTAButton.css("display","none");$disabledButton.css("display","inline-block");}else{$CTAButton.css("display","inline-block");$disabledButton.css("display","none");}},getFilterValuesString:function(){var filters=[];$UIfilters.each(function(){if(this.value.length>0){var item=$(this).attr("id")+"="+this.value;filters.push(item);}});var filterString=filters.join("&");filterString=escape(filterString);return filterString;},callSalesCatalog:function(productID,filters){var params={cTemplate:'products/update_prefilters',filters:filters,productid:productID,uiParameters:null}
var successCallback=function(req){var productId=$("#productId",".modalContent").val();var prefiltersContainer=$("#prefiltersModal-"+productId,".modalContent");var returnedFilters=req;if(req.indexOf('=~=')>-1){var firstSplit=req.split('=~=');configuratorLink=firstSplit[0];$CTAButton.attr('href',configuratorLink);returnedFilters=firstSplit[1];}
var jsonFilters=jQuery.parseJSON(returnedFilters);$(jsonFilters).each(function(){var selectEl=$("select#"+this.AttributeId,prefiltersContainer);$(this.Values).each(function(){var option=$("option[value='"+this.AttributeValue+"']",selectEl);option.attr("disabled",this.Disabled);})})}
var failCallback=function(req){window.location.href=$CTALink;return false;}
DELL.com.SalesCat.call("configset",params,successCallback,failCallback);}}
this.onload={initialize:function(){}};DELL.com.Utils.Initialize(this.onload);}).call(DELL.com.Prefilters);})(jQuery);
if (window.console){console.log('ex time: prefilters.js', new Date().getTime() - startTScript);}



/*script:flickr.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Flickr=DELL.com.Flickr||{};(function($){(function(){var self=this;var container=false;var flickrURL="http://api.flickr.com/services/feeds/photos_public.gne?id=31173559@N07&lang=en-us&format=json";var flickrElement=$('div.rssReaderContainer div.flickrReader');var flickrList=$(flickrElement).find('ul');var linktarget=$(flickrElement).find("input[name='linkTarget']").val();var show=$(flickrList).attr("class");var maxWidth="60";var imgArray=new Array();jsonFlickrFeed=function(data){$.each(data.items,function(i,item){if(i==show)return false;var listItem=$("<li/>");var link=$("<a/>").attr({href:item.link,target:linktarget||"_blank"});$("<img/>").attr({src:item.media.m,alt:item.title,target:"_self",className:((i+1)%3==0)?"last":false}).bind("load",self.resizeImage).appendTo(link);$(link).appendTo(listItem);$(listItem).appendTo(flickrList);});$(flickrElement).append($("<a/>").attr({href:data.link,target:"_self",className:"viewMore"}).text("View more"));};self.resizeImage=function(){var ratio;var notLoaded=imgArray.length;$(this).css("display","inline");if(notLoaded>0){if(imgArray[notLoaded-1].width>0){ratio=maxWidth/imgArray[notLoaded-1].width;imgArray[notLoaded-1].width=ratio*imgArray[notLoaded-1].width;imgArray[notLoaded-1].height=ratio*imgArray[notLoaded-1].height;imgArray.pop();}}
if(this.width>0){ratio=maxWidth/this.width;height=this.height;this.width=ratio*this.width;this.height=ratio*height;}else{imgArray.push(this);}};self.getPhotos=function(){$.ajax({url:flickrURL,dataType:"jsonp",jsonpCallback:"self.formatPhotos"});};self.onload={initialize:function(){if(DELL.com.Utils.Context.$PRIMARYCONTAINER.find(".flickrReader").size()>0){self.getPhotos();}}};DELL.com.Utils.Initialize(self.onload);}).call(DELL.com.Flickr)})(jQuery);
if (window.console){console.log('ex time: flickr.js', new Date().getTime() - startTScript);}



/*script:featured_bundles_nav.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.DealsNavigation=DELL.com.DealsNavigation||{};DELL.com.DealsNavigation=function(item){var catid=item.rel;var li=$(item).parents('li');var ul=li.parent();ul.children('li').removeClass('active');var ps=DELL.com.Delphi.PageSettings;var placeHolder=$('#featuredDeals');var url=ps.APIRoot+"SalesCatalog.svc/productdata/html?querytype=CategoryRequest&cTemplate=products/featured_bundles&uiParamaters=customParam1=true&catid=";url+=catid;url+="&c="+ps.lwp.Country;url+="&l="+ps.lwp.Language;url+="&s="+ps.lwp.Segment;url+="&cs="+ps.lwp.CustomerSet;$.ajax({url:url,type:"GET",error:function(req){var errorMsg=DELL.com.Utils.Localize('error_no_content');placeHolder.html(errorMsg);},success:function(req){li.addClass('active');placeHolder.html(req);}});};
if (window.console){console.log('ex time: featured_bundles_nav.js', new Date().getTime() - startTScript);}



/*script:dropdown.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};(function($){DELL.com.Dropdown=function(dropdown){this.initialize(dropdown)};DELL.com.Dropdown.prototype={initialize:function(dropdown){var mainObj=this;dropdown.change(function(){if(this.selectedIndex!=0)
{var destination=$(this).attr("value");var target=$(this).attr("target");mainObj.gotoDestination(destination,target);}});},gotoDestination:function(destination,target){switch(target)
{case"_self":window.location=destination;break;case"_blank":window.open(destination,'_blank');break;default:window.location=destination;break;}}};$(document).ready(function(){$(".dropdown").each(function(){try
{var newDropdown=new DELL.com.Dropdown($(this));}
catch(__errObj)
{}});});})(jQuery);
if (window.console){console.log('ex time: dropdown.js', new Date().getTime() - startTScript);}



/*script:scene7_player.js*/
var startTScript=new Date().getTime ();

var $j=jQuery;var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.Scene7=DELL.com.Utils.Scene7||{};(function($){var Scene7Player=function(__id){this.initialize();}
Scene7Player.prototype={initialize:function(){}};$(document).ready(function(){var context=DELL.com.Utils.Context.$PRIMARYCONTAINER||$("#primaryContent, #franchisePrimaryContent");if(context.size()<=0){return;}
context.find('a.scene7PlayerEmbedLink').click(function(e){e.preventDefault();})
if(context.find('a.scene7PlayerEmbedLink')){var swfPath="";if(document.getElementById("scene7")&&document.getElementById("scene7").getAttribute("href"))
{swfPath=document.getElementById("scene7").getAttribute("href");}
var flashvars={};var parameters={allowscriptaccess:'always',wmode:'transparent',allowfullscreen:'true',src:swfPath};var attributes={id:"productScene7",name:"productScene7"};swfobject.embedSWF(swfPath,"productScene7"," "," ","9.0.0","media_player/expressinstall.swf",flashvars,parameters,attributes);}});})(jQuery);function onScene7ViewerClick(){document.getElementById("ctl00_ctl00_MainBodyPlacerHolder_MainBodyTopPlaceHolder_ProductMicroContentControl1").style.display="none";}
if (window.console){console.log('ex time: scene7_player.js', new Date().getTime() - startTScript);}



/*script:media_player.js*/
var startTScript=new Date().getTime ();

(function($){var MediaPlayer=function(__id){this.initialize();}
MediaPlayer.prototype={initialize:function(){}};$(document).ready(function(){var context=DELL.com.Utils.Context.$PRIMARYCONTAINER||$("#primaryContent, #franchisePrimaryContent");if(context.size()<=0)
return;context.find('a.mediaPlayerEmbedLink').click(function(e){e.preventDefault();if($(this).parent().parent().prev().attr('id')){var movieName=$(this).parent().parent().prev().attr('id');}
else{var movieName=$('.mediaPlayerContainer object').attr('id');}
if(navigator.appName.indexOf("Microsoft")!=-1){window[movieName].openEmbedPanel();}
else{document[movieName].openEmbedPanel();}})
$('.inlinevideo',context).each(function(i){var fr=DELL.com.Delphi.PageSettings.FlashRoot;var v=$(this);var m=v.attr("rel");var oid=v.attr("oid");var wide=v.attr("ws");var b=$(".iv_thumb",v).attr("src");var t=escape($(".iv_title",v).html());var d=$("a",v).attr("href")||"#";var pt=v.attr("pt")||"related";var c=v.attr("css")||fr+"media_player/assets/css/media_player_theme.css";var l=v.attr("lang")||"en";var w
v.attr("width")!=undefined?w=v.attr("width").replace("px",""):w=250;var h
v.attr("height")!=undefined?h=v.attr("height").replace("px",""):h=232;var id=v.attr("id");if(id==null||id.length==0){id="fid_"+Math.floor(Math.random()*10000);v.attr("id",id);}
if(oid!=null&&oid!=""){var swfPath="http://i.dell.com/images/global/ooyala/swf/ooyala_player.swf";var mode="";switch(pt.toUpperCase()){case"FEATURED":mode="normal";break;case"RELATED":mode="rightRail";break;case"INLINE":mode="rightRail";break;case"MAIN":mode="main";break;default:mode="normal";break;}
if(String(wide).toUpperCase()=="YES"){h=(w*.5625);}
var fv={themePath:"images/global/ooyala/swf/theme-about_dell.swf",xmlPath:"images/global/ooyala/xml/playerMasterCopy.xml",mode:mode,playerWidth:w,playerHeight:h,embedCode:oid,autoplay:0,l:l,hostedAtURL:d,enableFullScreen:0};if(String(wide).toUpperCase()=="YES"&&mode!="rightRail"){h=h+44;}
var p={allowscriptaccess:'always',wmode:'transparent',allowfullscreen:'true',src:swfPath,width:w,height:h};var attributes={id:id};}
else{var swfPath=fr+"media_player/delphi_media_player.swf";var p={allowscriptaccess:'always',wmode:'transparent',allowfullscreen:'true',src:swfPath,width:w,height:h,base:fr};var labelResume=DELL.com.Utils.Localize('label_resume')
var labelReplay=DELL.com.Utils.Localize('label_replay')
var labelShare=DELL.com.Utils.Localize('label_share')
var labelEmbed=DELL.com.Utils.Localize('label_embed')
var labelEmbedBtn=DELL.com.Utils.Localize('label_embed_btn')
var labelEmbedBtnPressed=DELL.com.Utils.Localize('label_embed_btn_pressed')
var labelPlayPause=DELL.com.Utils.Localize('label_play_pause')
var labelExpandContract=DELL.com.Utils.Localize('label_expand_contract')
var fv={appWidth:w,media:m,thumb:b,mediaTitle:t,destination:d,languageCode:l,basePath:fr+"media_player/",playerType:pt,CSSFile:c,flashID:id,labelResume:labelResume,labelReplay:labelReplay,labelShare:labelShare,labelEmbed:labelEmbed,labelEmbedBtn:labelEmbedBtn,labelEmbedBtnPressed:labelEmbedBtnPressed,labelPlayPause:labelPlayPause,labelExpandContract:labelExpandContract};var attributes={id:id};}
if(m.indexOf(".wmv")>-1){if(pt=='main'){this.innerHTML='<object id="MediaPlayer" width="'+w+'" height="'+h+'" classid="CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95" standby="Loading�" type="application/x-oleobject" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,7,1112"><param name="AllowChangeDisplaySize" value="true"><param name="autosize" value="false"><param name="filename" value="'+m+'" /><param name="Showcontrols" value="True" /><param name="autoStart" value="True" /><embed type="application/x-mplayer2" autoStart="true" src="'+m+'" name="MediaPlayer" width="'+w+'" height="'+h+'"></embed></object>';}
return;}
if(m.indexOf(".swf")>-1){swfobject.embedSWF(m,id,w,h,"9.0.0",fr+"media_player/expressinstall.swf",fv,{},{});return;}
swfobject.embedSWF(swfPath,id,w,h,"9.0.0",fr+"media_player/expressinstall.swf",fv,p,attributes);})
DELL.com.Utils.ooyalaCallback=function(playerId,eventName,parameters){switch(eventName){case"apiReady":document.getElementById(playerId).loadRatingsApi();break;case"ratingsApiReady":var currentRating=parseInt(document.getElementById(playerId).getCurrentItemAverageRating(),10)/2;var ratingForm=$("#ooyalaRating-"+playerId);ratingForm.data('isOoyala',true);ratingForm.data('canRate',document.getElementById(playerId).getCanRateCurrentItem());ratingForm.data('avgRating',currentRating);DELL.com.Ratings.createRatingStars(ratingForm);break;}}});})(jQuery);
if (window.console){console.log('ex time: media_player.js', new Date().getTime() - startTScript);}



/*script:youtube.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.YouTubeLoader=DELL.com.YouTubeLoader||{};(function($){(function(){var getObject=function(__playerID){return document.getElementById(__playerID);},loadVideoById=function(id,startSeconds,__playerID)
{if(id.indexOf('v=')!=-1)
{var newid=id.split("v=");id=newid[1];}
if(id.indexOf('&')!=-1)
{var newid=id.split("&");id=newid[0];}
var obj=getObject(__playerID);obj.loadVideoById(id,startSeconds);},cueNewVideo=function(id,startSeconds,__playerID)
{var obj=getObject(__playerID);obj.cueVideoById(id,startSeconds);},clearVideo=function(__playerID)
{var obj=getObject(__playerID);obj.clearVideo();},setSize=function(w,h,__playerID)
{var obj=getObject(__playerID);obj.setSize(w,h);},play=function(__playerID)
{var obj=getObject(__playerID);obj.playVideo();},pause=function(__playerID)
{var obj=getObject(__playerID);obj.pauseVideo();},stop=function(__playerID)
{var obj=getObject(__playerID);obj.stopVideo();},seekTo=function(seconds,__playerID)
{var obj=getObject(__playerID);obj.seekTo(seconds,true);},getPlayerState=function(__playerID)
{var obj=getObject(__playerID);return obj.getPlayerState();},getBytesLoaded=function(__playerID)
{var obj=getObject(__playerID);return obj.getVideoBytesLoaded();},getBytesTotal=function(__playerID)
{var obj=getObject(__playerID);return obj.getVideoBytesTotal();},getCurrentTime=function(__playerID)
{var obj=getObject(__playerID);return obj.getCurrentTime();},getDuration=function(__playerID)
{var obj=getObject(__playerID);return obj.getDuration();},getStartBytes=function(__playerID)
{var obj=getObject(__playerID);return obj.getVideoStartBytes();},setVolume=function(newVolume,__playerID)
{var obj=getObject(__playerID);obj.setVolume(newVolume);},getVolume=function(__playerID)
{var obj=getObject(__playerID);return obj.getVolume();},mute=function(__playerID)
{var obj=getObject(__playerID);obj.mute();},unMute=function(__playerID)
{var obj=getObject(__playerID);obj.unMute();},getEmbedCode=function(__playerID)
{var obj=getObject(__playerID);return obj.getVideoEmbedCode();},getVideoUrl=function(__playerID)
{var obj=getObject(__playerID);return obj.getVideoUrl();};this.loadVideoById=loadVideoById;this.cueNewVideo=cueNewVideo;this.clearVideo=clearVideo;this.setSize=setSize;this.play=play;this.pause=pause;this.stop=stop;this.seekTo=seekTo;this.getPlayerState=getPlayerState;this.getBytesLoaded=getBytesLoaded;this.getBytesTotal=getBytesTotal;this.getCurrentTime=getCurrentTime;this.getDuration=getDuration;this.getStartBytes=getStartBytes;this.setVolume=setVolume;this.getVolume=getVolume;this.mute=mute;this.unMute=unMute;this.getEmbedCode=getEmbedCode;this.getVideoUrl=getVideoUrl;}).apply(DELL.com.YouTubeLoader);var youTubeStateChangeFunction;function getYouTubeObject(__playerID)
{return document.getElementById(__playerID);}
function onYouTubePlayerReady(__playerID)
{var obj=getYouTubeObject(__playerID);youTubeStateChangeFunction=function(__newState)
{var obj=getYouTubeObject(__playerID);obj.playerStateUpdateHandler(__newState);}
obj.addEventListener("onStateChange","onYouTubeStateChange");}
function onYouTubeStateChange(__newState)
{youTubeStateChangeFunction(__newState);}})(jQuery);
if (window.console){console.log('ex time: youtube.js', new Date().getTime() - startTScript);}



/*script:temp.js*/
var startTScript=new Date().getTime ();

function menuItem(){}
function menuRef(){}
function menuSep(){}
function editListen(ev)
{kCode=ev.keyCode||ev.which;if(ev.ctrlKey&&ev.shiftKey&&(kCode==69||kCode==5)){if(typeof m_editurl!=='undefined'){if(confirm("edit page?")){m_editurl=m_editurl.replace(/local.dell.com/i,"cmscontent.dell.com");window.open(m_editurl,'editwin');}}}
else if(ev.ctrlKey&&ev.shiftKey&&(kCode==88||kCode==24)){if(typeof m_i_editurl!=='undefined'){if(confirm("View Include Files?")){m_i_editurl=m_i_editurl.replace(/local.dell.com/i,"cmscontent.dell.com");window.open(m_i_editurl,'editwin2');}}}
else if(ev.ctrlKey&&ev.shiftKey){alert(kCode);}}
if (window.console){console.log('ex time: temp.js', new Date().getTime() - startTScript);}



/*script:tabs.js*/
var startTScript=new Date().getTime ();

(function($){$.ui=$.ui||{};$.fn.tabs=function(){var method=typeof arguments[0]=='string'&&arguments[0];var args=method&&Array.prototype.slice.call(arguments,1)||arguments;return method=='length'?$.data(this[0],'tabs').$tabs.length:this.each(function(){if(method){var tabs=$.data(this,'tabs');if(tabs)tabs[method].apply(tabs,args);}else
new $.ui.tabs(this,args[0]||{});});};$.ui.tabs=function(el,options){var self=this;this.options=$.extend({},$.ui.tabs.defaults,options);this.element=el;if(options.selected===null)
this.options.selected=null;this.options.event+='.tabs';$(el).bind('setData.tabs',function(event,key,value){if((/^selected/).test(key))
self.select(value);else{self.options[key]=value;self.tabify();}}).bind('getData.tabs',function(event,key){return self.options[key];});$.data(el,'tabs',this);this.tabify(true);};$.ui.tabs.defaults={selected:0,unselect:false,event:'click',disabled:[],cookie:null,spinner:'Loading&#8230;',cache:false,idPrefix:'ui-tabs-',ajaxOptions:{},fx:null,tabTemplate:'<li><a href="#{href}"><span>#{label}</span></a></li>',panelTemplate:'<div></div>',navClass:'ui-tabs-nav',selectedClass:'ui-tabs-selected',unselectClass:'ui-tabs-unselect',disabledClass:'ui-tabs-disabled',panelClass:'ui-tabs-panel',hideClass:'ui-tabs-hide',loadingClass:'ui-tabs-loading'};$.extend($.ui.tabs.prototype,{tabId:function(a){return a.title&&a.title.replace(/\s/g,'_').replace(/[^A-Za-z0-9\-_:\.]/g,'')||this.options.idPrefix+$.data(a);},ui:function(tab,panel){return{instance:this,options:this.options,tab:tab,panel:panel};},tabify:function(init){this.$lis=$('li:has(a[href]:not(.skip))',this.element);this.$tabs=this.$lis.map(function(){return $('a',this)[0];});this.$panels=$([]);var self=this,o=this.options;this.$tabs.each(function(i,a){if(a.hash&&a.hash.replace('#',''))
self.$panels=self.$panels.add(a.hash);else if($(a).attr('href')!='#'){$.data(a,'href.tabs',a.href);$.data(a,'load.tabs',a.href);var id=self.tabId(a);a.href='#'+id;var $panel=$('#'+id);if(!$panel.length){$panel=$(o.panelTemplate).attr('id',id).addClass(o.panelClass).insertAfter(self.$panels[i-1]||self.element);$panel.data('destroy.tabs',true);}
self.$panels=self.$panels.add($panel);}
else
o.disabled.push(i+1);});if(init){$(this.element).hasClass(o.navClass)||$(this.element).addClass(o.navClass);this.$panels.each(function(){var $this=$(this);$this.hasClass(o.panelClass)||$this.addClass(o.panelClass);});function adjust2lines(container){if(container){var aLI=$('li',container);aLI.each(function(){tabTxt=$(this).html().toLowerCase();if(tabTxt.indexOf('\<br\>')>0){container.addClass('twoLines');return true;}});}}
adjust2lines($(this.element).closest('#campaignTabs'));adjust2lines($(this.element).closest('#campaignTabs12col'));this.$tabs.each(function(i,a){if(location.hash){if(a.hash==location.hash){o.selected=i;scrollTo(0,0);if($.browser.msie||$.browser.opera){setTimeout(function(){$('html, body').attr({scrollTop:$("a[href|="+location.hash+"]").offset().top});},500);}else{$('html, body').attr({scrollTop:$("a[href|="+location.hash+"]").offset().top});}
return false;}}else if(o.cookie){var index=parseInt($.cookie('ui-tabs'+$.data(self.element)),10);if(index&&self.$tabs[index]){o.selected=index;return false;}}else if(self.$lis.eq(i).hasClass(o.selectedClass)){o.selected=i;return false;}});this.$panels.addClass(o.hideClass);this.$lis.removeClass(o.selectedClass);if(o.selected!==null){this.$panels.eq(o.selected).show().removeClass(o.hideClass);this.$lis.eq(o.selected).addClass(o.selectedClass);}
if(this.$tabs[o.selected]!=null){var href=o.selected!==null&&$.data(this.$tabs[o.selected],'load.tabs');if(href)
this.load(o.selected);}
o.disabled=$.unique(o.disabled.concat($.map(this.$lis.filter('.'+o.disabledClass),function(n,i){return self.$lis.index(n);}))).sort();$(window).bind('unload',function(){self.$tabs.unbind('.tabs');self.$lis=self.$tabs=self.$panels=null;});}
for(var i=0,li;li=this.$lis[i];i++)
$(li)[$.inArray(i,o.disabled)!=-1&&!$(li).hasClass(o.selectedClass)?'addClass':'removeClass'](o.disabledClass);if(o.cache===false)
this.$tabs.removeData('cache.tabs');var hideFx,showFx,baseFx={'min-width':0,duration:1},baseDuration='normal';if(o.fx&&o.fx.constructor==Array)
hideFx=o.fx[0]||baseFx,showFx=o.fx[1]||baseFx;else
hideFx=showFx=o.fx||baseFx;var resetCSS={display:'',overflow:'',height:''};if(!$.browser.msie)
resetCSS.opacity='';function hideTab(clicked,$hide,$show){$hide.animate(hideFx,hideFx.duration||baseDuration,function(){$hide.addClass(o.hideClass).css(resetCSS);if($.browser.msie&&hideFx.opacity)
$hide[0].style.filter='';if($show)
showTab(clicked,$show,$hide);});}
function showTab(clicked,$show,$hide){if(showFx===baseFx)
$show.css('display','block');$show.animate(showFx,showFx.duration||baseDuration,function(){$show.removeClass(o.hideClass).css(resetCSS);if($.browser.msie&&showFx.opacity)
$show[0].style.filter='';$(self.element).triggerHandler('tabsshow',[self.ui(clicked,$show[0])],o.show);});}
function switchTab(clicked,$li,$hide,$show){$li.addClass(o.selectedClass).siblings().removeClass(o.selectedClass);hideTab(clicked,$hide,$show);}
this.$tabs.unbind('.tabs').bind(o.event,function(e){var $li=$(this).parents('li:eq(0)'),$hide=self.$panels.filter(':visible'),$show=$(this.hash);if(($li.hasClass(o.selectedClass)&&!o.unselect)||$li.hasClass(o.disabledClass)||$(this).hasClass(o.loadingClass)||$(self.element).triggerHandler('tabsselect',[self.ui(this,$show[0])],o.select)===false){this.blur();return false;}
self.options.selected=self.$tabs.index(this);if(o.unselect){if($li.hasClass(o.selectedClass)){self.options.selected=null;$li.removeClass(o.selectedClass);self.$panels.stop();hideTab(this,$hide);this.blur();return false;}else if(!$hide.length){self.$panels.stop();var a=this;self.load(self.$tabs.index(this),function(){$li.addClass(o.selectedClass).addClass(o.unselectClass);showTab(a,$show);});this.blur();return false;}}
if(o.cookie)
$.cookie('ui-tabs'+$.data(self.element),self.options.selected,o.cookie);self.$panels.stop();if($show.length){var a=this;self.load(self.$tabs.index(this),$hide.length?function(){switchTab(a,$li,$hide,$show);}:function(){$li.addClass(o.selectedClass);showTab(a,$show);});}else
throw'jQuery UI Tabs: Mismatching fragment identifier.';if($.browser.msie)
this.blur();return false;});if(!(/^click/).test(o.event))
this.$tabs.bind('click.tabs',function(){return false;});},add:function(url,label,index){if(index==undefined)
index=this.$tabs.length;var o=this.options;var $li=$(o.tabTemplate.replace(/#\{href\}/,url).replace(/#\{label\}/,label));$li.data('destroy.tabs',true);var id=url.indexOf('#')==0?url.replace('#',''):this.tabId($('a:first-child',$li)[0]);var $panel=$('#'+id);if(!$panel.length){$panel=$(o.panelTemplate).attr('id',id).addClass(o.panelClass).addClass(o.hideClass);$panel.data('destroy.tabs',true);}
if(index>=this.$lis.length){$li.appendTo(this.element);$panel.appendTo(this.element.parentNode);}else{$li.insertBefore(this.$lis[index]);$panel.insertBefore(this.$panels[index]);}
o.disabled=$.map(o.disabled,function(n,i){return n>=index?++n:n});this.tabify();if(this.$tabs.length==1){$li.addClass(o.selectedClass);$panel.removeClass(o.hideClass);var href=$.data(this.$tabs[0],'load.tabs');if(href)
this.load(index,href);}
$(this.element).triggerHandler('tabsadd',[this.ui(this.$tabs[index],this.$panels[index])],o.add);},remove:function(index){var o=this.options,$li=this.$lis.eq(index).remove(),$panel=this.$panels.eq(index).remove();if($li.hasClass(o.selectedClass)&&this.$tabs.length>1)
this.select(index+(index+1<this.$tabs.length?1:-1));o.disabled=$.map($.grep(o.disabled,function(n,i){return n!=index;}),function(n,i){return n>=index?--n:n});this.tabify();$(this.element).triggerHandler('tabsremove',[this.ui($li.find('a')[0],$panel[0])],o.remove);},enable:function(index){var o=this.options;if($.inArray(index,o.disabled)==-1)
return;var $li=this.$lis.eq(index).removeClass(o.disabledClass);if($.browser.safari){$li.css('display','inline-block');setTimeout(function(){$li.css('display','block');},0);}
o.disabled=$.grep(o.disabled,function(n,i){return n!=index;});$(this.element).triggerHandler('tabsenable',[this.ui(this.$tabs[index],this.$panels[index])],o.enable);},disable:function(index){var self=this,o=this.options;if(index!=o.selected){this.$lis.eq(index).addClass(o.disabledClass);o.disabled.push(index);o.disabled.sort();$(this.element).triggerHandler('tabsdisable',[this.ui(this.$tabs[index],this.$panels[index])],o.disable);}},select:function(index){if(typeof index=='string')
index=this.$tabs.index(this.$tabs.filter('[href$='+index+']')[0]);this.$tabs.eq(index).trigger(this.options.event);},load:function(index,callback){var self=this,o=this.options,$a=this.$tabs.eq(index),a=$a[0],bypassCache=callback==undefined||callback===false,url=$a.data('load.tabs');callback=callback||function(){};if(!url||($.data(a,'cache.tabs')&&!bypassCache)){callback();return;}
if(o.spinner){var $span=$('span',a);$span.data('label.tabs',$span.html()).html('<em>'+o.spinner+'</em>');}
var finish=function(){self.$tabs.filter('.'+o.loadingClass).each(function(){$(this).removeClass(o.loadingClass);if(o.spinner){var $span=$('span',this);$span.html($span.data('label.tabs')).removeData('label.tabs');}});self.xhr=null;};var ajaxOptions=$.extend({},o.ajaxOptions,{url:url,success:function(r,s){$(a.hash).html(r);finish();callback();if(o.cache)
$.data(a,'cache.tabs',true);$(self.element).triggerHandler('tabsload',[self.ui(self.$tabs[index],self.$panels[index])],o.load);o.ajaxOptions.success&&o.ajaxOptions.success(r,s);}});if(this.xhr){this.xhr.abort();finish();}
$a.addClass(o.loadingClass);setTimeout(function(){self.xhr=$.ajax(ajaxOptions);},0);},url:function(index,url){this.$tabs.eq(index).removeData('cache.tabs').data('load.tabs',url);},destroy:function(){var o=this.options;$(this.element).unbind('.tabs').removeClass(o.navClass).removeData('tabs');this.$tabs.each(function(){var href=$.data(this,'href.tabs');if(href)
this.href=href;var $this=$(this).unbind('.tabs');$.each(['href','load','cache'],function(i,prefix){$this.removeData(prefix+'.tabs');});});this.$lis.add(this.$panels).each(function(){if($.data(this,'destroy.tabs'))
$(this).remove();else
$(this).removeClass([o.selectedClass,o.unselectClass,o.disabledClass,o.panelClass,o.hideClass].join(' '));});}});})(jQuery);
if (window.console){console.log('ex time: tabs.js', new Date().getTime() - startTScript);}



/*script:opinion_labs.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};(function($){DELL.com.opinionLabs=function(_id){this.custom_var='';this._sp='%3A\\/\\/';this._rp='%3A//';this._poX=0.0;this._sH=$(window).height();this._ht=escape(self.location.href);this._hr=document.referrer;this._tm=(new Date()).getTime();this._kp=0;this._sW=$(window).width();this.tleaf_cv='';this.initialize();}
DELL.com.opinionLabs.prototype={initialize:function(){this.bindEvents(this);},bindEvents:function(_mainObj){$(".oplabs").click(function(){_mainObj.doOpionlabs();_mainObj.O_LC();});$(window).unload(function(){_mainObj._fPx;});},_fC:function(_u){_aT=this._sp+',\\/,\\.,-,_,'+this._rp+',%2F,%2E,%2D,%5F';_aA=_aT.split(',');for(i=0;i<5;i++){eval('_u=_u.replace(/'+_aA[i]+'/g,_aA[i+5])')}
return _u},_fK:function(_e){if(!_e)
_e=window.event;var _k=(typeof _e.which=='number')?_e.which:_e.keyCode;if((this._kp==15&&_k==12))
window.open('https://secure.opinionlab.com/pageviewer/pv_controlboard.html?url='+this._fC(this._ht),'PageViewer','height=529,width=705,screenX='+((this._sW-705)/2)+',screenY='+((this._sH-529)/2)+',top='+((this._sH-529)/2)+',left='+((this._sW-705)/2)+',status=yes,toolbar=no,menubar=no,location=no,resizable=yes');this._kp=_k},_fPx:function(){if(Math.random()>=1.0-_poX)
this.O_LC()},O_LC:function(){this.tleaf_cv=escape(escape(this.getCookie('s_vi')));if(this.tleaf_cv!='')
this.tleaf_cv=this.tleaf_cv+"|";var opURL=DELL.com.Utils.Localize('opinion_lab_comment_card_url');if(opURL!=''&&opURL!='opinion_lab_comment_card_url')
window.open(opURL+'?time1='+this._tm+'&time2='+(new Date()).getTime()+'&prev='+this._fC(escape(this._hr))+'&referer='+this._fC(this._ht)+'&height='+this._sH+'&width='+this._sW+'&custom_var='+this.tleaf_cv+this.custom_var,'comments','width=535,height=192,screenX='+((this._sW-535)/2)+',screenY='+((this._sH-192)/2)+',top='+((this._sH-192)/2)+',left='+((this._sW-535)/2)+',resizable=yes,copyhistory=yes,scrollbars=no')},doOpionlabs:function(){var metricPath=DELL.com.Delphi.PageSettings.mi.PageKey;var pageSeg=DELL.com.Delphi.PageSettings.lwp.Segment;var pageLang=DELL.com.Delphi.PageSettings.lwp.Language;var pageCnty=DELL.com.Delphi.PageSettings.lwp.Country;var _lG=pageLang+"-"+pageCnty+".";if(pageLang=="en"){_lG="";}
var ssid=this.getCookie("SITESERVER");if(ssid!=null&&ssid.length>3){ssid=ssid.substring(3);}
this.custom_var=ssid+"|"+metricPath+"|"+pageSeg;this._rp='%3A//'+_lG;},getCookie:function(NameOfCookie){if(document.cookie.length>0){begin=document.cookie.indexOf(NameOfCookie+"=");if(begin!=-1){begin+=NameOfCookie.length+1;end=document.cookie.indexOf(";",begin);if(end==-1){end=document.cookie.length;}
return unescape(document.cookie.substring(begin,end));}}
return"";}}
$(document).ready(function(){new DELL.com.opinionLabs();});})(jQuery);
if (window.console){console.log('ex time: opinion_labs.js', new Date().getTime() - startTScript);}



/*script:flash.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.Flash=DELL.com.Utils.Flash||{};(function($){(function(){this.resizeFlash=function(w,h,id){var flash=document.getElementById(id);if(flash===null){flash=document.getElementByName(id);}
if(!isNaN(w)){flash.width=w;}
if(!isNaN(h)){flash.height=h;}
return id;},this.renderFlash=function(context){if(context.size()<=0)
return;$('.inlineflash',context).each(function(i){var lwp=DELL.com.Delphi.PageSettings.lwp;var fr=DELL.com.Delphi.PageSettings.FlashRoot;var f=$(this);var fuid=f.attr("fuid");if(fuid==null||fuid.length==0){fuid="fuid_"+Math.floor(Math.random()*10000);f.attr("id",fuid);}
var fa=f.attr("fa");var fpv=f.attr("fpv");if(fpv==null||fpv.length==0){fpv="9.0.0";}
var url=f.attr("rel");var fw=f.attr("fwidth");var fh=f.attr("fheight");var fasa=f.attr("fasa");var fplay=f.attr("fplay");var fmenu=f.attr("fmenu");var fscale=f.attr("fscale");var fdf=f.attr("fdf");var fwm=f.attr("fwm");var fslc=f.attr("fslc");var floop=f.attr("floop");var fq=f.attr("fq");var fsa=f.attr("fsa");var fbgc=f.attr("fbgc");if(fbgc==null||fbgc.length==0){fbgc="#FFFFFF";}
var fst=f.attr("fst");var fafs=f.attr("fafs");var fan=f.attr("fan");var p={allowscriptaccess:fasa,play:fplay,menu:fmenu,scale:fscale,devicefont:fdf,wmode:fwm,swliveconnect:fslc,loop:floop,quality:fq,salign:fsa,bgcolor:fbgc,seamlesstabbing:fst,allowfullscreen:fafs,allownetworking:fan};var vars="var fv = {country:\""+lwp.Country+"\",language:\""+lwp.Language+"\",customerset:\""+lwp.CustomerSet+"\",segment:\""+lwp.Segment+"\",r:\"us\",containerURL:\""+document.location.href+"\"";var fvar=f.attr("fvar");if(fvar!=null&&fvar.length>0){var fvars=fvar.split("&");for(var i=0;i<fvars.length;i++){var parts=fvars[i].toString().split("=");if(parts[0]!=null&&parts[0].length>0)
vars+=","+parts[0]+":\""+parts[1]+"\"";}}
vars+="}";eval(vars);var attributes={id:fuid};swfobject.embedSWF(url,fuid,fw,fh,fpv,fr+"media_player/expressinstall.swf",fv,p,attributes);});}}).call(DELL.com.Utils.Flash);$(document).ready(function(){var context=DELL.com.Utils.Context.$PRIMARYCONTAINER||$("#primaryContent, #franchisePrimaryContent");DELL.com.Utils.Flash.renderFlash(context);});})(jQuery);
if (window.console){console.log('ex time: flash.js', new Date().getTime() - startTScript);}



/*script:rating_stars.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Ratings=DELL.com.Ratings||{};(function($){(function(){var undefined;DELL.com.Utils.Initialize({initialize:function(){var context=DELL.com.Utils.Context.$PRIMARYCONTAINER||$("#primaryContent, #franchisePrimaryContent");if(context.size()<=0)
return;var ratingForms=$('.ratingsForm',context).not('[id^=ooyalaRating]');ratingForms.each(function(){DELL.com.Ratings.createRatingStars($(this));});}})
DELL.com.Ratings.createRatingStars=function(form){var $form=$(form);var isArticle=($form.closest("ul.articleUserTools").length>0);var isOoyala=form.data('isOoyala');var avgRating=0;if(isOoyala){avgRating=Math.round(form.data('avgRating'))}else{avgRating=($form.find(".fullStar").length)+($form.find(".halfStar").length*0.5)};var canRate=(isOoyala)?form.data('canRate'):true;var emptyStarClass='emptyStar';var activeStarClass=(isArticle)?'fullStar':'activeStar';var halfStarClass=(isArticle)?'halfStar':'emptyStar';var modifier=$form.find('.field:first').index();$form.bind('setReadOnly',function(){$(this).find('label').css('cursor','default').end().find('.field').unbind();}).bind('setAverage',function(){$(this).find('.field').each(function(){if(($(this).index()-modifier)<avgRating)$(this).trigger('shine');else if(avgRating-($(this).index()-modifier)==0.5)$(this).trigger('shineHalf');else $(this).trigger('off');})}).find('.field').bind('shine',function(){$(this).removeClass(emptyStarClass).removeClass(halfStarClass).addClass(activeStarClass);}).bind('shineHalf',function(){$(this).removeClass(emptyStarClass).removeClass(activeStarClass).addClass(halfStarClass);}).bind('off',function(){$(this).removeClass(activeStarClass).removeClass(halfStarClass).addClass(emptyStarClass);}).each(function(){var $this=$(this),value=$this.find('input').val(),elementsArray={activate:$($this),deactivate:jQuery()};$this.hover(function(){$form.find('.field:lt('+($(this).index()-modifier)+')').trigger('shine');$(this).trigger('shine');$form.find('.field:gt('+($(this).index()-modifier)+')').trigger('off');},function(){$form.trigger('setAverage');});}).find('input').bind('click change',function(e){if($form.data('submitted')===true)return false;if(!isOoyala)$form.submit();else{var rated=e.target.value;var playerId=$form.attr('id').replace('ooyalaRating-','');document.getElementById(playerId).incrementCurrentItemRating(rated*2);}
$form.data('submitted',true).trigger('setReadOnly');}).focus(function(){$(this).parent('.field').mouseover();}).blur(function(){$(this).parent('.field').mouseout();}).end().end().trigger('setAverage').submit(function(){$form.siblings(".rateSubmission").load(function(){$form.find('.field input').attr('disabled',true);});return true;});}}).call(DELL.com.Ratings)})(jQuery);
if (window.console){console.log('ex time: rating_stars.js', new Date().getTime() - startTScript);}



/*script:metrics.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.Metrics=DELL.com.Utils.Metrics||{};(function($){(function(){this.initOM=function(){adTrackImpressions();var mi=DELL.com.Delphi.PageSettings.mi;$("head").append('<META NAME="METRICSPATH" CONTENT="&eiwatch='+mi.PageKey+'" />');s_dell.pageName=mi.PageKey;s_dell.hier1=mi.CategoryPath;s_dell.prop1=mi.PageType;var context=$("#primaryContent, #franchisePrimaryContent, #navContent"),$tabCollection=context.find('.ui-tabs-nav-container > ul');if(location.hash!=""&&location.hash!="#"&&$tabCollection.size()>0){var tabMetricsID=location.hash.replace(/^#/,'');if(tabMetricsID=="RatingsAndReviews"){DELL.com.Utils.Metrics.setRatingsTabMetrics(tabMetricsID);}}
s_dell.t();s_dell.events="";s_dell.eVar38="";adTrackClickThroughs();}
this.onModalOpened=function(targetID){if(DELL.com.Delphi.PageSettings.ModalMi!=undefined&&DELL.com.Delphi.PageSettings.ModalMi!=null){if(DELL.com.Delphi.PageSettings.SavedMi==undefined||DELL.com.Delphi.PageSettings.SavedMi==null){DELL.com.Delphi.PageSettings.SavedMi=DELL.com.Delphi.PageSettings.mi;}
s_dell.manageVars("clearVars");DELL.com.Delphi.PageSettings.mi=DELL.com.Delphi.PageSettings.ModalMi;this.initOM();}else{if(DELL.com.Delphi.PageSettings.SavedMi==undefined||DELL.com.Delphi.PageSettings.SavedMi==null){DELL.com.Delphi.PageSettings.SavedMi=DELL.com.Delphi.PageSettings.mi;}
s_dell.manageVars("clearVars");DELL.com.Delphi.PageSettings.mi.PageKey=DELL.com.Delphi.PageSettings.mi.PageKey+"modal-"+targetID;this.initOM();}}
this.onModalClosed=function(){if(DELL.com.Delphi.PageSettings.SavedMi!=undefined&&DELL.com.Delphi.PageSettings.SavedMi!=null){s_dell.manageVars("clearVars");DELL.com.Delphi.PageSettings.mi=DELL.com.Delphi.PageSettings.SavedMi;this.initOM();}}
this.logAnavMetrics=function(navCaption,navOption){s_dell.eVar30=navOption;s_dell.eVar31=navCaption;s_dell.linkTrackVars='eVar30,eVar31';s_dell.t();}
this.logTabMetrics=function(id){if(id=="RatingsAndReviews"){this.setRatingsTabMetrics(id);}
s_dell.prop13=s_dell.pageName+"[tab='"+id+"']";s_dell.pageName="";void(s_dell.t());s_dell.events="";s_dell.eVar38="";}
this.setRatingsTabMetrics=function(id){s_dell.events="event3"
s_dell.eVar38="viewed customer ratings";s_dell.prop13=s_dell.pageName+"[tab='"+id+"']";}
this.trackAddToCartMetrics=function(products){if(s_dell==null||s_dell==undefined){return;}
if(products==null||products==undefined){return;}
s_dell.linkTrackVars="products,events";s_dell.linkTrackEvents="scAdd";s_dell.products=products;s_dell.events='scAdd';s_dell.tl(this,'o','AddToCart');}}).call(DELL.com.Utils.Metrics);$(document).ready(function(){DELL.com.Utils.Metrics.initOM();});})(jQuery);
if (window.console){console.log('ex time: metrics.js', new Date().getTime() - startTScript);}



/*script:init.js*/
var startTScript=new Date().getTime ();

var $j=jQuery;var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Init=DELL.com.Init||{};(function($j){(function(){var onload={initClearFocus:function(){$('.searchField').each(function(){var $this=$(this),title=$this.attr('title')&&$this.attr('value'),clearInput='';$this.focus(function(){if($this.val()==title){clearInput=$this.val();$this.val('');}})
$this.blur(function(){if($this.val()==''){$this.val(clearInput);}});})},initTabs:function(){var context=$("#primaryContent, #franchisePrimaryContent, #navContent"),$tabCollection=context.find('.ui-tabs-nav-container > ul');if($tabCollection.size()<=0)
return;$tabCollection.tabs().bind('tabsshow',function(event,ui){var myTracer=context.find('ul').parent().parent().parent().find('div.butterflyTron');if(myTracer!==null){DELL.com.ProductBanner.resetBanners();}
var content=ui.tab,tabLink=$(ui.tab),metricsID=tabLink.attr('href').replace(/^#/,'');$(content).focus();DELL.com.Utils.Metrics.logTabMetrics(metricsID);});$tabCollection.find('div').each(function(){var $this=$(this),link=$this.find('a');$this.click(function(e){if(e.target.nodeName=="A"){e.stopImmediatePropagation();return;}
link.click();});});},writeHmcTabsTitle:function(){var $hmcTabs=$('.hmcTabs');var tab1Title=$('#hmcTab1Title',$hmcTabs).text();var tab2Title=$('#hmcTab2Title',$hmcTabs).text();var tab3Title=$('#hmcTab3Title',$hmcTabs).text();var tab4Title=$('#hmcTab4Title',$hmcTabs).text();var tab5Title=$('#hmcTab5Title',$hmcTabs).text();if(tab1Title){$('.ui-tabs-nav li a[id="hmcTab1-anchor"]',$hmcTabs).html('<span>'+tab1Title+'</span>');$("#hmcTab1 .hmcInlineContent table tr:gt(0)").mouseover(function(){$(this).css("background-color","#EAF5FF");});$("#hmcTab1 .hmcInlineContent table tr:gt(0)").mouseout(function(){$(this).css("background-color","#FFFFFF");});}
if(tab2Title){$('.ui-tabs-nav li a[id="hmcTab2-anchor"]',$hmcTabs).html('<span>'+tab2Title+'</span>');$("#hmcTab2 .hmcInlineContent table tr:gt(0)").mouseover(function(){$(this).css("background-color","#EAF5FF");});$("#hmcTab2 .hmcInlineContent table tr:gt(0)").mouseout(function(){$(this).css("background-color","#FFFFFF");});}
if(tab3Title){$('.ui-tabs-nav li a[id="hmcTab3-anchor"]',$hmcTabs).html('<span>'+tab3Title+'</span>');$("#hmcTab3 .hmcInlineContent table tr:gt(0)").mouseover(function(){$(this).css("background-color","#EAF5FF");});$("#hmcTab3 .hmcInlineContent table tr:gt(0)").mouseout(function(){$(this).css("background-color","#FFFFFF");});}
if(tab4Title){$('.ui-tabs-nav li a[id="hmcTab4-anchor"]',$hmcTabs).html('<span>'+tab4Title+'</span>');$("#hmcTab4 .hmcInlineContent table tr:gt(0)").mouseover(function(){$(this).css("background-color","#EAF5FF");});$("#hmcTab4 .hmcInlineContent table tr:gt(0)").mouseout(function(){$(this).css("background-color","#FFFFFF");});}
if(tab5Title){$('.ui-tabs-nav li a[id="hmcTab5-anchor"]',$hmcTabs).html('<span>'+tab5Title+'</span>');$("#hmcTab5 .hmcInlineContent table tr:gt(0)").mouseover(function(){$(this).css("background-color","#EAF5FF");});$("#hmcTab5 .hmcInlineContent table tr:gt(0)").mouseout(function(){$(this).css("background-color","#FFFFFF");});}},toggleSpecs:function(){var $configOptions=$(".configToggle > select");if($configOptions.length>0){$configOptions.bind("change",function(e){var placeHolder=$('.specsContainer');if(window.specsContainer==null){window.specsContainer=placeHolder.html();}
if(this.selectedIndex==0){placeHolder.html(window.specsContainer);return;}
var ps=DELL.com.Delphi.PageSettings,url=ps.APIRoot+"SalesCatalog.svc/productdata/html?querytype=ProductTechSpecs&"
+"cTemplate=products/tech_specs_offers&uiParamaters=ajax=true&productitem=";url+=this.value;url+="&c="+ps.lwp.Country;url+="&l="+ps.lwp.Language;url+="&s="+ps.lwp.Segment;url+="&cs="+ps.lwp.CustomerSet;$.ajax({url:url,type:"GET",success:function(req){var stuff=$(req).find('.specsContainer');if(stuff.length>0){placeHolder.replaceWith(stuff);DELL.com.Utils.AutoModal.init();}}});});}},initLinks:function(){var context=DELL.com.Utils.Context.$PRIMARYCONTAINER||$("#primaryContent, #franchisePrimaryContent");$(".cobrowse a").live("click",function(e){e.preventDefault();var $this=$(this);if(DELL.com.Utils.GetURLParamVal($this.attr("href"),"ep")==""){$this.attr("href",($this.attr("href")+escape(top.location.href)))}
if(DELL.com.Utils.GetURLParamVal($this.attr("href"),"cs")==""){try{var sLWP="&"+s_dell.getLWPvariables();$this.attr("href",($this.attr("href")+sLWP))}catch(e){}}
var ph=DELL.com.Utils.GetURLParamVal($this.attr("href"),"popupHeight")||"755";var pw=DELL.com.Utils.GetURLParamVal($this.attr("href"),"popupWidth")||"635";window.open($this.attr("href"),"LiveLOOK_Co_Browsing","toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,titlebar=0,status=0,width="+pw+",height="+ph+",left="+((screen.width-parseInt(pw))/2)+",top="+((screen.height-parseInt(ph))/2));});$("a[name='mailtoLinkType']").unbind("click").bind("click",function(e){e.preventDefault();var emailSubject=$("span[id='emailSubjectText']").text();var emailBody=$("h2[id='mastheadPageCategory']").text()+' '+$("h3[id='mastheadPageTitle']").text();if(emailBody===" ")
emailBody=self.document.title;var plang=DELL.com.Delphi.PageSettings.lwp.Language;if(plang=="ja"||plang=="zh"||plang=="ko")
self.location.href='mailto:?body='+encodeURIComponent(self.location.href);else
self.location.href='mailto:?body='+encodeURIComponent(emailBody)+'  '+encodeURIComponent(self.location.href)+'&subject='+encodeURI(emailSubject);});if($("#productStack").length>0){$("#productStack a[class='closerLook'], .heroContent a[class='closerLook']").unbind("click").bind("click",function(e){e.preventDefault();window.open($(this).attr("href"),"closerlook","WIDTH=1050,HEIGHT=700,RESIZABLE=YES,SCROLLBARS=YES,TOOLBAR=YES,LEFT=0,TOP=20","");});}
$(".pageTools a[name='printLinkType'], .articleUserTools a[name='printLinkType'], #compareSpecsHeader a[name='printLinkType']").unbind("click").bind("click",function(e){e.preventDefault();if(window.print())
window.print();});$(".promoPopup").unbind("click").bind("click",function(e){e.preventDefault();window.open($(this).attr("href"),"promo","WIDTH=600,HEIGHT=400,RESIZABLE=YES,SCROLLBARS=YES,TOOLBAR=YES,LEFT=0,TOP=20","");});DELL.com.Utils.AutoModal.init();$("a[id='leadgenbanner']").unbind("click").bind("click",function(e){e.preventDefault();var ps=DELL.com.Delphi.PageSettings;var csguid='';var siteserver=DELL.com.Utils.getCookie("SITESERVER");if(siteserver.length>0){siteserver=siteserver.split("=");csguid=siteserver[1];}
var leadgenURL=$(this).attr("href")+"&c="+ps.lwp.Country+"&l="+ps.lwp.Language+"&s="+ps.lwp.Segment+"&cs="+ps.lwp.CustomerSet+"&s_vi="+DELL.com.Utils.getCookie("s_vi")+"&csguid="+csguid+"&refr="+encodeURIComponent(location.href);window.open(leadgenURL,"leadgen","WIDTH=1030,HEIGHT=700,RESIZABLE=YES,SCROLLBARS=YES,TOOLBAR=YES,LEFT=0,TOP=20","");});if(context.size()<=0)
return;var page=DELL.com.Utils.GetURLParamVal(document.URL,"3x_page");if(page==""){DELL.com.Utils.deleteCookie(DELL.com.Delphi.PageSettings.lwp.Segment+"compare","/",null);}
var compare=({inactiveButton:function(){this.buttons.addClass(this.buttonClasses.inactive).removeClass(this.buttonClasses.active);if(this.links)
this.links.addClass(this.linkClasses.inactive).removeClass(this.linkClasses.active);},activeButton:function(){this.buttons.addClass(this.buttonClasses.active).removeClass(this.buttonClasses.inactive);if(this.links)
this.links.addClass(this.linkClasses.active).removeClass(this.linkClasses.inactive);},updateButtonText:function(){var self=this;this.buttons.find('span strong').each(function(){var span=$(this).find('span');if(span.length<1){$(this).append('<span>('+self.checked()+')</span>');}else{span.text('('+self.checked()+')');}});},checked:function(){return this.storedChecked;},setURL:function(url){this.buttons.attr('href',url);if(this.links)
this.links.attr('href',url);},onload:function(storedChecked){var self=this;self.storedChecked=storedChecked,self.cp=$('div.compareProduct'),self.buttons=$('.compareButton a.btn'),self.buttonText=$('.compareButton a.btn:first span strong').text(),self.buttonClasses={'active':'primaryNav','inactive':'inactiveNav'},self.links=$('a.lnkCompareSelected'),self.linkClasses={'active':'primaryNav','inactive':'inactiveNav'};if(self.checked()<=1){self.inactiveButton();}else{self.activeButton();}
self.updateButtonText();self.buttons.unbind().die().bind('click',function(e){if(self.checked()<=1){e.stopPropagation();return false;}});self.links.unbind().die().bind('click',function(e){if(self.checked()<=1){e.stopPropagation();return false;}});}});var $cp=context.find('.compareProduct');if($cp.length>0){var $clnkSelected=$cp.find('.hidden');var $clnk=$cp.find('span').not('.hidden');var returnURL="&returnURL="+encodeURIComponent(location.href);var compareCookie=(DELL.com.Utils.getCookie(DELL.com.Delphi.PageSettings.lwp.Segment+"compare")!="")?DELL.com.Utils.getCookie(DELL.com.Delphi.PageSettings.lwp.Segment+"compare").split(","):null;var cParams=DELL.com.Utils.Initialize.compareParams||compareCookie||new Array;compare.onload(cParams.length);$cp.each(function(index){var $inp=$('input[type=checkbox]',this),query=location.href.substring(0,location.href.indexOf("/p/"))+"/p/"+$inp.attr('value')+"=";compare.setURL(query+cParams+returnURL);if(cParams.length>1&&cParams.toString().indexOf($inp.attr("name"))>-1)
{$clnkSelected.eq(index).wrap('<a href="'+query+cParams+returnURL+'" ></a>');$clnk.eq(index).addClass('hidden');$clnkSelected.eq(index).removeClass('hidden');compare.activeButton();}
if(cParams.length==0)
$inp.attr("checked",false)
if($.inArray($inp.attr("name"),cParams)!=-1)
$inp.attr("checked",true)
$inp.unbind().bind("click",function(){if($inp.attr("checked")){cParams.push($inp.attr("name"));}else{cParams=$.grep(cParams,function(value){return value!=$inp.attr("name");});}
compare.storedChecked=cParams.length;if(cParams.length>1){$(".compareProduct input:checkbox[checked]").siblings("a").find("span").unwrap();var $displayWhenChecked=$(".compareProduct input:checkbox[checked]").siblings(".textCompareSelected");$displayWhenChecked.wrap('<a href="'+query+cParams+returnURL+'" ></a>');compare.setURL(query+cParams+returnURL);$(".compareProduct input:checkbox[checked]").siblings(".textCompare").attr("class","textCompare hidden");$(".compareProduct input:checkbox").not("[checked]").siblings("a").find("span").unwrap();$(".compareProduct input:checkbox").not("[checked]").siblings(".textCompareSelected").attr("class","textCompareSelected hidden");$(".compareProduct input:checkbox").not("[checked]").siblings(".textCompare").attr("class","textCompare");$displayWhenChecked.attr("class","textCompareSelected");compare.activeButton();}else if(cParams.length<=1){$(".compareProduct a").find("span").unwrap();$(".compareProduct .textCompareSelected").attr("class","textCompareSelected hidden");$(".compareProduct .textCompare").attr("class","textCompare");compare.inactiveButton();}
if(cParams.length>=1){DELL.com.Utils.setCookie(DELL.com.Delphi.PageSettings.lwp.Segment+"compare",cParams,null,"/",null,null);}else{DELL.com.Utils.deleteCookie(DELL.com.Delphi.PageSettings.lwp.Segment+"compare","/",null);}
compare.updateButtonText();DELL.com.Utils.Initialize.compareParams=cParams;});});compare.updateButtonText();}
$(".logout a").unbind("click").bind("click",function(e){e.preventDefault();maLinkLogout();});$("#availableFranchiseIce .infoCol").each(function(){var $this=$(this);var params={ids:$this.attr("id"),idtype:"ORDERCODE",targetId:$this.attr("id"),cTemplate:"products/productStack/customer_rec",uiParameters:escape("&=gr:~g:~rk:")}
if($this.attr("id")!=null)
DELL.com.SalesCat.call("carousel",params);});},initStormMH:function(){if(DELL.com.Delphi.PageSettings.theme.indexOf("della")==-1&&$("#dellLogo").length==0){if(typeof(m_IsAuthPremier)!="undefined"){if(m_IsAuthPremier){var capOffset=$("#flyouttoolboxlink").offset();var tb_posDiff=($(".fotoolboxbodymin").width())-($("#flyouttoolboxlink").outerWidth());var tb_finalLeft=capOffset.left-tb_posDiff;var tb_finalTop=capOffset.top+$(".toolboxcaption").outerHeight();$("#flyouttoolboxbody").css({'top':tb_finalTop+'px','left':tb_finalLeft+'px'});}}}
var options={matchSubset:false,selectFirst:false,scrollHeight:200,width:200};$(".mastheadcontainer #searchinput").autocomplete("/ac/ac.aspx",options).result(function(){if($(".mastheadcontainer input[name='ref']").length==0)
$(".mastheadcontainer form[name='search']").append("<input type='hidden' name='ref' value='ac'/>");});},initRadian6:function(){if($(".radian6Widget").length>0){$.getScript("http://labs.radian6.com/js/favorites/faveswidget.js",function(){$(".radian6Widget").each(function(){FavesWidget.create({id:$(this).children("input[name=radian6ID]").val(),max_items:$(this).children("input[name=radian6MaxFeeds]").val(),title:" ",theme:"ngen"},$(this));});});}},initCNETRatings:function(){$(".CNETrating").each(function(){var ps=DELL.com.Delphi.PageSettings;var locale=ps.lwp.Language+"_"+ps.lwp.Country.toUpperCase();var pn=$(this).find("#CNETProdId").val();var locationId=$(this).attr("id");var layout=$(this).find("#CNETLayout").val();var src="http://logo.cnetcontentsolutions.com/hook/?style=1&mf=Dell&h=735b90b4";src+="&locationId="+locationId;src+="&layout="+layout;src+="&locale="+locale;src+="&pn="+pn;$.getScript(src);});},initCNETReviews:function(){$(".CNETReview").each(function(){var targetId=$(this).attr("id");if(targetId!=null){var url="http://api.cnet.com/restApi/v1.0/techReview?contentId=6545983&contentType=coco&contributorType=author&start=0&limit=10&part=dell-cnet&editionId=4615&viewType=json&productId="+targetId;$.ajax({url:url,dataType:"jsonp",type:"GET",error:function(){$("#"+targetId+".CNETReview").html("&nbsp;");},success:function(req){try{$("#"+targetId+".CNETReview").html(req.CNETResponse.TechReview.Pages.Page.Body.$);}catch(e){$("#"+targetId+".CNETReview").html("&nbsp;");}}});}});},languageLink:function(){var language_link=$(".mastheadToolWorld > a[href^='?l']")
if(window.location.search==''||language_link.attr('href')==null)return;var language_href=language_link.attr('href');var final_url=DELL.com.Utils.ChangeURLParams(window.location.href,'l',language_href);language_link.attr('href',final_url);},ptronBannerHeight:function(){if($("#ptron").length>0){var ptronSmallBanner=$("#ptron .promoBanners img");if(ptronSmallBanner.height()<127){$("#ptron .promoBanners li").addClass("smallBanner");}}},jiathis:function(){if($(".jiathis").length>0){$.getScript("http://v2.jiathis.com/code/jia.js");}}};this.InitLinks=onload.initLinks;DELL.com.Utils.Initialize(onload);}).call(DELL.com.Init);})(jQuery);
if (window.console){console.log('ex time: init.js', new Date().getTime() - startTScript);}



/*script:iperceptions.js*/
var startTScript=new Date().getTime ();

var IPerceptions=window.IPerceptions||{};IPerceptions.Survey=IPerceptions.Survey||{};(function($){(function(){var surveyInit=function(params){var delphiLWP=DELL.com.Delphi.PageSettings.lwp;var invRate=params.surveyRate||35;var surveyJS=params.surveyJS;var strURL=document.URL;var department="";var randomNumber=Math.floor((Math.random()*100));if(randomNumber<invRate){loadIPScript(surveyJS);}},loadIPScript=function(path){$.getScript(path);},onload={initialize:function(){$(".ipSurvey:first").each(function(){surveyInit({"surveyRate":$(this).children("#surveyRate").val(),"surveyJS":$(this).children("#surveyJS").val()});});}};DELL.com.Utils.Initialize(onload);}).call(IPerceptions.Survey);})(jQuery);
if (window.console){console.log('ex time: iperceptions.js', new Date().getTime() - startTScript);}



/*script:quote.js*/
var startTScript=new Date().getTime ();

(function($){$(document).ready(function(){try{$(".articleModule .quote").each(function(){$(".quoteModule").append("<blockquote><p>"+$(this).attr("innerHTML")+"</p></blockquote>");});}catch(e){}});})(jQuery);
if (window.console){console.log('ex time: quote.js', new Date().getTime() - startTScript);}



/*script:global.js*/
var startTScript=new Date().getTime ();

var resizeFlash=DELL.com.Utils.Flash.resizeFlash;
if (window.console){console.log('ex time: global.js', new Date().getTime() - startTScript);}



/*script:birdseed.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.BS=DELL.com.Utils.BS||{};(function($){(function(){this.init=function(){var tns=$('.technote');var lwp=DELL.com.Delphi.PageSettings.lwp;tns.each(function(i){if($(this).attr('rel').length>0&&$(this).attr('class').indexOf('microcontent')==-1){var u='http://www.dell.com/CONTENT/public/glossary.aspx?f='+$(this).attr('rel')+'~'+lwp.Country+'_'+lwp.Language+'_'+lwp.Segment;$(this).unbind("click").bind("click",function(e){e.preventDefault();var birdSeedTitle=DELL.com.Utils.Localize('birdseed_title_imp_details');new DELL.com.ModalWindow({"id":("tn"+(i+1)),"position":"top","url":u,"title":birdSeedTitle,"width":"400","height":"150","ovropac":"0","ovrcolor":"#ffffff","scroll":"yes"});});$(this).attr('href',u);$(this).attr('id',('tn'+(i+1)));$(this).html("<sup>"+(i+1)+"</sup>");}
else if($(this).attr('rel').length>0&&$(this).attr('class').indexOf('microcontent')!=-1){var u='/mc.ashx?id='+$(this).attr('rel')+'&c='+lwp.Country+'&l='+lwp.Language+'&s='+lwp.Segment;$(this).unbind("click").bind("click",function(e){e.preventDefault();var birdSeedTitle=DELL.com.Utils.Localize('birdseed_title_imp_details');new DELL.com.ModalWindow({"id":("tn"+(i+1)),"position":"top","url":u,"title":birdSeedTitle,"width":"400","height":"150","target":"div","ovropac":"0","ovrcolor":"#ffffff","scroll":"yes"});});$(this).attr('href',u);$(this).attr('id',('tn'+(i+1)));$(this).html("<sup>"+(i+1)+"</sup>");}})}}).call(DELL.com.Utils.BS);})(jQuery);
if (window.console){console.log('ex time: birdseed.js', new Date().getTime() - startTScript);}



/*script:modal_init.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.ModalInit=DELL.com.Utils.ModalInit||{};(function($){(function(){this.init=function(){this.timedModalID="";},this.initModal=function(){DELL.com.Utils.ModalInit.timedModalID='';$("a[name='modalPopup'],a[submitName='modalPopup']").live("click",function(e){e.preventDefault();new DELL.com.ModalWindow($(this));return false;});$("a[name='prefiltersModal']").live("click",function(e){var prodCode=$(this).attr('href').split('?')[0].replace("#prefilter-","");var prodDiv=$("#info-"+prodCode);if($(prodDiv).length==0)e.preventDefault();var prod3xLink=$("a[name^='linkTo3x']",prodDiv).attr("href");DELL.com.Prefilters.prefilterControl.getPrefilters(prodCode,$(this));return false;});if($("a[name='modalPopupOnLoad']").length>0){$("a[name='modalPopupOnLoad']").live("click",function(e){e.preventDefault();new DELL.com.ModalWindow($(this));return false;});if(DELL.com.ModalWindow==null||typeof(DELL.com.ModalWindow)=='undefined'){DELL.com.Utils.ModalInit.timedModalID=setInterval(function(){if(DELL.com.ModalWindow==null||typeof(DELL.com.ModalWindow)!='undefined'){clearInterval(DELL.com.Utils.ModalInit.timedModalID);new DELL.com.ModalWindow($("a[name='modalPopupOnLoad']").eq(0));}},500);}else{new DELL.com.ModalWindow($("a[name='modalPopupOnLoad']").eq(0));}}
$("a[name='modalRoll']:not('.ratingTip'),a[submitName='modalRoll']:not('.ratingTip')").live("click",function(e){e.preventDefault();return false;});$("a[name='modalRoll'],a[submitName='modalRoll']").live("mouseover",function(){$this=$(this);var hoverDelay=DELL.com.Utils.GetURLParamVal($this.attr("href"),"hoverDelay")||"300";DELL.com.Utils.ModalInit.timedModalID=setTimeout(function(){if($this.attr("href").indexOf("eventType")==-1&&$this.attr("rel").indexOf("eventType")==-1){$this.attr({href:$this.attr("href")+(($this.attr("href").indexOf('?')!=-1)?"&":"?")+"eventType=rollover"});}
new DELL.com.ModalWindow($this);},hoverDelay);});$("a[name='modalRoll'],a[submitName='modalRoll']").live("mouseout",function(){clearTimeout(DELL.com.Utils.ModalInit.timedModalID);});},this.ModalContent=function(mObj){var $modalObj=mObj||DELL.com.Utils.Context.$BODY;$modalObj.find(".sBookmark").find("a").unbind("click").bind("click",function(e){e.preventDefault();var $this=$(this);var bURL=$this.attr("href").replace("%7Burl%7D",encodeURIComponent(top.location.href));bURL=bURL.replace("{url}",encodeURIComponent(top.location.href));while(bURL.indexOf("%7Btitle%7D")>-1)
bURL=bURL.replace("%7Btitle%7D",encodeURIComponent(top.document.title));while(bURL.indexOf("{title}")>-1)
bURL=bURL.replace("{title}",encodeURIComponent(top.document.title));var bkmrk=window.open(bURL,'bookmark','toolbar=no,width=700,height=400,scrollbars=yes,resizable');});$modalObj.find(".prefilterContent").ready(function(){DELL.com.Prefilters.prefilterControl.init();});$modalObj.find(".modalMore").find("a").unbind("click").bind("click",function(e){e.preventDefault();var $this=$(this);var lwp=DELL.com.Delphi.PageSettings.lwp;$this.attr({href:DELL.com.Delphi.PageSettings.APIRoot+$this.attr("href").substring($this.attr("href").indexOf("document.svc"))+"&c="+lwp.Country+"&l="+lwp.Language+"&s="+lwp.Segment+"&cs="+lwp.CustomerSet+"&ovrcolor=#888888&modaltarget=div&modalwidth=440"});$this.origObj=DELL.com.ModalWindow.Obj;new DELL.com.ModalWindow($this);});$modalObj.find(".addToFavorites").find("a").unbind("click").bind("click",function(e){e.preventDefault();if($.browser.msie){window.external.AddFavorite(top.location.href,decodeURIComponent(top.document.title));}else if($.browser.mozilla){window.sidebar.addPanel(decodeURIComponent(top.document.title),top.location.href,"");}else{return false;}});$modalObj.find("a[name='mailtoLinkType']").unbind("click").bind("click",function(e){e.preventDefault();var $this=$(this);self.location.href='mailto:?body='+encodeURIComponent(self.document.title)+'  '+encodeURIComponent(self.location.href)+'&amp;subject='+encodeURIComponent($this.children("input:first").val());});$('#modalProductSpinner').each(function(i){var fr=DELL.com.Delphi.PageSettings.FlashRoot;var id=$(this).attr("id");var flashvars={};flashvars.url360=DELL.com.ModalWindow.OptionalValue1;var params={};params.play="false";params.loop="false";params.menu="false";params.quality="best";params.scale="noscale";params.salign="";params.wmode="window";params.devicefont="false";params.seamlesstabbing="false";params.swliveconnect="false";params.allowfullscreen="true";params.allowscriptaccess="always";params.allownetworking="all";var attributes={};swfobject.embedSWF(fr+"product_spinner/vrviewer.swf",id,"595","450","9.0.0",true,flashvars,params,attributes);});var $tabs=$modalObj.find('.ui-tabs-nav-container > ul');var $hmcTabs=$modalObj.find('.hmcTabs');if($tabs.length){$tabs.tabs().live('tabsshow',function(event,ui){$(ui.tab).focus();});}
if($hmcTabs.length){var tab1Title=$('#hmcTab1Title',$hmcTabs).text();var tab2Title=$('#hmcTab2Title',$hmcTabs).text();var tab3Title=$('#hmcTab3Title',$hmcTabs).text();var tab4Title=$('#hmcTab4Title',$hmcTabs).text();var tab5Title=$('#hmcTab5Title',$hmcTabs).text();$('.ui-tabs-nav li a[id="hmcTab1-anchor"]',$hmcTabs).html('<span>'+tab1Title+'</span>');$('.ui-tabs-nav li a[id="hmcTab2-anchor"]',$hmcTabs).html('<span>'+tab2Title+'</span>');$('.ui-tabs-nav li a[id="hmcTab3-anchor"]',$hmcTabs).html('<span>'+tab3Title+'</span>');$('.ui-tabs-nav li a[id="hmcTab4-anchor"]',$hmcTabs).html('<span>'+tab4Title+'</span>');$('.ui-tabs-nav li a[id="hmcTab5-anchor"]',$hmcTabs).html('<span>'+tab5Title+'</span>');}
$modalObj.find('.inlinevideo').each(function(i){var fr=DELL.com.Delphi.PageSettings.FlashRoot;var v=$(this);var m=v.attr("rel")||"";var b=$(".iv_thumb",v).attr("src");var t=escape($(".iv_title",v).html());var d=$("a",v).attr("href")||"#";var pt=v.attr("pt")||"related";var c=v.attr("css")||fr+"media_player/assets/css/media_player_theme.css";var l=v.attr("lang")||"en";var w
v.attr("width")!=undefined?w=v.attr("width").replace("px",""):w=250;var h
v.attr("height")!=undefined?h=v.attr("height").replace("px",""):h=250;var id=v.attr("id");if(id==null||id.length==0){id="fid_"+Math.floor(Math.random()*10000);v.attr("id",id);}
var p={allowscriptaccess:'always',allowfullscreen:'true',src:fr+"media_player/delphi_media_player.swf",width:w,height:h,base:fr};var fv={appWidth:w,media:m,thumb:b,mediaTitle:t,destination:d,languageCode:l,basePath:fr+"media_player/",playerType:pt,CSSFile:c,flashID:id};var attributes={id:id};if(m.indexOf(".wmv")>-1){if(pt=='main'){this.innerHTML='<object id="MediaPlayer" width="'+w+'" height="'+h+'" classid="CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95" standby="Loading…" type="application/x-oleobject" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,7,1112"><param name="AllowChangeDisplaySize" value="true"><param name="autosize" value="false"><param name="filename" value="'+m+'" /><param name="Showcontrols" value="True" /><param name="autoStart" value="True" /><embed type="application/x-mplayer2" autoStart="true" src="'+m+'" name="MediaPlayer" width="'+w+'" height="'+h+'"></embed></object>';}
return;}
if(m.indexOf(".swf")>-1){swfobject.embedSWF(m,id,w,h,"9.0.0",fr+"media_player/expressinstall.swf",fv,{},{});return;}
swfobject.embedSWF(fr+"media_player/delphi_media_player.swf",id,w,h,"9.0.0",fr+"media_player/expressinstall.swf",fv,p,attributes);});$('#modalPictaflex').each(function(i){var fr=DELL.com.Delphi.PageSettings.FlashRoot;var id=$(this).attr("id");platformId=DELL.com.ModalWindow.OptionalValue1!=""?DELL.com.ModalWindow.OptionalValue1:"5";var flashvars={};flashvars.c=DELL.com.Delphi.PageSettings.lwp.Country;flashvars.l=DELL.com.Delphi.PageSettings.lwp.Language;flashvars.s=DELL.com.Delphi.PageSettings.lwp.Segment;flashvars.cs=DELL.com.Delphi.PageSettings.lwp.CustomerSet;flashvars.r=DELL.com.Delphi.PageSettings.lwp.Region;flashvars.nextgen="true";flashvars.platform_id=platformId;flashvars.image_id=DELL.com.ModalWindow.OptionalValue2;flashvars.containerURL=location.href;var params={};params.play="false";params.loop="false";params.menu="false";params.quality="best";params.scale="noscale";params.salign="";params.wmode="transparent";params.devicefont="false";params.seamlesstabbing="false";params.swliveconnect="true";params.allowfullscreen="true";params.allowscriptaccess="always";params.allownetworking="all";var attributes={};swfobject.embedSWF("http://i.dell.com/images/global/pictaflex3/design_studio_3.swf",id,"965","600","9.0.0",true,flashvars,params,attributes);});$modalObj.find(".modalContent a[name='printLinkType']").unbind("click").bind("click",function(e){e.preventDefault();var iframe=document.createElement('IFRAME');$(iframe).attr('style','position:absolute;width:0px;height:0px;left:-500px;top:-500px;');$("body").append(iframe);var doc=iframe.contentWindow?iframe.contentWindow.document:iframe.contentDocument;doc.open();$("link[rel='stylesheet']").each(function(){doc.write('<link type="text/css" rel="stylesheet" href="'+$(this).attr("href")+'"></link>');});if(this.Target=="iframe")
doc.write($(".modalFrame").html());else
doc.write($(".modalContent").html());doc.close();if(iframe.contentWindow){iframe.contentWindow.focus();iframe.contentWindow.print();}else{iframe.contentDocument.focus();iframe.contentDocument.print();}});$("ul.billboardThumbs li a").css("opacity","0.6");$("ul.billboardThumbs li a.selected").css("opacity","1.0").find("img").css("visibility","hidden");$(".hotspotModal ul.billboardThumbs li a").click(function(){var $self=$(this);var $li=$(this).parent();var eqNum=$li.parent().children("li").index($li);var bigImg=$self.attr("href");$(".bigImg").show();$(".VideoDisplay").hide();$(".VideoDisplay .modalFrame").attr("src","about:blank");$self.closest(".hotspotModal").find(".bigImg").attr("src",bigImg);$(".hotspotModal ul.billboardThumbs li a.selected").removeClass("selected").css("opacity","0.6").find("img").css("visibility","visible");$self.addClass("selected").css("opacity","1.0").find("img").css("visibility","hidden");return false;});$("ul.billboardThumbs li a").hover(function(){$(this).css("opacity","1.0");},function(){if(!$(this).hasClass("selected")){$(this).css("opacity","0.6");}});$("ul.videoThumb li a").css("opacity","1");$("ul.videoThumb li a").click(function(){if($(".VideoDisplay .modalFrame").attr("src").indexOf("http")==-1)
$(".VideoDisplay .modalFrame").attr("src",$(".VideoDisplay #videoFrmSrc").val());$(".bigImg").hide();$(".VideoDisplay").show();return false;});$("ul.videoThumb li a").hover(function(){$(this).css("opacity","1");});DELL.com.Utils.AutoModal.init();};}).call(DELL.com.Utils.ModalInit);})(jQuery);
if (window.console){console.log('ex time: modal_init.js', new Date().getTime() - startTScript);}



/*script:modal_auto.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.AutoModal=DELL.com.Utils.AutoModal||{};(function($){(function(){this.init=function(){var lwp=DELL.com.Delphi.PageSettings.lwp;var $autoModal=$(".tooltip, .technote");var modal={type:"tooltip",width:400,height:150,pos:"bottom",flip:"true",eventType:"rollover"}
var tecnotes={nextID:0};$autoModal.each(function(){var $this=$(this);modal.title=$this.attr('title')||$this.html();modal.action=$this.attr('name')||"modalRoll";modal.pos="bottom";modal.flip="true";if($this.hasClass("anavhmc")){modal.eventType="click";}
if($this.hasClass('technote')){var contentID=$this.attr('rel'),numberID=tecnotes.hasOwnProperty(contentID)?tecnotes[contentID]:++tecnotes.nextID;modal.action="modalPopup";modal.flip="false";modal.title=DELL.com.Utils.Localize('birdseed_title_imp_details');$this.html("<sup>"+numberID+"</sup>");tecnotes[contentID]=numberID;}
if($this.attr('href')&&$this.hasClass('ratingTip')){$this.attr({href:$this.attr('href'),rel:$this.attr("rel")+"&eventType=rollover&ovropac=0&modaltarget=div&modaltype="+modal.type+"&position="+modal.pos,name:modal.action});}
else if($this.attr('rel').length&&!$this.hasClass('microcontent')){var u='http://www.dell.com/CONTENT/public/glossary.aspx?f='+$this.attr('rel')+'~'+lwp.Country+'_'+lwp.Language+'_'+lwp.Segment;$this.attr({href:u+"&modalwidth="+modal.width+"&modalheight="+modal.height+"&ovropac=0&modalscroll=yes&modaltype="+modal.type+"&position="+modal.pos+"&title="+modal.title+"&flip="+modal.flip+"&eventType="+modal.eventType,name:modal.action});}
else if($this.attr('rel').length&&$this.hasClass('microcontent')){var u='/mc.ashx?id='+$this.attr('rel')+'&c='+lwp.Country+'&l='+lwp.Language+'&s='+lwp.Segment;$this.attr({href:u+"&modalwidth="+modal.width+"&modalHeight="+modal.height+"&ovropac=0&modalscroll=yes&modaltarget=div&modaltype="+modal.type+"&position="+modal.pos+"&title="+modal.title+"&flip="+modal.flip+"&eventType="+modal.eventType,name:modal.action});}});}}).call(DELL.com.Utils.AutoModal);})(jQuery);
if (window.console){console.log('ex time: modal_auto.js', new Date().getTime() - startTScript);}



/*script:contract.js*/
var startTScript=new Date().getTime ();

(function($){$(document).ready(function(){$("#agencyOption").find("option[value=''][selected!=true]").css({'color':'rgb(153,153,153)'});$("#contractOption").find("option[value=''][selected!=true]").css({'color':'rgb(153,153,153)'});$(this).children().find("#agencyOption").change(function(){if($("#agencyOption option:selected").val()!="")
window.open($("#agencyOption option:selected").val(),'popup990x650','WIDTH=990,HEIGHT=650,RESIZABLE=NO,SCROLLBARS=YES,TOOLBAR=NO,LEFT=0,TOP=20');});$(this).children().find("#contractOption").change(function(){if($("#contractOption option:selected").val()!="")
window.open($("#contractOption option:selected").val(),'popup990x650','WIDTH=990,HEIGHT=650,RESIZABLE=NO,SCROLLBARS=YES,TOOLBAR=NO,LEFT=0,TOP=20');});});})(jQuery);
if (window.console){console.log('ex time: contract.js', new Date().getTime() - startTScript);}



/*script:vmlcorners.js*/
var startTScript=new Date().getTime ();

$.fn.jcorners=function(o){return this.each(function(){new $jc(this,o);});};$.jcorners=function(e,o){var defaults={radius:5};this.options=$.extend({},defaults,o||{});if(this.browser.msie){$("body").prepend("<xml:namespace ns='urn:schemas-microsoft-com:vml' prefix='v' />");if($(e).css("background-color")!==undefined){var bg=$(e).css("background-color");}else{var bg="#fff";}
var arc=(this.options.radius/$(e).height());$(e).wrap("<v:roundrect arcsize='"+arc+"' fillcolor='"+bg+"' strokecolor='"+bg+"' strokeweight='0pt'></v:roundrect>").parent().css({"behavior":"url(#default#VML)","background-color":"transparent","height":$(e).outerHeight(),"width":parseInt($(e).css("paddingLeft"))+parseInt($(e).css("paddingRight"))+$(e).width()+"px","display":"inline-block"});$(e).css({"background":"transparent"});}
return this;}
if (window.console){console.log('ex time: vmlcorners.js', new Date().getTime() - startTScript);}



/*script:add_to_cart_tracking.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.Utils.Metrics=DELL.com.Utils.Metrics||{};DELL.com.Utils.Metrics.AddToCartTracking=DELL.com.Utils.Metrics.AddToCartTracking||{};(function($){(function(){this.init=function(){$('a').live('click',function(e){var $this=$(this),orderCode=false,targetURL=this.href;var vars=[],hash;var hashes=targetURL.slice(targetURL.indexOf('?')+1).split('&');for(var i=0;i<hashes.length;i++)
{hash=hashes[i].split('=');vars.push(hash[0]);vars[hash[0]]=hash[1];}
if(String(vars.opcode).indexOf("',")!=-1)
{var tempArray=String(vars.opcode).split("',");vars.opcode=tempArray[0];}
if(vars.oc&&vars.opcode=="add"){DELL.com.Utils.Metrics.trackAddToCartMetrics(vars.oc);}});};}).call(DELL.com.Utils.Metrics.AddToCartTracking);$(document).ready(function(){DELL.com.Utils.Metrics.AddToCartTracking.init();});})(jQuery);
if (window.console){console.log('ex time: add_to_cart_tracking.js', new Date().getTime() - startTScript);}



/*script:reviews_products_selector.js*/
var startTScript=new Date().getTime ();

(function($){$(document).ready(function(){var productFamilyClone=null;var $activeButton=$("#activeButton");var $inactiveButton=$("#inactiveButton");var $productFamilyContainer=$(".products");var $productFamilySelectObj=$("#productFamily");var $productCategorySelectObj=$("#productCategory");productFamilyClone=$productFamilySelectObj.children().clone();$activeButton.hide();$productFamilyContainer.hide();$productCategorySelectObj.bind("change",function(event){$activeButton.show();var selectedCategoryVal=$(this).val();var selectedCategoryIndex=$(this).attr("selectedIndex");if(selectedCategoryIndex=="0"){$productFamilyContainer.hide();}else{$productFamilySelectObj.children().remove();$productFamilyContainer.show();$(productFamilyClone).each(function(){if($(this).hasClass(selectedCategoryVal)||$(this).hasClass("family"))
{$productFamilySelectObj.append($(this).clone()[0]);}});}
$inactiveButton.css('display','inline-block');$activeButton.attr("href",$(this).val()).hide();});$productFamilySelectObj.bind("change",function(event){$inactiveButton.hide();$activeButton.attr("href",$(this).val()).css('display','inline-block');});});})(jQuery);
if (window.console){console.log('ex time: reviews_products_selector.js', new Date().getTime() - startTScript);}



/*script:list_jumpmenu_convertor.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};(function($){var subObjCount=0;$('ul.listToJumpMenu').each(function(indexMain){subObjCount=0;var divHolder=$(document.createElement('div')).insertBefore($(this).hide());divHolder.attr("class","divTest");var selectObjMain=$(document.createElement('select')).appendTo(divHolder);selectObjMain.attr("id","selectObj_"+indexMain);selectObjMain.attr("class","mainJumpMenu");$('>li a',this).each(function(){var hrefValue=this.href;hrefValue=hrefValue+" "+$(this).attr('target');option=$(document.createElement('option')).appendTo(selectObjMain).val(hrefValue).html($(this).html());});var brObj=$(document.createElement('br')).insertAfter(selectObjMain);var indexSub=0;$('li>ul',this).each(function(){var selectObjSub=$(document.createElement('select')).appendTo(divHolder);indexSub=$(this).parent().prevAll().length;selectObjSub.attr("id","subObj_"+indexMain+indexSub);selectObjSub.attr("class","subJumpMenu");$('>li a',this).each(function(){var hrefValue=this.href;hrefValue=hrefValue+" "+$(this).attr('target');option=$(document.createElement('option')).appendTo(selectObjSub).val(hrefValue).html($(this).html());});selectObjSub.css("display","none");selectObjSub.change(function(){if($(this).attr("selectedIndex")==0&&$('#buttonObj_'+indexMain).length>0){$('#buttonObj_'+indexMain).attr("class","btn inactiveNav buttonJumpMenu");}else{$('#buttonObj_'+indexMain).attr("class","btn primaryNav buttonJumpMenu");}});subObjCount++;});if(subObjCount>0&&$('#buttonObj_'+indexMain).length==0){var anchorLink="<a class='btn primaryNav' id='buttonObj_"+indexMain+"'href='#'></a>";var buttonObj=$(document.createElement('a')).appendTo($(divHolder));buttonObj.attr("id",'buttonObj_'+indexMain);buttonObj.attr("href","#");buttonObj.attr("class","btn inactiveNav buttonJumpMenu");buttonObj.html("<span class='t'><span></span></span><span class='b'><span></span></span><span class='c'><strong>"+DELL.com.Utils.Localize('button_jumpmenu')+"</strong></span>");subObjCount=0;}});$('*[id^=selectObj]').change(function(){var indexSelectObj=$('*[id^=selectObj]').index($(this));var indexSubObj=$(this).attr("selectedIndex");var subObjName="#subObj_"+indexSelectObj+indexSubObj;$('*[id^='+'subObj_'+indexSelectObj+']').each(function(){$(this).css("display","none");$('#buttonObj_'+indexSelectObj).attr("class","btn inactiveNav buttonJumpMenu");});if($(subObjName).length>0){$(subObjName).css("display","block");$(subObjName).attr("selectedIndex","0");}else{var hrefValue=($(this).val());if(hrefValue.indexOf(' _blank')>0){window.open(hrefValue.substring(0,hrefValue.indexOf(' _blank')));}else{window.location.href=hrefValue;}}});function setURLToOpen(subObj){subObj.each(function(){if($(this).css('display')=="block"){var hrefValue=$(this).val();if(hrefValue.indexOf(' _blank')>0){window.open(hrefValue.substring(0,hrefValue.indexOf(' _blank')));}else{window.location.href=hrefValue;}}});}
$("a[class*='buttonJumpMenu']").click(function(){setURLToOpen($('*[id^=subObj]'));});})(jQuery);
if (window.console){console.log('ex time: list_jumpmenu_convertor.js', new Date().getTime() - startTScript);}



/*script:available_models.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};(function($){DELL.com.AvailableModel=function(){};DELL.com.AvailableModel.prototype={};$(document).ready(function(){$(".modalContent .viewbyNav ul li a").live("click",function(e){var link=$(this).attr("href");e.preventDefault();DELL.com.ModalWindow.reference.replaceContent(link+
(link.match(/\?/)?"&":"?")+"t-template=products/product/modal_quickview.aspx");});});})(jQuery);
if (window.console){console.log('ex time: available_models.js', new Date().getTime() - startTScript);}



/*script:oas.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.OAS=DELL.com.OAS||{};(function($){(function(){var OAS_url='http://oascentral.dell.com/RealMedia/ads/';var OAS_sitepage='dell/';var OAS_listpos='';var OAS_query='';var OAS_target='_blank';var OAS_rn=new String(Math.random());var OAS_rns=OAS_rn.substring(2,11);var OAS_RichAdHTML="";var OAS_AdBuf=new Array();var OAS_AdBufId=new Array();OAS_NORMAL=function(){var adHTML="";$('[id^=oas_]').each(function(index){adHTML='<a href="'+OAS_url+'click_nx.ads/'+OAS_sitepage+'/1'+OAS_rns+'@'+OAS_listpos+'!'+$(this).attr("ID").slice(4)+'?'+OAS_query+'" target='+OAS_target+'>';adHTML+='<img src="'+OAS_url+'adstream_nx.ads/'+OAS_sitepage+'/1'+OAS_rns+'@'+OAS_listpos+'!'+$(this).attr("ID").slice(4)+'?'+OAS_query+'" border=0></a>';$(this).html(adHTML);});},OAS_RICH_ADS=function(){for(var i2=0;i2<OAS_AdBuf.length;i2++){$('#oas_'+OAS_AdBufId[i2]).append(OAS_AdBuf[i2]);DELL.com.Utils.Flash.renderFlash($('#oas_'+OAS_AdBufId[i2]));}},OAS_RICH_HTML=function(){var listPos=OAS_listpos.split(','),dw=document.write;document.write=function(pString){OAS_RichAdHTML+=pString;}
for(var i=0;i<listPos.length;i++){OAS_RICH(listPos[i]);OAS_AdBuf.push(OAS_RichAdHTML);OAS_AdBufId.push(listPos[i]);OAS_RichAdHTML="";}
document.write=dw;OAS_RICH_ADS();};var onload={initialize:function(){var count=$('[id^=oas_]').length;OAS_sitepage+=DELL.com.Delphi.PageSettings.mi.PageKey.replace(/:/g,"/");if(OAS_sitepage.lastIndexOf("/")==(OAS_sitepage.length-1))
OAS_sitepage+="dell";else
OAS_sitepage+="/dell";$('[id^=oas_]').each(function(index){OAS_listpos+=$(this).attr("ID").slice(4);if(index<(count-1))
OAS_listpos+=",";});if(OAS_listpos.length>0){if(navigator.userAgent.indexOf('Mozilla/3')!=-1||navigator.userAgent.indexOf('Mozilla/4.0 WebTV')!=-1){OAS_NORMAL();}
else{$.getScript(OAS_url+'adstream_mjx.ads/'+OAS_sitepage+'/1'+OAS_rns+'@'+OAS_listpos+'?'+OAS_query,OAS_RICH_HTML);}}}};DELL.com.Utils.Initialize(onload);}).call(DELL.com.OAS);})(jQuery);
if (window.console){console.log('ex time: oas.js', new Date().getTime() - startTScript);}



/*script:help_me_choose.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.HelpMeChoose=DELL.com.HelpMeChoose||{};DELL.com.HelpMeChoose={showAddress:'0',showStatus:'0',showMenu:'0',showToolbar:'0',resizable:'0',scrollable:'1',height:'514',width:'855',openHMC:function(url){window.open(url,"_blank","status="+this.showStatus+","+"toolbar="+this.showToolbar+","+"location="+this.showAddress+","+"menubar="+this.showMenu+","+"resizable="+this.resizable+","+"scrollbars="+this.scrollable+","+"height="+this.height+","+"width="+this.width);},onload:function($){var self=this;$('a.hmc').click(function(e){e.preventDefault();self.openHMC($(e.target).attr('href'));});}}.onload(jQuery);
if (window.console){console.log('ex time: help_me_choose.js', new Date().getTime() - startTScript);}



/*script:productBanner.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.ProductBanner=DELL.com.ProductBanner||{};(function($){(function(){var $this=this;var timerInterval=null;this.init=function(){$("ul.billboardThumbs li a").css("opacity","0.6");$("ul.billboardThumbs li a.selected").css("opacity","1.0").find("img").css("visibility","hidden");if($("#butterflyBanner img").length>0){var $li=$(this);var eqNum=$li.index($li);var myImgPath=$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('title');var mySpacer=$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('src');$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').removeAttr('src');$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('src',$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('id'));$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('title',$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('alt'));}
$("ul.billboardThumbs li a").click(function(){$this.rotateBanner($(this));if(timerInterval!=null){clearInterval(timerInterval);timerInterval=null;}
return false;});$("ul.billboardThumbs li a").hover(function(){$(this).css("opacity","1.0");},function(){if(!$(this).hasClass("selected")){$(this).css("opacity","0.6");}});if($("#butterflyBanner img").length>0){timerInterval=setInterval(function(){$this.rotateBanners();},7000);}
if($("#heroVideo").length>0){var $videoDiv=$("#heroVideo");$videoDiv.remove();var $firstChild=$("#loveTabContainer .ui-tabs-panel:first-child");var $vidThumb=$firstChild.find(".billboardVideoThumb");var vidLink=$vidThumb.find("a").attr("href");$vidThumb.find("a").attr("name","inline").click(function(){$this.showHeroVideo($firstChild,vidLink,$videoDiv);return false;});$this.showHeroVideo($firstChild,vidLink,$videoDiv);}},this.showHeroVideo=function(_fc,_vl,_vd){_fc.find(".productBanner").children("img").hide().removeClass("bigImg");_fc.find(".billboardThumbs li a.selected").removeClass("selected").css("opacity","0.6").find("img").css("visibility","visible");_fc.find(".productBanner").prepend(_vd);$("#loveTabContainer #heroVideo").show();$("#heroVideo iframe").attr("src",_vl);if($.browser.msie){$("#heroVideo iframe").css({"margin-top":"-20px","height":$("#heroVideo iframe").height()+19+"px"});}else{$("#heroVideo iframe").load(function(){$(this).contents().find(".headingWrap").css("padding-bottom","5px").find("h3").css("margin","0");});}
return false;},this.rotateBanner=function(_bThumb){var $li=_bThumb.parent();var eqNum=$li.parent().children("li").index($li);_bThumb.closest(".productBanner").children("img").hide().removeClass("bigImg");_bThumb.closest(".productBanner").find("img").eq(eqNum).show().addClass("bigImg");var myImgPath=$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('title');var mySpacer=$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('src');$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').removeAttr('src');$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('src',$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('id'));$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('title',$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').attr('alt'));$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img').hide();$('.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) #butterflyBanner img:eq('+eqNum+')').show();$("#heroVideo").remove();_bThumb.closest(".billboardThumbs").find("li a.selected").removeClass("selected").css("opacity","0.6").find("img").css("visibility","visible");_bThumb.addClass("selected").css("opacity","1.0").find("img").css("visibility","hidden");},this.rotateBanners=function(){var $bThumbs=$("#loveTabContainer.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) ul.billboardThumbs .changeBillboard");if($bThumbs.length>0){var curIndex=$bThumbs.index($("#loveTabContainer.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) ul.billboardThumbs .selected"));if(curIndex<($bThumbs.length-1))
$this.rotateBanner($bThumbs.eq(curIndex+1));else
$this.rotateBanner($bThumbs.eq(0));}else{clearInterval(timerInterval);timerInterval=null;}},this.resetBanners=function(){var $bThumbs=$("#loveTabContainer.butterflyTron .ui-tabs-panel:not(.ui-tabs-hide) ul.billboardThumbs .changeBillboard");if($bThumbs.length>0){$this.rotateBanner($bThumbs.eq(0));}else{clearInterval(timerInterval);timerInterval=null;}},this.onload={initialize:function(){$this.init();}};DELL.com.Utils.Initialize(this.onload);}).call(DELL.com.ProductBanner);})(jQuery);
if (window.console){console.log('ex time: productBanner.js', new Date().getTime() - startTScript);}



/*script:newtron.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Utils=DELL.com.Utils||{};DELL.com.NewTron=DELL.com.NewTron||{};$.ui=$.ui||{};$.ui.tabs=$.ui.tabs||{};$.ui.tabs.prototype=$.ui.tabs.prototype||{};(function($){(function(){var $this=this;this.init=function(){$(".ui-tabs-selected .newtron_tab_right").removeClass("newtron_tab_right_inactive").addClass("newtron_tab_right_active");$("div#loveTabContainer ul.ui-tabs-nav li a").click(function(){var $this=$(this);var $listitem=$this.parent();var $rightimg=$listitem.find('.newtron_tab_right');$(".bigImg").show();var $alllistitems=$listitem.siblings();var $allrightimgs=$alllistitems.find('.newtron_tab_right');$listitem.removeClass('newtron_tab_hover');$allrightimgs.removeClass('newtron_tab_right_active').removeClass('newtron_tab_right_inactive').removeClass('newtron_tab_right_hover');$allrightimgs.addClass('newtron_tab_right_inactive');$rightimg.removeClass('newtron_tab_right_inactive').removeClass('newtron_tab_right_hover');$rightimg.addClass('newtron_tab_right_active');var href=$this.attr("href");window.location.hash=DELL.com.Utils.GetURLHashVal(href);if((window.XMLHttpRequest==undefined)&&(ActiveXObject!=undefined)){var yPlacement=$('.ui-tabs-nav-container').offset().top-20;window.scrollTo(0,yPlacement);}});$("div#loveTabContainer ul.ui-tabs-nav li").hover(function(){var $listitem=$(this);var $rightimg=$listitem.find(".newtron_tab_right");if($listitem.attr("class").indexOf("ui-tabs-selected")==-1){var linkTabHref=$(this).find('a[href^="#"]');linkTabHref.length>0?$listitem.addClass('newtron_tab_hover'):$listitem.addClass('newtron_url_hover');$rightimg.removeClass('newtron_tab_right_inactive').addClass('newtron_tab_right_hover');}},function(){var $listitem=$(this);var $rightimg=$listitem.find('.newtron_tab_right');if($listitem.attr("class").indexOf("ui-tabs-selected")==-1){$listitem.removeClass('newtron_tab_hover');$listitem.removeClass('newtron_url_hover');$rightimg.removeClass('newtron_tab_right_hover').addClass('newtron_tab_right_inactive');}});var prodHash=DELL.com.Utils.GetURLHashVal(window.location.href);if(prodHash!=""&&$("#"+prodHash).length>0){$('html, body').attr({scrollTop:0});if(navigator.userAgent.indexOf("Firefox")!=-1){$(window).load(function(){$('html, body').attr({scrollTop:0});setTimeout(function(){$('html, body').attr({scrollTop:0});},500);});}
else{setTimeout(function(){$('html, body').attr({scrollTop:0});},500);}}},this.onload={initialize:function(){$this.init();}};DELL.com.Utils.Initialize(this.onload);}).call(DELL.com.NewTron);})(jQuery);
if (window.console){console.log('ex time: newtron.js', new Date().getTime() - startTScript);}



/*script:toolbar_utility_stalker.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com.UtilityBar=DELL.com.UtilityBar||{};(function($){(function(){if($("#utilityToolbar").length>0){var utility=$("#utilityToolbar");utility.remove();$("#contentWrap").append(utility);var containerHeight=$("#utilityToolbar").parent().height();var containerTop=$("#utilityToolbar").parent().offset().top;var toolbarHeight=$("#utilityToolbar").height();var contentDiv=$("#content");var contentWidth=$("#content").width();var toolbarWidth=$("#utilityToolbar").width();var toolbarPad=15;var topPos,leftPos;function setToolbar(){setLeftPos();setTopPos();$("#utilityToolbar").offset({top:topPos,left:leftPos});}
function setLeftPos(){if($(window).width()<(contentDiv.offset().left+contentWidth+toolbarWidth+toolbarPad)){leftPos=contentDiv.offset().left+contentWidth+toolbarPad;}
else{leftPos=$(window).width()-toolbarWidth;}}
function setTopPos(){if($(window).scrollTop()>(containerHeight+containerTop-toolbarHeight)){topPos=containerHeight+containerTop-toolbarHeight-toolbarPad;}
else if($(window).scrollTop()>containerTop){topPos=$(window).scrollTop()+toolbarPad;}
else{topPos=containerTop+toolbarPad;}}
$(window).scroll(function(){setToolbar();}).resize(function(){setToolbar();});setToolbar();$("#utilityToolbar").show();}}).call(DELL.com.UtilityBar);})(jQuery);
if (window.console){console.log('ex time: toolbar_utility_stalker.js', new Date().getTime() - startTScript);}



/*script:salescatalog_api.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.SalesCat=DELL.com.SalesCat||{};(function($){(function(){var loadingIcon="<div class=\"loadingIcon\">&nbsp;</div>";this.call=function(callType,params,successCallback,failCallback){var targetId=params.targetId||"ajaxHook";var urlParams=[];var serviceType;var method="GET";switch(callType){case'collection':serviceType='productcollection';urlParams={catid:params.catId||'',appliedNavigators:params.appliedNavigators,sort:params.sort||'',groupby:params.groupBy||'',cTemplate:params.cTemplate||''}
break;case'syndication':serviceType='productcontentsyndicationdata/html';urlParams={catid:params.catId||'',productitem:params.productItemId,ordercode:params.orderCode||'',variant:params.variant||'',querytype:params.queryType||'',queryData:params.queryData||'',cTemplate:params.cTemplate||'',jsonp_callback:params.jsonp_callback||'',uiParamaters:params.uiParamaters||'none',enforceLanguage:params.enforceLanguage||''}
break;case'banner':serviceType='productbannerdata/html';break;case'snp':serviceType='snpdata/html';urlParams={skus:($.isArray(params.skus))?params.skus.join(','):params.skus,cTemplate:params.cTemplate,uiParameters:'none'}
break;case'carousel':serviceType='productCarouseldata/html';urlParams={ids:($.isArray(params.ids))?params.ids.join(','):params.ids,idtype:params.idtype,cTemplate:params.cTemplate,uiParamaters:params.uiParameters||'none'}
break;case'configset':serviceType='productconfigsetdata/html';method="POST";urlParams={page:params.page||1,preconfigfilter:params.filters||'',cTemplate:params.cTemplate,overrideOrderCodes:($.isArray(params.overrideordercodes))?params.overrideordercodes.join(','):params.overrideordercodes,uiParameters:params.uiParameters||'none',productitemid:params.productid}
break;case'category':serviceType='salescatalogcategoryviewdata/html';method="POST";urlParams={page:params.page||1,preconfigfilter:params.filters||null,cTemplate:params.cTemplate,overrideOrderCodes:params.overrideordercodes||null,uiParameters:params.uiParameters||'none',catid:params.catid}
break;case'suggestion':serviceType='productsuggestiondata/html';method="POST";urlParams={page:params.page||1,cTemplate:params.cTemplate,searchTerm:params.searchTerm||'',overrideordercodes:($.isArray(params.overrideordercodes))?params.overrideordercodes.join(','):params.overrideordercodes||null,uiParameters:params.uiParameters||'none'}
break;case'related':serviceType='relatedconfigs/html';break;default:case'product':serviceType='productdata/html';urlParams={catid:params.catId||'',productitem:params.productItemId,ordercode:params.orderCode||'',variant:params.variant||'',querytype:params.queryType||'',querydata:params.queryData||'',cTemplate:params.cTemplate||'',jsonp_callback:params.jsonp_callback||'',uiParameters:params.uiParameters||'none'}
break;}
var ps=DELL.com.Delphi.PageSettings;var svcUrl=ps.APIRoot+"SalesCatalog.svc/"+serviceType;var encodedParams=$.param(urlParams);var data=decodeURIComponent(encodedParams);var lwpc=ps.lwp.Country;var lwpl=ps.lwp.Language;var lwps=ps.lwp.Segment;var lwpcs=ps.lwp.CustomerSet;data+="&c="+lwpc;data+="&l="+lwpl;data+="&s="+lwps;data+="&cs="+lwpcs;if($("#"+targetId).length>0)$("#"+targetId).append(loadingIcon);$.ajax({url:svcUrl,data:data,context:params.context||this,type:method,error:function(req){if(typeof failCallback==='function'){failCallback(req);}else{if($("#"+targetId).length>0)$("#"+targetId).html("&nbsp;");}},success:function(req){if(typeof successCallback==='function'){if(params.context)this.successCallback(req);else successCallback(req);}else{if($("#"+targetId).length>0)$("#"+targetId).html(req);}}});}}).call(DELL.com.SalesCat);})(jQuery);
if (window.console){console.log('ex time: salescatalog_api.js', new Date().getTime() - startTScript);}



/*script:baynote_ajax.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};DELL.com.Baynote=DELL.com.Baynote||{};(function($){(function(){var loadingIcon="<div class=\"loadingIcon\">&nbsp;</div>";this.isBaynoteReady=function(){if(typeof BaynoteAPI=='undefined'||typeof BaynoteAPI.getAjaxTag!='function')return false;var ajaxHandler=BaynoteAPI.getAjaxTag();if(!ajaxHandler.initialized)return false;return true;}
this.call=function(params,successCallback,failCallback){params.customerId="dell";var ps=DELL.com.Delphi.PageSettings;params.code=ps.lwp.Segment+"_"+ps.lwp.Region;var href=location.href;var pathname=location.pathname;var splitted=href.split(pathname);params.url=splitted[0]+pathname.replace(".aspx","");BaynoteAPI.getAjaxTag().send({bnURL:'/baynote/guiderest',context:params.context||this,onSuccess:successCallback,onFailure:failCallback,params:params});}}).call(DELL.com.Baynote);})(jQuery);
if (window.console){console.log('ex time: baynote_ajax.js', new Date().getTime() - startTScript);}



/*script:categorytron.js*/
var startTScript=new Date().getTime ();

var DELL=window.DELL||{};DELL.com=DELL.com||{};(function($){$(function(){var $firstPrevDivider=$(".butterflyTabs li.selected").prev(".divider");var $firstNextDivider=$(".butterflyTabs li.selected").next(".divider");if($firstPrevDivider.length>0)
{$firstPrevDivider.addClass('selectedDivider');}
if($firstPrevDivider.length>0)
{$firstNextDivider.addClass('selectedDivider');}
$(".butterflyTabs li").hover(function(){var $prevDivider=$(this).prev(".divider");if($(this).attr("class").indexOf("selected")==-1){$(this).addClass('liHover');$prevDivider.addClass('selectedDivider');}
var $nextDivider=$(this).next(".divider");if($(this).attr("class").indexOf("selected")==-1){$nextDivider.addClass('selectedDivider');}},function(){var $prevDivider=$(this).prev(".divider");if($(this).attr("class").indexOf("selected")==-1){$(this).removeClass('liHover');if($prevDivider.prev("li").attr("class").indexOf("selected")==-1){$prevDivider.removeClass('selectedDivider');}}
var $nextDivider=$(this).next(".divider");if($(this).attr("class").indexOf("selected")==-1){if($nextDivider.next("li").attr("class").indexOf("selected")==-1){$nextDivider.removeClass('selectedDivider');}}});});})(jQuery);
if (window.console){console.log('ex time: categorytron.js', new Date().getTime() - startTScript);}


