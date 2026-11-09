<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
    <mobile:Form id="AnonymousMainForm" runat="server" Alignment="Right" Title="«·’›Õ… «·—∆Ì”Ì…">
        <mobile:Link ID="lnkOurProducts" Runat="server" NavigateUrl="#CategoryListForm">„‰ Ã« ‰‹‹‹‹‹‹‹«</mobile:Link>
        <mobile:Command ID="cmdShoppingCard" Runat="server" Format="Link" OnClick="cmdShoppingCard_Click">”·… «·„‘ —Ì« </mobile:Command>
        <br />
        <br />
        <mobile:Command ID="cmdAdminLog" Runat="server" Format="Link" OnClick="cmdAdminLog_Click"> ”ÃÌ· «·œŒÊ·</mobile:Command>
    </mobile:Form>

    <mobile:Form id="LoginForm" runat="server" Alignment="Right" Title=" ”Ã· œŒÊ·">
        <mobile:Label ID="Label1" Runat="server">«”„ «·„” Œœ„</mobile:Label>
        <br />
        <mobile:TextBox ID="txtUserName" Runat="server">
        </mobile:TextBox>
        <br />
        <mobile:Label ID="Label2" Runat="server">ﬂ·„… «·”—</mobile:Label>
        <mobile:TextBox ID="txtPassword" Runat="server">
        </mobile:TextBox>
        <br />
        <mobile:Command ID="cmdLogin" Runat="server" OnClick="cmdLogin_Click">œŒÊ·</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="LnkBack1" Runat="server" NavigateUrl="#AnonymousMainForm">⁄Êœ…</mobile:Link>

    </mobile:Form>

    <mobile:Form ID="ErrorForm" Runat="server" Alignment="Right" OnActivate="ErrorForm_Activate"
        Title="Œÿ√">
        <mobile:Label ID="lblErrorMessage" Runat="server" Font-Bold="True" ForeColor="Maroon">
        </mobile:Label>
        <br />
        <br />
        <mobile:Link ID="lnkBack4" Runat="server">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="InfoForm" Runat="server" Alignment="Right" OnActivate="InfoForm_Activate"
        Title="„⁄·Ê„…">
        <mobile:Label ID="lblInfoMessage" Runat="server" Font-Bold="True" ForeColor="Navy">
        </mobile:Label>
        <br />
        <br />
        <mobile:Link ID="lnkBack14" Runat="server">⁄Êœ…</mobile:Link>
    </mobile:Form>

    <mobile:Form ID="CategoryListForm" Runat="server" Alignment="Right" 
        PagerStyle-NextPageText="«· «·Ì" PagerStyle-PreviousPageText="«·”«»ﬁ" Paginate="True"
        Title="·«∆Õ… «·√’‰«›" OnActivate="CategoryListForm_Activate"><mobile:Label ID="lblCategoryListTitle" Runat="server" Alignment="Center"
            Font-Bold="True" Font-Size="Large">«·√’‰«›</mobile:Label> <br /><mobile:ObjectList
                ID="oLstCategories" Runat="server" AutoGenerateFields="False" BackCommandText="⁄Êœ…"
                CommandStyle-StyleReference="subcommand" DefaultCommand="DisplayProducts" DetailsCommandText=" ›«’Ì·"
                LabelStyle-StyleReference="title" MoreText=" ›«’Ì·" OnItemCommand="oLstCategories_ItemCommand" >
                <Command Name="DisplayProducts" Text="«·„Ê«œ" />
                <Field DataField="Cat_Name" Name="Cat_Name" Title="«·’‰›" />
                <Field DataField="Cat_Description" Name="Cat_Description" Title=" Ê’Ì›" />
                <Field DataField="Cat_Id" Name="Cat_Id" Visible="False" />
