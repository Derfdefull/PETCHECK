using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PETCHECK.Models;

namespace PETCHECK.Views
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected PetCheckDBEntities db;
        protected List<Usuario> UserList;
        protected Usuario Edit;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            db = new PetCheckDBEntities();
            UserList = db.Usuario.Where(st => st.Contraseña == null).ToList();

            if (Request.QueryString["K"] != null)
            {
                UserList = UserList.Where(st => st.Nombre.ToLower().Contains(Request.QueryString["K"].ToLower())).ToList();
            }

            if (Request.QueryString["Own"] != null)
            {
                var i = int.Parse(Request.QueryString["Own"]);
                Edit = db.Usuario.First(st => st.idUsuario == i);
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var dbr = new PetCheckDBEntities();
                dbr.Usuario.Add(new Usuario()
                {
                    Nombre = TxtRName.Text,
                    Telefono = int.Parse(TxtRPhone.Text),
                    Direccion = TxtRAddress.Text
                }); dbr.SaveChanges();
                Response.Redirect("~/Views/Clientes.aspx?Er=1");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Clientes.aspx?Er=2");
            }
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                var i = int.Parse(Request.QueryString["Edit"]);
                Edit = db.Usuario.First(st => st.idUsuario == i);
                Edit.Nombre = TxtEName.Text;
                Edit.Telefono = int.Parse(TxtEPhone.Text);
                Edit.Direccion = TxtEAddress.Text;
                db.SaveChanges();
                Response.Redirect("~/Views/Clientes.aspx?Er=0");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Clientes.aspx?Er=2");
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (TxtSearch.Text.Trim() != "")
            {
                Response.Redirect(string.Format("~/Views/Clientes.aspx?K={0}", TxtSearch.Text));
            }
            else
            {
                Response.Redirect("~/Views/Servicios.aspx");
            }
        }
    }
}