<%@ Page Language="C#"%>
  <%@ import namespace="System.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">


<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />

<title>TMS - Turnover Management System</title>


<style type="text/css">
    .auto-style3 {
        text-align: left;
    }

    .auto-style11 {
        background-color: #FFFF00;
    }

    .auto-style12 {
        text-align: right;
        width: 106px;
        padding-right: 5px;
    }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="blue1.css" rel="stylesheet" type="text/css" />
<style type="text/css">

#header {
    top: 0px;
    position: fixed;
    width: 100%;
}

#content {
    margin-top: 60px;
}
    .auto-style3 {
        text-align: center;
        font-size: xx-large;
    }

    .auto-style4 {
        text-align: center;
        font-size: xx-large;
        margin-bottom: 8px;
        margin-top: 5px;
    }

    .auto-style5 {
        margin-bottom: 10px;
    }

    .auto-style13 {
        text-align: left;
        width: 50px;
        padding-right: 5px;
        padding-left: 5px;
        height: 25px;
    }

    .auto-style23 {
        text-align: left;
        width: 50px;
        padding-right: 5px;
        padding-left: 30px;
        height: 25px;
    }

    .auto-style14 {
        width: 137px;
        height: 25px;
    }

    .auto-style15 {
        width: 7px;
        height: 25px;
    }

    .auto-style16 {
        width: 148px;
        height: 25px;
    }

    .auto-style17 {
        width: 23px;
        height: 25px;
    }

    .auto-style18 {
        height: 25px;
    }
</style>
  <script type="text/javascript">
      function hide() {
          document.getElementById('span_hide').style.display = "none";
      }
        </script>
</head>
<body onload = "window.r=false;init();" style="margin-bottom: 0px"> 

<div id="container">

    
	<div id="masthead">

   <div id="header"> 
   <div id="tmsHeadPanel" style="background-color:#DCEFF8">
    <asp:Panel ID="tmsPanel" runat="server" Visible="False">
        <p style="text-align:center; font-size: xx-large;">
		TMS - Turnover Management System
        </p>
    </asp:Panel>
    <button style="width:100%; height:30px;color: #fff;background-color:cornflowerblue;border-color:cadetblue;" type="button"  ID="ButtonTmsPanel" onserverclick="ButtonTmsPanel_Click" runat="server">
        <span id="panelTmsSpan" style="text-align:center;color:beige">FE TMS - Facilities Engineering Turnover Management System</span>
         <span id="Span1" runat="server" style="float:right;color:beige" class="glyphicon glyphicon-chevron-down"></span>
         <span id="Span2" runat="server" style="float:right;color:beige" class="glyphicon glyphicon-chevron-up"></span>
      </button>
    </div>

