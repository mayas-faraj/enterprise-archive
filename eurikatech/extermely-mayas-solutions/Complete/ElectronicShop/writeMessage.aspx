<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.master" AutoEventWireup="true" CodeFile="writeMessage.aspx.cs" Inherits="writeMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" Runat="Server">
    <table class="Table_WriteMessage">
        <tr>
        <td>الإسم</td>
        <td><asp:TextBox CssClass="TextBox" ID="txName" runat="server" /></td>
        </tr>
        <tr>
        <td>الهاتف</td>
        <td><asp:TextBox CssClass="TextBox" ID="txPhone" runat="server" /></td>
        </tr>
        <tr>
        <td>العنوان</td>
        <td><asp:TextBox CssClass="TextBox" ID="txAddress" runat="server" /></td>
        </tr>
        <tr>
        <td>البريد الإلكتروني</td>
        <td><asp:TextBox CssClass="TextBox" ID="txEmail" runat="server" /></td>
        </tr>
        <tr>
        <td>عنوان الرسالة</td>
        <td><asp:TextBox CssClass="TextBox" ID="txSubject" runat="server" /></td>
        </tr>
        <tr>
        <td>نص الرسالة</td>
        <td><asp:TextBox CssClass="TextBox" ID="txMessage" runat="server" Rows="6" TextMode="MultiLine" /></td>
        </tr>
        <tr>
        <td>شيفرة التحقق</td>
        <td><asp:Image AlternateText="velidation code" id="imgCode" CssClass="Image_Code" runat="server"/></td>
        </tr>
        <tr>
        <td>كتابة الشيفرة</td>
        <td><asp:TextBox CssClass="TextBox" ID="txCode" runat="server" /></td>
        </tr>
        <tr>
        <td colspan="2"><asp:Button CssClass="Button" ID="btnSend" runat="server"  Text="إرسال" OnClick="btnSend_Click"/></td>
        </tr>
        <tr>
        <td colspan=2>
        <asp:Label ID="lblError" runat="server" CssClass="Label_Error" />
        </td>
        </tr>
    </table>
</asp:Content>

