//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PETCHECK.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Consulta
    {
        public int idConsulta { get; set; }
        public string Diagnostico { get; set; }
        public Nullable<System.DateTime> Fecha { get; set; }
        public int Mascota { get; set; }
        public Nullable<int> Servicio { get; set; }
        public int Doctor { get; set; }
        public Nullable<int> Cita { get; set; }
    
        public virtual Cita Cita1 { get; set; }
        public virtual Mascota Mascota1 { get; set; }
        public virtual Servicio Servicio1 { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}
