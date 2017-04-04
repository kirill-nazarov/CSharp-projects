<%@ Page Title="TMS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TMS_WebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1><%: Title %> - Turnover Management System</h1>

    <p>Checklist/Act/Form Search Page</p>

    <asp:DropDownList ID="cboDiscipline" SelectMethod="GetDisciplines"
        AppendDataBoundItems="true" AutoPostBack="true"
        DataTextField="DisciplineName" DataValueField="DisciplineName" runat="server">
        <asp:ListItem Value="" Text="ALL" />
    </asp:DropDownList>

    <asp:GridView ID="formList" runat="server"
        ItemType="TMS_WebForms.Models.Form" DataKeyNames="FormID"
        SelectMethod="GetForms"
        AllowSorting="true"
        AutoGenerateColumns="False" CssClass="table table-bordered">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="LinkToFile" DataTextField="FormName" HeaderText="Name" Target="_blank" SortExpression="FormName" />
            <asp:BoundField DataField="DescriptionEng" HeaderText="Description" SortExpression="DescriptionEng" />
            <asp:BoundField DataField="Discipline.DisciplineName" HeaderText="Discipline" SortExpression="Discipline.DisciplineName" />
            <asp:BoundField DataField="Type.TypeName" HeaderText="Type" SortExpression="Type.TypeName" />
            <asp:BoundField DataField="Phase.PhaseName" HeaderText="Phase" SortExpression="Phase.PhaseName" />
            <asp:BoundField DataField="Revision" HeaderText="Revision" SortExpression="Revision" />
            <asp:BoundField DataField="Date" HeaderText="Date" />
            <asp:BoundField DataField="Status.StatusName" HeaderText="Status" SortExpression="Status.StatusName" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <EmptyDataRowStyle Height="14px" />
        <EmptyDataTemplate>
            Not found
        </EmptyDataTemplate>

        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Wrap="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" Font-Size="Small" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" Font-Size="Small" Height="12px" Wrap="True" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

    </asp:GridView>

</asp:Content>
