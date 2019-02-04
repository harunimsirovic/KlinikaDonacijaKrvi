<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />
   <center> <table class="auto-style1">
    <tr>
        <td style="text-align: right">Username:</td>
        <td >
            <asp:TextBox ID="Username" runat="server" Width="140px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Username" ErrorMessage="Molimo unesite username" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align: right">Password:</td>
        <td>
            <asp:TextBox ID="Password" runat="server" Width="140px" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="Molimo unesite password" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Label ID="Poruka" runat="server" ForeColor="#CC0000" style="text-align: center"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:logRegConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
        </td>
        <td>
            <asp:Button ID="BtnLogin" runat="server" OnClick="BtnLogin_Click" Text="Login" Width="86px" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" Width="86px" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table> </center>     <br /><br />
</asp:Content>

