<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shotguns.aspx.cs" Inherits="Ecommerce_Project.Shotguns" %>

<asp:Content ID="Shotguns" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/rm.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <div>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <h3>Shotguns</h3>
            </HeaderTemplate>

            <ItemTemplate>
                <div class="col-md-3 prod" style="padding-left: 0px; padding-right: 0px;">
                    <div class="thumbnail">
                        <a href="Product.aspx?ProductID=<%# Eval("ProductId") %>" id='<%# Eval("ProductId") %>1'>
                            <img src='<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>.jpg' alt="" style="width: 100%; border: 1px solid gray;" />
                            <div class="caption">
                                <div class="prod-caption ellipsis">
                                    <asp:Label runat="server" ID="Label2"
                                        Text='<%# Eval("ProductName") %>' />
                                    <asp:Label runat="server" ID="Label3"
                                        Text='<%# Eval("ProductType") %>' />
                                </div>
                            </div>
                        </a>
                        <div>
                            <strong class="price">
                                <asp:Label runat="server" ID="Label4" class="padd1 h3"
                                    Text='<%# Eval("ProductPrice") %> ' />
                            </strong>
                            <%--<asp:Button runat="server" class="btn btn-primary" role="button" Text="Add to Cart" ID='<%# Eval("ProductId") %>'></asp:Button>--%>
                            <a href="AddToCart.aspx?ProductID=<%# Eval("ProductId") %>" class="btn btn-primary" role="button" id='<%# Eval("ProductId") %>'>Add to Cart</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <asp:SqlDataSource
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            ID="SqlDataSource1" runat="server"
            SelectCommand="SELECT [ProductID], [ProductName], [ProductPrice], [ProductType],
              [ProductImage] FROM [Products] WHERE ProductType = 'Shotgun'"></asp:SqlDataSource>
    </div>
</asp:Content>
