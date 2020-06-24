<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillTable.aspx.cs" Inherits="BillTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Customer Bill List
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
										    <h5 class="card-title" >Customer Bill List In Account</h5>
									    </header>
									
                                        <div class="card-body">
                                            <div class="form-group row">
											    <label class="col-sm-4 control-label text-sm-right pt-2">Company Name <span class="required">*</span></label>
											    <div class="col-sm-8">
                                                    <asp:DropDownList ID="DropDownList1" runat="server" data-plugin-selectTwo class="form-control populate" Width="275px"></asp:DropDownList>
											    </div>
										    </div>
									    </div>
									    <footer class="card-footer">
										    <div>
											    <div class="col-sm-15">
												    <asp:Button ID="btnB_Search" runat="server" class="btn btn-primary" Text="Search" OnClick="btnB_Search_Click"/>
                                                    <button type="reset" class="btn btn-danger" >Reset</button>
                                                    <asp:Button ID="btnB_GetAllRecord" runat="server" class="btn btn-primary" Text="Get All Records" OnClick="btnB_GetAllRecord_Click"/>
                                                    <asp:Button ID="btnB_AddNewCustomer" runat="server" class="btn btn-success" Text="Add New Bill" OnClick="btnB_AddNewCustomer_Click"/>
												
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
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="VrNo"  Width="1050px" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
               
                <Columns>
                    <asp:BoundField DataField="VrNo" HeaderText="Vr No" SortExpression="VrNo" >
                    <HeaderStyle Height="30px" />
                    <ItemStyle Height="30px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Jrn_Type" HeaderText="Jrn Type" SortExpression="Jrn_Type" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="BillAmount" HeaderText="Bill Amount" SortExpression="BillAmount" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:MM-dd-yyyy}" HtmlEncode="false" SortExpression="Date" />
                    <asp:CommandField ShowSelectButton="True" HeaderText="Action" SelectText="Edit" >
                        <ItemStyle Font-Bold="True" ForeColor="#993300" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderManagementSystemConnectionString %>" SelectCommand="SELECT [VrNo], [Jrn_Type], [CompanyName], [Description], [BillAmount], [Date] FROM [BillReceive] WHERE ([Jrn_Type] = @Jrn_Type)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="Sale" Name="Jrn_Type" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </center>

    <center>
        <asp:Panel ID="Panel2" runat="server">
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="VrNo" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" Width="1050px" CellSpacing="2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">

                <Columns>
                    <asp:BoundField DataField="VrNo" HeaderText="VrNo" SortExpression="VrNo" >
                        <HeaderStyle Height="30px" />
                        <ItemStyle Height="30px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Jrn_Type" HeaderText="Jrn Type" SortExpression="Jrn_Type" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="BillAmount" HeaderText="Bill Amount" SortExpression="BillAmount" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:MM-dd-yyyy}" HtmlEncode="false" SortExpression="Date" />
                    <asp:CommandField ShowSelectButton="True" HeaderText="Action" SelectText="Edit" >
                        <ItemStyle Font-Bold="True" ForeColor="#993300" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrderManagementSystemConnectionString %>" SelectCommand="SELECT [VrNo], [Jrn_Type], [CompanyName], [Description], [BillAmount], [Date] FROM [BillReceive] WHERE (([CompanyName] = @CompanyName) AND ([Jrn_Type] = @Jrn_Type))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CompanyName" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="GridView2" DefaultValue="Sale" Name="Jrn_Type" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </center>
    <br />
</asp:Content>

