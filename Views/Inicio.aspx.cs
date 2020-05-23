using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PETCHECK.Models;

namespace PETCHECK.Views
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected Usuario UserData;
        protected string ChartData;
        protected List<Cita> C;
        protected List<Cita> CToday;
        protected List<Cita> CWeek;

        protected void Page_Load(object sender, EventArgs e)
        {
           
                UserData = (Usuario)Session["UserLoged"];
                GetChartData();
                C = new List<Cita>(); CToday = new List<Cita>();
                CWeek = new List<Cita>();
                var db = new PetCheckDBEntities();
                var time = DateTime.Now.TimeOfDay;
                C = db.Cita.ToList();
                C = C.Where(st => st.Fecha.Month == DateTime.Now.Month).ToList();
                CToday = C.Where(st => st.Fecha.Day == DateTime.Today.Day).ToList();
                CWeek = C.Where(st => st.Fecha >= DateTime.Today && st.Fecha <= DateTime.Today.AddDays(7)).ToList();
            
        }


        protected void GetChartData()
        {
            var C = new PetCheckDBEntities().Cita.Where(st => st.Fecha.Year == DateTime.Now.Year).ToList();
            for (int Month = 1; Month <= 12; Month++)
            {
                var aux = C.Where(st => st.Fecha.Month == Month).ToList();
                if (Month != 12)
                    ChartData += String.Format("{0},", aux.Count);
                else
                    ChartData += String.Format("{0}", aux.Count);
            }
        }
    }
}