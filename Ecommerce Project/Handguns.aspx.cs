using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce_Project
{
    public partial class Handguns : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //public void getProdID(int i)
        //{
        //    //Debug.WriteLine("Debug: " + i);
        //    Response.Redirect("~/AddToCart.aspx?ProductID=" + i);
        //}

        public void getProdID(object sender, EventArgs e)
        {
            //Debug.WriteLine("Debug: " + i);

            Response.Redirect("~/AddToCart.aspx?ProductID=1");
        }
    }
}