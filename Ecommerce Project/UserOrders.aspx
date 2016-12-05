<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserOrders.aspx.cs" Inherits="Ecommerce_Project.UserOrders" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table class="table">
                    <h3>Your Orders</h3>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <hr />
                    <div class="col-md-2">
                        <asp:Label runat="server" ID="Label1"
                            Text='<%#"Order #" + Eval("OrderID") %>' />
                    </div>
                    <div class="col-md-2">
                        <asp:Label runat="server" ID="Label2"
                            Text='<%# Eval("FirstName") + " " + Eval("LastName") %>' />
                    </div>
                    <div class="col-md-3">
                        <asp:Label runat="server" ID="Label4"
                            Text='<%# Eval("ProductName") %>' />
                    </div>
                    <div class="col-md-2">
                        <asp:Label runat="server" ID="Label5"
                            Text='<%# Eval("ProductPrice") %>' />
                    </div>
                    <div class="col-md-3">
                        <asp:Label runat="server" ID="Label6"
                            Text='<%#"<strong>Shipped: </strong>" + Eval("OrderFulfilled") %>' />
                    </div>
                    <br />
                    
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            ID="SqlDataSource1" runat="server"
            SelectCommand="SELECT [Orders].[OrderId], [UserInformation].[FirstName], [UserInformation].[LastName], [Products].[ProductName], [Products].[ProductPrice], [Orders].[OrderFulfilled]
FROM [Orders], [Products], [UserInformation]
WHERE [Orders].[ProductId] = [Products].[ProductID] AND [Orders].[UserId] = @userID AND [UserInformation].[Id] = @userID">
            <SelectParameters>
                <asp:Parameter Name="userID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
