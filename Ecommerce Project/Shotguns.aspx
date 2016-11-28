<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shotguns.aspx.cs" Inherits="Ecommerce_Project.Shotguns" %>

<asp:Content ID="Shotguns" ContentPlaceHolderID="MainContent" runat="server">
    <div>
      <asp:Repeater ID="Repeater1" runat="server" 
          DataSourceID="SqlDataSource1">
          <HeaderTemplate>
              <table>
              <col width="200" />
              <col width="800" />
              <col width="150" />
              <tr>
                  <th>Image</th>
                 <th>Name</th>
                  <th>Type</th>
                 <th>Price</th>
              </tr>
          </HeaderTemplate>

          <ItemTemplate>
          <tr>
              <td>
                  <img src= '<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>.jpg' alt="" style="height:200px;width:200px;border:1px solid gray;"/>
                </td>
              <td>
                  <asp:Label runat="server" ID="Label2" 
                      text='<%# Eval("ProductName") %>' />
              </td>
              <td>
                  <asp:Label runat="server" ID="Label3" 
                      text='<%# Eval("ProductType") %>' />
              </td>
              <td>
                  <asp:Label runat="server" ID="Label4" 
                      text='<%# Eval("ProductPrice") %>' />
              </td>
          </tr>
          </ItemTemplate>
          <FooterTemplate>
              </table>
          </FooterTemplate>
      </asp:Repeater>

      <asp:SqlDataSource 
          ConnectionString=
              "<%$ ConnectionStrings:DefaultConnection %>"
          ID="SqlDataSource1" runat="server" 
          SelectCommand="SELECT [ProductName], [ProductPrice], [ProductType],
              [ProductImage] FROM [Products] WHERE ProductType = 'Shotgun'">
      </asp:SqlDataSource>
    </div>
</asp:Content>
