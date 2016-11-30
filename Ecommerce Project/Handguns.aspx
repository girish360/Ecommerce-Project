<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Handguns.aspx.cs" Inherits="Ecommerce_Project.Handguns" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/rm.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <div>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <h3>Handguns</h3>
            </HeaderTemplate>

            <ItemTemplate>
                <div class="col-md-3 prod" style="padding-left: 0px; padding-right: 0px;">
                    <div class="thumbnail">
                        <a href="">
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
                                <asp:Label runat="server" ID="Label4"
                                    Text='<%# Eval("ProductPrice") %>' />
                            </strong>
                            <a href="#" class="btn btn-primary" role="button">Add to Cart</a>
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
            SelectCommand="SELECT [ProductName], [ProductPrice], [ProductType],
              [ProductImage] FROM [Products] WHERE ProductType = 'Handgun'"></asp:SqlDataSource>
    </div>
</asp:Content>
