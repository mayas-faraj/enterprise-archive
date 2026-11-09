
function FlashDetector_Detect(){var pObj=null;var tokens,len,curr_tok;var hasVersion=-1;if(navigator.mimeTypes&&navigator.mimeTypes['application/x-shockwave-flash'])
{pObj=navigator.mimeTypes['application/x-shockwave-flash'].enabledPlugin;}
if(pObj!=null)
{tokens=navigator.plugins['Shockwave Flash'].description.split(' ');len=tokens.length;while(len--)
{curr_tok=tokens[len];if(!isNaN(parseInt(curr_tok)))
{hasVersion=curr_tok;FlashDetector_Version=curr_tok;break;}}
if(hasVersion>=FlashDetector_TargetVersion)
{playable=true;}
else
{playable=false;}}
return playable;}<!--
function ylib_Browser()
{d=document;this.agt=navigator.userAgent.toLowerCase();this.major=parseInt(navigator.appVersion);this.dom=(d.getElementById)?1:0;this.ns=(d.layers);this.ns4up=(this.ns&&this.major>=4);this.ns6=(this.dom&&navigator.appName=="Netscape");this.op=(window.opera?1:0);this.ie=(d.all);this.ie4=(d.all&&!this.dom)?1:0;this.ie4up=(this.ie&&this.major>=4);this.ie5=(d.all&&this.dom);this.win=((this.agt.indexOf("win")!=-1)||(this.agt.indexOf("16bit")!=-1));this.mac=(this.agt.indexOf("mac")!=-1);};var oBw=new ylib_Browser();function ylib_getObj(id,d)
{var i,x;if(!d)d=document;if(!(x=d[id])&&d.all)x=d.all[id];for(i=0;!x&&i<d.forms.length;i++)x=d.forms[i][id];for(i=0;!x&&d.layers&&i<d.layers.length;i++)x=ylib_getObj(id,d.layers[i].document);if(!x&&document.getElementById)x=document.getElementById(id);return x;};function ylib_getH(o){return(oBw.ns)?((o.height)?o.height:o.clip.height):((oBw.op&&typeof o.style.pixelHeight!='undefined')?o.style.pixelHeight:o.offsetHeight);};function ylib_setH(o,h){if(o.clip)o.clip.height=h;else if(oBw.op&&typeof o.style.pixelHeight!='undefined')o.style.pixelHeight=h;else o.style.height=h;};function ylib_getW(o){return(oBw.ns)?((o.width)?o.width:o.clip.width):((oBw.op&&typeof o.style.pixelWidth!='undefined')?w=o.style.pixelWidth:o.offsetWidth);};function ylib_setW(o,w){if(o.clip)o.clip.width=w;else if(oBw.op&&typeof o.style.pixelWidth!='undefined')o.style.pixelWidth=w;else o.style.width=w;};function ylib_getX(o){return(oBw.ns)?o.left:((o.style.pixelLeft)?o.style.pixelLeft:o.offsetLeft);};function ylib_setX(o,x){if(oBw.ns)o.left=x;else if(typeof o.style.pixelLeft!='undefined')o.style.pixelLeft=x;else o.style.left=x;};function ylib_getY(o){return(oBw.ns)?o.top:((o.style.pixelTop)?o.style.pixelTop:o.offsetTop);};function ylib_setY(o,y){if(oBw.ns)o.top=y;else if(typeof o.style.pixelTop!='undefined')o.style.pixelTop=y;else o.style.top=y;};function ylib_getPageX(o){var x=0;if(oBw.ns)x=o.pageX;else{while(eval(o)){x+=o.offsetLeft;o=o.offsetParent;}}return x;};function ylib_getPageY(o){var y=0;if(oBw.ns)y=o.pageY;else{while(eval(o)){y+=o.offsetTop;o=o.offsetParent;}}return y;};function ylib_getZ(o){return(oBw.ns)?o.zIndex:o.style.zIndex;};function ylib_moveTo(o,x,y){ylib_setX(o,x);ylib_setY(o,y);};function ylib_moveBy(o,x,y){ylib_setX(o,ylib_getPageX(o)+x);ylib_setY(o,ylib_getPageY(o)+y);};function ylib_setZ(o,z){if(oBw.ns)o.zIndex=z;else o.style.zIndex=z;};function ylib_show(o,disp){(oBw.ns)?'':(!disp)?o.style.display="inline":o.style.display=disp;(oBw.ns)?o.visibility='show':o.style.visibility='visible';};function ylib_hide(o,disp){(oBw.ns)?'':(arguments.length!=2)?o.style.display="none":o.style.display=disp;(oBw.ns)?o.visibility='hide':o.style.visibility='hidden';};function ylib_setStyle(o,s,v){if(oBw.ie5||oBw.dom)eval("o.style."+s+" = '"+v+"'");};function ylib_getStyle(o,s){if(oBw.ie5||oBw.dom)return eval("o.style."+s);};function ylib_addEvt(o,e,f,c){if(o.addEventListener)o.addEventListener(e,f,c);else if(o.attachEvent)o.attachEvent("on"+e,f);else eval("o.on"+e+"="+f)};function ylib_writeHTML(o,h){if(oBw.ns){var doc=o.document;doc.write(h);doc.close();return false;}if(o.innerHTML)o.innerHTML=h;};function ylib_insertHTML(o,h,w)
{if(oBw.op)return;if(o.insertAdjacentHTML)
{o.insertAdjacentHTML(w,h);return;}
if(oBw.ns)
{ylib_writeHTML(o,h);return;}
var r=o.ownerDocument.createRange();r.setStartBefore(o);var frag=r.createContextualFragment(h);ylib_insertObj(o,w,frag);};function ylib_insertObj(o,w,node)
{switch(w)
{case'beforeBegin':o.parentNode.insertBefore(node,o);break;case'afterBegin':o.insertBefore(node,o.firstChild);break;case'beforeEnd':o.appendChild(node);break;case'afterEnd':if(o.nextSibling)o.parentNode.insertBefore(node,o.nextSibling);else o.parentNode.appendChild(node);break;}};function addEvent(obj,evType,fn,useCapture)
{if(obj.addEventListener){obj.addEventListener(evType,fn,useCapture);return true;}
if(obj.attachEvent){return obj.attachEvent("on"+evType,fn);}
alert("Unable to add event listener for "+evType+" to "+obj.tagName);}
function removeEvent(obj,evType,fn,useCapture)
{if(obj.removeEventListener){obj.removeEventListener(evType,fn,useCapture);return true;}
if(obj.detachEvent){return obj.detachEvent("on"+evType,fn);}
alert("Unable to remove event listener for "+evType+" from "+obj.tagName);}
function addStyleSheet(doc,id)
{if(doc==null){return;}
if(id!=null){removeStyleSheet(doc,id);}
var styleElt=doc.createElement("STYLE");if(id!=null){styleElt.id=id;}
doc.getElementsByTagName("HEAD").item(0).appendChild(styleElt);return doc.styleSheets[doc.styleSheets.length-1];}
function removeStyleSheet(doc,id){var sheets=doc.getElementsByTagName("STYLE");var n;for(var i=0,n=sheets.length;i<n;++i){if(sheets[i].id==id){sheets[i].parentNode.removeChild(sheets[i]);return sheets[i];}}
return null;}
function addStylesheetRule(styleSheet,name,styles)
{if(styleSheet==null){return;}
if(typeof styleSheet.addRule!="undefined")
styleSheet.addRule(name,styles);else if(typeof styleSheet.insertRule!="undefined")
styleSheet.insertRule(name+" { "+styles+" }",styleSheet.cssRules.length);}
var YLIB_SHIFT_KEYCODE=16;var YLIB_CTRL_KEYCODE=17;var YLIB_ALT_KEYCODE=18;var YLIB_SHIFT="shift";var YLIB_CTRL="ctrl";var YLIB_ALT="alt";ylib_keyevt.count=0;function ylib_keyevt(elm)
{this.id="keyevt"+ylib_keyevt.count++;eval(this.id+"=this");this.keys=new Array();this.shift=0;this.ctrl=0;this.alt=0;this.addKey=ylib_addKey;this.keyevent=ylib_keyevent;this.checkModKeys=ylib_checkModKeys;};function ylib_addKey(cdom,cns4,a,m)
{if(oBw.ie||oBw.dom)this.keys[cdom]=[a,m];else this.keys[cns4]=[a,m];};var YLIB_COUNT=0;function ylib_keyevent(evt)
{if(!evt)evt=window.event;if(evt){var k=(oBw.ie||oBw.op||oBw.ns6)?evt.keyCode:evt.which;this.checkModKeys(evt,k);if(this.keys[k]==null)return false;var m=this.keys[k][1];if((this.shift&&(m.indexOf(YLIB_SHIFT)!=-1)||!this.shift&&(m.indexOf(YLIB_SHIFT)==-1))&&(this.ctrl&&(m.indexOf(YLIB_CTRL)!=-1)||!this.ctrl&&(m.indexOf(YLIB_CTRL)==-1))&&(this.alt&&(m.indexOf("alt")!=-1)||!this.alt&&(m.indexOf("alt")==-1)))
{var a=this.keys[k][0];a=eval(a);if(typeof a=="function")a();}}};function ylib_checkModKeys(e,k)
{if(oBw.dom)
{this.shift=e.shiftKey;this.ctrl=e.ctrlKey;this.alt=e.altKey;}
else
{this.shift=(k==YLIB_SHIFT_KEYCODE)?1:0;this.ctrl=(k==YLIB_CTRL_KEYCODE)?1:0;this.alt=(k==YLIB_ALT_KEYCODE)?1:0;}};var oKey=new ylib_keyevt();function ClickButton(p_sButtonId,p_sHiddenFieldId,p_oClickHandler)
{var oButton=document.getElementById(p_sButtonId);if(oButton&&oButton.form)
{var oHiddenField=document.getElementById(p_sHiddenFieldId);if(oHiddenField)
{oButton.HiddenField=oHiddenField;oButton.HiddenField.value="";oButton.onclick=function(){if(typeof p_oClickHandler!='undefined'&&p_oClickHandler)p_oClickHandler();this.HiddenField.value=this.value;this.form.submit();};return oButton;}
else return false;}
else return false;};function Menu_Click(p_oEvent)
{var oEvent=p_oEvent?p_oEvent:window.event;var oSender=p_oEvent?oEvent.target:oEvent.srcElement;if(p_oEvent)oEvent.stopPropagation();else oEvent.cancelBubble=true;this.Sender=oSender;this.Event=oEvent;if(typeof this.ClickHandler!='undefined')this.ClickHandler();};function Menu_MouseOver(p_oEvent)
{var oEvent=p_oEvent?p_oEvent:window.event;var oSender=p_oEvent?oEvent.target:oEvent.srcElement;if(oSender.tagName=='LI')oSender.className='hover';else if(oSender.tagName=='A')oSender.parentNode.className='hover';else return false;};function Menu_MouseOut(p_oEvent)
{var oEvent=p_oEvent?p_oEvent:window.event;var oSender=p_oEvent?oEvent.target:oEvent.srcElement;if(oSender.tagName=='LI')oSender.className='';else if(oSender.tagName=='A')oSender.parentNode.className='';else return false;};function Button_Click(p_oEvent)
{var oEvent=p_oEvent?p_oEvent:window.event;var oSender=p_oEvent?oEvent.target:oEvent.srcElement;if(p_oEvent)oEvent.stopPropagation();else oEvent.cancelBubble=true;this.Event=oEvent;this.Sender=oSender;HideMenu();this.Menu.Button=this;g_oMenu=this.Menu;if(typeof this.ClickHandler!='undefined')this.ClickHandler();else g_oMenu.Show();document.onclick=Document_Click;};function showIFrameShim(theDiv)
{var theShim=document.getElementById("DivShim");if(theShim!=null){theShim.style.width=theDiv.offsetWidth;theShim.style.height=theDiv.offsetHeight;theShim.style.top=theDiv.style.top;theShim.style.left=theDiv.style.left;theShim.style.display="block";}}
function hideIFrameShim()
{var theShim=document.getElementById("DivShim");if(theShim!=null){theShim.style.display="none";}}
function ButtonMenu(p_sMenuId,p_oClickHandler)
{var oMenu=document.getElementById(p_sMenuId);if(oMenu){if(typeof p_oClickHandler!='undefined')oMenu.ClickHandler=p_oClickHandler;oMenu.Show=function(){if(document.all)this.style.width=this.offsetWidth+'px';var nTop=ylib_getPageY(this.Button);var nLeft=ylib_getPageX(this.Button);var containerID=this.getAttribute("container");if(containerID!=null){var container=document.getElementById(containerID);var altContainer=document.getElementById("bufu");if(altContainer!=null){container=altContainer;}
nTop=ygPos.getY(this.Button)-ygPos.getY(container);nLeft=ygPos.getX(this.Button)-ygPos.getX(container);}
nTop+=this.Button.offsetHeight;if(oBw.ie&&oBw.mac){nTop-=4;nLeft-=6;}
this.style.top=nTop+'px';this.style.left=nLeft+'px';this.style.visibility='visible';};oMenu.onclick=Menu_Click;if(document.all){oMenu.onmouseover=Menu_MouseOver;oMenu.onmouseout=Menu_MouseOut;}
return oMenu;}
return false;};function Button(p_sButtonId)
{var oButton=document.getElementById(p_sButtonId);if(oButton)
{oButton.onclick=Button_Click;return oButton;}
else return false;};function MenuButton()
{var nArguments=arguments.length;function __MenuButton_TwoArguments(p_sButtonId,p_sMenuId)
{var oButton=Button(p_sButtonId);if(oButton){oButton.Menu=new ButtonMenu(p_sMenuId);return oButton;}
return false;};function __MenuButton_ThreeArguments(p_sButtonId,p_sMenuId,p_oMenuClickHandler)
{var oButton=Button(p_sButtonId);if(oButton){oButton.Menu=new ButtonMenu(p_sMenuId,p_oMenuClickHandler);return oButton;}
return false;};function __MenuButton_FourArguments(p_sButtonId,p_oButtonClickHandler,p_sMenuId,p_oMenuClickHandler)
{var oButton=Button(p_sButtonId);if(oButton&&typeof p_oButtonClickHandler!='undefined'){oButton.ClickHandler=p_oButtonClickHandler;oButton.Menu=new ButtonMenu(p_sMenuId,p_oMenuClickHandler);return oButton;}
return false;};if(nArguments==2)return __MenuButton_TwoArguments(arguments[0],arguments[1]);if(nArguments==3)return __MenuButton_ThreeArguments(arguments[0],arguments[1],arguments[2]);if(nArguments==4)return __MenuButton_FourArguments(arguments[0],arguments[1],arguments[2],arguments[3]);return false;};function Tab_MouseOver()
{if(!this.Selected)this.className="hover";return false;};function Tab_MouseOut()
{if(!this.Selected)this.className="";return false;};function PIMMenu_Click(p_oEvent)
{var oEvent=p_oEvent?p_oEvent:window.event;if(p_oEvent)oEvent.stopPropagation();else oEvent.cancelBubble=true;if(oEvent&&oEvent.target&&oEvent.target.parentNode&&oEvent.target.parentNode.tagName=="A")window.location=oEvent.target.parentNode.href;};function Arrow_Click(p_oEvent)
{document.Selects=document.getElementsByTagName('select');if(document.Selects[0])
{var nSelects=document.Selects.length-1;for(var i=nSelects;i>=0;i--)document.Selects[i].style.visibility='hidden';}
var oAvatar=document.getElementById("swfcontainer");if(oAvatar){oAvatar.style.visibility="hidden";}
var oEvent=p_oEvent||window.event;if(p_oEvent)oEvent.stopPropagation();else oEvent.cancelBubble=true;HideMenu();var oTab=this.parentNode.parentNode;var nTop=(oTab.offsetTop+oTab.parentNode.offsetHeight);var sTop=((oTab.Selected)?(nTop+2):(nTop-1))+"px";g_oMenu=document.getElementById(this.href.split('#')[1]);g_oMenu.style.top=sTop;g_oMenu.style.left=oTab.offsetLeft+"px";g_oMenu.onclick=PIMMenu_Click;g_oMenu.style.visibility="visible";document.onclick=Document_Click;return false;};function Tabs_Init()
{var oMailTab=document.getElementById('mailtab');var oMobileTab=document.getElementById('mobiletab');var oAddressBookTab=document.getElementById('addressbooktab');var oCalendarTab=document.getElementById('calendartab');var oNotepadTab=document.getElementById('notepadtab');if(oMailTab)
{oMailTab.getElementsByTagName("a")[1].onclick=Arrow_Click;oMailTab.onmouseover=Tab_MouseOver;oMailTab.onmouseout=Tab_MouseOut;oMailTab.Selected=(oMailTab.className=='selected'||oMailTab.className=='first selected')?true:false;}
if(oMobileTab)
{oMobileTab.getElementsByTagName("a")[1].onclick=Arrow_Click;oMobileTab.onmouseover=Tab_MouseOver;oMobileTab.onmouseout=Tab_MouseOut;oMobileTab.Selected=(oMobileTab.className=='selected'||oMobileTab.className=='first selected')?true:false;}
if(oAddressBookTab)
{oAddressBookTab.getElementsByTagName("a")[1].onclick=Arrow_Click;oAddressBookTab.onmouseover=Tab_MouseOver;oAddressBookTab.onmouseout=Tab_MouseOut;oAddressBookTab.Selected=(oAddressBookTab.className=='selected'||oAddressBookTab.className=='first selected')?true:false;}
if(oCalendarTab)
{oCalendarTab.getElementsByTagName("a")[1].onclick=Arrow_Click;oCalendarTab.onmouseover=Tab_MouseOver;oCalendarTab.onmouseout=Tab_MouseOut;oCalendarTab.Selected=(oCalendarTab.className=='selected'||oCalendarTab.className=='first selected')?true:false;}
if(oNotepadTab)
{oNotepadTab.getElementsByTagName("a")[1].onclick=Arrow_Click;oNotepadTab.onmouseover=Tab_MouseOver;oNotepadTab.onmouseout=Tab_MouseOut;oNotepadTab.Selected=(oNotepadTab.className=='selected'||oNotepadTab.className=='first selected')?true:false;}
return false;};function HideMenu()
{if(typeof g_oMenu!='undefined'&&g_oMenu)
{if(g_oMenu.Hide)g_oMenu.Hide();else g_oMenu.style.visibility='hidden';var hideCB=g_oMenu.hideCB;if(typeof hideCB=="function"){hideCB.call(g_oMenu);}
g_oMenu=null;document.onclick=null;window.onresize=null;}
else return;};function Document_Click()
{if(document.Selects)
{var nSelects=document.Selects.length-1;for(var i=nSelects;i>=0;i--)document.Selects[i].style.visibility='visible';}
var oAvatar=document.getElementById("swfcontainer");if(oAvatar){oAvatar.style.visibility="visible";}
HideMenu();};function LeftNav_Click(p_oEvent)
{var oEvent=p_oEvent?p_oEvent:window.event;var oSender=p_oEvent?oEvent.target:oEvent.srcElement;var oAnchor=oSender.getElementsByTagName('a')[0];if(oSender.tagName=='LI'&&oAnchor)
{var oWindow=(oAnchor.target=="_top")?window.parent:window;oWindow.document.location=oAnchor.href;}};function LeftNav_MouseOver(p_oEvent)
{var oEvent=p_oEvent?p_oEvent:window.event;var oTarget=oEvent.target?oEvent.target:oEvent.srcElement;oTarget=oTarget.nodeType!=1?oTarget.parentNode:oTarget;var oLI;if(oTarget.tagName=="LI")oLI=oTarget;else if(oTarget.parentNode.tagName=="LI")oLI=oTarget.parentNode;else if(oTarget.parentNode.parentNode.tagName=="LI")oLI=oTarget.parentNode.parentNode;if(oLI){var bEmptyLink=false;if(oTarget.tagName=="A")
{if(oTarget.parentNode.tagName=="SPAN")
{oTarget.style.textDecoration='underline';bEmptyLink=true;}}
if(oLI.className!='selected')
{oLI.previousClassName=oLI.className;oLI.className=(oLI.previousClassName.length>0)?oLI.previousClassName+' hover':'hover';if(typeof oLI.firstChild!="undefined"&&typeof oLI.firstChild.style!="undefined"){oLI.firstChild.style.textDecoration=bEmptyLink?'none':'underline';}}}};function LeftNav_MouseOut(p_oEvent)
{var oEvent=p_oEvent?p_oEvent:window.event;var oTarget=oEvent.target?oEvent.target:oEvent.srcElement;oTarget=oTarget.nodeType!=1?oTarget.parentNode:oTarget;var oLI;if(oTarget.tagName=="LI")oLI=oTarget;else if(oTarget.parentNode.tagName=="LI")oLI=oTarget.parentNode;else if(oTarget.parentNode.parentNode.tagName=="LI")oLI=oTarget.parentNode.parentNode;if(oLI){var bEmptyLink=false;if(oTarget.tagName=="A")
{if(oTarget.parentNode.tagName=="SPAN")
{oTarget.style.textDecoration='none';bEmptyLink=true;}}
if(oLI.className!='selected')
{var bPreviousClassName=((typeof oLI.previousClassName!='undefined')&&(oLI.previousClassName.length>0))?true:false;var sClassName=(bPreviousClassName)?oLI.previousClassName+' hover':'hover';if(oLI.className==sClassName)oLI.className=(bPreviousClassName)?oLI.previousClassName:'';if(typeof oLI.firstChild!="undefined"&&typeof oLI.firstChild.style!="undefined"){oLI.firstChild.style.textDecoration='none';}}}};function LeftNav(p_sNavId)
{var oLeftNav=document.getElementById(p_sNavId);if(oLeftNav)
{var aULs=oLeftNav.getElementsByTagName('ul');if(aULs[0])
{aULs[0].onclick=LeftNav_Click;aULs[0].onmouseover=LeftNav_MouseOver;aULs[0].onmouseout=LeftNav_MouseOut;}
else return;if(aULs[1])
{aULs[1].onclick=LeftNav_Click;aULs[1].onmouseover=LeftNav_MouseOver;aULs[1].onmouseout=LeftNav_MouseOut;}}
else return false;};function DestinationFolder_Click()
{var oSender=this.Sender;var oLI=false;if(!oSender.tagName)oLI=oSender.parentNode;else if(oSender.tagName=='LI')oLI=oSender;else if(oSender.parentNode.tagName=='LI')oLI=oSender.parentNode;if(oLI)
{var sFolderName=oLI.getAttribute("iname");var oForm=this.Button.form;var bNewFolder=parseInt(oLI.value)==0?true:false;if(bNewFolder)
{var sNewFolderName=window.prompt(oForm.newfoldermessage.value,'');if(sNewFolderName)sNewFolderName=sNewFolderName;else return false;if(sNewFolderName!=null&&sNewFolderName!='null'&&sNewFolderName.length!=0)
{oForm.NewFol.value=sNewFolderName;oForm.destBox.value='@NEW';oForm.MOV.value='1';oForm.submit();}
else return false;}
else
{oForm.destBox.value=sFolderName;oForm.MOV.value='1';oForm.submit();}}
else{return false;}};function Window_Resize()
{g_oMenu.style.left=((ylib_getPageX(g_oMenu.Button)+g_oMenu.Button.offsetWidth)-g_oMenu.Button.Menu.offsetWidth)+'px';}
function Move_Click()
{g_oMenu.style.visibility='visible';if(!this.Configured)
{if(g_oMenu.offsetHeight>250)
{g_oMenu.style.width=g_oMenu.offsetWidth+20+"px";g_oMenu.className+=' overflow';if(document.all&&!window.showModelessDialog)
{g_oMenu.style.top='-1000px';g_oMenu.style.left='-1000px';}}
else g_oMenu.style.width=g_oMenu.offsetWidth+"px";document.onclick=Document_Click;window.onresize=Window_Resize;this.Configured=true;}
var nTop=(ylib_getPageY(this)+this.offsetHeight);var nLeft=ylib_getPageX(this);if(oBw.ie&&oBw.mac)
{nTop-=4;nLeft-=6;}
g_oMenu.style.top=nTop+'px';g_oMenu.style.left=nLeft+'px';};function PersonalFoldersDisplayToggle_Click()
{var sDoneURL=(g_oDoneURL)?g_sDoneURL:document.URL;window.open("/"+g_sYMURI+"/Welcome?pers=1&.done="+escape(sDoneURL)+"&"+g_sURLExtras,'_self');};function MySearchesDisplayToggle_Click()
{var sDoneURL=(g_oDoneURL)?g_sDoneURL:document.URL;window.open("/"+g_sYMURI+"/Welcome?searches=1&.done="+escape(sDoneURL)+"&"+g_sURLExtras,'_self');};function AddFolderControl_Click()
{var nn=window.prompt(g_sNewFolderMessage,'');if(nn!=null&&nn!='null'&&nn!='')
{var nn_escaped='';var nn_len=nn.length;for(i=0;i<nn_len;i++)
{var nn_asc=nn.charCodeAt(i);if(nn_asc==43)nn_escaped+='%2b';else if(nn_asc>128)nn_escaped+=nn.charAt(i);else nn_escaped+=escape(nn.charAt(i));}
var sURL='/'+g_sYMURI+'/Folders?ADD=1&Name='+nn_escaped+'&.crumb='+g_sFoldersCrumb+'&.done='+g_sAddFolderDoneURL+'&'+g_sURLExtras;window.open(sURL,'_self');}};function LHCol_Init()
{g_oAddFolderDoneURL=document.getElementById('addfolderdoneurl');g_sAddFolderDoneURL=(g_oAddFolderDoneURL)?g_oAddFolderDoneURL.value:escape(document.URL);g_oDoneURL=document.getElementById('doneurl');if(g_oDoneURL)g_sDoneURL=g_oDoneURL.value;g_oYMURI=document.getElementById('ymuri');if(g_oYMURI)g_sYMURI=g_oYMURI.value;g_oURLExtras=document.getElementById('urlextras');if(g_oURLExtras)g_sURLExtras=g_oURLExtras.value;g_oNewFolderMessage=document.getElementById('newfoldermessage');if(g_oNewFolderMessage)g_sNewFolderMessage=g_oNewFolderMessage.value;g_oFoldersCrumb=document.getElementById('folderscrumb');if(g_oFoldersCrumb)g_sFoldersCrumb=g_oFoldersCrumb.value;var oPersonalFoldersDisplayToggle=document.getElementById('personalfoldersdisplaytoggle');if(oPersonalFoldersDisplayToggle)
{oPersonalFoldersDisplayToggle.onclick=PersonalFoldersDisplayToggle_Click;oPersonalFoldersDisplayToggle.onmouseover=function(){this.className='hover';};oPersonalFoldersDisplayToggle.onmouseout=function(){this.className='';};}
var oMSDisplayToggle=document.getElementById('mysearchesdisplaytoggle');if(oMSDisplayToggle)
{oMSDisplayToggle.onclick=MySearchesDisplayToggle_Click;oMSDisplayToggle.onmouseover=function(){this.className='hover';};oMSDisplayToggle.onmouseout=function(){this.className='';};}
var oAddFolderControl=document.getElementById('addfoldercontrol');if(oAddFolderControl)
{oAddFolderControl.onclick=AddFolderControl_Click;oAddFolderControl.onmouseover=function(){this.className='hover';};oAddFolderControl.onmouseout=function(){this.className='';};}};function ymsgr_ult_beacon(u)
{if(u)
{u+='?.rand='+Math.random();var ymsgr_beacon=new Image();ymsgr_beacon.src=u;}}
function ymsgr_set_vm_target(self,url)
{if(ymsgr_is_messenger())
{setTimeout("ymsgr_ult_beacon('"+url+"')",10);self.href='ymsgr:showvm?';}
else
self.target="mailmsgr";}
function ymsgr_set_im_target(self,url)
{if(ymsgr_is_messenger())
{setTimeout("ymsgr_ult_beacon('"+url+"')",10);self.href='ymsgr:sendim?'+get_target_yid();}
else
self.target="mailmsgr";}
function ymsgr_set_vc_target(self,url)
{if(ymsgr_is_messenger())
{setTimeout("ymsgr_ult_beacon('"+url+"')",10);self.href='ymsgr:callpc?to='+get_target_yid();}
else
self.target="mailmsgr";}
function ymsgr_set_lm_beacon(self,url)
{setTimeout("ymsgr_ult_beacon('"+url+"')",10);}
function get_target_yid()
{return typeof ymsgr_tyid=="undefined"?"":ymsgr_tyid;}
function ymsgr_is_messenger()
{var ymsgr_client=messenger.detect();var ymsgr_version=ymsgr_client.version.split(',');if(ymsgr_client.installed&&ymsgr_version[0]>=7)
{return(ymsgr_version[0]>7||ymsgr_version[1]>0||ymsgr_version[2]>0||ymsgr_version[3]>=182);}
return false;}
function Messenger(){this.startDetect();return null;}
Messenger.prototype.installed=0;Messenger.prototype.cobrand='';Messenger.prototype.intl='us';Messenger.prototype.version="4";Messenger.prototype.platform="w32";Messenger.prototype.post=[];Messenger.prototype.detect=function(){for(var i=0;i<this.post.length;i++){this[this.post[i]]();}
this.post=[];return this;}
Messenger.prototype.startDetect=function(){var ok=this.detectCookie();if(!ok)ok=this.detectBing();if(!ok)ok=this.detectRafi();if(!ok)ok=this.detectCapabilities();if(!ok)ok=this.detectControl();if(!ok)ok=this.detectMime();}
Messenger.prototype.detectControl=function(){if(this.detectBrowser()=='ie')
{document.writeln("<object classid='clasid:41695A8E-6414-11D4-8FB3-00D0B7730277' hidden='true' id='Ymsgr01' width='0' height='0' codebase='tkzwtyzwzi:qwerty'><span id='Ymsgr00'></span></object>");this.post[this.post.length]="postDetectControl";}}
Messenger.prototype.detectBrowser=function()
{var ua=navigator.userAgent.toLowerCase();if(ua.indexOf('opera')!=-1)
{return'opera';}
else if(ua.indexOf('msie')!=-1)
{return'ie';}
else if(ua.indexOf('safari')!=-1)
{return'safari';}
else if(ua.indexOf('flock')!=-1)
{return'flock';}
else if(ua.indexOf('firefox')!=-1)
{return'firefox';}
else if(ua.indexOf('gecko')!=-1)
{return'gecko';}
else
{return false;}}
Messenger.prototype.postDetectControl=function(){var w,v;if(document.all){v=document.all.Ymsgr00;}else{v=document.getElementById("Ymsgr00");}
if(v){w=document.getElementById("Ymsgr01");if(w&&w.offsetHeight){this.installed=1;this.version="5.02";this.platform="w32";}else{return false;}}else{this.installed=1;this.version="5.03";this.platform="w32";}
return true;}
Messenger.prototype.detectMime=function(){if(navigator.mimeTypes&&navigator.mimeTypes.length){for(var i=0;i<navigator.mimeTypes.length;i++){if(navigator.mimeTypes[i].suffixes.indexOf("yps")>-1){this.installed=1;this.version="5.04";this.platform="w32";return true;}}}
return false;}
Messenger.prototype.detectCapabilities=function(){if(document.body&&document.body.style&&typeof document.body.style.behavior=="string"){document.body.style.behavior="url(#default#clientCaps)";var ver=document.body.getComponentVersion("{E5D12C4E-7B4F-11D3-B5C9-0050045C3C96}","ComponentID");if(ver){this.installed=1;this.version=ver;this.platform="w32";return true;}}
return false;}
Messenger.prototype.detectBing=function(){if(this.detectBrowser()=='ie')
{document.writeln('<object id="Ymsgr02" classid="CLSID:DA4F543C-C8A9-4E88-9A79-548CBB46F18F" hidden="true" width="0" height="0" codebase="tkzwtyzwzi:qwerty"></object>');this.post[this.post.length]="postDetectBing";}}
Messenger.prototype.postDetectBing=function(){var v;if(document.all){v=document.all.Ymsgr02;}else{v=document.getElementById("Ymsgr02");}
if(!v)return false;if(typeof v.installed=="undefined")return false;if(typeof v.version=="undefined")return false;this.installed=v.installed();var versionstring=v.version(1);if(!versionstring||typeof versionstring=="undefined")return false;this.version=versionstring.split(".").join(",");this.cobrand=v.cobrand();this.intl=v.intl();return true;}
Messenger.prototype.detectRafi=function(){if(!document.getElementById)return false;if(!navigator.plugins["Yahoo Application State Plugin"])return false;document.writeln("<object id='Ymsgr03' type='application/x-vnd.yahoo.applicationState' hidden='true'></object>");this.post[this.post.length]="postDetectRafi";return false;}
Messenger.prototype.postDetectRafi=function(){var v=document.getElementById("Ymsgr03");if(!v)return false;if(typeof v.applicationInfo!="function")return false;var m=v.applicationInfo("msgr");if(!m)return false;this.installed=m.installed();var ver=m.version();this.version=ver.major+","+ver.minor+","+ver.hiBuild+","+ver.loBuild;this.cobrand=m.cobrand();this.intl=m.internationalCode();return true;}
Messenger.prototype.detectCookie=function(){return false;}
var messenger=new Messenger();function loadSpellCorrections(req,transactionID,args)
{if(typeof req.responseText=="undefined"){SpellController.hideController();return;}
var message=null;try{var scriptToRun=req.responseText.replace(/<\!--.*-->/g,"");eval(scriptToRun);speller.setText(document.Compose.Body.value);}catch(e){if(e.message.toLowerCase()=="syntax error"){speller=new Speller([]);}else{speller=new Speller([]);}}
if(args==null){args=[0];}
var editBox=null;if(typeof RTE_EDITOR_COMPOSITION_PREFIX!="undefined"){editBox=document.getElementById(RTE_EDITOR_COMPOSITION_PREFIX+args[0]);}else{editBox=document.getElementById("bodyfield");}
if(editBox==null){SpellController.hideController();return;}
SpellController.showController(editBox,editBox.tagName);speller.setEditor(editBox,args[0]);speller.update();}
function Speller(newCorrections)
{this.text="";this.corrections=newCorrections;this.changes="";this.current=0;this.ignore=new Object();this.formatted=true;this.state=0;var self=this;this.editBox=null;this.editDoc=null;this.editContent=null;this.isText=false;this.useAX=false;this.thumbMgr=null;this.setText=function(newText)
{this.current=0;this.text=newText;}
this.setNoSuggestions=function(noSuggText)
{this.noSuggestions=noSuggText;}
this.spellingActive=function()
{return(this.state);}
this.hideShim=function(leMenu)
{hideIFrameShim();}
this.onChange=function()
{if(this.current<this.corrections.length){this.changeWord(this.current);this.nextWord();}}
this.onChangeAll=function()
{var cur=this.corrections[this.current];if(this.current<this.corrections.length){var currentWord=this.text.substr(cur.b,cur.l);this.changeWord(this.current);for(var i=this.current+1;i<this.corrections.length;i++){var corr=this.corrections[i];if(!this.ignore[i]&&this.text.substr(corr.b,corr.l)==currentWord){this.changeWord(i);this.ignore[i]=true;}}
this.nextWord();}}
this.onIgnore=function()
{if(this.current<this.corrections.length){this.nextWord();}}
this.onIgnoreAll=function()
{var cur=this.corrections[this.current];if(this.current<this.corrections.length){var currentWord=this.text.substr(cur.b,cur.l);for(var i=this.current+1;i<this.corrections.length;i++){var corr=this.corrections[i];if(!this.ignore[i]&&this.text.substr(corr.b,corr.l)==currentWord){this.ignore[i]=true;}}
this.nextWord();}}
this.onKeyPressWord=function(evt)
{if(evt.keyCode==13){this.onChange();}}
this.nextWord=function()
{while(this.current++<this.corrections.length&&this.ignore[this.current]);this.update();}
this.setEditor=function(editBox,id)
{this.editBox=editBox;this.isText=false;this.editorID=id;if(editBox.tagName=="IFRAME"){this.editDoc=editBox.contentWindow.document;this.editContent=this.editDoc.body;}else if(editBox.tagName=="TEXTAREA"){this.editDoc=editBox;this.editContent=editBox;this.isText=true;}else if(editBox.tagName=="OBJECT"){var editObj=rteEditorMap[id];this.editDoc=editObj.GetDocument();if(editObj.Wrapper&&editObj.Wrapper.Visible){this.editContent=editObj.Wrapper.Content;this.thumbMgr=editObj.ThumbnailManager;}else{this.editContent=this.editDoc.body;}
this.useAX=true;}else{alert("Speller.setEditor: unknown editBox type: "+editBox.tagName+" ("+typeof editBox+")");}
self.trapFocus(true);}
this.trapFocus=function(trapping)
{var evtToTrap=this.isText?"click":((document.all)?"focus":"mousedown");var theFrame=(document.all)?this.editBox:this.editDoc;if(theFrame!=null){if(trapping){addEvent(theFrame,evtToTrap,this.disableSpell,true);}else{removeEvent(theFrame,evtToTrap,this.disableSpell,true);}}}
this.disableSpell=function(evt)
{HideMenu();if(evt==null){evt=window.event;}
self.trapFocus(false);self.state=1;self.finish();disableItem("changeButton",true);disableItem("ignoreButton",true);SpellController.showMessage("SPELL_DISABLED");var doneButton=document.getElementById("doneButton");if(doneButton!=null){doneButton.innerHTML=SpellController.getString("RESUME_BTN");doneButton.onclick=self.enableSpell;}
return true;}
this.enableSpell=function(evt)
{disableItem("doneButton",true);SpellController.hideMessage();var doneButton=document.getElementById("doneButton");if(doneButton!=null){doneButton.innerHTML=SpellController.getString("CLOSE_BTN");doneButton.onclick=spellDone;}
self.state=0;SpellCheck_Click(self.editorID);}
this.finish=function()
{if(this.corrections!=null){this.current=this.corrections.length;this.update();this.text=null;}
if(self.editDoc!=null){self.trapFocus(false);}}
this.lastIndex=0;this.lastDelta=0;this.offsetDelta=function(theText,offset)
{var i=0;var count=0;if(offset>=this.lastIndex){i=this.lastIndex;count=this.lastDelta;}
var len=Math.min(offset,theText.length);while(i<len){if(theText.charCodeAt(i)==13){count++;}
i++;}
this.lastIndex=i;this.lastDelta=count;return count;}
this.update=function()
{var theDoc=this.editDoc;var word=document.getElementById("word");var suggSelect=document.getElementById("suggestions");if(this.corrections!=null&&this.current<this.corrections.length){var cur=this.corrections[this.current];if(!this.isText){var html="";html+=this.text.substr(0,cur.b);html+='<cite id="misspelled" style="font-style:normal;font-weight:bold;color:red;">';html+=this.text.substr(cur.b,cur.l);html+='</cite>';html+=this.text.substr(cur.b+cur.l,this.text.length-(cur.b+cur.l));this.editContent.innerHTML=html;var foundWord=theDoc.getElementById("misspelled");if(foundWord==null){this.nextWord();return;}
foundWord.scrollIntoView(false);}else{this.editDoc.value=this.text;if(typeof(this.editBox.selectionStart)=="undefined"){var selectedWord=this.editBox.createTextRange();if(selectedWord!=null){selectedWord.collapse(true);var adjustedStart=cur.b-this.offsetDelta(this.text,cur.b);selectedWord.moveStart("character",adjustedStart);selectedWord.moveEnd("character",cur.l);}
selectedWord.select();}else{this.editBox.selectionStart=cur.b;this.editBox.selectionEnd=cur.b+cur.l;}
this.editBox.focus();}
suggSelect.options.length=0;var n=cur.s.length;if(n==0){word.value=this.text.substr(cur.b,cur.l);suggSelect.options[0]=new Option(SpellController.getString("NO_SUGGESTIONS"),"",true,true);}else{word.value=cur.s[0];for(var i=0;i<n;i++){var thisWord=cur.s[i]
suggSelect.options[i]=new Option(thisWord,thisWord,(i==0),(i==0));}
suggSelect.selectedIndex=0;}
if(!this.isText){word.select();}}else{if(this.text!=null&&this.text!=""){if(!this.isText){this.editContent.innerHTML=this.text;}else{this.editDoc.value=this.text;}}
var message=(this.corrections.length>0)?"NO_MORE_MISSPELLINGS":"NO_MISSPELLINGS";SpellController.showMessage(message);disableItem("changeButton",true);disableItem("ignoreButton",true);}
if(this.thumbMgr){this.thumbMgr.RestoreThumbnails();}}
this.changeWord=function(index)
{var newText="";var word=document.getElementById("word");var cur=this.corrections[index];newText+=this.text.substr(0,cur.b);newText+=word.value;newText+=this.text.substr(cur.b+cur.l,this.text.length-(cur.b+cur.l));this.adjustOffsets(word.value.length-cur.l,index+1);this.text=newText;}
this.adjustOffsets=function(delta,start)
{for(i=start;i<this.corrections.length;i++){this.corrections[i].b+=delta;}}
this.getStyles=function()
{var html="";var styles=document.getElementsByTagName("STYLE");for(var i=0;i<styles.length;i++){html+="<style>"+styles[i].innerHTML+"</style>";}
return html;}}
var SpellController={UIStrings:{NO_SUGGESTIONS:"No Suggestions",NO_MORE_MISSPELLINGS:"No more misspellings",NO_MISSPELLINGS:"No misspellings found",SPELL_DISABLED:"Spelling disabled, click Resume to continue",CHANGE_LABEL:"Change to:",SUGG_LABEL:"Suggestions:",CHANGE_BTN:"Change",IGNORE_BTN:"Ignore",CLOSE_BTN:"Close",RESUME_BTN:"Resume",CHANGE_ONE_ITEM:"Change this word",CHANGE_ALL_ITEM:"Change all occurrences",IGNORE_ONE_ITEM:"Ignore this word",IGNORE_ALL_ITEM:"Ignore all occurrences"},oldHeight:null,setString:function(id,str)
{this.UIStrings[id]=str;},getString:function(id)
{var result=this.UIStrings[id];if(result==null){return id;}
return result;},addController:function(container)
{if(typeof container=="string"){container=document.getElementById(container);}
var html="";html+='<div id="spellbox" class="clearfix">';html+='<div id="btnbox" class="first">';html+='<div id="spellmsg" style="display:none"></div>';html+='<div id="correction"><label for="word">'+this.getString("CHANGE_LABEL")+'&nbsp;</label><input id="word" onkeypress="speller.onKeyPressWord(event)" /></div>';html+='<button id="changeButton" class="hasdefaultstate" type="button" value="Change" onclick="changeClick(event)">'+this.getString("CHANGE_BTN")+'</button>';html+='<button id="ignoreButton" class="hasdefaultstate" type="button" value="Ignore" onclick="ignoreClick(event)">'+this.getString("IGNORE_BTN")+'</button>';html+='<button id="doneButton" type="button" value="Close" onclick="spellDone(spellbox)">'+this.getString("CLOSE_BTN")+'</button>';html+='</div>';html+='<div id="slbox">';html+='<label id="sugglabel" for="suggestions">'+this.getString("SUGG_LABEL")+'&nbsp;</label>';html+='<select id="suggestions" size="4" onchange="SpellController.onChangeSuggestions()"></select>';html+='</div>';html+='</div>';html+='<div id="changemenu" class="buttonmenu" container="'+container.id+'">';html+='<strong>Change Options</strong>';html+='<ul>';html+='<li value="0">'+this.getString("CHANGE_ONE_ITEM")+'</li>';html+='<li value="1">'+this.getString("CHANGE_ALL_ITEM")+'</li>';html+='</ul>';html+='</div>';html+='<div id="ignoremenu" class="buttonmenu" container="'+container.id+'">';html+='<strong>Change Options</strong>';html+='<ul>';html+='<li value="0">'+this.getString("IGNORE_ONE_ITEM")+'</li>';html+='<li value="1">'+this.getString("IGNORE_ALL_ITEM")+'</li>';html+='</ul>';html+='</div>';container.innerHTML=html;var oChangeMenu=MenuButton('changeButton',changeClick,'changemenu',changeMenuClick);var oSkipMenu=MenuButton('ignoreButton',ignoreClick,'ignoremenu',ignoreMenuClick);},showController:function(editBox)
{var spellBox=document.getElementById("spellbox");if(spellBox==null){SpellController.addController("spellcontrol");spellBox=document.getElementById("spellbox");}
if(spellBox!=null){spellBox.style.display="block";if(typeof editBox!="undefined"&&editBox!=null){if(this.oldHeight==null){this.oldHeight=editBox.clientHeight;this.editBox=editBox;editBox.style.height=editBox.clientHeight-spellBox.offsetHeight+"px";}
if(editBox.tagName=="TEXTAREA"){this.setBoxWidth(editBox,spellBox);}}
this.hideMessage();disableItem("changeButton",false);disableItem("ignoreButton",false);disableItem("doneButton",false);disableItem("word",false);disableItem("suggestions",false);}},setBoxWidth:function(editBox,spellBox)
{if(spellBox.getAttribute("width_set")!=null){return;}
var width=editBox.offsetWidth;spellBox.style.width=width+"px";var delta=spellBox.offsetWidth-width;if(delta!=0){width-=delta;spellBox.style.width=width+"px";}
var btnbox=document.getElementById("btnbox");var slbox=document.getElementById("slbox");if(btnbox!=null&&slbox!=null){var delta=(width-(btnbox.offsetWidth+slbox.offsetWidth))/2;var word=document.getElementById("word");var suggestions=document.getElementById("suggestions");if(delta>0&&word!=null){word.style.width=(word.offsetWidth+delta)+"px";}
if(suggestions!=null){suggestions.style.width=(suggestions.offsetWidth+delta)+"px";}}
spellBox.setAttribute("width_set","1");},hideController:function(id)
{var spellBox=document.getElementById("spellbox");if(spellBox!=null){if(this.editBox!=null&&this.oldHeight!=null){this.editBox.style.height=this.oldHeight+"px";this.oldHeight=null;}
spellBox.style.display="none";}},disableItem:function(itemID,disabled)
{},onChangeSuggestions:function()
{var suggSelect=document.getElementById("suggestions");var suggestion=suggSelect.options[suggSelect.selectedIndex].value;if(suggestion!=""){document.getElementById("word").value=suggestion;}},showMessage:function(msg)
{var messageArea=document.getElementById("spellmsg");if(messageArea!=null){messageArea.innerHTML=this.getString(msg);var theBox=document.getElementById("correction");if(theBox!=null){theBox.style.display="none";}
theBox=document.getElementById("sugglabel");if(theBox!=null){theBox.style.display="none";}
theBox=document.getElementById("suggestions");if(theBox!=null){theBox.style.display="none";}
messageArea.style.display="block";}},hideMessage:function()
{var messageArea=document.getElementById("spellmsg");if(messageArea!=null){messageArea.style.display="none";var theBox=document.getElementById("correction");if(theBox!=null){theBox.style.display="";}
theBox=document.getElementById("sugglabel");if(theBox!=null){theBox.style.display="";}
theBox=document.getElementById("suggestions");if(theBox!=null){theBox.style.display="";}}}}
function spellDone(id)
{if(typeof speller!='undefined'&&speller!=null){speller.finish();SpellController.hideController(id);speller=null;}
enableSpell(true);}
function disableItem(itemID,disabled)
{var color=((disabled)?"#999":"#000");var theItem=document.getElementById(itemID);if(theItem!=null){theItem.disabled=disabled;theItem.style.color=color;}}
function changeClick()
{var mainWidth=parseInt(this.offsetWidth);mainWidth-=22;var nOffsetX=(this.Event.layerX)?(this.Event.layerX):this.Event.offsetX;if(nOffsetX>mainWidth){var leMenu=this.Menu;if(leMenu!=null){leMenu.style.zIndex=100;leMenu.Show();leMenu.hideCB=speller.hideShim;showIFrameShim(leMenu);}}else{speller.onChange();}}
function changeMenuClick()
{switch(this.Sender.value){case 0:speller.onChange();break;case 1:speller.onChangeAll();break;default:alert("Unknown change option: "+this.Sender.value);break;}
HideMenu();}
function ignoreClick()
{var mainWidth=parseInt(this.offsetWidth);mainWidth-=22;var nOffsetX=(this.Event.layerX)?(this.Event.layerX):this.Event.offsetX;if(nOffsetX>mainWidth){var leMenu=this.Menu;if(leMenu!=null){leMenu.style.zIndex=100;leMenu.Show();leMenu.hideCB=speller.hideShim;showIFrameShim(leMenu);}}else{speller.onIgnore();}}
function ignoreMenuClick()
{switch(this.Sender.value){case 0:speller.onIgnore();break;case 1:speller.onIgnoreAll();break;default:alert("Unknown this.ignore option: "+this.Sender.value);break;}
HideMenu();}