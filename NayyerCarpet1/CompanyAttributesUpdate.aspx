<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CompanyAttributesUpdate.aspx.cs" Inherits="CustomerBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Update Register Company
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
                            <div style="margin-left:420px;">
								<section class="card">
									<header class="card-header">
										<h5 class="card-title" >Update Party In Account</h5>
									</header>
									
                                    <div class="card-body">

										<div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Id</label>
											<div class="col-sm-8">
											    <asp:Label ID="lblCompanyId" runat="server" Text="" style="font-size:15px; font-weight: 700;" ></asp:Label>
                                                <div style="color: #009933">Fixed Value.</div>
											</div>
										</div>
                                        
                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Party Name <span class="required">*</span></label>
											<div class="col-sm-8">
											    <asp:TextBox ID="txtCompany_Name" runat="server" class="form-control" placeholder="eg.: Nayyer Carpet Karachi" Width="275px"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCompany_Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
										</div>

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2" style="font-size:15px;">Contact <span class="required">*</span></label>
											<div class="col-sm-8">
											    <asp:TextBox ID="txtCompany_Contact" runat="server" class="form-control" placeholder="eg.: 03XXXXXXXXX" Width="275px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="This field is required." ControlToValidate="txtCompany_Contact" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ControlToValidate="txtCompany_Contact" EnableClientScript="False" ErrorMessage="Contact is not Valid." ForeColor="Red" ValidationExpression="\d{11}"></asp:RegularExpressionValidator>
                                            </div>
										</div>
									</div>
									<footer class="card-footer">
										<div class="row justify-content-end">
											<div class="col-sm-8">
												<asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" Text="Update" OnClick="btnUpdate_Click"/>
												<%--<button type="reset" class="btn btn-danger" >Reset</button>--%>
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

