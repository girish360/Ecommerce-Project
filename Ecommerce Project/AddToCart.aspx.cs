using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
//using Ecommerce_Project.Logic;
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
            //if user is logged in and authenticated
            
            if ((System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                //using the SqlConnection conn
                using (conn)
                {
                    //Opens the connection to the default database
                    conn.Open();
                    //Create sql statement string with parameters ProductId, UserId, OrderFulfilled, and OrderPaidFor
                    string sql = "INSERT INTO Orders(ProductId, UserId, OrderFulfilled, OrderPaidFor) VALUES(@param1,@param2,@param3, @param4)";
                    //Creates a new SQL command from the sql string and connection above.
                    SqlCommand command = new SqlCommand(sql, conn);
                    //The following commands will add parameters for the above SQL command.
                    //Param1 equals the productId that is passed by either Handguns.aspx, Rifles.aspx, or Shotguns.aspx
                    command.Parameters.Add("@param1", SqlDbType.Int).Value = Request.QueryString["ProductID"];
                    //Param2 equals the current users ID
                    command.Parameters.Add("@param2", SqlDbType.NVarChar, 128).Value = Page.User.Identity.GetUserId();
                    //Param3 and Param4 sets OrderFulfilled and OrderPaidFor to false
                    command.Parameters.Add("@param3", SqlDbType.Bit).Value = false;
                    command.Parameters.Add("@param4", SqlDbType.Bit).Value = false;
                    command.CommandType = CommandType.Text;
                    //More info on ExecuteNonQuery found @ https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand.executenonquery(v=vs.110).aspx
                    command.ExecuteNonQuery();

                    conn.Close();
                }
                Response.Redirect("UserOrders");
            }
            //if user isn't logged in or authenticated, the user is redirected to the login page
            else
            {
                Response.Redirect("~/Account/Login");
            }
        }
    }
}