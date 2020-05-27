using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PETCHECK.Models;
using PETCHECK.Class;
namespace PETCHECK.Views
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
           PetCheckDBEntities db = new PetCheckDBEntities();
            var Psw = Encrypter.ToHash(TxtPsw.Text);
            var query = db.Usuario.Where(st => st.Alias == TxtUser.Text && st.Contraseña == Psw).ToList();
            if (query.Count == 1)
            {
                var user = query.First(); 
                Session["UserLoged"] = user;
                Session.Timeout = 10; 
                Response.Redirect("~/Views/Inicio.aspx");
            }
            else
            {
                string s = "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\"><strong> Algo salio mal! </ strong > La contraseña o el usuario son incorrectos. <button type = \"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"> <span aria-hidden=\"true\">&times;</span> </button></div>";
                msgbox.InnerHtml = s; 
            }

        }
    }
}