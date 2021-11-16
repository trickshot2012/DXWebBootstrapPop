<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DXWebApplication20.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <style>
   
        .bimage-validation-failed{
            border-color: red;
            border-style:solid !important;
        }
         .bimage-validation-ok{
            border-color: black;
            border-style:none;
        }
        </style>


     <dx:BootstrapFloatingActionButton runat="server" ID="BsActionButton" ContainerCssSelector="#default-fab" InitialActionContext="c1">
        <Items>
            <dx:BootstrapFABAction ActionName="a1" ContextName="c1"></dx:BootstrapFABAction>
        </Items>
        <ClientSideEvents
            ActionItemClick="OnActionItemClick" />
    </dx:BootstrapFloatingActionButton>

    <dx:BootstrapPopupControl runat="server" ShowFooter="true"
        ClientInstanceName="popupControl" PopupElementCssSelector="#info-popup-control" CloseAction="None" AllowDragging="true"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="true" Width="500px">
        <HeaderTemplate>
            <h4 class="text-primary">
                <span class="fa fa-cart-plus"></span>Add Product
            </h4>
        </HeaderTemplate>
        <FooterTemplate>
            <dx:BootstrapButton runat="server" Text="Cancel" ID="BsButtonBreak">
                <ClientSideEvents Click="function(s, e) { popupControl.Hide(); }" />
                <SettingsBootstrap RenderOption="Primary" />
            </dx:BootstrapButton>
            <dx:BootstrapButton runat="server" Text="OK" ID="BsButtonSave" AutoPostBack="false" UseSubmitBehavior="false">
                <ClientSideEvents Click="conClick" />
                <SettingsBootstrap RenderOption="Primary" />
            </dx:BootstrapButton>
        </FooterTemplate>
        <ContentCollection>
            <dx:ContentControl>
                <dx:BootstrapBinaryImage runat="server" ClientInstanceName="BsImageNewC" ID="BsImageNew">
                    <EditingSettings Enabled="true" AllowDropOnPreview="true" EmptyValueText="Drop image here" />
                    <ClientSideEvents ValueChanged="OnValueChanged" />
                </dx:BootstrapBinaryImage>
                <br />
                <b>Name:
                    <dx:BootstrapTextBox ID="BsTextboxArtikelbez" runat="server">
                        <ValidationSettings ValidationGroup="Validation">
                            <RequiredField IsRequired="true" ErrorText="Name mandatory" />
                        </ValidationSettings>
                    </dx:BootstrapTextBox>
                </b>
                <br />
                <b>Description:</b>
                <dx:BootstrapMemo ID="BsMemoBeschreibung" Rows="4" runat="server"></dx:BootstrapMemo>
                <br />
                <b>Price:</b>
                <dx:BootstrapTextBox Width="100" ID="BsTextBoxPreis" runat="server">
                    <ValidationSettings ValidationGroup="Validation">
                        <RequiredField IsRequired="true" ErrorText="Price mandatory" />
                    </ValidationSettings>
                </dx:BootstrapTextBox>
            </dx:ContentControl>
        </ContentCollection>
    </dx:BootstrapPopupControl>

     <script>
         function OnValueChanged(s, e) {
             if (BsImageNewC.GetValue() != '') {
                 BsImageNewC.GetMainElement().getElementsByClassName("img-thumbnail")[0].className = "img-thumbnail";
             }


         }
         function conClick(s, e) {
             if (BsImageNewC.GetValue() == '')
                 BsImageNewC.GetMainElement().getElementsByClassName("img-thumbnail")[0].className = 'img-thumbnail bimage-validation-failed';
             var isValid = ASPxClientEdit.ValidateGroup('Validation') && BsImageNewC.GetValue();
             if (isValid)
                 popupControl.Hide();
             e.processOnServer = isValid;
         }
         function OnActionItemClick(s, e) {

             if (e.actionName === "a1") {
                 popupControl.Show();
             }
             else if (e.actionName === "Cancel") {
                 gridFAB.CancelEdit();
             }
         }
     </script>

</asp:Content>
