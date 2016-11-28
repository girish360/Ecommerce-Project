<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Ecommerce_Project.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
    <p>
        At PBSJ Armory our goal is to preserve the American legacy of firearm ownership by providing opportunities to own quality firearms while providing our customers
        with world renowned service.
    </p>
    <div class="col-md-3">
        <img class="img-responsive" src="//cdn1.lawrensen.com/images/pbsj/poulina.jpg" alt="Poulina">
        <h3>Poulina Tran</h3>
        <p>About text</p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="//cdn1.lawrensen.com/images/pbsj/braden.jpg" alt="Braden">
        <h3>Braden Kelly</h3>
        <p>About text</p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="//cdn1.lawrensen.com/images/pbsj/stephen.jpg" alt="Stephen">
        <h3>Stephen Lawrensen</h3>
        <p>About text</p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="//cdn1.lawrensen.com/images/pbsj/jonathan.jpg" alt="jonathan">
        <h3>Jonathan Van Zweden</h3>
        <p>About text</p>
    </div>
</asp:Content>
