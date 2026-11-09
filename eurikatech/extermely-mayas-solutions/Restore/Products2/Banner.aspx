<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Banner.aspx.cs" Inherits="Banner" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Banner Page</title>
<link type="text/css" href="App_Themes/general.css" rel="stylesheet"/>
</head>
<body class="bannerPage">
<center>
<table class="bannerTable">
<tr><td colspan="3">
<table class="bannerTable">
    <tr>
    <td style="width:30%"></td>
    <td class="bannerImageCell">
        <span class="bannerHeadText">Your Store Name</span><br />
        <span class="bannerSubText">welcome in out store</span>
    </td>
    <td style="width:30%"></td>
    </tr>
</table>
</td></tr>
<tr>
<td style="width:33.3%"><a href="main.aspx" target="content" class="bannerText">الصفحة الرئيسية</a></td>
<td style="width:33.3%"><a href="products.aspx" target="content" class="bannerText">عرض المنتجات</a></td>
<td style="width:33.3%"><a href="comment.aspx" target="content" class="bannerText">أرسل ملاحظاتك</a></td>
</tr>
</table>
</center>
</body>
</html>
