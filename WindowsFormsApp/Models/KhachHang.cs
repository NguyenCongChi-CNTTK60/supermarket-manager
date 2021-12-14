namespace WindowsFormsApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Data;

    [Table("KhachHang")]
    public partial class KhachHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhachHang()
        {
            HoaDons = new HashSet<HoaDon>();
        }

        [Key]
        [StringLength(20)]
        public string MaKH { get; set; }

        [Required]
        [StringLength(50)]
        public string TenKH { get; set; }

        public bool? GioiTinh { get; set; }

        [StringLength(50)]
        public string DiaChi { get; set; }

        [Required]
        [StringLength(10)]
        public string SDT { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }
        public KhachHang(DataRow row)
        {
            this.MaKH = row["Mã khách hàng"].ToString();
            this.TenKH = row["Tên khách hàng"].ToString();
            this.DiaChi = row["Địa chỉ"].ToString();
            this.SDT = row["Số điện thoại"].ToString();
            this.Email = row["Email"].ToString();
        }
    }
}