</mobile:ObjectList><br />&nbsp;&nbsp; <br /><mobile:Link ID="lnkBack2" Runat="server"
                NavigateUrl="#AnonymousMainForm">⁄Êœ…</mobile:Link></mobile:Form>

    <mobile:Form ID="ProductListForm" Runat="server" Alignment="Right" 
        PagerStyle-NextPageText="«· «·Ì" PagerStyle-PreviousPageText="«·”«»ﬁ" Paginate="True"
        Title="·«∆Õ… «·„Ê«œ" OnActivate="ProductListForm_Activate"><mobile:Label ID="lblProductListTitle" Runat="server" Alignment="Center"
            Font-Bold="True" Font-Size="Large">«·„Ê«œ</mobile:Label> <br /><mobile:Label ID="Label26"
                Runat="server" BreakAfter="False">«· ’‰Ì›</mobile:Label> <mobile:SelectionList ID="slstProdListCats"
                    Runat="server" BreakAfter="False" DataTextField="Cat_Name" DataValueField="Cat_Id">
                </mobile:SelectionList> <mobile:Command ID="cmdGetCatProds" Runat="server" OnClick="cmdGetCatProds_Click"  >Ã·»</mobile:Command> <br /><mobile:Label ID="Label3" Runat="server" Alignment="Center"
            Font-Bold="True" Font-Size="Large">«·„«œ…</mobile:Label><mobile:List
                        ID="lstCatProducts" Runat="server" DataTextField="Prod_Name" DataValueField="Prod_Id" OnItemCommand="lstCatProducts_ItemCommand">
                    </mobile:List>&nbsp;&nbsp; <br /><mobile:Link ID="lnkBack5" Runat="server" NavigateUrl="#CategoryListForm">⁄Êœ…</mobile:Link></mobile:Form><br>
