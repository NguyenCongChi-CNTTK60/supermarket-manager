using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp.Controller;

namespace WindowsFormsApp
{
    public partial class UC_ThongKe : UserControl
    {
        public UC_ThongKe()
        {
            InitializeComponent();
            getDataChart();
        }

        private void addUC(UserControl userControl) 
        {
            userControl.Dock = DockStyle.Fill;
            pnlTK.Controls.Clear();
            pnlTK.Controls.Add(userControl);
            userControl.BringToFront();
        }

        private void btnHoadon_Click_1(object sender, EventArgs e)
        {
           
            UC_ThongKeHoaDon uC_Thongkehoadon = new UC_ThongKeHoaDon();
            addUC(uC_Thongkehoadon);
        }

        private void btnHanghoa_Click_1(object sender, EventArgs e)
        {
           
            UC_ThongKeHangHoa uC_ThongKehanghoa = new UC_ThongKeHangHoa();
            addUC(uC_ThongKehanghoa);
        }

        private void btnKhachhang_Click_1(object sender, EventArgs e)
        {
          
            UC_ThongKeKhachHang uC_Thongkekhachhang = new UC_ThongKeKhachHang();
            addUC(uC_Thongkekhachhang);
        }

        private void btnphieunhap_Click_1(object sender, EventArgs e)
        {
            UC_ThongKePhieuNhap uC_Thongkephieunhap = new UC_ThongKePhieuNhap();
            addUC(uC_Thongkephieunhap);
        }

        private void pnlButton_Paint(object sender, PaintEventArgs e)
        {

        }



        DateTime today = DateTime.Now;
        private void getDataChart()
        {
            chart1.Titles.Clear();
            dpkNgaybd.Value = new DateTime(2021,11,1);
            dpkNgaykt.Value = dpkNgaybd.Value.AddMonths(1).AddDays(-1);
            string query = "USP_ThongKeDoanhThuTrongThang @ngaybd , @ngaykt";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { dpkNgaybd.Value, dpkNgaykt.Value });
            chart1.DataSource = data;
            chart1.Series["Doanh Thu"].XValueMember = "NGAY";
            chart1.Series["Doanh Thu"].YValueMembers = "TONGTIEN";
            chart1.Titles.Add("THỐNG KÊ DOANH THU");
            chart1.Series["Doanh Thu"].Color = System.Drawing.Color.FromArgb(59, 82, 132);
            //chart1.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
            // chart1.ChartAreas[0].AxisX.Minimum = 0;
            //chart1.Series[0].ChartType = SeriesChartType.Column;

        }

        private void btnXem_Click(object sender, EventArgs e)
        {
            chart1.Titles.Clear();
            string query = "USP_ThongKeDoanhThuTrongThang @ngaybd , @ngaykt";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { dpkNgaybd.Value, dpkNgaykt.Value });
            chart1.DataSource = data;
            chart1.Series["Doanh Thu"].XValueMember = "NGAY";
            chart1.Series["Doanh Thu"].YValueMembers = "TONGTIEN";
            chart1.Titles.Add("THỐNG KÊ DOANH THU");
            chart1.Series["Doanh Thu"].Color = System.Drawing.Color.FromArgb(59, 82, 132);
        }
    }
}
