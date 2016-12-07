using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce_Project
{
    public partial class UserOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["userID"].DefaultValue = User.Identity.GetUserId();

            if (User.Identity.GetUserId() == "eb7cb2f2-8814-42c5-bf45-afcdd23a01bf")
            {
                //if admin is logged in, redirect him or her to the proper page.
                Response.Redirect("~/AdminOrders");
            }
            else
            {
                //Query to display user orders
                SqlDataSource1.SelectCommand = "SELECT[Orders].[OrderId], [UserInformation].[FirstName], [UserInformation].[LastName], [Products].[ProductName], [Products].[ProductPrice], [Orders].[OrderFulfilled], [Orders].[OrderPaidFor] FROM[Orders], [Products], [UserInformation] WHERE[Orders].[ProductId] = [Products].[ProductID] AND [Orders].[UserId] = @userID AND [UserInformation].[Id] = @userID";
                SqlDataSource1.DataBind();

            }
        }
    }
}