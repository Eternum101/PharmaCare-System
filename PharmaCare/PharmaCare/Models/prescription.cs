using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace PharmaCare.Models
{
    public class prescription
    {
        public int PrescriptionID { get; set; }
        public int DrugID { get; set; }
        public string DrugName { get; set; }
        public int PatientID { get; set; }
        public int DoctorID { get; set; }
        public string DoctorName { get; set; }
        public string PrescriptionDate { get; set; }
        public string PrescriptionStatus { get; set; }
        public string DrugDose { get; set; }
        public string FirstTime { get; set; }
        public string LastTime { get; set; }
        public string TimesPerDay { get; set; }
        public string StatusOfDoes { get; set; }
        public string AdditionalInformation { get; set; }
        
    }
}