using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp.Controller;

namespace WindowsFormsApp
{
    public partial class UC_KhachHang : UserControl
    {
        public UC_KhachHang()
        {
            InitializeComponent();
            LoadListKH();
            txtMaKH.Text = Matudong();
        }

        public void LoadListKH()
        {
            DataTable dt = QuanLyKhachHang.Intance.getListKH();
            dgvThongTinKhachHang.DataSource = dt;
            //loadBinding();
        }



        private string Matudong()
        {
            string query = "select MaKH from KhachHang";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);
            string ma = "";
            if (dt.Rows.Count <= 0)
            {
                ma = "KH01";
            }
            else
            {
                int k;
                ma = "KH";
                //k = Convert.ToInt32(dt.Rows[dt.Rows.Count - 1][0].ToString().Substring(2, 3));
                k = dt.Rows.Count;
                k++;
                if (k < 10)
                {
                    ma = ma + "0";
                }
                else if (k >= 10 && k < 100)
                {
                    ma = ma + "";
                }
                else if (k >= 100 && k < 1000)
                {
                    ma = ma + "";
                }
                ma = ma + k.ToString();

            }
            return ma;
        }


        void loadBinding()
        {
            txtMaKH.DataBindings.Add(new Binding("Text", dgvThongTinKhachHang.DataSource, "MaKH", true, DataSourceUpdateMode.Never));
            txtTenKH.DataBindings.Add(new Binding("Text", dgvThongTinKhachHang.DataSource, "TenKH", true, DataSourceUpdateMode.Never));
            txtSDT.DataBindings.Add(new Binding("Text", dgvThongTinKhachHang.DataSource, "SDT", true, DataSourceUpdateMode.Never));
            txtEmail.DataBindings.Add(new Binding("Text", dgvThongTinKhachHang.DataSource, "Email", true, DataSourceUpdateMode.Never));
            txtDiaChi.DataBindings.Add(new Binding("Text", dgvThongTinKhachHang.DataSource, "DiaChi", true, DataSourceUpdateMode.Never));
        }

        void ClearBinding()
        {
            txtMaKH.DataBindings.Clear();
            txtTenKH.DataBindings.Clear();
            txtSDT.DataBindings.Clear();
            txtEmail.DataBindings.Clear();
            txtDiaChi.DataBindings.Clear();
        }        

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtTimKiem.Text))
            {
                DataTable dt = QuanLyKhachHang.Intance.TimKiemKH(txtTimKiem.Text);
                //ClearBinding();
                //loadBinding();
                dgvThongTinKhachHang.DataSource = dt;
                //LoadListKH();
            }
            else
                LoadListKH();
        }

        private void btnLamMoi_Click_1(object sender, EventArgs e)
        {
            ClearBinding();
            LoadListKH();
        }

        public bool check = false;
        private void btnThem_Click(object sender, EventArgs e)
        {
            check = !check;
            if (check == true)
            {
                txtMaKH.Text = Matudong();
                txtTenKH.Text = "";
                txtSDT.Text = "";
                txtEmail.Text = "";
                txtDiaChi.Text = "";
                txtMaKH.Enabled = true;
                txtTenKH.Enabled = true;
                txtSDT.Enabled = true;
                txtEmail.Enabled = true;
                txtDiaChi.Enabled = true;
                dgvThongTinKhachHang.Enabled = false;
                btnThem.Text = "Xác nhận";
            }
            else
            {
                btnThem.Text = "Thêm Mới";
                txtMaKH.Enabled = false;
                txtTenKH.Enabled = false;
                txtSDT.Enabled = false;
                txtEmail.Enabled = false;
                txtDiaChi.Enabled = false;
                dgvThongTinKhachHang.Enabled = true;
                if (txtMaKH.Text == "")
                {
                    MessageBox.Show("Nhập thiếu thông tin! Vui lòng thử lại");
                }
                else
                {
                    if (QuanLyKhachHang.Intance.themKH(txtMaKH.Text, txtTenKH.Text, txtDiaChi.Text, txtSDT.Text, txtEmail.Text))
                    {
                        MessageBox.Show("Thêm khách hàng thành công!", "Thông báo");
                        ClearBinding();
                        LoadListKH();
                        LamMoi();
                    }
                    else MessageBox.Show("Thất bại!", "Thông báo");
                }
            }
        }

        private void btnSua_Click_1(object sender, EventArgs e)
        {
            check = !check;
            if (check == true)
            {
                txtTenKH.Enabled = true;
                txtSDT.Enabled = true;
                txtEmail.Enabled = true;
                txtDiaChi.Enabled = true;
                btnThem.Enabled = false;
            }
            else
            {
                txtMaKH.Enabled = false;
                txtTenKH.Enabled = false;
                txtSDT.Enabled = false;
                txtEmail.Enabled = false;
                txtDiaChi.Enabled = false;
                if (QuanLyKhachHang.Intance.suaKH(txtMaKH.Text, txtTenKH.Text, txtDiaChi.Text, Convert.ToInt32(txtSDT.Text), txtEmail.Text))
                {
                    MessageBox.Show("Sửa thành công!", "Thông báo");
                    btnThem.Enabled = true;
                    ClearBinding();
                    LoadListKH();
                    LamMoi();
                }
            }
        }

        private void btnXoa_Click_1(object sender, EventArgs e)
        {
            if (QuanLyKhachHang.Intance.xoaKH(txtMaKH.Text))
            {
                MessageBox.Show("Xóa thành công!", "Thông báo");
                ClearBinding();
                LoadListKH();
                LamMoi();
            }
        }

        private void dgvThongTinKhachHang_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int indexx;
            indexx = e.RowIndex;
            txtMaKH.Text = dgvThongTinKhachHang.Rows[indexx].Cells[0].Value.ToString();
            txtTenKH.Text = dgvThongTinKhachHang.Rows[indexx].Cells[1].Value.ToString();
            txtDiaChi.Text = dgvThongTinKhachHang.Rows[indexx].Cells[2].Value.ToString();
            txtSDT.Text = dgvThongTinKhachHang.Rows[indexx].Cells[3].Value.ToString();
            txtEmail.Text = dgvThongTinKhachHang.Rows[indexx].Cells[4].Value.ToString();
        }


        private void LamMoi()
        {
            txtMaKH.Text = Matudong();
            txtTenKH.Text = "";
            txtSDT.Text = "";
            txtEmail.Text = "";
            txtDiaChi.Text = "";
        }
    }
}
