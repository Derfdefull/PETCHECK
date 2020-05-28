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
    public partial class Consultas : System.Web.UI.Page
    {
        protected PetCheckDBEntities db;
        protected List<Consulta> CList;

        protected void Page_Load(object sender, EventArgs e)
        {
            db = new PetCheckDBEntities();
            CList = db.Consulta.ToList();
            if (Request.QueryString["k"] != null && Request.QueryString["k"] != "")
            {
                var date = DateTime.Parse(Request.QueryString["k"]);
                CList = CList.Where(st => st.Fecha.Value.Day == date.Day).ToList();
            }
            if (Request.QueryString["New"] != null)
            {
                foreach (var doc in db.Usuario.Where(st => st.Tipo == true).ToList())
                {
                    cmbRDoc.Items.Add(new ListItem() { Value = doc.idUsuario.ToString(), Text = doc.Nombre });
                }
                foreach (var pet in db.Mascota.ToList())
                {
                    cmbRPet.Items.Add(new ListItem() { Value = pet.idMascota.ToString(), Text = pet.Nombre });
                }
                foreach (var srv in db.Servicio.ToList())
                {
                    cmbRServ.Items.Add(new ListItem() { Enabled = true, Text = srv.Nombre, Value = srv.idServicio.ToString() });
                }
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var dbr = new PetCheckDBEntities();

                var date = DateTime.Parse(TxtRDate.Text);
                var time = TimeSpan.Parse(TxtRTime.Text);

                DateTime CDateTime = date + time;

                dbr.Consulta.Add(new Consulta()
                {
                    Doctor = int.Parse(cmbRDoc.SelectedValue),
                    Mascota = int.Parse(cmbRPet.SelectedValue),
                    Servicio = int.Parse(cmbRServ.SelectedValue),
                    Fecha = CDateTime,
                    Diagnostico = TxtRDiag.Text
                });
                dbr.SaveChanges();
                Response.Redirect("~/Views/Consultas.aspx?Er=1");
            }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Consultas.aspx?Er=2");
            }
        }

        protected void BtnRegisterCita_Click(object sender, EventArgs e)
        {
            try
            {

            var dbr = new PetCheckDBEntities();
            var id = int.Parse(Request.QueryString["Cita"]);
            var C = db.Cita.Where(st => st.idCita == id).First();

            dbr.Consulta.Add(new Consulta()
            {
                Doctor = C.Doctor,
                Mascota = C.Mascota,
                Servicio = C.Servicio,
                Fecha = C.Fecha,
                Diagnostico = TxtCRDiag.Text
            });
            dbr.SaveChanges();
            Response.Redirect("~/Views/Consultas.aspx?Er=1");
        }
            catch (DbEntityValidationException)
            {
                Response.Redirect("~/Views/Consultas.aspx?Er=2");
            }
}

        protected void BtnFilter_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("~/Views/Consultas.aspx?k={0}", TxtInit.Text));
        }
    }
}