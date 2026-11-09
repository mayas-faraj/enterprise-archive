<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
    <mobile:Form ID="AdminMainForm" Runat="server" Alignment="Right" Title="«·’›Õ… «·—∆”Ì… - ≈œ«—…">
        <mobile:Link ID="lnkManageCategories" Runat="server" NavigateUrl="#CategoryListForm">≈œ«—… «·√’‰«›</mobile:Link>
        <mobile:Link ID="lnkManageProducts" Runat="server" NavigateUrl="#ProductListForm">≈œ«—… «·„Ê«œ</mobile:Link>
        <br />
        <mobile:Link ID="lnkDisplayCards" Runat="server" NavigateUrl="#DisaplayAllOrderForm">⁄—÷ «·ÿ·»« </mobile:Link>
        <br />
        <mobile:Link ID="lnkCleanCards" Runat="server" NavigateUrl="#CleanCardsForm"> ›—Ì€ «·»ÿ«ﬁ« </mobile:Link>
        <br />
        <mobile:Command ID="cmdLogout" Runat="server" Format="Link" OnClick="cmdLogout_Click"> ”ÃÌ· «·Œ—ÊÃ</mobile:Command>
    </mobile:Form>&nbsp;<br>
</br>
    <mobile:Form ID="ErrorForm" Runat="server" Alignment="Right" OnActivate="ErrorForm_Activate"
        Title="Œÿ√">
        <mobile:Label ID="lblErrorMessage" Runat="server" Font-Bold="True" ForeColor="Maroon">
        </mobile:Label>
        <br />
        <br />
        <mobile:Link ID="lnkBack4" Runat="server">⁄Êœ…</mobile:Link>
    </mobile:Form><br>
</br>
    <mobile:Form ID="CategoryListForm" Runat="server" Alignment="Right" OnActivate="CategoryListForm_Activate"
        Paginate="True" Title="·«∆Õ… «·√’‰«›" PagerStyle-NextPageText="«· «·Ì" PagerStyle-PreviousPageText="«·”«»ﬁ">
        <mobile:Label ID="lblCategoryListTitle" Runat="server" Alignment="Center" Font-Bold="True"
            Font-Size="Large">«·√’‰«›</mobile:Label>
        <br />
        <mobile:ObjectList ID="oLstCategories" Runat="server" AutoGenerateFields="False"
            BackCommandText="⁄Êœ…" CommandStyle-StyleReference="subcommand" DefaultCommand="Edit" LabelStyle-StyleReference="title" MoreText=" ›«’Ì·"
            OnItemCommand="oLstCategories_ItemCommand">
            <Command Name="Edit" Text=" ⁄œÌ·" />
            <Field DataField="Cat_Name" Name="Cat_Name" Title="«·’‰›" />
            <Field DataField="Cat_Description" Name="Cat_Description" Title=" Ê’Ì›" />
            <Field DataField="Cat_Id" Name="Cat_Id" Visible="False" />
        </mobile:ObjectList>
        <mobile:Label ID="lblCatListCount" Runat="server" Font-Size="Small">
        </mobile:Label>
        <mobile:Command ID="cmdAddCategory" Runat="server" OnClick="cmdAddCategory_Click">≈÷«›…</mobile:Command>
        <br />
        <mobile:Link ID="lnkBack2" Runat="server" NavigateUrl="#AdminMainForm">⁄Êœ…</mobile:Link>
    </mobile:Form><br>
</br>
    <mobile:Form ID="CategoryForm" Runat="server" Alignment="Right" OnActivate="CategoryForm_Activate"
        Title="„⁄·Ê„«  ’‰›">
        <mobile:Label ID="llbCategoryTitle" Runat="server" Alignment="Center" Font-Bold="True"
            Font-Size="Large">„⁄·Ê„«  «·’‰›</mobile:Label>
        <br />
        <mobile:Label ID="Label7" Runat="server" BreakAfter="False" ForeColor="Red">*</mobile:Label>
        <mobile:Label ID="Label4" Runat="server">«”„ «·’‰›</mobile:Label>
        <mobile:TextBox ID="txtCat_Name" Runat="server">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVCat_Name" Runat="server" ControlToValidate="txtCat_Name"
            ErrorMessage="√œŒ· «”„ «·’‰›">√œŒ· «”„ «·’‰›</mobile:RequiredFieldValidator>
        <mobile:Label ID="Label5" Runat="server">«· Ê’Ì›</mobile:Label>
        <mobile:TextBox ID="txtCat_Description" Runat="server">
        </mobile:TextBox>
        <mobile:Command ID="cmdSaveCategory" Runat="server" OnClick="cmdSaveCategory_Click"
            SoftkeyLabel="Save">Õ›Ÿ</mobile:Command>
        <br />
        <mobile:Link ID="lnkBack3" Runat="server" NavigateUrl="#CategoryListForm">⁄Êœ…</mobile:Link>
    </mobile:Form><br>
