<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecommerce_Project.Product" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="Form1" runat="server"
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="container">

                <div class="row">

                    <div class="col-md-12">
                        <div class="col-md-3">
                            <asp:Label runat="server" ID="Label6"
                                Text='<%#"<strong>Shipped: </strong>" + Eval("ProductName") %>' />
                        </div>

                        <div class="thumbnail">
                            <img class="img-responsive" src="http://placehold.it/800x300" alt="">
                            <div class="caption-full">
                                <h4 class="pull-right">$Price</h4>
                                <h4><a href="#">Product Name</a>
                                </h4>
                                <p>Product Description</p>
                            </div>
                        </div>
                    </div>
                </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            There is nothing to see here.
        </EmptyDataTemplate>
    </asp:FormView>
    <asp:SqlDataSource
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        ID="SqlDataSource1" runat="server"
        SelectCommand="SELECT [Products].[ProductName], [Products].[ProductType], [Products].[ProductPrice], [Products].[ProductImage], [Products].[ProductPrice]
FROM [Products]
WHERE [Products].[ProductID] = @productID">
        <SelectParameters>
            <asp:Parameter Name="ProductID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
