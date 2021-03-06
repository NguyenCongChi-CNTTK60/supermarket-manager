using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp.Controller;
using WindowsFormsApp.DataSet;

namespace WindowsFormsApp
{
    public partial class FormInHoaDon : Form
    {
        private string mahd;
        private string Tienkhachdua;
        private string Tienhoantra;
        public FormInHoaDon(string mahd, string Tienkhachdua, string Tienhoantra)
        {
            InitializeComponent();
            this.mahd = mahd;
            this.Tienkhachdua = Tienkhachdua;
            this.Tienhoantra = Tienhoantra;
        }


        Chuoiketnoi chuoiketnoi = new Chuoiketnoi();
        private void FormInHoaDon_Load(object sender, EventArgs e)
        {
            SqlConnection con = chuoiketnoi.sqlConnection();
            con.Open();
            string query = "USP_Inhoadon'" + mahd + "'";
            SqlDataAdapter dta = new SqlDataAdapter(query, con);
            DataSet1 dataSet1 = new DataSet1();
            dta.Fill(dataSet1, "DataTable2");
            ReportDataSource dataSource = new ReportDataSource("DataSet1", dataSet1.Tables[1]);
            con.Close();
            ReportParameter[] rptParams = new ReportParameter[]
           {
                new ReportParameter("Tienkhachdua", Tienkhachdua),
                new ReportParameter("Tienhoantra", Tienhoantra)
           };
            this.reportViewer1.LocalReport.SetParameters(rptParams);
            this.reportViewer1.LocalReport.DataSources.Clear();
            this.reportViewer1.LocalReport.DataSources.Add(dataSource);
            this.reportViewer1.RefreshReport();

        }
    }
}
