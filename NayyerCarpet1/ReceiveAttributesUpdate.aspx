<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReceiveAttributesUpdate.aspx.cs" Inherits="CustomerBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Update Receive Bill
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
   <link href="bootstrap-4.4.1/css/bootstrap.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
					
    <!-- start: page -->
					<div class="row" style="margin-top:50px;" >
						<div class="col-lg-8">
                            <div style="margin-left:400px;">
								<section class="card">
									<header class="card-header">
										<h5 class="card-title" >Update Customer Receive Bill In Account</h5>
									</header>
									
                                    <div class="card-body">

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Company Name <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:DropDownList ID="DropDownList1" runat="server" data-plugin-selectTwo class="form-control populate" Width="275px"></asp:DropDownList>
											</div>
										</div>

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Vr No <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:TextBox ID="txtR_Vr" runat="server" class="form-control" placeholder="In Number" TextMode="Number" Width="275px"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required." ControlToValidate="txtR_Vr" ForeColor="Red"></asp:RequiredFieldValidator>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Jrn Type</label>
											<div class="col-sm-8">
											    <asp:Label ID="lblR_Receive" runat="server" Text="Receive" class="form-control" Width="275px" ></asp:Label>
                                                <div style="color: #009933">Fixed Value.</div>
											</div>
										</div>

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Description <span class="required">*</span></label>
											<div class="col-sm-8">
											    <asp:TextBox ID="txtR_Description" runat="server" class="form-control" placeholder="Type your message" Height="80px" Width="275px" TextMode="MultiLine"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtR_Description" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
										</div>

                                        <div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Amount <span class="required">*</span></label>
											<div class="col-sm-8">
											    <asp:TextBox ID="txtR_Amount" runat="server" class="form-control" placeholder="In Number" Width="275px" TextMode="Number"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtR_Amount" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
										</div>

                                        <div class="form-group row">
                                            <label class="col-sm-4 control-label text-sm-right pt-2">Date <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:TextBox ID="txtR_Date" runat="server" data-plugin-datepicker placeholder="eg.: mm/dd/yyyy" Width="275px" class="form-control"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtR_Date" ForeColor="Red"></asp:RequiredFieldValidator>
										    </div>
										</div>

									</div>
									<footer class="card-footer">
										<div class="row justify-content-end">
											<div class="col-sm-8">
												<asp:Button ID="btnR_Update" runat="server" class="btn btn-primary" Text="Update" OnClick="btnR_Update_Click"/>
												<%--<button type="reset" class="btn btn-danger" >Reset</button>--%>
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

