﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecommerce_Project.Product" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Create the FormView to display a specific products information --%>
    <asp:FormView ID="Form1" runat="server"
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <img class="img-responsive" src="<%# Eval("ProductImage") %>.jpg" style="max-height: 500px;" alt="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10">
                        <h4><a href="#"><%#Eval("ProductName")%></a>
                        </h4>
                        <p>Product Description</p>
                    </div>
                    <div class="col-md-2">
                        <h4 class="pull-right">$<%#Eval("ProductPrice")%></h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <p><%#Eval("ProductDesc") %></p>
                        <p>
                            <a class="btn btn-default" href="AddToCart.aspx?ProductID=<%# Eval("ProductId") %>">Buy Now &raquo;</a>
                        </p>
                    </div>

                </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            <p>You must select a product.</p>
        </EmptyDataTemplate>
    </asp:FormView>
    <%-- Define the SQL data source and query to populate the form --%>
    <asp:SqlDataSource
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        ID="SqlDataSource1" runat="server"
        SelectCommand="SELECT [Products].[ProductID], [Products].[ProductName], [Products].[ProductType], [Products].[ProductPrice], [Products].[ProductImage], [Products].[ProductPrice], [Products].[ProductDesc]
FROM [Products]
WHERE [Products].[ProductID] = @productID">
        <SelectParameters>
            <asp:Parameter Name="ProductID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
