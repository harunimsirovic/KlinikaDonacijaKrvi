<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Doniranje.aspx.cs" Inherits="Doniranje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <p><br /><br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" HorizontalAlign="Center" Width="125px">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime" />
                <asp:BoundField DataField="Prezime" HeaderText="Prezime" SortExpression="Prezime" />
                <asp:BoundField DataField="JMBG" HeaderText="JMBG" SortExpression="JMBG" />
                <asp:BoundField DataField="Adresa" HeaderText="Adresa" SortExpression="Adresa" />
                <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
                <asp:TemplateField HeaderText="Grupa" SortExpression="Grupa">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Grupa") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="grupa" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Donacije_KrviConnectionString %>" SelectCommand="SELECT [id], [grupa] FROM [Krvna_grupa]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Grupa") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField CancelText="Otkazi" DeleteText="Obrisi" EditText="Izmjeni" InsertText="Ubaci" NewText="Dodaj" SelectText="Oznaci" ShowInsertButton="True" UpdateText="Azuriraj" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Donacije_KrviConnectionString %>" DeleteCommand="DELETE FROM [Donori] WHERE [id] = @id" InsertCommand="INSERT INTO [Donori] ([Ime], [Prezime], [JMBG], [Adresa], [Tel], [Grupa]) VALUES (@Ime, @Prezime, @JMBG, @Adresa, @Tel, @Grupa)" SelectCommand="SELECT * FROM [Donori]" UpdateCommand="UPDATE [Donori] SET [Ime] = @Ime, [Prezime] = @Prezime, [JMBG] = @JMBG, [Adresa] = @Adresa, [Tel] = @Tel, [Grupa] = @Grupa WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ime" Type="String" />
                <asp:Parameter Name="Prezime" Type="String" />
                <asp:Parameter Name="JMBG" Type="String" />
                <asp:Parameter Name="Adresa" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Grupa" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ime" Type="String" />
                <asp:Parameter Name="Prezime" Type="String" />
                <asp:Parameter Name="JMBG" Type="String" />
                <asp:Parameter Name="Adresa" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Grupa" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br /><br />
    </p>


</asp:Content>

