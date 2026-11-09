<%@ Register TagPrefix="cc1" Namespace="MobileCheckbox" Assembly="MobileCheckbox" %>
<%@ Page language="c#" Codebehind="default.aspx.cs" Inherits="MSPress.MobWeb.CheckboxEx._default" AutoEventWireup="false" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<mobile:Form id="Form1" runat="server" title="Facts about Wales">
<mobile:Label id="Label3" runat="server" StyleReference="title">
Facts about Wales:</mobile:Label>
<mobile:Label id="Label2" runat="server">
True or False?:</mobile:Label>
<cc1:Checkbox id="Checkbox1" runat="server"
Text="Capital is Cardiff"></cc1:Checkbox>
<cc1:Checkbox id="Checkbox2" runat="server"
Text="Highest mountain is Snowdon"></cc1:Checkbox>
<cc1:Checkbox id="Checkbox3" runat="server"
Text="Favorite sport is rugby"></cc1:Checkbox>
<mobile:Command id="Command1" runat="server">Next</mobile:Command>
</mobile:Form>
<mobile:Form id="Form2" runat="server" title="Result">
<mobile:Label id="Label1" runat="server"
StyleReference="title">Result</mobile:Label>
<mobile:Label id="result" runat="server">Label</mobile:Label>
</mobile:Form>
