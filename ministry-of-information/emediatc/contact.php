<?php //the code that send mail is include in class (class/send_form.php)
$link_url = $_SERVER['QUERY_STRING']; //for request the url
?>
<style type="text/css">
<!--
.style8 {color: #000000}
.style7 {color: #820000}
-->
</style>
<div align="center"> 
  <table width="99%" height="200" border="0" align="right" cellpadding="0" cellspacing="0" bordercolor="#E6E6E0" style="border-width: 0px; margin-top: 3px">
          <form name="form" method="post" action="?<?=$link_url?>&send_form=1">
	<tr>
	  <td align="center" valign="top" class="search_word" style="padding: 5 5 0 0"><br />
	    <table width="1%" border="0" align="center" cellpadding="2" cellspacing="2" class="alltext" dir="<?=$dir?>">
          <?php if(!empty($msg)) {?>
          <tr>
            <td align="left"><center>
            </center></td>
            <td align="center"><font size="2" face="Tahoma" color="#CE0000" class="msg"><?php print $msg;?><br />
              <br />
            </font></td>
            <td align="left">&nbsp;</td>
          </tr>
          <?php }//end if?>
          <tr>
            <td width="1%" nowrap="nowrap" class="form"><?=$frmad['Fullname_form'];?>
              :</td>
            <td width="1%" align="left"><input name="Name" type="text" class="inputform" id="Name" size="20" />            </td>
            <td width="1%" valign="bottom" class="msg">*</td>
          </tr>
          <tr>
            <td width="1%" height="6" nowrap="nowrap" class="form"><?=$frmad['Email_form'];?>
              :</td>
            <td width="1%" height="6" align="left"><input name="E-mail" type="text" class="inputform" id="E-mail" size="20" />            </td>
            <td width="1%" height="6" valign="bottom" class="msg">*</td>
          </tr>
          <tr>
            <td width="1%" nowrap="nowrap" class="form"><?=$frmad['City_form'];?>
              :</td>
            <td width="1%" align="left"><input name="City" type="text" class="inputform" id="City" size="20" />            </td>
            <td width="1%" valign="bottom">&nbsp;</td>
          </tr>
          <tr>
            <td width="1%" height="6" nowrap="nowrap" class="form"><?=$frmad['Country_form'];?>
              :</td>
            <td width="1%" height="6" align="left"><input name="Country" type="text" class="inputform" size="20" align="texttop" id="Country" />            </td>
            <td height="6" width="1%" valign="bottom">&nbsp;</td>
          </tr>
          <tr>
            <td width="1%" height="24" nowrap="nowrap" class="form"><?=$frmad['Tel_form'];?>
              :</td>
            <td width="1%" align="left"><input name="Phone" type="text" class="inputform" id="Phone" size="20" />            </td>
            <td width="1%" valign="bottom">&nbsp;</td>
          </tr>
          <tr>
            <td width="1%" height="6" nowrap="nowrap" class="form"><?=$frmad['Fax_form'];?>
              :</td>
            <td width="1%" height="6" align="left"><input name="Fax" class="inputform" id="Fax" size="20" align="texttop" rows="1" />            </td>
            <td width="1%" height="6" valign="bottom">&nbsp;</td>
          </tr>
          <tr>
            <td width="1%" valign="top" nowrap="nowrap" class="form"><?=$frmad['Comment_form'];?>
              : </td>
            <td width="1%" align="center" valign="top"><textarea name="Comments" cols="70" rows="10" class="textarea"></textarea></td>
            <td width="1%" align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td height="6" valign="middle" nowrap="nowrap" class="form"><?=$frmad['Number_form'];?>
              : </td>
            <td align="<?=$_left;?>" valign="top" class="alltext"><input name="txtNumber" type="text" class="inputform" id="txtNumber" size="30" style="direction:ltr" />
                <img src="class/img.php" alt="" /></td>
            <td align="center" valign="top"><span class="msg">*</span></td>
          </tr>
          <tr>
            <td align="center" valign="top"><strong><font size="2" face="tahoma">
              <input name="Recipient" type="hidden"  id="Recipient"  readonly="" value="<?php if(empty($format_email)){ echo "info@".$_SERVER['HTTP_HOST']; } else {echo $format_email;}?>" size="25" class="inputform" />
            </font></strong></td>
            <td align="center" valign="top"><br />
              &nbsp;
                <input name="Submit" type="submit" class="button" id="Submit" style="cursor:pointer" value="<?=$frmad['Send'];?>" />
              &nbsp;
              <input name="Reset" type="reset" class="button" id="Reset" style="cursor:pointer" value="<?=$frmad['Clear'];?>"/></td>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
      </table></td></tr>
  </form>   
  </table>