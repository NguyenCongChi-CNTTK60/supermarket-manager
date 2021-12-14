
namespace WindowsFormsApp
{
    partial class UC_ThongKe
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea2 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend2 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series2 = new System.Windows.Forms.DataVisualization.Charting.Series();
            this.pnlButton = new System.Windows.Forms.Panel();
            this.btnphieunhap = new System.Windows.Forms.Button();
            this.btnHoadon = new System.Windows.Forms.Button();
            this.btnKhachhang = new System.Windows.Forms.Button();
            this.btnHanghoa = new System.Windows.Forms.Button();
            this.pnlTK = new System.Windows.Forms.Panel();
            this.bunifuElipse1 = new Bunifu.Framework.UI.BunifuElipse(this.components);
            this.bunifuElipse2 = new Bunifu.Framework.UI.BunifuElipse(this.components);
            this.bunifuElipse3 = new Bunifu.Framework.UI.BunifuElipse(this.components);
            this.bunifuElipse4 = new Bunifu.Framework.UI.BunifuElipse(this.components);
            this.btnXem = new Guna.UI2.WinForms.Guna2Button();
            this.chart1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.dpkNgaykt = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label4 = new System.Windows.Forms.Label();
            this.dpkNgaybd = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.pnlButton.SuspendLayout();
            this.pnlTK.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlButton
            // 
            this.pnlButton.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(52)))), ((int)(((byte)(73)))), ((int)(((byte)(94)))));
            this.pnlButton.Controls.Add(this.btnphieunhap);
            this.pnlButton.Controls.Add(this.btnHoadon);
            this.pnlButton.Controls.Add(this.btnKhachhang);
            this.pnlButton.Controls.Add(this.btnHanghoa);
            this.pnlButton.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlButton.Location = new System.Drawing.Point(0, 0);
            this.pnlButton.Margin = new System.Windows.Forms.Padding(4);
            this.pnlButton.Name = "pnlButton";
            this.pnlButton.Size = new System.Drawing.Size(1010, 66);
            this.pnlButton.TabIndex = 24;
            this.pnlButton.Paint += new System.Windows.Forms.PaintEventHandler(this.pnlButton_Paint);
            // 
            // btnphieunhap
            // 
            this.btnphieunhap.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(37)))), ((int)(((byte)(47)))), ((int)(((byte)(75)))));
            this.btnphieunhap.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnphieunhap.FlatAppearance.BorderSize = 0;
            this.btnphieunhap.FlatAppearance.CheckedBackColor = System.Drawing.Color.White;
            this.btnphieunhap.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnphieunhap.Font = new System.Drawing.Font("Sitka Banner", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnphieunhap.ForeColor = System.Drawing.Color.White;
            this.btnphieunhap.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnphieunhap.Location = new System.Drawing.Point(489, 0);
            this.btnphieunhap.Name = "btnphieunhap";
            this.btnphieunhap.Size = new System.Drawing.Size(157, 66);
            this.btnphieunhap.TabIndex = 24;
            this.btnphieunhap.Text = "  Phiếu nhập";
            this.btnphieunhap.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnphieunhap.UseVisualStyleBackColor = false;
            this.btnphieunhap.Click += new System.EventHandler(this.btnphieunhap_Click_1);
            // 
            // btnHoadon
            // 
            this.btnHoadon.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(37)))), ((int)(((byte)(47)))), ((int)(((byte)(75)))));
            this.btnHoadon.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHoadon.FlatAppearance.BorderSize = 0;
            this.btnHoadon.FlatAppearance.CheckedBackColor = System.Drawing.Color.White;
            this.btnHoadon.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHoadon.Font = new System.Drawing.Font("Sitka Banner", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHoadon.ForeColor = System.Drawing.Color.White;
            this.btnHoadon.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnHoadon.Location = new System.Drawing.Point(0, 0);
            this.btnHoadon.Name = "btnHoadon";
            this.btnHoadon.Size = new System.Drawing.Size(157, 66);
            this.btnHoadon.TabIndex = 6;
            this.btnHoadon.Text = "   Hóa đơn";
            this.btnHoadon.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnHoadon.UseVisualStyleBackColor = false;
            this.btnHoadon.Click += new System.EventHandler(this.btnHoadon_Click_1);
            // 
            // btnKhachhang
            // 
            this.btnKhachhang.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(37)))), ((int)(((byte)(47)))), ((int)(((byte)(75)))));
            this.btnKhachhang.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnKhachhang.FlatAppearance.BorderSize = 0;
            this.btnKhachhang.FlatAppearance.CheckedBackColor = System.Drawing.Color.White;
            this.btnKhachhang.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnKhachhang.Font = new System.Drawing.Font("Sitka Banner", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnKhachhang.ForeColor = System.Drawing.Color.White;
            this.btnKhachhang.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnKhachhang.Location = new System.Drawing.Point(326, 0);
            this.btnKhachhang.Name = "btnKhachhang";
            this.btnKhachhang.Size = new System.Drawing.Size(157, 66);
            this.btnKhachhang.TabIndex = 23;
            this.btnKhachhang.Text = "   Khách hàng";
            this.btnKhachhang.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnKhachhang.UseVisualStyleBackColor = false;
            this.btnKhachhang.Click += new System.EventHandler(this.btnKhachhang_Click_1);
            // 
            // btnHanghoa
            // 
            this.btnHanghoa.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(37)))), ((int)(((byte)(47)))), ((int)(((byte)(75)))));
            this.btnHanghoa.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHanghoa.FlatAppearance.BorderSize = 0;
            this.btnHanghoa.FlatAppearance.CheckedBackColor = System.Drawing.Color.White;
            this.btnHanghoa.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHanghoa.Font = new System.Drawing.Font("Sitka Banner", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHanghoa.ForeColor = System.Drawing.Color.White;
            this.btnHanghoa.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnHanghoa.Location = new System.Drawing.Point(163, 1);
            this.btnHanghoa.Name = "btnHanghoa";
            this.btnHanghoa.Size = new System.Drawing.Size(157, 66);
            this.btnHanghoa.TabIndex = 5;
            this.btnHanghoa.Text = "   Hàng hóa";
            this.btnHanghoa.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnHanghoa.UseVisualStyleBackColor = false;
            this.btnHanghoa.Click += new System.EventHandler(this.btnHanghoa_Click_1);
            // 
            // pnlTK
            // 
            this.pnlTK.Controls.Add(this.label2);
            this.pnlTK.Controls.Add(this.btnXem);
            this.pnlTK.Controls.Add(this.chart1);
            this.pnlTK.Controls.Add(this.dpkNgaykt);
            this.pnlTK.Controls.Add(this.label4);
            this.pnlTK.Controls.Add(this.dpkNgaybd);
            this.pnlTK.Location = new System.Drawing.Point(0, 73);
            this.pnlTK.Name = "pnlTK";
            this.pnlTK.Size = new System.Drawing.Size(1010, 589);
            this.pnlTK.TabIndex = 25;
            // 
            // bunifuElipse1
            // 
            this.bunifuElipse1.ElipseRadius = 25;
            this.bunifuElipse1.TargetControl = this.btnHoadon;
            // 
            // bunifuElipse2
            // 
            this.bunifuElipse2.ElipseRadius = 25;
            this.bunifuElipse2.TargetControl = this.btnHanghoa;
            // 
            // bunifuElipse3
            // 
            this.bunifuElipse3.ElipseRadius = 25;
            this.bunifuElipse3.TargetControl = this.btnKhachhang;
            // 
            // bunifuElipse4
            // 
            this.bunifuElipse4.ElipseRadius = 25;
            this.bunifuElipse4.TargetControl = this.btnphieunhap;
            // 
            // btnXem
            // 
            this.btnXem.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(59)))), ((int)(((byte)(82)))), ((int)(((byte)(132)))));
            this.btnXem.BorderRadius = 1;
            this.btnXem.BorderThickness = 2;
            this.btnXem.CheckedState.Parent = this.btnXem;
            this.btnXem.CustomImages.Parent = this.btnXem;
            this.btnXem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXem.DisabledState.Parent = this.btnXem;
            this.btnXem.FillColor = System.Drawing.SystemColors.Control;
            this.btnXem.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnXem.ForeColor = System.Drawing.Color.Black;
            this.btnXem.HoverState.Parent = this.btnXem;
            this.btnXem.Location = new System.Drawing.Point(766, 28);
            this.btnXem.Name = "btnXem";
            this.btnXem.ShadowDecoration.Parent = this.btnXem;
            this.btnXem.Size = new System.Drawing.Size(124, 36);
            this.btnXem.TabIndex = 38;
            this.btnXem.Text = "Xem";
            this.btnXem.Click += new System.EventHandler(this.btnXem_Click);
            // 
            // chart1
            // 
            chartArea2.Name = "ChartArea1";
            this.chart1.ChartAreas.Add(chartArea2);
            legend2.Name = "Legend1";
            this.chart1.Legends.Add(legend2);
            this.chart1.Location = new System.Drawing.Point(27, 88);
            this.chart1.Name = "chart1";
            this.chart1.Palette = System.Windows.Forms.DataVisualization.Charting.ChartColorPalette.None;
            series2.BorderWidth = 3;
            series2.ChartArea = "ChartArea1";
            series2.LabelBorderWidth = 3;
            series2.Legend = "Legend1";
            series2.Name = "Doanh Thu";
            this.chart1.Series.Add(series2);
            this.chart1.Size = new System.Drawing.Size(925, 453);
            this.chart1.TabIndex = 37;
            this.chart1.Text = "chart1";
            // 
            // dpkNgaykt
            // 
            this.dpkNgaykt.CheckedState.Parent = this.dpkNgaykt;
            this.dpkNgaykt.FillColor = System.Drawing.Color.White;
            this.dpkNgaykt.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dpkNgaykt.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dpkNgaykt.HoverState.Parent = this.dpkNgaykt;
            this.dpkNgaykt.Location = new System.Drawing.Point(484, 28);
            this.dpkNgaykt.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dpkNgaykt.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dpkNgaykt.Name = "dpkNgaykt";
            this.dpkNgaykt.ShadowDecoration.Parent = this.dpkNgaykt;
            this.dpkNgaykt.Size = new System.Drawing.Size(228, 36);
            this.dpkNgaykt.TabIndex = 36;
            this.dpkNgaykt.Value = new System.DateTime(2021, 12, 9, 19, 36, 10, 687);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Sitka Banner", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(370, 29);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(93, 32);
            this.label4.TabIndex = 35;
            this.label4.Text = "Đến ngày";
            // 
            // dpkNgaybd
            // 
            this.dpkNgaybd.CheckedState.Parent = this.dpkNgaybd;
            this.dpkNgaybd.FillColor = System.Drawing.Color.White;
            this.dpkNgaybd.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dpkNgaybd.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dpkNgaybd.HoverState.Parent = this.dpkNgaybd;
            this.dpkNgaybd.Location = new System.Drawing.Point(100, 28);
            this.dpkNgaybd.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dpkNgaybd.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dpkNgaybd.Name = "dpkNgaybd";
            this.dpkNgaybd.ShadowDecoration.Parent = this.dpkNgaybd;
            this.dpkNgaybd.Size = new System.Drawing.Size(220, 36);
            this.dpkNgaybd.TabIndex = 34;
            this.dpkNgaybd.Value = new System.DateTime(2021, 12, 9, 19, 36, 10, 687);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Sitka Banner", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(9, 28);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(85, 32);
            this.label2.TabIndex = 39;
            this.label2.Text = "Từ ngày";
            // 
            // UC_ThongKe
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.pnlTK);
            this.Controls.Add(this.pnlButton);
            this.Name = "UC_ThongKe";
            this.Size = new System.Drawing.Size(1010, 662);
            this.pnlButton.ResumeLayout(false);
            this.pnlTK.ResumeLayout(false);
            this.pnlTK.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlButton;
        private System.Windows.Forms.Button btnphieunhap;
        private System.Windows.Forms.Button btnKhachhang;
        private System.Windows.Forms.Button btnHanghoa;
        private System.Windows.Forms.Button btnHoadon;
        private System.Windows.Forms.Panel pnlTK;
        private Bunifu.Framework.UI.BunifuElipse bunifuElipse1;
        private Bunifu.Framework.UI.BunifuElipse bunifuElipse2;
        private Bunifu.Framework.UI.BunifuElipse bunifuElipse3;
        private Bunifu.Framework.UI.BunifuElipse bunifuElipse4;
        private System.Windows.Forms.Label label2;
        private Guna.UI2.WinForms.Guna2Button btnXem;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart1;
        private Guna.UI2.WinForms.Guna2DateTimePicker dpkNgaykt;
        private System.Windows.Forms.Label label4;
        private Guna.UI2.WinForms.Guna2DateTimePicker dpkNgaybd;
    }
}
