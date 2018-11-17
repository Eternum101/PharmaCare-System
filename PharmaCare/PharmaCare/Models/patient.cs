using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PharmaCare.Models
{
    public class patient
    {
        public int PatientID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string Type { get; set; }
        public int DoctorID { get; set; }
        public int WardID { get; set; }
        public int RoomID { get; set; }
        
        public static patient SearchPatientID(int PatientID)
        {
            SqlConnection connection = Dbconnection.GetConnection();
            string selectStatement = "SELECT * FROM Patients WHERE PatientID = @PatientID";
            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
            selectCommand.Parameters.AddWithValue("@PatientID", PatientID);

            try
            {
                connection.Open();
                SqlDataReader patientReader = selectCommand.ExecuteReader(System.Data.CommandBehavior.SingleRow);

                if
                   (patientReader.Read())
                {
                    patient patientInfo = new patient();
                    patientInfo.PatientID = (int)patientReader["PatientID"];
                    patientInfo.Name = patientReader["Name"].ToString();
                    patientInfo.Address = patientReader["Address"].ToString();
                    patientInfo.City = patientReader["City"].ToString();
                    patientInfo.ZipCode = patientReader["ZipCode"].ToString();
                    patientInfo.Type = patientReader["Type"].ToString();
                    patientInfo.DoctorID = (int)patientReader["DoctorID"];
                    patientInfo.WardID = (int)patientReader["WardID"];
                    patientInfo.RoomID = (int)patientReader["RoomID"];

                    return patientInfo;

                }
                else
                {
                    return null;
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
        }

        public static patient SearchPatientName(string PatientName)
        {
            //set connection to schoolDB class GetConnection method
            SqlConnection connection = Dbconnection.GetConnection();
            //select statement
            string selectStatement = "SELECT * FROM Patients WHERE Name = @PatientName";
            //select command
            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
            selectCommand.Parameters.AddWithValue("@PatientName", PatientName);

            try
            {
                connection.Open();
                SqlDataReader patientReader = selectCommand.ExecuteReader(System.Data.CommandBehavior.SingleRow);

                if
                   (patientReader.Read())
                {
                    patient patientInfo = new patient();
                    patientInfo.PatientID = (int)patientReader["PatientID"];
                    patientInfo.Name = patientReader["Name"].ToString();
                    patientInfo.Address = patientReader["Address"].ToString();
                    patientInfo.City = patientReader["City"].ToString();
                    patientInfo.ZipCode = patientReader["ZipCode"].ToString();
                    patientInfo.Type = patientReader["Type"].ToString();
                    patientInfo.DoctorID = (int)patientReader["DoctorID"];
                    patientInfo.WardID = (int)patientReader["WardID"];
                    patientInfo.RoomID = (int)patientReader["RoomID"];

                    return patientInfo;

                }
                else
                {
                    return null;
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
        }
    }

    
}