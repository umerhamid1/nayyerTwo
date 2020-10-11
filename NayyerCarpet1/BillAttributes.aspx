<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillAttributes.aspx.cs" Inherits="CustomerBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add New Bill
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
					
    <!-- start: page -->
					<div class="row" style="margin-top:50px;" >
						<div class="col-lg-8">
                            <div style="margin-left:400px;">
								<section class="card">
									<header class="card-header">
										<h5 class="card-title" >Add New Party Bill In Account</h5>
									</header>
									
                                    <div class="card-body">

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px; vertical-align: middle">Jrn Type</label>
											<div class="col-sm-8">
											    <asp:Label ID="lblB_Sale" runat="server" Text="Sale" style="font-size:15px; font-weight: 700;"  ></asp:Label>
                                                <div style="color: #009933">Fixed Value.</div>
											</div>
										</div>

                                        <div class="form-group row">
                                            <label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Party Name <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:DropDownList ID="DropDownList1" runat="server" data-plugin-selectTwo class="form-control populate" data-height="240" Width="275px"></asp:DropDownList>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="This field is required." InitialValue="Choose a Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
										</div>

                                        <div class="form-group row">
                                           <label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Vr No <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:TextBox ID="txtB_Vr" runat="server" class="form-control" placeholder="  In Number" TextMode="Number" Width="275px"></asp:TextBox>
											    <asp:Label ID="lblVrNo" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required." ControlToValidate="txtB_Vr" ForeColor="Red"></asp:RequiredFieldValidator>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Description <span class="required">*</span></label>
											<div class="col-sm-8">
											    <asp:TextBox ID="txtB_Description" runat="server" class="form-control" placeholder="  Type your message" Height="80px" Width="275px" TextMode="MultiLine"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtB_Description" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
										</div>

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Amount <span class="required">*</span></label>
											<div class="col-sm-8">
											    <asp:TextBox ID="txtB_Amount" runat="server" class="form-control" placeholder="  In Number"  TextMode="Number" Width="275px"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtB_Amount" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
										</div>

                                        <div class="form-group row">
                                            <label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Date <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:TextBox ID="txtB_Date" runat="server" data-plugin-datepicker placeholder="  mm/dd/yyyy" Width="275px" class="form-control"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtB_Date" ForeColor="Red"></asp:RequiredFieldValidator>
										    </div>
										</div>

									</div>
									<footer class="card-footer">
										<div class="row justify-content-end">
											<div class="col-sm-8">
												<asp:Button ID="btnB_Submit" runat="server" class="btn btn-primary" Text="Submit" OnClick="btnB_Submit_Click"/>
												<button type="reset" class="btn btn-danger" >Reset</button>
											</div>
										</div>
									</footer>
								</section>
				</div>
						</div>
					</div>
    <br />
					<!-- end: page -->

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

