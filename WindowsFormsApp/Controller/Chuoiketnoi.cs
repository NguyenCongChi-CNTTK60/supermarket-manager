﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp.Controller
{
    class Chuoiketnoi
    {
        string str;
        public Chuoiketnoi()
        {
            str = @"Data Source=desktop-rnopi29;Initial Catalog=QuanLySieuThi;User ID=sa;Password=123";
        }

        public SqlConnection sqlConnection()
        {
            return new SqlConnection(str);
        }
    }
}