<script runat="server">

    protected void Filter_Changed(object sender, EventArgs e)
    {
        string FilterStr, Param;
        FilterStr = null;

        FilterStr = " AND ";

        Param = _Category.SelectedItem.Value;
        if (Param != "ALL") { FilterStr = "[Category] = " + Param; };
        if (FilterStr.StartsWith(" AND")) { FilterStr = FilterStr.Substring(5); };
        Param = _Discipline.SelectedItem.Value;
        if (Param != "ALL") { FilterStr = FilterStr + " AND [Discipline] = " + Param; };
        if (FilterStr.StartsWith(" AND")) { FilterStr = FilterStr.Substring(5); };
        Param = _Phase.SelectedItem.Value;
        if (Param != "ALL") { FilterStr = FilterStr + " AND [Phase] = " + Param; };
        if (FilterStr.StartsWith(" AND")) { FilterStr = FilterStr.Substring(5); };

        Param = _Status.SelectedItem.Value;
        if (Param != "ALL") { FilterStr = FilterStr + " AND [Status] = " + Param; };
        if (FilterStr.StartsWith(" AND")) { FilterStr = FilterStr.Substring(5); };

        if (!String.IsNullOrWhiteSpace(_Revision.Text) && IsDigitsOnly(_Revision.Text))
        {
            Param = _Revision.Text;
            FilterStr = FilterStr + " AND [Revision] = " + Param;
            if (FilterStr.StartsWith(" AND")) { FilterStr = FilterStr.Substring(5); };
        }

        if (!String.IsNullOrWhiteSpace(_Name.Text))
        {
            Param = _Name.Text;
            FilterStr = FilterStr + " AND ShortName LIKE '%" + Param + "%'";
            if (FilterStr.StartsWith(" AND")) { FilterStr = FilterStr.Substring(5); };
        }

        if (!String.IsNullOrWhiteSpace(_EngDescr.Text))
        {
            Param = _EngDescr.Text;
            FilterStr = FilterStr + " AND DescriptionEng LIKE '%" + Param + "%'";
            if (FilterStr.StartsWith(" AND")) { FilterStr = FilterStr.Substring(5); };
        }

        SqlDataSource1.FilterExpression = null;
        SqlDataSource1.FilterExpression = FilterStr;


    }

    bool IsDigitsOnly(string str)
    {
        foreach (char c in str)
        {
            if (c < '0' || c > '9')
                return false;
        }
        return true;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.Visible = true;
    }

    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        string url;
        url = DetailsView1.Rows[13].Cells[1].Text;
        System.Diagnostics.Process.Start(url);
        DetailsView1.Visible = false;
    }



    protected void ResetButton_Click(object sender, EventArgs e)
    {
        _Name.Text = "";
        _Discipline.SelectedIndex = 0;
        _Phase.SelectedIndex = 0;
        _Revision.Text = "";
        _Status.SelectedIndex = 0;
        _EngDescr.Text = "";
        _Category.SelectedIndex = 0;
        SqlDataSource1.FilterExpression = null;
        DetailsView1.Visible = false;

    }

    protected void ButtonTmsPanel_Click(object sender, EventArgs e)
    {
        tmsPanel.Visible = !tmsPanel.Visible;
        DetailsView1.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = !Panel1.Visible;
        DetailsView1.Visible = false;
    }

    protected void Unnamed1_Load(object sender, EventArgs e)
    {
        Visible = false;
    }
