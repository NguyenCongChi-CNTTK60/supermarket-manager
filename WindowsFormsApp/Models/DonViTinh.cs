namespace WindowsFormsApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Data;

    [Table("DonViTinh")]
    public partial class DonViTinh
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonViTinh()
        {
            MatHangs = new HashSet<MatHang>();
        }

        [Key]
        [StringLength(10)]
        public string MaDVT { get; set; }

        [Required]
        [StringLength(20)]
        public string TenDVT { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MatHang> MatHangs { get; set; }
        public DonViTinh(DataRow row)
        {
            this.MaDVT = row["MaDVT"].ToString();
            this.TenDVT = row["TenDVT"].ToString();
        }
    }
}
