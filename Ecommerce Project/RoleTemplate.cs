using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce_Project
{
    class RoleTemplate : ITemplate
    {
        public void InstantiateIn(System.Web.UI.Control container)
        {
            LoginName ln = new LoginName();
            LoginStatus ls = new LoginStatus();
            Literal lc = new Literal();

            lc.Text = "<br />";
            ln.FormatString = "Welcome, {0}. This line is from the template.";

            container.Controls.Add(ln);
            container.Controls.Add(lc);
            container.Controls.Add(ls);
        }

        void Page_Load(Object sender, EventArgs e)
        {
            RoleGroup rg = new RoleGroup();
            rg.ContentTemplate = new RoleTemplate();
            String[] RoleList = { "users" };
            rg.Roles = RoleList;
            //RoleGroupCollection rgc = LoginView1.RoleGroups;
            //rgc.Add(rg);
        }
    }

    
}