<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Ecommerce_Project.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>________</p>
    <p>We are here to assist you with any questions you have about our products.</p>
    <br />
    <div class="row text-center slideanim">
        <div class="col-sm-4 col-md-4">
            <i class="fa fa-phone-square fa-5x" aria-hidden="true"></i>
             <h3>Call us</h3>
             <address>
                 <abbr title="Phone">Phone:</abbr>
                 222-222-2222
             </address>
        </div>

        <div class="col-sm-4 col-md-4">
            <i class="fa fa-envelope fa-5x" aria-hidden="true"></i>
            <h3>Email us</h3>
            <address>
                <strong>Support Center:</strong>   <a href="mailto:Support@example.com">PBSJsupport@live.com</a><br />
                <strong>Marketing Center:</strong> <a href="mailto:Marketing@example.com">PBSJmarketing@live.com</a>
            </address>
        </div>

        <div class="col-sm-4 col-md-4">
           <i class="fa fa-facebook-official fa-5x" aria-hidden="true"></i>
            <h3>Facebook us</h3>
            <address>
                <strong>Facebook:</strong>   <a href="http://facebook.com">facebook.com/PBSJarmory</a><br />
            </address>
        </div>
    </div>

    <div class="col-md-12 text-center">
        
        <h2>PBSJ Armory</h2>
        <address>
            222 22th St Sw<br />
            Green City, Greenland 22222
        </address>
    </div>

</asp:Content>
