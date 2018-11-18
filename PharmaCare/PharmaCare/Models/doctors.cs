﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PharmaCare.Models
{
    public class doctors
    {
        public int DoctorID { get; set; }
        public string DoctorName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string Speciality { get; set; }
    }
}