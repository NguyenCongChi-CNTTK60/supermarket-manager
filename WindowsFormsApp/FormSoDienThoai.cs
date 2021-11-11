﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLySieuThi
{
    public partial class FormSoDienThoai : Form
    {

        public FormSoDienThoai()
        {
            InitializeComponent();
            txtSDT.Focus();

        }

        Chuoiketnoi chuoiketnoi = new Chuoiketnoi();
        private void FormSodienthoai_Load(object sender, EventArgs e)
        {

        }


        private bool check_data()
        {
            if (string.IsNullOrEmpty(txtSDT.Text))
            {
                errorProvider1.SetError(txtSDT, " ");
                lblCanhbao.Text = "Vui lòng nhập số điện thoại của bạn";
                lblCanhbao.ForeColor = Color.Brown;
                return false;
            }
            else
                errorProvider1.SetError(txtSDT, null);
            return true;
        }

        private void addUC(UserControl userControl)
        {
            userControl.Dock = DockStyle.Fill;
            pnlma.Controls.Clear();
            pnlma.Controls.Add(userControl);
            userControl.BringToFront();
        }

        private void btnLuu_Click_1(object sender, EventArgs e)
        {
            if (check_data() == true)
            {
                SqlConnection con = chuoiketnoi.sqlConnection();
                con.Open();
                string tk = txtSDT.Text;

                string query = "select Sdt,Tendangnhap from Nhanvien where Sdt = '" + tk + "'";
                SqlCommand sqlCommand = new SqlCommand(query, con);
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                if (sqlDataReader.Read() == true)
                {
                    UC_Xacnhanma_dienthoai uC_Xacnhanma_Dienthoai = new UC_Xacnhanma_dienthoai(txtSDT.Text);
                    addUC(uC_Xacnhanma_Dienthoai);
                }
                else
                    lblCanhbao.Text = "Số điện thoại không đúng";
                lblCanhbao.ForeColor = Color.Brown;
                con.Close();
            }
        }

        private void btnQuaylai_Click_1(object sender, EventArgs e)
        {
            FormDangnhap formDangnhap = new FormDangnhap();
            formDangnhap.Show();
            this.Hide();
        }

        private void txtSđtnv_TextChanged_1(object sender, EventArgs e)
        {
            lblCanhbao.Text = "";
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {

        }
    }
}