</script>
 			<form runat="server">
 			
				<asp:SqlDataSource  id="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FORMSConnectionString2 %>" SelectCommand="SELECT [Number], [ShortName], [DescriptionEng], [DescriptionRus], [Revision], [Year], [CategoryText], [DisciplineText], [PhaseText], [StatusText], [Category], [Phase], [Discipline], [Status] FROM [FORMS_VIEW1]" EnableCaching="False">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="_Category" Name="newparameter" PropertyName="SelectedValue" />
                    </FilterParameters>
				</asp:SqlDataSource>
				<asp:SqlDataSource id="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FORMSConnectionString2 %>" SelectCommand="SELECT [CategoryNumber], [CategoryText] FROM [Categories]">
				</asp:SqlDataSource>
				<asp:SqlDataSource id="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FORMSConnectionString2 %>" SelectCommand="SELECT [DisciplineDescription], [DisciplineNumber] FROM [Disciplines]">
				</asp:SqlDataSource>
				<asp:SqlDataSource id="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:FORMSConnectionString2 %>" SelectCommand="SELECT [Number], [PhaseName] FROM [Phases]">
				</asp:SqlDataSource>
				<asp:SqlDataSource id="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:FORMSConnectionString2 %>" SelectCommand="SELECT [Number], [StatusText] FROM [Statuses]">
				</asp:SqlDataSource>


                            <asp:Panel ID="Panel1" runat="server" Visible="False" BackColor="#DCEFF8">
					<table cellpadding="1" cellspacing="1">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
					<tr>
						<td  class="auto-style13" id="Name1">Name:</td>
						<td class="auto-style14">
						<asp:TextBox id="_Name"  runat="server"  Wrap="False" Width="250px"></asp:TextBox>
						</td>
						<td class="auto-style23">Discipline:</td>
                        <td>
						<asp:DropDownList id="_Discipline" runat="server" DataSourceID="SqlDataSource3" DataTextField="DisciplineDescription" DataValueField="DisciplineNumber" Width="100%" AppendDataBoundItems="True" OnSelectedIndexChanged="Filter_Changed" OnTextChanged="Filter_Changed">
							<asp:ListItem Selected="True">ALL</asp:ListItem>
						</asp:DropDownList>
						</td>
						<td class="auto-style23">Type:</td>
						<td>
						<asp:DropDownList id="_Category" runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryText" DataValueField="CategoryNumber" AppendDataBoundItems="True"  Width="100%" style="margin-bottom: 0px" OnSelectedIndexChanged="Filter_Changed" OnTextChanged="Filter_Changed">
							<asp:ListItem Selected="True">ALL</asp:ListItem>
						</asp:DropDownList>
						</td>
						<td class="auto-style23">Revision:</td>
						<td>
						<asp:TextBox id="_Revision" runat="server" Width="30px"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="auto-style13">Description:</td>
						<td  style="width: 137px; height: 25px;">
						<asp:TextBox id="_EngDescr" runat="server" Width="250px" Wrap="False"></asp:TextBox>
						</td>
						
						<td class="auto-style23">Phase:</td>
						<td style="width:148px">
						<asp:DropDownList id="_Phase" runat="server" DataSourceID="SqlDataSource4" DataTextField="PhaseName" DataValueField="Number" AppendDataBoundItems="True" Height="22px" Width="100%" OnSelectedIndexChanged="Filter_Changed" OnTextChanged="Filter_Changed">
							<asp:ListItem Selected="True">ALL</asp:ListItem>
						</asp:DropDownList>
						</td>
						<td class="auto-style23">Status:</td>
						<td style="height: 25px" >
						<asp:DropDownList id="_Status" runat="server" DataSourceID="SqlDataSource5" DataTextField="StatusText" DataValueField="Number" Width="100%" AppendDataBoundItems="True" OnTextChanged="Filter_Changed" OnSelectedIndexChanged="Filter_Changed">
							<asp:ListItem Selected="True">ALL</asp:ListItem>
						</asp:DropDownList>
						</td>
					</tr>				
					</table>
                     <div class="text-center"style="padding:10px">
						<asp:Button  id="SearchButton" runat="server" Text="SEARCH" OnClick="Filter_Changed" CssClass="btn btn-success btn-xs" Width="70px" />&nbsp; &nbsp; 
						<asp:Button id="ResetButton" runat="server" Text="RESET" OnClick="ResetButton_Click" CssClass="btn btn-success btn-xs" Width="70px" />
                     </div>
                           </asp:Panel>
                            <button style="width:100%; height:30px;text-align:left;color: #fff;background-color: #5bc0de;border-color: #46b8da;" type="button"  ID="Button1" onserverclick="Button1_Click" runat="server">
                                <span id="searchText" style="color:yellow">FORMS OF CONSTRUCTION QUALITY RECORDS - SEARCH PAGE</span>
                                <span id="ArrowDown" runat="server" style="float:right;color:yellow" class="glyphicon glyphicon-chevron-down"></span>
                                <span id="ArrowUp" runat="server" style="float:right;color:yellow" class="glyphicon glyphicon-chevron-up"></span>
                            </button>
             </div>
        <div id="content">
						<asp:GridView id="GridView1" runat="server" AutoGenerateColumns="False" Caption=""
						DataKeyNames="ShortName"
                        DataSourceID="SqlDataSource1"                        
                        CssClass="table table-bordered table-striped table-condensed"
                        EnableModelValidation="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
							<AlternatingRowStyle BackColor="White" />
							<Columns>
                                <asp:ButtonField CommandName="select" DataTextField="ShortName" HeaderText="Name"  ItemStyle-HorizontalAlign="Left" />
								<asp:BoundField DataField="DescriptionEng" HeaderText="Description" ItemStyle-HorizontalAlign="Left" SortExpression="DescriptionEng" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="col-xs-2">
								</asp:BoundField>
                                <asp:BoundField DataField="DisciplineText" HeaderText="Discipline" ReadOnly="True" SortExpression="DisciplineText" HeaderStyle-HorizontalAlign="Center"/>
								<asp:BoundField DataField="CategoryText" HeaderText="Type" SortExpression="CategoryText" ReadOnly="True" HeaderStyle-HorizontalAlign="Center">
								</asp:BoundField>
                                <asp:BoundField DataField="PhaseText" HeaderText="Phase" ReadOnly="True" SortExpression="PhaseText"  HeaderStyle-HorizontalAlign="Center"/>
								<asp:BoundField DataField="Revision" HeaderText="Rev." SortExpression="Revision" HeaderStyle-HorizontalAlign="Center">
								</asp:BoundField>
								<asp:BoundField DataField="Year" HeaderText="Date" SortExpression="Year" DataFormatString="{0:d}" HeaderStyle-HorizontalAlign="Center">
								</asp:BoundField>
								<asp:BoundField DataField="StatusText" HeaderText="Status" ReadOnly="True" SortExpression="StatusText" HeaderStyle-HorizontalAlign="Center"/>
							</Columns>
							<EditRowStyle BackColor="#2461BF" />
							<EmptyDataRowStyle Height="14px" />
							<EmptyDataTemplate>
								Not found
							</EmptyDataTemplate>
							<HeaderStyle BackColor="#428bca" Font-Bold="True" Font-Size="Small" ForeColor="White" />
							<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />


						</asp:GridView>
						
                <span id="span_hide"; onmouseup="hide()"; style="display:block;   position: absolute;left:100px;top:100px;  " >

                    <asp:DetailsView id="DetailsView1" runat="server" DataSourceID="SqlDataSource6" Height="39px" Width="131%" BorderStyle="Solid"
                         BackColor="Silver" AutoGenerateRows="False" EnableModelValidation="True"
                        CssClass="table table-bordered"
                         Visible="False" BorderColor="Black" BorderWidth="2px" CaptionAlign="Left" HeaderText="Detail information" HorizontalAlign="Left" CellPadding="5" CellSpacing="1" Font-Bold="False" OnItemCommand="DetailsView1_ItemCommand" >
                        <CommandRowStyle BorderWidth="2px" />
                        <FieldHeaderStyle BackColor="#D1DDF1" BorderColor="Black" BorderStyle="Solid" HorizontalAlign="Right" Width="120px" Wrap="False" Font-Bold="True" Font-Italic="False" />
                    <Fields>
                        <asp:BoundField DataField="ShortName" HeaderText="Name" SortExpression="ShortName" />
                        <asp:BoundField DataField="DescriptionEng" HeaderText="Description" SortExpression="DescriptionEng" />
                        <asp:BoundField DataField="DisciplineText" HeaderText="Discipline" SortExpression="DisciplineText" ReadOnly="True" />
                        <asp:BoundField DataField="CategoryText" HeaderText="Type" SortExpression="CategoryText" ReadOnly="True" />
                        <asp:BoundField DataField="PhaseText" HeaderText="Phase" SortExpression="PhaseText" />
                        <asp:BoundField DataField="Revision" HeaderText="Revision" SortExpression="Revision" />
                        <asp:BoundField DataField="Year" HeaderText="Date" SortExpression="Year" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="StatusText" HeaderText="Status" SortExpression="StatusText" ReadOnly="True" />
                        <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                        <asp:HyperLinkField DataNavigateUrlFields="FullPath" DataTextField="FullPath" HeaderText="Link to file" Target="_blank" />
                    </Fields>
				        <HeaderStyle BackColor="#507CD1" BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Font-Bold="True" Wrap="False" HorizontalAlign="Justify" />
                        <RowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Strikeout="False" HorizontalAlign="Left" />
				</asp:DetailsView>
				<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:FORMSConnectionString2 %>" SelectCommand="SELECT FORMS_VIEW1.FullPath, FORMS_VIEW1.CategoryText, FORMS_VIEW1.DisciplineText, FORMS_VIEW1.PhaseText, FORMS_VIEW1.StatusText, FORMS_VIEW1.Number, FORMS_VIEW1.ShortName, FORMS_VIEW1.DescriptionEng, FORMS_VIEW1.DescriptionRus, FORMS_VIEW1.Year, FORMS_VIEW1.Revision, FORMS_VIEW1.Status, FORMS_VIEW1.Comments, Forms.LinkToPath, Forms.LinktoFile FROM FORMS_VIEW1 INNER JOIN Forms ON FORMS_VIEW1.ShortName = Forms.ShortName WHERE (FORMS_VIEW1.ShortName = @ShortName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="ShortName" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
				</asp:SqlDataSource>
				</span>
			        </div>
        </div>    
         </form>
			</div>
			
	</div>

	<div>
		<p style="align-content:center; font-size:x-small;">
		Copyright &copy; 2017. All Rights Reserved</p>
			</div>
</body>
</html>
