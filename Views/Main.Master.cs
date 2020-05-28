using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PETCHECK.Models;

namespace PETCHECK.Views
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected Usuario aux;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLoged"] != null)
            {
                aux = (Usuario)Session["UserLoged"];
            }
            else
            {
                if(Request.QueryString["log"] == null)
                Response.Redirect("~/Views/Login.aspx?log=0");
            }
        }
    }
}