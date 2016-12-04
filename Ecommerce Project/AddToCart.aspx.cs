using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using Ecommerce_Project.Logic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Microsoft.AspNet.Identity;

//Taken and modified from an asp.net web tutorial: https://www.asp.net/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/shopping-cart
namespace Ecommerce_Project
{
    public partial class AddToCart : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string rawId = Request.QueryString["ProductID"];

                using (conn)
                {
                    conn.Open();
                    string sql = "INSERT INTO Orders(ProductId, UserId, OrderFulfilled) VALUES(@param1,@param2,@param3)";
                    SqlCommand command = new SqlCommand(sql, conn);
                    command.Parameters.Add("@param1", SqlDbType.Int).Value = Request.QueryString["ProductID"];
                    command.Parameters.Add("@param2", SqlDbType.NVarChar, 128).Value = Page.User.Identity.GetUserId();
                    command.Parameters.Add("@param3", SqlDbType.Bit).Value = false;
                    command.CommandType = CommandType.Text;
                    command.ExecuteNonQuery();
                }
            }
            else
            {
                Response.Redirect("~/Account/Login");
            }
        }
    }
}