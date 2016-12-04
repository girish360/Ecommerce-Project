<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="Ecommerce_Project.AddToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div><%= Page.User.Identity.Name %></div>
    <div><%= Page.User.Identity.GetUserId() %></div>
</asp:Content>