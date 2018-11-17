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

        public static SqlDataReader GetPrescription(SqlConnection con, int PatientID)
        {
            //set connection to PharmaCareDB class GetConnection method
            SqlConnection connection = Dbconnection.GetConnection();
            //select statement
            string selectStatement = "SELECT Prescriptions.PrescriptionID, Drugs.DrugName, Patients.Name, Doctors.DoctorName, " +
                "Prescriptions.PrescriptionDate, Prescriptions.AdditionalInformation, Prescriptions.PrescriptionStatus, Prescriptions.DrugDose, " +
                "Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay, Prescriptions.StatusOfDose FROM Prescriptions " +
                "INNER JOIN Drugs ON Prescriptions.DrugID = Drugs.DrugID " +
                "INNER JOIN Doctors ON Prescriptions.DoctorID = Doctors.DoctorID " +
                "INNER JOIN Patients ON Prescriptions.PatientID = Patients.PatientID " +
                "WHERE Prescriptions.PatientID = @PatientID";
            
            using (var selectCommand = new SqlCommand(selectStatement, con))
            {
                selectCommand.Parameters.AddWithValue("@PatientID", PatientID);
                return selectCommand.ExecuteReader();
            }
        }
        /*try
        {
            connection.Open();
            SqlDataReader Reader = selectCommand.ExecuteReader(System.Data.CommandBehavior.SingleRow);

            if
               (Reader.Read())
            {
                prescription prescriptiontInfo = new prescription();
                prescriptiontInfo.PatientID = (int)Reader["PatientID"];
                prescriptiontInfo.DrugID = (int)Reader["DrugID"];
                prescriptiontInfo.DrugName = Reader["DrugName"].ToString();
                prescriptiontInfo.PatientID = (int)Reader["PatientID"];
                prescriptiontInfo.DoctorID = (int)Reader["DoctorID"];
                prescriptiontInfo.DoctorName = Reader["DoctorName"].ToString();
                prescriptiontInfo.PrescriptionDate = Reader["PrescriptionDate"].ToString();
                prescriptiontInfo.PrescriptionStatus = Reader["PrescriptionStatus"].ToString();
                prescriptiontInfo.DrugDose = Reader["DrugDose"].ToString();


            }
            else
            {

            }
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally
        {
            connection.Close();
        }


    }*/
        
        
    }
}