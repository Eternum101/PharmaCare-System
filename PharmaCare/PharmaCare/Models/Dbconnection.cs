﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace PharmaCare.Models
{
    public class Dbconnection
    {
        public static SqlConnection GetConnection()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=PharmaCare_DB;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            return connection;
        }
    }
}