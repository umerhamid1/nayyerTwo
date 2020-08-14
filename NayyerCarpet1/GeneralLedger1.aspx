<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GeneralLedger1.aspx.cs" Inherits="BillTable" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">

    General Ledger 1

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

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
   
                    <div class="row" style="margin-top:50px;" >
						<div class="col-lg-8">
                            <div style="margin-left:400px;">
								<section class="card">
									<header class="card-header">
										<h5 class="card-title" >General Ledger 1</h5>
									</header>
									
                                    <div class="card-body">

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Company Name <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:DropDownList ID="DropDownList1" runat="server" data-plugin-selectTwo class="form-control populate" Width="275px"></asp:DropDownList>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="This field is required." InitialValue="Choose a Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
										</div>

                                        <div class="form-group row">
                                            <label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">From Date <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:TextBox ID="txtFrom" runat="server" data-plugin-datepicker placeholder="  mm/dd/yyyy" Width="275px" class="form-control"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtFrom" ForeColor="Red"></asp:RequiredFieldValidator>
										    </div>
										</div>

                                        <div class="form-group row">
                                            <label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">To Date <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:TextBox ID="txtTo" runat="server" data-plugin-datepicker placeholder="  mm/dd/yyyy" Width="275px" class="form-control"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtTo" ForeColor="Red"></asp:RequiredFieldValidator>
										    </div>
										</div>

                                         <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Download Report</label>
											<div class="col-sm-8">
                                                <asp:DropDownList ID="ddlFileFormat" runat="server"  class="form-control populate" Width="275px">
                                                    <asp:ListItem Text="  Select Download File In "></asp:ListItem>
                                                    <asp:ListItem Text="PDF" Value="PDF"></asp:ListItem>  
                                                    <asp:ListItem Text="WORD" Value="WORD"></asp:ListItem>  
                                                    <asp:ListItem Text="EXCEL" Value="EXCEL"></asp:ListItem> 
                                                    <asp:ListItem Text="IMAGE" Value="IMAGE"></asp:ListItem> 
                                                </asp:DropDownList>
											</div>
                                        </div>

									</div>
									<footer class="card-footer">
										<div class="row justify-content-end">
											<div class="col-sm-8">
												<asp:Button ID="btnViewReport" runat="server" class="btn btn-primary" Text="View Report" OnClick="btnViewReport_Click"/>
												<button type="reset" class="btn btn-danger" >Reset</button>
                                                <asp:Button ID="btnB_Print" runat="server" class="btn btn-success" Text="Print" OnClick="btnB_Print_Click"/>
											</div>
										</div>
									</footer>
								</section>
				            </div>
						</div>
					</div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>

    <br />

    <center>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" SizeToReportContent = "true" >

        </rsweb:ReportViewer>
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

