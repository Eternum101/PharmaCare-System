using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PharmaCare.Models
{
    public class prescription
    {
        public string PrescriptionID { get; set; }
        public string DrugID { get; set; }
        public string PatientID { get; set; }
        public string DoctorID { get; set; }
        public string PrescriptionDate { get; set; }
        public string PrescriptionStatus { get; set; }
        public float DrugDose { get; set; }
        public string FirstTime { get; set; }
        public string LastTime { get; set; }
        public int TimesPerDay { get; set; }
        public string StatusOfDoes { get; set; }
        public string AdditionalInformation { get; set; }
    }
}