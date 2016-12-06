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
    public partial class AdminOrders : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["userID"].DefaultValue = User.Identity.GetUserId();

            if (User.Identity.GetUserId() == "eb7cb2f2-8814-42c5-bf45-afcdd23a01bf")
            {
                SqlDataSource1.SelectCommand = "SELECT[Orders].[OrderId], [UserInformation].[FirstName], [UserInformation].[LastName], [Products].[ProductName], [Products].[ProductPrice], [Orders].[OrderFulfilled], [Orders].[OrderPaidFor] FROM[Orders] LEFT JOIN Products ON [Orders].[ProductId] = [Products].[ProductID] LEFT JOIN UserInformation ON [Orders].[UserId] = [UserInformation].[Id];";
                SqlDataSource1.DataBind();
            }
            else
            {
                //if basic user is logged in, redirect him or her to the proper page.
                Response.Redirect("~/UserOrders");
            }
        }

        protected void orderFulfilledUpdate(object sender, CommandEventArgs e)
        {
            //credit to Ashwini Verma at http://stackoverflow.com/questions/9822827/how-to-pass-multiple-values-through-command-argument-in-asp-net

            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string orderID = commandArgs[0];
            string fulfilledStatus = commandArgs[1];
            //System.Diagnostics.Debug.WriteLine("fulfilledStatus = " + fulfilledStatus);

            using (conn)
            {
                //if OrderFulfilled is false, update to true
                //if OrderFulfilled is true, update to false
                if (fulfilledStatus == "False")
                {
                    //Opens the connection to the default database
                    conn.Open();
                    //Assign update sql statement as a string
                    string sql = "UPDATE Orders SET OrderFulfilled='true' WHERE OrderId = " + orderID;
                    //Creates a new SQL command from the sql string and connection above.
                    SqlCommand command = new SqlCommand(sql, conn);
                    command.CommandType = CommandType.Text;
                    //More info on ExecuteNonQuery found @ https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand.executenonquery(v=vs.110).aspx
                    command.ExecuteNonQuery();
                    conn.Close();
                    //Bind data to repeater after values are updated
                    Repeater1.DataBind();
                }
                else
                {
                    //Opens the connection to the default database
                    conn.Open();
                    //Assign update sql statement as a string
                    string sql = "UPDATE Orders SET OrderFulfilled='false' WHERE OrderId = " + orderID;
                    //Creates a new SQL command from the sql string and connection above.
                    SqlCommand command = new SqlCommand(sql, conn);
                    command.CommandType = CommandType.Text;
                    //More info on ExecuteNonQuery found @ https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand.executenonquery(v=vs.110).aspx
                    command.ExecuteNonQuery();
                    conn.Close();
                    //Bind data to repeater after values are updated
                    Repeater1.DataBind();
                }
            }
        }

        protected void paymentUpdate(object sender, CommandEventArgs e)
        {
            //credit to Ashwini Verma at http://stackoverflow.com/questions/9822827/how-to-pass-multiple-values-through-command-argument-in-asp-net

            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string orderID = commandArgs[0];
            string paymentStatus = commandArgs[1];

            using (conn)
            {
                //if OrderFulfilled is false, update to true
                //if OrderFulfilled is true, update to false
                if (paymentStatus == "False")
                {
                    //Opens the connection to the default database
                    conn.Open();
                    //Assign update sql statement as a string
                    string sql = "UPDATE Orders SET OrderPaidFor='true' WHERE OrderId = " + orderID;
                    //Creates a new SQL command from the sql string and connection above.
                    SqlCommand command = new SqlCommand(sql, conn);
                    command.CommandType = CommandType.Text;
                    //More info on ExecuteNonQuery found @ https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand.executenonquery(v=vs.110).aspx
                    command.ExecuteNonQuery();
                    conn.Close();
                    //Bind data to repeater after values are updated
                    Repeater1.DataBind();
                }
                else
                {
                    //Opens the connection to the default database
                    conn.Open();
                    //Assign update sql statement as a string
                    string sql = "UPDATE Orders SET OrderPaidFor='false' WHERE OrderId = " + orderID;
                    //Creates a new SQL command from the sql string and connection above.
                    SqlCommand command = new SqlCommand(sql, conn);
                    command.CommandType = CommandType.Text;
                    //More info on ExecuteNonQuery found @ https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand.executenonquery(v=vs.110).aspx
                    command.ExecuteNonQuery();
                    conn.Close();
                    //Bind data to repeater after values are updated
                    Repeater1.DataBind();
                }
            }
        }
    }
}