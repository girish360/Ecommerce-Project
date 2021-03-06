﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserOrders.aspx.cs" Inherits="Ecommerce_Project.UserOrders" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
         <%-- Define the data repeater to display all orders for the users to see --%>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table class="table">
                    <h3>Your Orders</h3>
            </HeaderTemplate>
            <ItemTemplate>
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
                            Text='<%#"$" + Eval("ProductPrice") %>' />
                    </div>
                    <div class="col-md-3">
                        <asp:Label runat="server" ID="Label5"
                            Text='<%#"<strong>Shipped: </strong>" + Eval("OrderFulfilled") %>' />
                        <br />
                    </div>
                    <div class="col-md-3">
                        <asp:Label runat="server" ID="Label6"
                            Text='<%#"<strong>Paid: </strong>" + Eval("OrderPaidFor") %>' />
                        <br />
                    </div>
                    <br />
                    <br />
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
        <%-- Define the data source for the repeater
             Query is defined in code behind. --%>
        <asp:SqlDataSource
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            ID="SqlDataSource1" runat="server">
            <SelectParameters>
                <asp:Parameter Name="userID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
