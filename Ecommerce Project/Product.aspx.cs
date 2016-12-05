using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Microsoft.AspNet.Identity;

namespace Ecommerce_Project
{
    public partial class Product : System.Web.UI.Page
    {
        public string productDescription()
        {
            string htmlData = "";

            return htmlData;
        }


        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string prodId = Request.QueryString["ProductID"];

        }
    }
}