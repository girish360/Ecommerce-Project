using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
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
            //userId = Page.User.Identity.GetUserId();
            SqlDataSource1.SelectParameters["userID"].DefaultValue = User.Identity.GetUserId();
        }
    }
}