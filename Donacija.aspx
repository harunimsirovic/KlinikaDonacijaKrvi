<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Donacija.aspx.cs" Inherits="Donacija" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    

    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="Donor" HeaderText="Donor" ReadOnly="True" SortExpression="Donor" />
            <asp:BoundField DataField="Primaoc" HeaderText="Primaoc" ReadOnly="True" SortExpression="Primaoc" />
            <asp:BoundField DataField="Kolicina(L)" HeaderText="Kolicina(L)" SortExpression="Kolicina(L)" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Donacije_KrviConnectionString %>" SelectCommand="SELECT Donori.Ime + ' ' + Donori.Prezime AS Donor, Primaoci.Ime + ' ' + Primaoci.Prezime AS Primaoc, Donacije.Kolicina AS [Kolicina(L)], Donacije.Datum FROM Donacije INNER JOIN Donori ON Donacije.Donor_id = Donori.id INNER JOIN Primaoci ON Donacije.Primaoc_id = Primaoci.id"></asp:SqlDataSource>
    <br />
    <a href="Doniranje.aspx">Donirajte i Vi krv, već danas.</a><br /><br />


    

</asp:Content>

