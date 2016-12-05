<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecommerce_Project.Product" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <div class="container">

        <div class="row">

            <div class="col-md-12">
                <div class="col-md-3">
                    <asp:Label runat="server" ID="Label6"
                        Text='<%#"<strong>Shipped: </strong>" + Eval("OrderFulfilled") %>' />
                </div>

                <div class="thumbnail">
                    <img class="img-responsive" src="http://placehold.it/800x300" alt="">
                    <div class="caption-full">
                        <h4 class="pull-right">$Price</h4>
                        <h4><a href="#">Product Name</a>
                        </h4>
                        <p>Product Description</p>
                        <asp:Label runat="server" ID="Label1"
                            Text='<%#"<strong>Shipped: </strong>" + Eval("OrderFulfilled") %>' />
                    </div>
                </div>
            </div>
        </div>

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
