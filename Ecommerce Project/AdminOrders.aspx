<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="Ecommerce_Project.AdminOrders" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table class="table">
                    <tr>
                        <th>Order ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Order Fulfilled</th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1"
                            Text='<%# Eval("OrderID") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label2"
                            Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label3"
                            Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label7"
                            Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label4"
                            Text='<%# Eval("ProductName") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label5"
                            Text='<%# Eval("ProductPrice") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label6"
                            Text='<%# Eval("OrderFulfilled") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            ID="SqlDataSource1" runat="server"
            SelectCommand="SELECT [Orders].[OrderId], [UserInformation].[FirstName], [UserInformation].[LastName], [Products].[ProductName], [Products].[ProductPrice], [Orders].[OrderFulfilled], [AspNetUsers].[Email]
FROM [Orders], [Products], [UserInformation], [AspNetUsers]
WHERE [Orders].[ProductId] = [Products].[ProductID] AND [Orders].[UserId] = [AspNetUsers].[Id] AND [Orders].[UserId] = [UserInformation].[Id]">
            <SelectParameters>
                <asp:Parameter Name="userID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
