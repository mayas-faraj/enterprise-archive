<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin" MasterPageFile="~/FootMaster.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <strong>
        <br />
        בÊÓÌםב ÇבÏÎזב בדÏםÑ ÇבדזÞÚ ÃÏÎב ÍÓÇÈ דÏםÑ ÇבדזÞÚ<br />
        <br />
    </strong>ÇבדÓÊÎÏד :
    <asp:TextBox ID="usname" runat="server" Width="169px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="usname"
        ErrorMessage="*"></asp:RequiredFieldValidator><br />
    <br />
    ‗בדÉ ÇבÓÑ :
    <asp:TextBox ID="passwo" runat="server" TextMode="Password" Width="159px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="passwo"
        ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:Button ID="signadmin" runat="server" OnClick="signadmin_Click" Text="ÊÓÌםב ÏÎזב דÏםÑ ÇבדזÞÚ" />&nbsp;<br />
    <br />
    <asp:Label ID="warn" runat="server"></asp:Label></asp:Content>
