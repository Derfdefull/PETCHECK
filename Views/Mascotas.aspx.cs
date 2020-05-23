using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PETCHECK.Models;
using System.Data.Entity.Validation;

namespace PETCHECK.Views
{
    public partial class Mascotas : System.Web.UI.Page
    {
        protected PetCheckDBEntities db;
        protected List<Mascota> PetList;
        protected Mascota Edit;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                db = new PetCheckDBEntities();
                PetList = db.Mascota.ToList();
                if (Request.QueryString["K"] != null)
                {
                    PetList = PetList.Where(st => st.Nombre.ToLower().Contains(Request.QueryString["K"].ToLower())).ToList();
                }

                if (Request.QueryString["Own"] != null)
                {
                    var i = int.Parse(Request.QueryString["Own"]);
                    Edit = db.Mascota.First(st => st.idMascota == i);
                }

            }catch (Exception)
            {
                db = new PetCheckDBEntities();
                PetList = new List<Mascota>(); 
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var dbr = new PetCheckDBEntities();
                dbr.Mascota.Add(new Mascota()
                {
                    Nombre = TxtRName.Text,
                    Genero = CmbRGender.Text,
                    Raza = TxtRRace.Text,
                    Especie = TxtRSpecies.Text,
                    Estatura = double.Parse(TxtRTall.Text),
                    Peso = double.Parse(TxtRWeight.Text),
                    Fecha_Nacimiento = DateTime.Parse(TxtRDate.Text)
                }); dbr.SaveChanges();
                Response.Redirect("~/Views/Mascotas.aspx?Er=1");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Mascotas.aspx?Er=2");
            }
           
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                var i = int.Parse(Request.QueryString["Edit"]);
                Edit = db.Mascota.First(st => st.idMascota == i);
                Edit.Nombre = TxtEName.Text; Edit.Genero = CmbEGender.Text; Edit.Especie = TxtESpecies.Text; 
                Edit.Raza = TxtERace.Text;
                Edit.Estatura = double.Parse(TxtETall.Text);
                Edit.Peso = double.Parse(TxtEWeight.Text);
                Edit.Fecha_Nacimiento = DateTime.Parse(TxtEDate.Text);
                db.SaveChanges();
                Response.Redirect("~/Views/Mascotas.aspx?Er=0");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Mascotas.aspx?Er=2");
            }
           
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (TxtSearch.Text.Trim() != "")
            {
                Response.Redirect(string.Format("~/Views/Mascotas.aspx?K={0}", TxtSearch.Text));
            }
            else
            {
                Response.Redirect("~/Views/Servicios.aspx");
            }
        }
    }
}