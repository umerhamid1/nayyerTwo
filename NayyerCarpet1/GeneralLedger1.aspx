<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GeneralLedger1.aspx.cs" Inherits="BillTable" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">

    General Ledger 1

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

     <link href="bootstrap-4.4.1/css/bootstrap.css" rel="stylesheet" />

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
											<label class="col-sm-4 control-label text-sm-right pt-2">Company Name <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:DropDownList ID="DropDownList1" runat="server" data-plugin-selectTwo class="form-control populate" Width="275px"></asp:DropDownList>
											</div>
										</div>

                                        <div class="form-group row">
                                            <label class="col-sm-4 control-label text-sm-right pt-2">From Date <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:TextBox ID="txtFrom" runat="server" data-plugin-datepicker TextMode="Date" placeholder="eg.: mm/dd/yyyy" Width="275px" class="form-control"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtFrom" ForeColor="Red"></asp:RequiredFieldValidator>
										    </div>
										</div>

                                        <div class="form-group row">
                                            <label class="col-sm-4 control-label text-sm-right pt-2">To Date <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:TextBox ID="txtTo" runat="server" data-plugin-datepicker TextMode="Date" placeholder="eg.: mm/dd/yyyy" Width="275px" class="form-control"></asp:TextBox>
											    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtTo" ForeColor="Red"></asp:RequiredFieldValidator>
										    </div>
										</div>

                                         <%--<div class="form-group row">
											<label class="col-sm-4 control-label text-sm-right pt-2">Download File <span class="required">*</span></label>
											<div class="col-sm-8">
                                                <asp:DropDownList ID="ddlFileFormat" runat="server" data-plugin-selectTwo class="form-control populate" Width="275px">
                                                    <asp:ListItem Text="Select Download File In "></asp:ListItem>
                                                    <asp:ListItem Text="PDF" Value=".pdf"></asp:ListItem>  
                                                    <asp:ListItem Text="WORD" Value=".doc"></asp:ListItem>  
                                                    <asp:ListItem Text="EXCEL" Value=".xls"></asp:ListItem> 
                                                </asp:DropDownList>
											</div>
										</div>--%>

									</div>
									<footer class="card-footer">
										<div class="row justify-content-end">
											<div class="col-sm-8">
												<asp:Button ID="btnViewReport" runat="server" class="btn btn-primary" Text="View Report" OnClick="btnViewReport_Click"/>
												<button type="reset" class="btn btn-danger" >Reset</button>
                                                <%--<asp:Button ID="btnB_Print" runat="server" class="btn btn-success" Text="Print"/>--%>
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
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" SizeToReportContent = "true">

        </rsweb:ReportViewer>
    </center>
    <br />
</asp:Content>

