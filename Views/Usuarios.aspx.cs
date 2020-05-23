using PETCHECK.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PETCHECK.Views
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected PetCheckDBEntities db;
        protected List<Usuario> UserList;
        protected Usuario Edit;

        protected void Page_Load(object sender, EventArgs e)
        {
            db = new PetCheckDBEntities();
            UserList = db.Usuario.Where(st => st.Contraseña != null).ToList();
            if(Request.QueryString["K"] != null) {
                UserList = UserList.Where(st => st.Alias.ToLower().Contains(Request.QueryString["K"].ToLower())).ToList();
            }

        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                var dbr = new PetCheckDBEntities();
                dbr.Usuario.Add(new Usuario()
                {
                    Nombre = TxtRName.Text,
                    Contraseña = TxtRPws.Text,
                    Alias = TxtRUser.Text,
                    Tipo = false
                }); dbr.SaveChanges();
                Response.Redirect("~/Views/Usuarios.aspx?Er=1");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Usuarios.aspx?Er=2");
            }
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                var i = int.Parse(Request.QueryString["Edit"]);
                Edit = db.Usuario.First(st => st.idUsuario == i);
                Edit.Nombre = TxtEName.Text;
                Edit.Alias = TxtEUser.Text;
                _ = CmbEType.SelectedIndex == 0 ? Edit.Tipo = true : Edit.Tipo = false;
                db.SaveChanges();
                Response.Redirect("~/Views/Usuarios.aspx?Er=0");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Usuarios.aspx?Er=2");
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if(TxtSearch.Text.Trim() != "")
            {
                Response.Redirect(string.Format("~/Views/Usuarios.aspx?K={0}", TxtSearch.Text));
            }
            else
            {
                Response.Redirect("~/Views/Servicios.aspx");
            }
        }
    }
}