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
        //SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\ProjectsV13;AttachDbFilename=""C: \Users\Braden\Source\Repos\Ecommerce - Project\Ecommerce Project\App_Data\aspnet - Ecommerce Project - 20161119011615.mdf"";Initial Catalog=""aspnet - Ecommerce Project - 20161119011615"";Integrated Security=True");
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                using (conn)
                {
                    conn.Open();
                    string sql = "INSERT INTO UserInformation(Id, FirstName,LastName,PhoneNumber,UserAddress,UserCity,UserState,UserZipCode) VALUES(@param1,@param2,@param3,@param4,@param5,@param6, @param7, @param8)";
                    SqlCommand command = new SqlCommand(sql, conn);
                    command.Parameters.Add("@param1", SqlDbType.NVarChar, 128).Value = user.Id;
                    command.Parameters.Add("@param2", SqlDbType.VarChar, 50).Value = FirstName.Text;
                    command.Parameters.Add("@param3", SqlDbType.VarChar, 50).Value = LastName.Text;
                    command.Parameters.Add("@param4", SqlDbType.VarChar, 15).Value = PhoneNumber.Text;
                    command.Parameters.Add("@param5", SqlDbType.VarChar, 100).Value = Address.Text;
                    command.Parameters.Add("@param6", SqlDbType.VarChar, 50).Value = City.Text;
                    command.Parameters.Add("@param7", SqlDbType.VarChar, 50).Value = State.Text;
                    command.Parameters.Add("@param8", SqlDbType.VarChar, 5).Value = ZipCode.Text;
                    command.CommandType = CommandType.Text;
                    command.ExecuteNonQuery();
                }

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