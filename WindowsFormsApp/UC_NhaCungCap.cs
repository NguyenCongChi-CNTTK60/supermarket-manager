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
    public partial class UC_NhaCungCap : UserControl
    {
        public UC_NhaCungCap()
        {
            InitializeComponent();
            LoadData();
            //Lammoi();
            txtMaNCC.Text = Matudong();
        }


        /*void loadBinding()
        {
            txtMaNCC.DataBindings.Add(new Binding("Text", dgvThongTinNCC.DataSource, "MaNCC", true, DataSourceUpdateMode.Never));
            txtTenNCC.DataBindings.Add(new Binding("Text", dgvThongTinNCC.DataSource, "TenNCC", true, DataSourceUpdateMode.Never));
            txtDiaChi.DataBindings.Add(new Binding("Text", dgvThongTinNCC.DataSource, "DiaChi", true, DataSourceUpdateMode.Never));
            txtSDT.DataBindings.Add(new Binding("Text", dgvThongTinNCC.DataSource, "SDT", true, DataSourceUpdateMode.Never));
            txtEmail.DataBindings.Add(new Binding("Text", dgvThongTinNCC.DataSource, "Email", true, DataSourceUpdateMode.Never));
        } */
        void LoadData()
        {
            dgvThongTinNCC.DataSource = QuanLyNhaCC.Intance.getListNCC();
        }





        void ClearBinding()
        {
            txtMaNCC.DataBindings.Clear();
            txtTenNCC.DataBindings.Clear();
            txtDiaChi.DataBindings.Clear();
            txtSDT.DataBindings.Clear();
            txtEmail.DataBindings.Clear();
        }

        private void btnLamMoi_Click_1(object sender, EventArgs e)
        {
            Lammoi();
            txtMaNCC.Text = Matudong();
        }


        private string Matudong()
        {
            string query = "select MaNCC from NhaCungCap";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);
            string ma = "";
            if (dt.Rows.Count <= 0)
            {
                ma = "NCC001";
            }
            else
            {
                int k;
                ma = "NCC";
                k = dt.Rows.Count;
                k++;
                if (k < 10)
                {
                    ma = ma + "00";
                }
                else if (k >= 10 && k < 100)
                {
                    ma = ma + "0";
                }
                else if (k >= 100 && k < 1000)
                {
                    ma = ma + " ";
                }
                ma = ma + k.ToString();

            }
            return ma;
        }


        private void Lammoi()
        {
            txtMaNCC.Text = "";
            txtTenNCC.Text = "";
            txtDiaChi.Text = "";
            txtSDT.Text = "";
            txtEmail.Text = "";
           
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (check_data() == true)
            {
                if (QuanLyNhaCC.Intance.themNCC(txtMaNCC.Text, txtTenNCC.Text, txtDiaChi.Text, txtSDT.Text, txtEmail.Text) == true)
                {

                    MessageBox.Show("Thêm thành công", "Thông báo");
                    txtMaNCC.Text = Matudong();
                    Lammoi();
                    LoadData();
                    //ClearBinding();
                }
                else
                    MessageBox.Show("Không thể xóa", "Thông báo");
            }
        }


        private void btnSua_Click_1(object sender, EventArgs e)
        {
            if (check_data() == true)
            {
                if (QuanLyNhaCC.Intance.capnhatNCC(txtTenNCC.Text, txtDiaChi.Text, txtSDT.Text, txtEmail.Text, txtMaNCC.Text) == true)
                {

                    MessageBox.Show("Sửa thành công", "Thông báo");
                    Lammoi();
                    LoadData();
                    //ClearBinding();
                }
                else
                    MessageBox.Show("Không thể sửa", "Thông báo");

            }
        }

        private void btnXoa_Click_1(object sender, EventArgs e)
        {
            if (QuanLyNhaCC.Intance.xoaNV(txtMaNCC.Text) == true)
            {
                MessageBox.Show("Xóa thành công", "Thông báo");
                LoadData();
                Lammoi();
                txtMaNCC.Text = Matudong();
            }
            else
            {
                MessageBox.Show("Không thể xóa", "Thông báo");
            }
        }


        private bool check_data()
        {
            if (string.IsNullOrEmpty(txtTenNCC.Text))
            {
                MessageBox.Show("Tên nhà cung cấp không được trống");
                return false;
            }
            else if (string.IsNullOrEmpty(txtSDT.Text))
            {
                MessageBox.Show("Số điện thoại không được trống");
                return false;
            }

            return true;
        }

        private void dgvThongTinNCC_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int indexx;
            indexx = e.RowIndex;
            txtMaNCC.Text = dgvThongTinNCC.Rows[indexx].Cells[0].Value.ToString();
            txtTenNCC.Text = dgvThongTinNCC.Rows[indexx].Cells[1].Value.ToString();
            txtDiaChi.Text = dgvThongTinNCC.Rows[indexx].Cells[2].Value.ToString();
            txtSDT.Text = dgvThongTinNCC.Rows[indexx].Cells[3].Value.ToString();
            txtEmail.Text = dgvThongTinNCC.Rows[indexx].Cells[4].Value.ToString();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(txtTimKiem.Text))
            {
                DataTable dt = QuanLyNhaCC.Intance.Timkiem(txtTimKiem.Text,txtTimKiem.Text);
                dgvThongTinNCC.DataSource = dt;
            }
            else
                LoadData();
        }

        private void dgvThongTinNCC_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            int indexx;
            indexx = e.RowIndex;
            txtMaNCC.Text = dgvThongTinNCC.Rows[indexx].Cells[0].Value.ToString();
            txtTenNCC.Text = dgvThongTinNCC.Rows[indexx].Cells[1].Value.ToString();
            txtDiaChi.Text = dgvThongTinNCC.Rows[indexx].Cells[2].Value.ToString();
            txtSDT.Text = dgvThongTinNCC.Rows[indexx].Cells[3].Value.ToString();
            txtEmail.Text = dgvThongTinNCC.Rows[indexx].Cells[4].Value.ToString();
        }
    }
}
