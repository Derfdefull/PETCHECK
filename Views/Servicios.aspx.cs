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
    public partial class Servicios : System.Web.UI.Page
    {
        protected PetCheckDBEntities db;
        protected List<Servicio> ServList;
        protected Servicio Edit;

        protected void Page_Load(object sender, EventArgs e)
        {
            db = new PetCheckDBEntities();
            ServList = db.Servicio.ToList();

            if (Request.QueryString["K"] != null)
            {
                ServList = ServList.Where(st => st.Nombre.ToLower().Contains(Request.QueryString["K"].ToLower())).ToList();
            }
        }


        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var dbr = new PetCheckDBEntities();
                dbr.Servicio.Add(new Servicio()
                {
                    Nombre = TxtRName.Text,
                    Precio = int.Parse(TxtRPrice.Text),
                    Descripcion = TxtRDescription.Text,
                    Clinica = 1
                }); dbr.SaveChanges();
                Response.Redirect("~/Views/Servicios.aspx?Er=1");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Servicios.aspx?Er=2");
            }
            
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                var i = int.Parse(Request.QueryString["Edit"]);
                Edit = db.Servicio.First(st => st.idServicio == i);
                Edit.Nombre = TxtEName.Text;
                Edit.Precio = int.Parse(TxtEPrice.Text);
                Edit.Descripcion = TxtEDescription.Text;
                db.SaveChanges();
                Response.Redirect("~/Views/Servicios.aspx?Er=0");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Servicios.aspx?Er=2");
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (TxtSearch.Text.Trim() != "")
            {
                Response.Redirect(string.Format("~/Views/Servicios.aspx?K={0}", TxtSearch.Text));
            }
            else
            {
                Response.Redirect("~/Views/Servicios.aspx");
            }
        }
    }
}