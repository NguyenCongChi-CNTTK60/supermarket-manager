using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp.Controller
{
    class QuanLyNhaCC
    {
        private static QuanLyNhaCC instance;

        public QuanLyNhaCC()
        {
        }

        public static QuanLyNhaCC Intance
        {
            get { if (instance == null) instance = new QuanLyNhaCC(); return instance; }
            set => instance = value;
        }

        public DataTable getListNCC()
        {
            string query = "select MaNCC as [Mã NCC], TenNCC as [Tên NCC], DiaChi as [Địa chỉ],SDT as [Số điện thoại], Email from NhaCungCap";
            return DataProvider.Instance.ExecuteQuery(query);
        }



        public bool themNCC(string maNCC, string tenNCC, string diaChi, string Sdt, string email)
        {

            string query = String.Format("insert into NhaCungCap(MaNCC,TenNCC,DiaChi,SDT,Email) values  ('{0}',N'{1}',N'{2}','{3}',N'{4}')", maNCC,tenNCC,diaChi,Sdt,email);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }


        public bool capnhatNCC (string tenNCC, string diaChi, string Sdt, string email,string maNCC)
        {
            string query = String.Format("update NhaCungCap set TenNCC = N'"+tenNCC+ "',DiaChi = N'" + diaChi + "',SDT = '" + Sdt + "',Email = '" + email + "' where MaNCC = '" + maNCC + "'");
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            
             return true;
            
        }


        public bool xoaNV(string maNCC)
        {
            string query = String.Format("delete NhaCungCap where MaNCC = '"+maNCC+"'");
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }


        public DataTable Timkiem(string maNCC, string tenNCC)
        {
            string query = String.Format("select * from NhaCungCap where MaNCC like N'%" + maNCC + "%' or TenNCC like N'%" + tenNCC +"%'");
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);
            return dt;
        }


    }
}