</br>
    <mobile:Form ID="ProductListForm" Runat="server" Alignment="Right" Paginate="True"
        Title="·«∆Õ… «·„Ê«œ" OnActivate="ProductListForm_Activate" PagerStyle-NextPageText="«· «·Ì" PagerStyle-PreviousPageText="«·”«»ﬁ">
        <mobile:Label ID="lblProductListTitle" Runat="server" Alignment="Center" Font-Bold="True"
            Font-Size="Large">«·„Ê«œ</mobile:Label>
        <br />
        <mobile:Label ID="Label3" Runat="server" BreakAfter="False">«· ’‰Ì›</mobile:Label>
        <mobile:SelectionList ID="slstProdListCats" Runat="server" DataTextField="Cat_Name"
            DataValueField="Cat_Id" BreakAfter="False">
        </mobile:SelectionList>
        <mobile:Command ID="cmdGetCatProds" Runat="server" OnClick="cmdGetCatProds_Click">Ã·»</mobile:Command>
        <br />
        <mobile:ObjectList ID="oLstProduct" Runat="server" AutoGenerateFields="False" BackCommandText="⁄Êœ…"
            CommandStyle-StyleReference="subcommand" DefaultCommand="Edit" DetailsCommandText=" ›«’Ì·"
            LabelStyle-StyleReference="title" MoreText=" ›«’Ì·" OnItemCommand="OLstProduct_ItemCommand">
            <Command Name="Edit" Text=" ⁄œÌ·" />
            <Field DataField="Prod_Name" Name="Prod_Name" Title="«·„«œ…" />
            <Field DataField="Prod_Description" Name="Prod_Description" Title=" Ê’Ì›" />
            <Field DataField="Price" Name="Price" Title="«·”⁄—" />
            <Field DataField="Prod_Id" Name="Prod_Id" Visible="False" />
        </mobile:ObjectList>
        <mobile:Label ID="lblProdListCount" Runat="server" Font-Size="Small">
        </mobile:Label>
        <mobile:Command ID="cmdAddProduct" Runat="server" OnClick="cmdAddProduct_Click">≈÷«›…</mobile:Command>
        <br />
        <mobile:Link ID="lnkBack5" Runat="server" NavigateUrl="#AdminMainForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="ProductForm" Runat="server" Alignment="Right" OnActivate="ProductForm_Activate"
        Title="„⁄·Ê„«  „«œ…"><mobile:Label ID="lblProductTitle" Runat="server" Alignment="Center"
            Font-Bold="True" Font-Size="Large">„⁄·Ê„«  «·„«œ…</mobile:Label> <br /><mobile:Label
                ID="Label2" Runat="server" BreakAfter="False" ForeColor="Red">*</mobile:Label><mobile:Label
                    ID="Label6" Runat="server">«”„ «·„«œ…</mobile:Label> <mobile:TextBox ID="txtProd_Name"
                        Runat="server">
                    </mobile:TextBox> <mobile:RequiredFieldValidator ID="reqVProd_Name" Runat="server"
                        ControlToValidate="txtProd_Name" ErrorMessage="√œŒ· «”„ «·’‰›">√œŒ· «”„ «·„«œ…</mobile:RequiredFieldValidator><mobile:Label
                            ID="Label8" Runat="server">«· Ê’Ì›</mobile:Label><mobile:TextBox ID="txtProd_Decription"
                                Runat="server">
                            </mobile:TextBox> <mobile:Label
                ID="Label9" Runat="server" BreakAfter="False" ForeColor="Red">*</mobile:Label> <mobile:Label ID="Label1" Runat="server">«· ’‰Ì›</mobile:Label> <mobile:SelectionList
                                ID="slstProdCat" Runat="server" DataTextField="Cat_Name" DataValueField="Cat_Id"></mobile:SelectionList><mobile:CustomValidator ID="cusVCat" Runat="server" ControlToValidate="slstProdCat"
                    ErrorMessage="«Œ — «· ’‰Ì›" OnServerValidate="cusVCat_ServerValidate">«Œ — «· ’‰Ì›</mobile:CustomValidator> <mobile:Label
                ID="Label10" Runat="server" BreakAfter="False" ForeColor="Red">*</mobile:Label><mobile:Label
                            ID="Label11" Runat="server">«·”⁄—</mobile:Label><mobile:TextBox ID="txtPrice"
                                Runat="server">
                            </mobile:TextBox> <mobile:RequiredFieldValidator ID="reqVPrice" Runat="server" ControlToValidate="txtPrice"
                                ErrorMessage="√œŒ· «·”⁄—">√œŒ· «·”⁄—</mobile:RequiredFieldValidator> <mobile:CompareValidator
                                    ID="cmpVPrice" Runat="server" ControlToValidate="txtPrice" ErrorMessage="√œŒ· —ﬁ„« ··”⁄—"
                                    Operator="DataTypeCheck" Type="Double">√œŒ· —ﬁ„« ··”⁄—</mobile:CompareValidator> <mobile:RangeValidator
                                        ID="rngVPrice" Runat="server" ControlToValidate="txtPrice" ErrorMessage="ÌÃ» √‰ ÌﬂÊ‰ «·”⁄— √ﬂ»— „‰ «·’›—"
                                        MaximumValue="1000000" Type="Double" MinimumValue="0">ÌÃ» √‰ ÌﬂÊ‰ «·”⁄— √ﬂ»— „‰ «·’›—</mobile:RangeValidator> <mobile:Link ID="lnkProcutSizes" Runat="server" Wrapping="Wrap" NavigateUrl="#ProductSizeForm">«·√ÕÃ«„</mobile:Link><mobile:Link
                                ID="lnkProcutColors" Runat="server" Wrapping="Wrap" NavigateUrl="#ProductColorForm">«·√·Ê«‰</mobile:Link>&nbsp; <mobile:Label
                                    ID="Label18" Runat="server">«”„ „·› «·’Ê—…</mobile:Label> <mobile:TextBox ID="txtImage_File_Name"
                                        Runat="server">
                                    </mobile:TextBox>&nbsp;<mobile:Command ID="cmdDisplayProductImage" Runat="server"
                                        CausesValidation="False" OnClick="cmdDisplayProductImage_Click">⁄—÷ «·’Ê—…</mobile:Command> <mobile:Image
                                    ID="imgProductImage" Runat="server" Alignment="Right" AlternateText="«÷€ÿ · Õ„Ì· «·’Ê—…"></mobile:Image><br />&nbsp;&nbsp;&nbsp;<br /><mobile:Command ID="cmdSaveProduct" Runat="server"
                                    SoftkeyLabel="Save" CommandName="PrimarySave" OnItemCommand="cmdSaveProduct_ItemCommand">Õ›Ÿ</mobile:Command> <br /><mobile:Link ID="lnkBack6" Runat="server"
                                        NavigateUrl="#ProductListForm">⁄Êœ…</mobile:Link></mobile:Form>
    <mobile:Form ID="SaveProductForm" Runat="server" Alignment="Right" Title="Õ›Ÿ «·„«œ…">ÌÃ» √‰  ﬁÊ„ »Õ›Ÿ «·„«œ… √Ê·« , ≈–« ﬂ‰   —Ìœ Õ›ŸÂ« «·¬‰ «÷€ÿ ⁄·Ï “— «·Õ›Ÿ:<br /><br /><mobile:Command ID="cmdSaveProduct2" Runat="server"
                                    SoftkeyLabel="Save" CommandName="SecondarySave" OnItemCommand="cmdSaveProduct_ItemCommand">Õ›Ÿ</mobile:Command><br /><br /><mobile:Link ID="lnkBack7" Runat="server"
                                        NavigateUrl="#ProductForm">⁄Êœ…</mobile:Link></mobile:Form>
    <mobile:Form ID="ProductSizeForm" Runat="server" Alignment="Right" Title="√ÕÃ«„ «·„«œ…" OnActivate="ProductSizeForm_Activate"><mobile:Label ID="lblProductSizeTitle" Runat="server" Alignment="Center" Font-Bold="True"
            Font-Size="Large">√ÕÃ«„ «·„«œ…</mobile:Label>
        <br />
        <br />
        <mobile:TextBox ID="txtSize_Name" Runat="server" BreakAfter="False">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVSize_Name" Runat="server" ControlToValidate="txtSize_Name"
            ErrorMessage="√œŒ· «”„ «·ÕÃ„">√œŒ· «”„ «·ÕÃ„</mobile:RequiredFieldValidator>
        <mobile:Command ID="cmdProdSizeAdd" Runat="server" OnClick="cmdProdSizeAdd_Click">≈÷«›…</mobile:Command>
        <br />
        <br />
        <mobile:ObjectList ID="oLstProdSizes" Runat="server" AutoGenerateFields="False" BackCommandText="⁄Êœ…"
            CommandStyle-StyleReference="subcommand" LabelStyle-StyleReference="title" MoreText=" ›«’Ì·" DataMember="Prod_Size_Id" DefaultCommand="Edit" LabelField="Size_Name" OnItemCommand="oLstProdSizes_ItemCommand">
            <Command Name="Edit" Text=" ⁄œÌ·" />
            <Command Name="Delete" Text="Õ–›" />
            <Field DataField="Size_Name" Name="Size_Name" Title="«·ÕÃ„" />
            <Field DataField="Prod_Size_Id" Name="Prod_Size_Id" Visible="False" />
        </mobile:ObjectList>
        <br />
        <br />
        <mobile:Link ID="lnkBack8" Runat="server"
                                        NavigateUrl="#ProductForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="EditProdSizeForm" Runat="server" Alignment="Right" Title=" ⁄œÌ· ÕÃ„" OnActivate="EditProdSizeForm_Activate">
        <mobile:Label ID="Label12" Runat="server" Alignment="Center" Font-Bold="True"> ⁄œÌ· «·ÕÃ„</mobile:Label>
        <br />
        <mobile:TextBox ID="txtEditSize_Name" Runat="server">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVEditProdSizeName" Runat="server" ControlToValidate="txtEditSize_Name"
            ErrorMessage="√œŒ· «·ÕÃ„">√œŒ· «·ÕÃ„</mobile:RequiredFieldValidator>
        <br />
        <br />
        <mobile:Command ID="cmdEditProdSizeSave" Runat="server"
                                    SoftkeyLabel="Save" OnClick="cmdEditProdSizeSave_Click">Õ›Ÿ</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="lnkBack9" Runat="server"
                                        NavigateUrl="#ProductSizeForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="ProductColorForm" Runat="server" Alignment="Right" Title="√·Ê«‰ «·„«œ…" OnActivate="ProductColorForm_Activate">
        <mobile:Label ID="lblProductColorTitle" Runat="server" Alignment="Center" Font-Bold="True"
            Font-Size="Large">√·Ê«‰ «·„«œ…</mobile:Label>
        <br />
        <br />
        <mobile:TextBox ID="txtColor_Name" Runat="server" BreakAfter="False">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVColor_Name" Runat="server" ControlToValidate="txtColor_Name"
            ErrorMessage="√œŒ· «”„ «·ÕÃ„">√œŒ· «”„ «··Ê‰</mobile:RequiredFieldValidator>
        <mobile:Command ID="cmdProdColorAdd" Runat="server" OnClick="cmdProdColorAdd_Click">≈÷«›…</mobile:Command>
        <br />
        <br />
        <mobile:ObjectList ID="oLstProdColors" Runat="server" AutoGenerateFields="False" BackCommandText="⁄Êœ…"
            CommandStyle-StyleReference="subcommand" LabelStyle-StyleReference="title" MoreText=" ›«’Ì·" DataMember="Prod_Color_Id" DefaultCommand="Edit" LabelField="Color_Name" OnItemCommand="oLstProdColors_ItemCommand">
            <Command Name="Edit" Text=" ⁄œÌ·" />
            <Command Name="Delete" Text="Õ–›" />
            <Field DataField="Color_Name" Name="Color_Name" Title="«··Ê‰" />
            <Field DataField="Prod_Color_Id" Name="Prod_Color_Id" Visible="False" />
        </mobile:ObjectList>
        <br />
        <br />
        <mobile:Link ID="lnkBack10" Runat="server"
                                        NavigateUrl="#ProductForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="EditProdColorForm" Runat="server" Alignment="Right" Title=" ⁄œÌ· ·Ê‰" OnActivate="EditProdColorForm_Activate">
        <mobile:Label ID="Label14" Runat="server" Alignment="Center" Font-Bold="True"> ⁄œÌ· «··Ê‰</mobile:Label>
        <br />
        <mobile:TextBox ID="txtEditColor_Name" Runat="server">
        </mobile:TextBox>
        <mobile:RequiredFieldValidator ID="reqVEditProd_Color" Runat="server" ControlToValidate="txtEditColor_Name"
            ErrorMessage="√œŒ· «·ÕÃ„">√œŒ· «··Ê‰</mobile:RequiredFieldValidator>
        <br />
        <br />
        <mobile:Command ID="cmdEditProdColorSave" Runat="server"
                                    SoftkeyLabel="Save" OnClick="cmdEditProdColorSave_Click">Õ›Ÿ</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="lnkBack11" Runat="server"
                                        NavigateUrl="#ProductColorForm">⁄Êœ…</mobile:Link>
    </mobile:Form><mobile:Form ID="DisaplayAllOrderForm" Runat="server" Alignment="Right" Paginate="True"
        Title="⁄—÷ «·ÿ·»« " PagerStyle-NextPageText="«· «·Ì" PagerStyle-PreviousPageText="«·”«»ﬁ">
        <mobile:Label ID="Label17" Runat="server" Alignment="Center" Font-Bold="True">⁄—÷ «·ÿ·»« </mobile:Label>
        <br />
        <br />
        <mobile:Label ID="Label13" Runat="server" BreakAfter="False">«”„ «·“»Ê‰</mobile:Label>
        <mobile:TextBox ID="txtDisplayOrders_Order_Name" Runat="server">
        </mobile:TextBox>
        <mobile:Label ID="Label15" Runat="server" BreakAfter="False">«·»·œ</mobile:Label>
        <mobile:TextBox ID="txtDisplayOrders_Country" Runat="server">
        </mobile:TextBox>
        <mobile:Label ID="Label16" Runat="server" BreakAfter="False">«·„œÌ‰…</mobile:Label>
        <mobile:TextBox ID="txtDisplayOrders_City" Runat="server">
        </mobile:TextBox>
        <br />
        <mobile:Command ID="cmdDisplayOrders" Runat="server" OnClick="cmdDisplayOrders_Click">⁄—÷</mobile:Command>
        <br />
        <br />
        <mobile:ObjectList ID="oLstAllOrders" Runat="server" AutoGenerateFields="False" BackCommandText="⁄Êœ…"
            CommandStyle-StyleReference="subcommand" DetailsCommandText=" ›«’Ì·" LabelStyle-StyleReference="title" OnItemDataBind="oLstAllOrders_ItemDataBind">
            <Field Name="Order_Summary" Title="«·ÿ·»" />
            <Field DataField="Order_Id" Name="Order_Id" Title="—ﬁ„ «·ÿ·»" />
            <Field DataField="Order_Name" Name="Order_Name" Title="«·“»Ê‰" />
            <Field DataField="Order_Date" Name="Order_Date" Title="«· «—ÌŒ" />
            <Field DataField="Order_City" Name="Order_City" Title="«·„œÌ‰…" />
            <Field DataField="Order_Country" Name="Order_Country" Title="«·»·œ" />
            <Field DataField="Order_Total" Name="Order_Total" Title="«·≈Ã„«·Ì" />
            <Field DataField="Order_Freight" Name="Order_Freight" Title="ﬂ·›… «·‘Õ‰" />
        </mobile:ObjectList>
        <mobile:Label ID="lblDisplayAllOrdersCount" Runat="server" Font-Size="Small">
        </mobile:Label>
        <br />
        <br />
        <mobile:Link ID="lnkBack13" Runat="server"
                                        NavigateUrl="#AdminMainForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
    <mobile:Form ID="CleanCardsForm" Runat="server" Alignment="Right" OnActivate="CleanCardsForm_Activate"
        Title=" ›—Ì€ «·ÿ·»«  «·ﬁœÌ…">
        <mobile:Label ID="lblAllCards" Runat="server">≈Ã„«·Ì «·»ÿ«ﬁ« </mobile:Label>
        <mobile:Label ID="lblSubmittedCards" Runat="server">≈Ã„«·Ì «·»ÿ«ﬁ«  «·„À» …</mobile:Label>
        <mobile:Label ID="lblOldUnSubmittedCards" Runat="server">≈Ã„«·Ì «·»ÿ«ﬁ«  €Ì— «·„À» … «·ﬁœÌ„…</mobile:Label>
        <mobile:Label ID="lblNewUnSubmittedCards" Runat="server">≈Ã„«·Ì «·»ÿ«ﬁ«  €Ì— «·„À» … «·ÕœÌÀ…</mobile:Label>
        <br />
        <br />
        <mobile:Command ID="cmdCleanOldCards" Runat="server" OnClick="cmdCleanOldCards_Click"> ›—Ì€ «·»ÿ«ﬁ«  €Ì— «·„À» … «·ﬁœÌ„…</mobile:Command>
        <br />
        <br />
        <mobile:Link ID="lnkBack14" Runat="server"
                                        NavigateUrl="#AdminMainForm">⁄Êœ…</mobile:Link>
    </mobile:Form>
</body>
</html>
