
var noFormWarning=false;var vLng_upl_PROGID="SidebarSynch.SBSynch";var vLng_upl_CLSID="028518E1-9FA8-44FC-92D7-5C54244B5F36";function ReplySMS(p_sFrom,p_sTo)
{var oForm=document.showLetter;var sURI=oForm.ymuri.value;var sURLExtras=oForm.urlextras.value;var sFrom=p_sFrom.replace(/\+/g,'%2b');if(LetterVals.smsintl){var sLocation='/'+sURI+'/ComposeSMS?'+sURLExtras+'&To='+sFrom+"&REP=1&From="+p_sTo+"&.intl="+LetterVals.smsintl;}else{var sLocation='/'+sURI+'/ComposeSMS?'+sURLExtras+'&To='+sFrom+"&REP=1&From="+p_sTo;}
window.location.href=sLocation;}
var pwWarningShown=false;function ShowPwWarning()
{if(!pwWarningShown)
{alert(document.showLetter.passwordwarningmessage.value);pwWarningShown=true;}}
function ShowFormWarning()
{if(noFormWarning)return true;var oForm=document.showLetter;if(window.showModalDialog)
{var sURI=oForm.ymuri.value;var sURLExtras=oForm.urlextras.value;var r=showModalDialog("/"+sURI+"/Static?file=FormWarning.html&"+sURLExtras,null,"dialogWidth:456px;dialogHeight:230px;center:yes;resizeable:no;status:no;help:no;scroll:no");if(r)
{if(r.dontshow)
{noFormWarning=true;window.open("/"+sURI+"/Asynch?op=noformwarn&"+sURLExtras,"asynch");}
return r.send;}
return false;}
else return confirm(oForm.formwarningmessage.value);}
function ShowLinkWarning()
{if(noFormWarning)return true;var oForm=document.showLetter;if(window.showModalDialog)
{var sURI=oForm.ymuri.value;var sURLExtras=oForm.urlextras.value;var r=showModalDialog("/"+sURI+"/Static?file=LinkWarning.html&"+sURLExtras,null,"dialogWidth:456px;dialogHeight:230px;center:yes;resizeable:no;status:no;help:no;scroll:no");if(r)
{if(r.dontshow)
{noFormWarning=true;window.open("/"+sURI+"/Asynch?op=noformwarn&"+sURLExtras,"asynch");}
return r.send;}
return false;}
else return confirm(oForm.linkwarningmessage.value);}
function Reply_Click()
{ResetFields();var oEvent=this.Event;var nOffsetX=(oEvent.layerX)?(oEvent.layerX):oEvent.offsetX;if(nOffsetX>(this.offsetWidth-22))this.Menu.Show();else
{document.compose.REP.value="1";document.compose.submit();}}
function ReplyMenu_Click()
{var oLI=this.Sender.tagName=="LI"?this.Sender:this.Sender.parentNode;if(parseInt(oLI.value)==0)document.compose.REP.value="1";else document.compose.REPA.value="1";document.compose.submit();}
function Forward_Click()
{ResetFields();var oEvent=this.Event;var nOffsetX=(oEvent.layerX)?(oEvent.layerX):oEvent.offsetX;if(nOffsetX>(this.offsetWidth-22))this.Menu.Show();else
{document.compose.FWD.value="1";document.compose.submit();}}
function ForwardMenu_Click()
{var oLI=this.Sender.tagName=="LI"?this.Sender:this.Sender.parentNode;document.compose.FWD.value="1";document.compose.fwopt.value=(parseInt(oLI.value)==0)?'quoted':'attach';document.compose.submit();}
function ResetFields()
{document.compose.REP.value='';document.compose.REPA.value='';document.compose.FWD.value='';}
function Delete_Click(p_oSender)
{var oForm=p_oSender.form;oForm.DEL.value="Delete";oForm.submit();}
function IsControlInstalled()
{if((LetterVals.SidebarSyncActionType||LetterVals.SidebarSyncAuxActionType)&&LetterVals.StateDynamic&&(LetterVals.yplus_browser||LetterVals.premium_user)){try
{var obj=new ActiveXObject(vLng_upl_PROGID);if(obj)
return true;}
catch(e){}
return false;}}
function InsertObjectTag()
{if((LetterVals.SidebarSyncActionType||LetterVals.SidebarSyncAuxActionType)&&LetterVals.StateDynamic&&(LetterVals.yplus_browser||LetterVals.premium_user)){var tag="<OBJECT ID=sbSynch CLASSID=CLSID:"+vLng_upl_CLSID+"></OBJECT>";var here=document.all("iObjectHere");if(here)
here.insertAdjacentHTML("afterBegin",tag);}}
function doSynch()
{if((LetterVals.SidebarSyncActionType||LetterVals.SidebarSyncAuxActionType)&&LetterVals.StateDynamic&&(LetterVals.yplus_browser||LetterVals.premium_user)){if(IsControlInstalled()==true)
{InsertObjectTag();var obj=document.all("sbSynch");if(obj&&obj.object)
{if(LetterVals.SidebarSyncActionType){obj.sbNotify("mail",LetterVals.SidebarSyncActionType,LetterVals.SidebarSyncUID);}
if(LetterVals.SidebarSyncAuxActionType){obj.sbNotify("mail",LetterVals.SidebarSyncAuxActionType,LetterVals.SidebarSyncAuxUID);}}}}}