<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CompanyAttributes.aspx.cs" Inherits="CustomerBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add New Company
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
   <link href="bootstrap-4.4.1/css/bootstrap.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
					
    <!-- start: page -->
					<div class="row" style="margin-top:50px;" >
						<div class="col-lg-8">
                            <div style="margin-left:420px;">
								<section class="card">
									<header class="card-header">
										<h5 class="card-title" >Add New Company In Account</h5>
									</header>
									
                                    <div class="card-body">

										<div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Id</label>
											<div class="col-sm-8">
											    <asp:Label ID="lblCompanyId" runat="server" Text="" Width="275px" class="form-control"></asp:Label>
                                                <div style="color: #009933">Fixed Value.</div>
											</div>
										</div>
                                        
                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Company Name <span class="required">*</span></label>
											<div class="col-sm-8">
											    <asp:TextBox ID="txtCompany_Name" runat="server" class="form-control" placeholder="eg.: Nayyer Carpet Karachi" Width="275px"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCompany_Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
										</div>

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Contact <span class="required">*</span></label>
											<div class="col-sm-8">
											    <asp:TextBox ID="txtCompany_Contact" runat="server" class="form-control" placeholder="eg.: 03XXXXXXXXX" Width="275px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCompany_Contact" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCompany_Contact" EnableClientScript="False" ErrorMessage="Contact is not Valid." ForeColor="Red" ValidationExpression="\d{11}"></asp:RegularExpressionValidator>
                                            </div>
										</div>
									</div>
									<footer class="card-footer">
										<div class="row justify-content-end">
											<div class="col-sm-8">
												<asp:Button ID="btnRegister" runat="server" class="btn btn-primary" Text="Register" OnClick="btnRegister_Click"/>
												<button type="reset" class="btn btn-danger" >Reset</button>
											</div>
										</div>
									</footer>
								</section>
				</div>
						</div>
					</div>
					<!-- end: page -->
                    </div>
</asp:Content>

