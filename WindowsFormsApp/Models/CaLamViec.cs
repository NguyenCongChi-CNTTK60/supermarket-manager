namespace WindowsFormsApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data;
    using System.Data.Entity.Spatial;

    [Table("CaLamViec")]
    public partial class CaLamViec
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CaLamViec()
        {
            ChiTietCLVs = new HashSet<ChiTietCLV>();
        }

        [Key]
        [StringLength(20)]
        public string MaCLV { get; set; }

        [Required]
        [StringLength(10)]
        public string Ca { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietCLV> ChiTietCLVs { get; set; }


        public CaLamViec (DataRow row)
        {

            this.MaCLV = row["MaCLV"].ToString();
            this.Ca = row["Ca"].ToString();

        }



      

    }
}
