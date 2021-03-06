using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsApp.Models;

namespace WindowsFormsApp.Controller
{
    class MatHangDAO
    {
        private static MatHangDAO instance;

        public MatHangDAO()
        {
        }

        public static MatHangDAO Intance
        {
            get { if (instance == null) instance = new MatHangDAO(); return instance; }
            set => instance = value;
        }

        public List<Models.MatHang> getListSanPham()
        {
            List<Models.MatHang> list = new List<Models.MatHang>();
            DataTable data = DataProvider.Instance.ExecuteQuery("select MaMH, TenMH, DonVi, GiaBan, SoLuong from MatHang");
            foreach (DataRow item in data.Rows)
            {
                Models.MatHang mathang = new Models.MatHang(item);
                list.Add(mathang);
            }
            return list;
        }


        public bool suaHH(string MaHang, string TenHH,  int SoLuong, int GiaBan)
        {
            string query = String.Format("update MatHang set SoLuong = {0},  GiaBan = {1}, TenMH = N'{2}', DonVi = '{3}'  where MaHang = '{4}'", SoLuong, GiaBan, TenHH,  MaHang);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool kiemtraXoa(string maHang)
        {
            string query = String.Format("select * from ChiTietHD where MaHang = '{0}'", maHang);
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            if (data.Rows.Count > 0)
            {
                return false;
            }
            query = String.Format("select * from ChiTietPN where MaHang = '{0}'", maHang);
            data = DataProvider.Instance.ExecuteQuery(query);
            if (data.Rows.Count > 0)
            {
                return false;
            }
            return true;
        }

        public bool capNhatHH(string maHang, int SL, int DonGia)
        {
            string query = String.Format("update MatHang set SoLuong = {0} + SoLuong, GiaGoc = (GiaGoc + {1})/2 where MaMH = '{2}'", SL, DonGia, maHang);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool xoaHang(string maKH)
        {
            string query = String.Format("delete from MatHang where MaMH = '{0}'", maKH);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public string loadMaHH()
        {
            string maKHnext = "SP001";
            string query = "select top 1 MaMH from MatHang order by MaMH desc";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            if (data.Rows.Count > 0)
            {
                DataRow data2 = data.Rows[0];
                string maKH = data2["MaMH"].ToString();
                maKHnext = maKH.Substring(2);
                int i = Convert.ToInt32(maKHnext);
                i = i + 1;
                if (i < 100 && i > 9)
                {
                    maKHnext = "SP0" + i;
                }
                else if (i < 10) maKHnext = "SP00" + (i);
                else
                {
                    maKHnext = "SP" + i;
                }
            }

            return maKHnext;
        }

        public DataTable TimKiemHH(string maPN)
        {
            string query = "exec usp_timMatHang @maPN";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { maPN });
            return data;
        }

        public MatHang getSP(string maSP)
        {
            MatHang a = new MatHang();
            string query = String.Format("select * from MatHang where MaMH = N'{0}'", maSP);
            if (DataProvider.Instance.ExecuteQuery(query).Rows.Count > 0)
            {
                DataRow data = DataProvider.Instance.ExecuteQuery(query).Rows[0];
                a.TenMH = data["TenHang"].ToString();
                a.MaMH = maSP;
                a.GiaBan = int.Parse(data["GiaBan"].ToString());
            }
            return a;
        }

        public bool temHH(MatHang data, string imgLocation)
        {
            byte[] images = null;
            FileStream stream = new FileStream(imgLocation, FileMode.Open, FileAccess.Read);
            BinaryReader brs = new BinaryReader(stream);
            images = brs.ReadBytes((int)stream.Length);

            using (SqlConnection connection = new SqlConnection(@"Data Source=DESKTOP-RNOPI29;Initial Catalog=QuanLySieuThi;User ID=sa;Password=123"))
            {
                string query = String.Format("Insert into MatHang Values('{0}', N'{1}', '{2}', {3}, {4}, {5}, @hinh) ", data.MaMH, data.TenMH, data.DonVi, data.GiaBan, data.SoLuong);
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.Add(new SqlParameter("@hinh", images));

                connection.Open();
                int n = cmd.ExecuteNonQuery();
                if (n > 0)
                {
                    return true;
                }
                connection.Close();
            }
            return false;
        }

        public void capNhatHinh(string imgLocation, string maHang)
        {
            byte[] images = null;
            FileStream stream = new FileStream(imgLocation, FileMode.Open, FileAccess.Read);
            BinaryReader brs = new BinaryReader(stream);
            images = brs.ReadBytes((int)stream.Length);
            // Update hình nếu có
            using (SqlConnection connection = new SqlConnection(@"Data Source=DESKTOP-RNOPI29;Initial Catalog=QuanLySieuThi;User ID=sa;Password=123"))
            {
                string query = String.Format("Update MatHang set Anh = @hinh where MaMH = '{0}'", maHang);
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.Add(new SqlParameter("@hinh", images));
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }

        public byte[] getAnhByID(string ID)
        {
            string query = String.Format("select Anh from MatHang where MaMH = '{0}'", ID);
            DataRow data = DataProvider.Instance.ExecuteQuery(query).Rows[0];
            byte[] img = ((byte[])data["Anh"]);
            return img;
        }

    }
}