</br>
    <mobile:Form ID="ProductCardForm" Runat="server" Alignment="Right" OnActivate="ProductCardForm_Activate"
        Title="„Ê«’›«  «·„«œ…">
        <mobile:Label ID="Label7" Runat="server" Alignment="Center" Font-Bold="True">„Ê«’›«  «·„«œ…</mobile:Label>
        <mobile:Label ID="lblProductCardProductName" Runat="server" Alignment="Center" Font-Bold="True" ForeColor="DarkBlue">
        </mobile:Label>
        <br />
        <mobile:Label ID="Label9" Runat="server" Font-Bold="True">«·Ê’›</mobile:Label>
        <mobile:Label ID="lblProductCardProductDesc" Runat="server" ForeColor="Crimson" Wrapping="Wrap">
        </mobile:Label>
        <mobile:Label ID="Label29" Runat="server" Font-Bold="True">«·”⁄—</mobile:Label>
        <mobile:Label ID="lblProuctCardPrice" Runat="server" ForeColor="Crimson">
        </mobile:Label>
        <br />
        <mobile:Image ID="imgProductCardImage" Runat="server">
        </mobile:Image>
        <br />
        <mobile:Label ID="Label31" Runat="server" BreakAfter="False" Font-Bold="True">«·√ÕÃ«„</mobile:Label>
        <mobile:List ID="lstProductCardSize" Runat="server" DataTextField="Size_Name" DataValueField="Prod_Size_Id">
        </mobile:List>
        <br />
        <mobile:Label ID="Label32" Runat="server" BreakAfter="False" Font-Bold="True">«·√·Ê«‰</mobile:Label>
        <mobile:List ID="lstProductCardColor" Runat="server" DataTextField="Color_Name" DataValueField="Prod_Color_Id">
        </mobile:List>
        <br />
        <mobile:Command ID="cmdAddToCard" Runat="server" OnClick="cmdAddToCard_Click">≈÷«›… ≈·Ï ”·… «·‘—«¡</mobile:Command>
        <br />
        <mobile:Link ID="Link1" Runat="server" NavigateUrl="#ProductListForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="ProductPropertiesForm" Runat="server" Title=" ›«’Ì· «·„«œ…" Alignment="Right" OnActivate="ProductPropertiesForm_Activate">
        <mobile:Label ID="Label8" Runat="server" BreakAfter="True">«·ÕÃ„</mobile:Label>
        <mobile:SelectionList ID="slstOneProductSize" Runat="server" DataTextField="Size_Name"
            DataValueField="Prod_Size_Id">
        </mobile:SelectionList>
        <mobile:Label ID="Label28" Runat="server" BreakAfter="True">«··Ê‰</mobile:Label>
        <mobile:SelectionList ID="slstOneProductColor" Runat="server" DataTextField="Color_Name"
            DataValueField="Prod_Color_Id">
        </mobile:SelectionList>
        <mobile:Label ID="Label30" Runat="server" BreakAfter="True">«·ﬂ„Ì…</mobile:Label>
        <mobile:TextBox ID="txtOneProductQty" Runat="server" Numeric="True">1</mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVOneProductPrice" Runat="server" ControlToValidate="txtOneProductQty"
            ErrorMessage="√œŒ· «·ﬂ„Ì…">√œŒ· «·ﬂ„Ì…</mobile:RequiredFieldValidator>
        <mobile:CompareValidator ID="compVOneProductPrice" Runat="server" ControlToValidate="txtOneProductQty"
            ErrorMessage="√œŒ· ﬁÌ„… —ﬁ„Ì… ··ﬂ„Ì…" Operator="DataTypeCheck" Type="Integer">√œŒ· ﬁÌ„… —ﬁ„Ì… ··ﬂ„Ì…</mobile:CompareValidator>
        <mobile:RangeValidator ID="rngVOneProductPrice" Runat="server" ControlToValidate="txtOneProductQty"
            ErrorMessage="√œŒ· ﬂ„Ì… »Ì‰ 1 Ê 99" MaximumValue="999" MinimumValue="1" Type="Integer">√œŒ· ﬂ„Ì… »Ì‰ 1 Ê 999</mobile:RangeValidator>
        <mobile:Command ID="cmdAddProductToCard" Runat="server" OnClick="cmdAddProductToCard_Click">Õ›Ÿ</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="Link2" Runat="server" NavigateUrl="#ProductCardForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="ConfirmNewCardForm" Runat="server" Title=" √ﬂÌœ «·»ÿ«ﬁ… «·ÃœÌœ…" Alignment="Right">
        <mobile:Label ID="Label33" Runat="server" Font-Bold="True">·« ÌÊÃœ √Ì »ÿ«ﬁ… ‘—«¡ ›⁄«·… , Â·  —Ìœ ≈‰‘«¡ »ÿ«ﬁ… ÃœÌœ…ø</mobile:Label>
        <br />
        <br />
        <mobile:Command ID="cmdConfirmNewCard" Runat="server" OnClick="cmdConfirmNewCard_Click">≈‰‘«¡ »ÿ«ﬁ… ÃœÌœ…</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="Link3" Runat="server" NavigateUrl="#AnonymousMainForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="CardForm" Runat="server" Alignment="Right" Title="»ÿ«ﬁ… ‘—«¡" PagerStyle-NextPageText="«· «·Ì" PagerStyle-PreviousPageText="«·”«»ﬁ" Paginate="True"><mobile:Label ID="Label4" Runat="server" BreakAfter="False" Font-Bold="True">      «·—ﬁ„</mobile:Label> <mobile:Label ID="lblCardNum" Runat="server" ForeColor="Crimson">
        </mobile:Label> <mobile:Label ID="Label5" Runat="server" BreakAfter="False" Font-Bold="True">       «—ÌŒ ÊÊﬁ  «·≈‰‘«¡</mobile:Label> <mobile:Label ID="lblCardCreateDate" Runat="server" ForeColor="Crimson">
        </mobile:Label> <mobile:Label ID="Label6" Runat="server" BreakAfter="False" Font-Bold="True">      «·„Ã„Ê⁄</mobile:Label> <mobile:Label ID="lblCardTotal" Runat="server" ForeColor="Crimson">
        </mobile:Label><br /><br /><mobile:Link ID="lnkOurProducts2" Runat="server" NavigateUrl="#CategoryListForm">≈÷«›… „«œ…</mobile:Link>&nbsp; <br /><mobile:ObjectList ID="oLstCardProducts" Runat="server" AutoGenerateFields="False"
            BackCommandText="⁄Êœ…" CommandStyle-StyleReference="subcommand" DefaultCommand="DisplayProduct"
            DetailsCommandText=" ›«’Ì·" LabelStyle-StyleReference="title" MoreText=" ›«’Ì·" LabelField="Full_Product_Name" OnItemCommand="oLstCardProducts_ItemCommand">
            <Command Name="DisplayProduct" Text="⁄—÷" />
            <Command Name="Delete" Text="Õ–›" />
            <Field DataField="Full_Product_Name" Name="Full_Product_Name" Title="«·„«œ…" />
            <Field DataField="Prod_Name" Name="Prod_Name" Title="«”„ «·„«œ…" />
            <Field DataField="Cat_Name" Name="Cat_Name" Title="«· ’‰Ì›" />
            <Field DataField="Size_Name" Name="Size_Name" Title="«·ÕÃ„" />
            <Field DataField="Color_Name" Name="Color_Name" Title="«··Ê‰" />
            <Field DataField="Price" Name="Price" Title="«·”⁄—" />
            <Field DataField="Qty" Name="Qty" Title="«·ﬂ„Ì…" />
            <Field DataField="Card_Detail_Id" Name="Card_Detail_Id" Visible="False" />
            <Field DataField="Prod_Id" Name="Prod_Id" Visible="False" />
            <Field DataField="Prod_Size_Id" Name="Prod_Size_Id" Visible="False" />
            <Field DataField="Prod_Color_Id" Name="Prod_Color_Id" Visible="False" />
