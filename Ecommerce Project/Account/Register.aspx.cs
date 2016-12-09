using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Ecommerce_Project.Models;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Configuration;
using System.Diagnostics;
using System.Web.UI.WebControls;

namespace Ecommerce_Project.Account
{
    public partial class Register : Page
    {
        //Define sql connection 
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        //This method is called when a user registers.
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            //Default code...
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                using (conn)
                {
                    //Open sql connection
                    conn.Open();
                    //Define the sql command to create the user
                    string sql = "INSERT INTO UserInformation(Id, FirstName,LastName,PhoneNumber,UserAddress,UserCity,UserState,UserZipCode) VALUES(@param1,@param2,@param3,@param4,@param5,@param6, @param7, @param8)";
                    //Assign the sql query to a command
                    SqlCommand command = new SqlCommand(sql, conn);
                    //Add all parameters from the form
                    command.Parameters.Add("@param1", SqlDbType.NVarChar, 128).Value = user.Id;
                    command.Parameters.Add("@param2", SqlDbType.VarChar, 50).Value = FirstName.Text;
                    command.Parameters.Add("@param3", SqlDbType.VarChar, 50).Value = LastName.Text;
                    command.Parameters.Add("@param4", SqlDbType.VarChar, 15).Value = PhoneNumber.Text;
                    command.Parameters.Add("@param5", SqlDbType.VarChar, 100).Value = Address.Text;
                    command.Parameters.Add("@param6", SqlDbType.VarChar, 50).Value = City.Text;
                    command.Parameters.Add("@param7", SqlDbType.VarChar, 50).Value = State.Text;
                    command.Parameters.Add("@param8", SqlDbType.VarChar, 5).Value = ZipCode.Text;
                    command.CommandType = CommandType.Text;
                    //Executes the sql command
                    command.ExecuteNonQuery();
                }
                //More default code...
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}