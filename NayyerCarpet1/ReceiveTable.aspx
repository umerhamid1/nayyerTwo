<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReceiveTable.aspx.cs" Inherits="BillTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Receive Bill List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

     <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="vendor/animate/animate.css"/>
		<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="vendor/select2/css/select2.css" />
		<link rel="stylesheet" href="vendor/select2-bootstrap-theme/select2-bootstrap.min.css" />
		<link rel="stylesheet" href="css/theme.css" />
		<link rel="stylesheet" href="css/skins/default.css" />
		<link rel="stylesheet" href="css/custom.css"/>
		<script src="vendor/modernizr/modernizr.js"></script>

    <link href="Style%20Sheet/GridviewStyleSheet.css" rel="stylesheet" />
   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
   
                        <div class="row" style="margin-top:50px;" >
						    <div class="col-lg-8">
                                <div style="margin-left:400px;">
								    <section class="card">
									    <header class="card-header">
										    <h5 class="card-title" >Party Receive Bill List In Account</h5>
									    </header>
									
                                        <div class="card-body">
                                            <div class="form-group row">
											    <label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Party Name <span class="required">*</span></label>
											    <div class="col-sm-8">
                                                    <asp:DropDownList ID="DropDownList1" runat="server" data-plugin-selectTwo class="form-control populate" Width="275px"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="This field is required." InitialValue="Choose a Name" ForeColor="Red"></asp:RequiredFieldValidator>
											    </div>
										    </div>
									    </div>
									    <footer class="card-footer">
										    <div>
											    <div class="col-sm-15">
												    <asp:Button ID="btnR_Search" runat="server" class="btn btn-primary" Text="Search" OnClick="btnR_Search_Click"/>
                                                    <asp:Button ID="btnR_GetAllRecord" runat="server" class="btn btn-primary" Text="Get All Records" OnClick="btnR_GetAllRecord_Click" CausesValidation="false"/>
                                                    <asp:Button ID="btnR_AddNewCustomer" runat="server" class="btn btn-success" Text="Add New Bill" OnClick="btnR_AddNewCustomer_Click" CausesValidation="false"/>
												
											    </div>
										    </div>
									    </footer>

								    </section>
				                </div>
						    </div>
					    </div>
    <br />

    <center>
        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" DataKeyNames="VrNo" CssClass="cssgridview" AlternatingRowStyle-CssClass="alt">

                <Columns>
                    <asp:BoundField DataField="VrNo" HeaderText="Vr No" SortExpression="VrNo">
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Jrn_Type" HeaderText="Jrn Type" SortExpression="Jrn_Type">
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompanyName" HeaderText="Party Name" SortExpression="CompanyName" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ReceiveAmount" HeaderText="Receive Amount" SortExpression="ReceiveAmount" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" SortExpression="Date" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" HeaderText="Action" SelectText="Edit" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Font-Bold="True" Wrap="False" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderManagementSystemConnectionString %>" SelectCommand="SELECT [VrNo], [Jrn_Type], [CompanyName], [Description], [Date], [ReceiveAmount] FROM [BillReceive] WHERE ([Jrn_Type] = @Jrn_Type)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="Received" Name="Jrn_Type" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </center>

    <center>
        <asp:Panel ID="Panel2" runat="server">
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged1" DataKeyNames="VrNo" CssClass="cssgridview" AlternatingRowStyle-CssClass="alt">

                <Columns>
                    <asp:BoundField DataField="VrNo" HeaderText="Vr No" SortExpression="VrNo">
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Jrn_Type" HeaderText="Jrn Type" SortExpression="Jrn_Type">
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompanyName" HeaderText="Party Name" SortExpression="CompanyName" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ReceiveAmount" HeaderText="Receive Amount" SortExpression="ReceiveAmount" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" SortExpression="Date" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Wrap="False" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" HeaderText="Action" SelectText="Edit" >
                        <HeaderStyle VerticalAlign="Middle" Height="30px" Font-Bold="True" Font-Size="12pt" />
                        <ItemStyle Height="25px" Font-Size="11pt" Font-Bold="True" Wrap="False" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrderManagementSystemConnectionString %>" SelectCommand="SELECT [VrNo], [Jrn_Type], [CompanyName], [Description], [Date], [ReceiveAmount] FROM [BillReceive] WHERE (([Jrn_Type] = @Jrn_Type) AND ([CompanyName] = @CompanyName))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" DefaultValue="Received" Name="Jrn_Type" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="CompanyName" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </center>
    <br />

    <!-- Vendor -->
		<script src="vendor/jquery/jquery.js"></script>
		<script src="vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="vendor/popper/umd/popper.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.js"></script>
		<script src="vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="vendor/common/common.js"></script>
		<script src="vendor/nanoscroller/nanoscroller.js"></script>
		<script src="vendor/magnific-popup/jquery.magnific-popup.js"></script>
		<script src="vendor/jquery-placeholder/jquery-placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="vendor/jquery-validation/jquery.validate.js"></script>
		<script src="vendor/select2/js/select2.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="js/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="js/custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="js/theme.init.js"></script>

		<!-- Examples -->
		<script src="js/examples/examples.validation.js"></script>

</asp:Content>

