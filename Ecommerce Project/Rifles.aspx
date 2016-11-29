<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rifles.aspx.cs" Inherits="Ecommerce_Project.Rifles" %>

<asp:Content ID="Rifles" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <h3>Rifles</h3>
            </HeaderTemplate>

            <ItemTemplate>
                <div class="col-md-3" style="padding-left: 0px; padding-right: 0px;">
                    <div class="thumbnail">
                        <a href="">
                            <img src='<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>.jpg' alt="" style="width: 100%; border: 1px solid gray;" />
                            <div class="caption">
                                <asp:Label runat="server" ID="Label2"
                                    Text='<%# Eval("ProductName") %>' />
                                <asp:Label runat="server" ID="Label3"
                                    Text='<%# Eval("ProductType") %>' />
                                <br />
                                <strong>
                                    <asp:Label runat="server" ID="Label4"
                                        Text='<%# Eval("ProductPrice") %>' />
                                </strong>
                            </div>
                        </a>
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
              [ProductImage] FROM [Products] WHERE ProductType = 'Rifle'"></asp:SqlDataSource>
    </div>
</asp:Content>