</mobile:ObjectList><br /><br /><mobile:Command ID="cmdSubmitOrder" Runat="server" Format="Link" OnClick="cmdSubmitOrder_Click">≈—”«· «·ÿ·»</mobile:Command> <br /><mobile:Link ID="lnkBack6" Runat="server" NavigateUrl="#AnonymousMainForm">⁄Êœ…</mobile:Link></mobile:Form>

    <mobile:Form ID="CardDetailForm" Runat="server" Alignment="Right" OnActivate="CardDetailForm_Activate"
        Title="„Ê«’›«  «·„«œ…">
        <mobile:Label ID="Label10" Runat="server" Alignment="Center" Font-Bold="True">„Ê«’›«  «·„«œ…</mobile:Label>
        <mobile:Label ID="lblCardDetailProdName" Runat="server" Alignment="Center" Font-Bold="True" ForeColor="DarkCyan">
        </mobile:Label>
        <br />
        <mobile:Label ID="Label12" Runat="server" Font-Bold="True">«·Ê’›</mobile:Label>
        <mobile:Label ID="lblCardDetailDescription" Runat="server" ForeColor="Crimson" Wrapping="Wrap">
        </mobile:Label>
        <mobile:Label ID="Label13" Runat="server" Font-Bold="True">«·”⁄—</mobile:Label>
        <mobile:Label ID="lblCardDetailPrice" Runat="server" ForeColor="Crimson">
        </mobile:Label>
        <br />
        <mobile:Image ID="imgCardDetailImgage" Runat="server">
        </mobile:Image>
        <br />
        <mobile:Label ID="Label11" Runat="server" BreakAfter="False">«·ÕÃ„</mobile:Label>
        <mobile:SelectionList ID="slstCardDetailSize" Runat="server" DataTextField="Size_Name"
            DataValueField="Prod_Size_Id">
        </mobile:SelectionList>
        <br />
        <mobile:Label ID="Label14" Runat="server" BreakAfter="False">«··Ê‰</mobile:Label>
        <mobile:SelectionList ID="slstCardDetailColor" Runat="server" DataTextField="Color_Name"
            DataValueField="Prod_Color_Id">
        </mobile:SelectionList>
        <br />
        <mobile:Label ID="Label15" Runat="server" BreakAfter="False">«·ﬂ„Ì…</mobile:Label>
        <mobile:TextBox ID="txtCardDetailQty" Runat="server" Numeric="True">1</mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVCardDetailPrice" Runat="server" ControlToValidate="txtCardDetailQty"
            ErrorMessage="√œŒ· «·ﬂ„Ì…">√œŒ· «·ﬂ„Ì…</mobile:RequiredFieldValidator>
        <mobile:CompareValidator ID="cmpVCardDetailPrice" Runat="server" ControlToValidate="txtCardDetailQty"
            ErrorMessage="√œŒ· ﬁÌ„… —ﬁ„Ì… ··ﬂ„Ì…" Operator="DataTypeCheck" Type="Integer">√œŒ· ﬁÌ„… —ﬁ„Ì… ··ﬂ„Ì…</mobile:CompareValidator>
        <mobile:RangeValidator ID="rngVCardDetailPrice" Runat="server" ControlToValidate="txtCardDetailQty"
            ErrorMessage="√œŒ· ﬂ„Ì… »Ì‰ 1 Ê 99" MaximumValue="999" MinimumValue="1" Type="Integer">√œŒ· ﬂ„Ì… »Ì‰ 1 Ê 999</mobile:RangeValidator>
        <br />
        <mobile:Command ID="cmdSaveCardDetail" Runat="server" OnClick="cmdSaveCardDetail_Click">Õ›Ÿ</mobile:Command>
        <br />
        <mobile:Command ID="cmdDeleteCardDetail" Runat="server" OnClick="cmdDeleteCardDetail_Click" ForeColor="#C00000">Õ–›</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="lnkBack10" Runat="server" NavigateUrl="#CardForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="ConfirmDeleteForm" Runat="server" Alignment="Right" OnActivate="ConfirmDeleteForm_Activate"
        Title="Õ–› ”Ã·">
        <mobile:Label ID="Label16" Runat="server" Alignment="Center" Font-Bold="True" ForeColor="Crimson">”Ì „ Õ–› «·”Ã· «·„Õœœ, Â·  —Ìœ «·„ «»⁄…ø</mobile:Label>
        <br />
        <br />
        <mobile:Command ID="cmdDoDelete" Runat="server" OnClick="cmdDoDelete_Click">Õ–›</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="lnkBack11" Runat="server" NavigateUrl="#AnonymousMainForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="SubmitCardForm" Runat="server" Alignment="Right" OnActivate="SubmitCardForm_Activate"
        Title="≈—”«· «·ÿ·»">
        <mobile:Label ID="Label17" Runat="server" Alignment="Center" Font-Bold="True" ForeColor="MidnightBlue">”Ì „ ≈—”«· «·ÿ·» ⁄‰œ « „«„ «·„⁄·Ê„«  «· «·Ì…</mobile:Label>
        <br />
        <br />
        <mobile:Label ID="Label18" Runat="server">«· «—ÌŒ</mobile:Label>
        <br />
        <mobile:Label ID="lblOrder_Date" Runat="server">
        </mobile:Label>
        <br />
        <mobile:Label ID="Label23" Runat="server">«·ﬁÌ„… «·ﬂ·Ì…</mobile:Label>
        <mobile:Label ID="lblOrder_Total" Runat="server" Font-Bold="True">
        </mobile:Label>
        <br />
        <mobile:Label ID="Label25" Runat="server"> ﬂ·›… «·‘Õ‰  = 10% «·ﬁÌ„… «·ﬂ·Ì… </mobile:Label>
        <mobile:Label ID="lblOrder_Freight" Runat="server" Font-Bold="True">
        </mobile:Label>
        <br />
        <br />
        <mobile:Label ID="Label19" Runat="server">«·«”„</mobile:Label>
        <mobile:TextBox ID="txtOrder_Name" Runat="server">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVOrder_Name" Runat="server" ControlToValidate="txtOrder_Name"
            ErrorMessage="√œŒ· «·«”„">√œŒ· «·«”„</mobile:RequiredFieldValidator>
        <br />
        <mobile:Label ID="Label20" Runat="server">«·»·œ</mobile:Label>
        <mobile:TextBox ID="txtOrder_Country" Runat="server">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVOrder_Country" Runat="server" ControlToValidate="txtOrder_Country"
            ErrorMessage="√œŒ· «·«”„">√œŒ· «·»·œ</mobile:RequiredFieldValidator>
        <br />
        <mobile:Label ID="Label21" Runat="server">«·„œÌ‰…</mobile:Label>
        <mobile:TextBox ID="txtOrder_City" Runat="server">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVOrder_City" Runat="server" ControlToValidate="txtOrder_City"
            ErrorMessage="√œŒ· «·«”„">√œŒ· «·„œÌ‰…</mobile:RequiredFieldValidator>
        <br />
        <mobile:Label ID="Label22" Runat="server">«·⁄‰Ê«‰</mobile:Label>
        <mobile:TextBox ID="txtOrder_Address" Runat="server">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVOrder_Address" Runat="server" ControlToValidate="txtOrder_City"
            ErrorMessage="√œŒ· «·«”„">√œŒ· «·⁄‰Ê«‰</mobile:RequiredFieldValidator>
        <br />
        <br />
        <mobile:Command ID="cmdDoSubmit" Runat="server" OnClick="cmdDoSubmit_Click">≈—”«· «·ÿ·»</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="lnkBack12" Runat="server" NavigateUrl="#CardForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="OrderSubmittedForm" Runat="server" Alignment="Right" OnActivate="OrderSubmittedForm_Activate"
        Title=" „ ≈—”«· «·ÿ·»">
        <mobile:Label ID="Label24" Runat="server" Alignment="Right">·ﬁœ  „ ≈—”«· «·ÿ·» »‰Ã«Õ</mobile:Label>
        <mobile:Label ID="Label27" Runat="server" Alignment="Right">«·—Ã«¡  ”ÃÌ· «·—ﬁ„ «· «·Ì ··ÿ·» «·„—”·</mobile:Label>
        <br />
        <br />
        <mobile:Label ID="lblSubmittedOrderId" Runat="server" Alignment="Center" Font-Bold="True" Font-Size="Large" ForeColor="Black">
        </mobile:Label>
        <br />
        <br />
        <mobile:Link ID="lnkBack13" Runat="server" NavigateUrl="#AnonymousMainForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
</body>
</html>
