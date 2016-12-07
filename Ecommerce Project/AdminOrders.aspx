<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="Ecommerce_Project.AdminOrders" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table class="table">
                    <h3>All Orders</h3>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <hr />
                    <div class="col-md-1">
                        <asp:Label runat="server" ID="Label1"
                            Text='<%#"Order #" + Eval("OrderID") %>' />
                    </div>
                    <div class="col-md-1">
                        <asp:Label runat="server" ID="Label2"
                            Text='<%# Eval("FirstName") + " " + Eval("LastName") %>' />
                    </div>
                    <div class="col-md-3">
                        <asp:Label runat="server" ID="Label3"
                            Text='<%# Eval("ProductName") %>' />
                    </div>
                    <div class="col-md-1">
                        <asp:Label runat="server" ID="Label4"
                            Text='<%# Eval("ProductPrice") %>' />
                    </div>
                    <div class="col-md-3">
                        <asp:Label runat="server" ID="Label5"
                            Text='<%#"<strong>Shipped: </strong>" + Eval("OrderFulfilled") %>' />
                        <br />
                        <asp:Button ID="button1" runat="server"
                            AutoPostBack="True"
                            Text="Update Shipping Status"
                            TextAlign="Right"
                            CommandArgument='<%# Eval("OrderID")+","+ Eval("OrderFulFilled")%>' OnCommand="orderFulfilledUpdate" />
                    </div>
                    <div class="col-md-3">
                        <asp:Label runat="server" ID="Label6"
                            Text='<%#"<strong>Paid: </strong>" + Eval("OrderPaidFor") %>' />
                        <br />
                        <asp:Button ID="button2" runat="server"
                            AutoPostBack="True"
                            Text="Update Payment Status"
                            TextAlign="Right"
                            CommandArgument='<%# Eval("OrderID")+","+ Eval("OrderPaidFor") %>' OnCommand="paymentUpdate" />
                    </div>
                    <br />
                    <br />
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            ID="SqlDataSource1" runat="server">
            <SelectParameters>
                <asp:Parameter Name="userID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
