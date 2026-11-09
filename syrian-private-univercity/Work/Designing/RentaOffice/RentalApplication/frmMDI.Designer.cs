namespace RentalApplication
{
    partial class frmMDI
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMDI));
            this.tsMain = new System.Windows.Forms.ToolStrip();
            this.tsbStatics = new System.Windows.Forms.ToolStripButton();
            this.tsbSerach = new System.Windows.Forms.ToolStripButton();
            this.tsbCashes = new System.Windows.Forms.ToolStripButton();
            this.tss1 = new System.Windows.Forms.ToolStripSeparator();
            this.tsbAddPart = new System.Windows.Forms.ToolStripButton();
            this.tbsAddBuild = new System.Windows.Forms.ToolStripButton();
            this.tsbAddGround = new System.Windows.Forms.ToolStripButton();
            this.tsbAddClient = new System.Windows.Forms.ToolStripButton();
            this.tss2 = new System.Windows.Forms.ToolStripSeparator();
            this.tsbCalc = new System.Windows.Forms.ToolStripButton();
            this.tsbHelp = new System.Windows.Forms.ToolStripButton();
            this.tsbExit = new System.Windows.Forms.ToolStripButton();
            this.tsMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // tsMain
            // 
            this.tsMain.AutoSize = false;
            this.tsMain.ImageScalingSize = new System.Drawing.Size(40, 40);
            this.tsMain.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsbStatics,
            this.tsbSerach,
            this.tsbCashes,
            this.tss1,
            this.tsbAddPart,
            this.tbsAddBuild,
            this.tsbAddGround,
            this.tsbAddClient,
            this.tss2,
            this.tsbCalc,
            this.tsbHelp,
            this.tsbExit});
            this.tsMain.Location = new System.Drawing.Point(0, 0);
            this.tsMain.Name = "tsMain";
            this.tsMain.Size = new System.Drawing.Size(624, 40);
            this.tsMain.TabIndex = 1;
            this.tsMain.Text = "القائمة الرئيسية";
            // 
            // tsbStatics
            // 
            this.tsbStatics.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbStatics.Image = ((System.Drawing.Image)(resources.GetObject("tsbStatics.Image")));
            this.tsbStatics.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbStatics.Name = "tsbStatics";
            this.tsbStatics.Size = new System.Drawing.Size(44, 37);
            this.tsbStatics.Text = "إحصائيات";
            this.tsbStatics.Click += new System.EventHandler(this.tsbStatics_Click);
            // 
            // tsbSerach
            // 
            this.tsbSerach.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbSerach.Image = ((System.Drawing.Image)(resources.GetObject("tsbSerach.Image")));
            this.tsbSerach.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbSerach.Name = "tsbSerach";
            this.tsbSerach.Size = new System.Drawing.Size(44, 37);
            this.tsbSerach.Text = "بحث";
            this.tsbSerach.Click += new System.EventHandler(this.tsbSerach_Click);
            // 
            // tsbCashes
            // 
            this.tsbCashes.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbCashes.Image = ((System.Drawing.Image)(resources.GetObject("tsbCashes.Image")));
            this.tsbCashes.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbCashes.Name = "tsbCashes";
            this.tsbCashes.Size = new System.Drawing.Size(44, 37);
            this.tsbCashes.Text = "الحسابات";
            this.tsbCashes.Click += new System.EventHandler(this.tsbCashes_Click);
            // 
            // tss1
            // 
            this.tss1.Name = "tss1";
            this.tss1.Size = new System.Drawing.Size(6, 40);
            // 
            // tsbAddPart
            // 
            this.tsbAddPart.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbAddPart.Image = ((System.Drawing.Image)(resources.GetObject("tsbAddPart.Image")));
            this.tsbAddPart.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbAddPart.Name = "tsbAddPart";
            this.tsbAddPart.Size = new System.Drawing.Size(44, 37);
            this.tsbAddPart.Text = "إضافة شقة";
            this.tsbAddPart.Click += new System.EventHandler(this.tsbAddPart_Click);
            // 
            // tbsAddBuild
            // 
            this.tbsAddBuild.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tbsAddBuild.Image = ((System.Drawing.Image)(resources.GetObject("tbsAddBuild.Image")));
            this.tbsAddBuild.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tbsAddBuild.Name = "tbsAddBuild";
            this.tbsAddBuild.Size = new System.Drawing.Size(44, 37);
            this.tbsAddBuild.Text = "إضافة عقار";
            this.tbsAddBuild.Click += new System.EventHandler(this.tbsAddBuild_Click);
            // 
            // tsbAddGround
            // 
            this.tsbAddGround.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbAddGround.Image = ((System.Drawing.Image)(resources.GetObject("tsbAddGround.Image")));
            this.tsbAddGround.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbAddGround.Name = "tsbAddGround";
            this.tsbAddGround.Size = new System.Drawing.Size(44, 37);
            this.tsbAddGround.Text = "إضافة أرض";
            this.tsbAddGround.Click += new System.EventHandler(this.tsbAddGround_Click);
            // 
            // tsbAddClient
            // 
            this.tsbAddClient.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbAddClient.Image = ((System.Drawing.Image)(resources.GetObject("tsbAddClient.Image")));
            this.tsbAddClient.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbAddClient.Name = "tsbAddClient";
            this.tsbAddClient.Size = new System.Drawing.Size(44, 37);
            this.tsbAddClient.Text = "إضافة عميل";
            this.tsbAddClient.Click += new System.EventHandler(this.tsbAddClient_Click);
            // 
            // tss2
            // 
            this.tss2.Name = "tss2";
            this.tss2.Size = new System.Drawing.Size(6, 40);
            // 
            // tsbCalc
            // 
            this.tsbCalc.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbCalc.Image = ((System.Drawing.Image)(resources.GetObject("tsbCalc.Image")));
            this.tsbCalc.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbCalc.Name = "tsbCalc";
            this.tsbCalc.Size = new System.Drawing.Size(44, 37);
            this.tsbCalc.Text = "الحاسبة";
            this.tsbCalc.Click += new System.EventHandler(this.tsbCalc_Click);
            // 
            // tsbHelp
            // 
            this.tsbHelp.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbHelp.Image = ((System.Drawing.Image)(resources.GetObject("tsbHelp.Image")));
            this.tsbHelp.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbHelp.Name = "tsbHelp";
            this.tsbHelp.Size = new System.Drawing.Size(44, 37);
            this.tsbHelp.Text = "مساعدة";
            this.tsbHelp.Click += new System.EventHandler(this.tsbHelp_Click);
            // 
            // tsbExit
            // 
            this.tsbExit.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsbExit.Image = ((System.Drawing.Image)(resources.GetObject("tsbExit.Image")));
            this.tsbExit.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbExit.Name = "tsbExit";
            this.tsbExit.Size = new System.Drawing.Size(44, 37);
            this.tsbExit.Text = "toolStripButton9";
            this.tsbExit.Click += new System.EventHandler(this.tsbExit_Click);
            // 
            // frmMDI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(624, 442);
            this.Controls.Add(this.tsMain);
            this.IsMdiContainer = true;
            this.MinimumSize = new System.Drawing.Size(640, 480);
            this.Name = "frmMDI";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RightToLeftLayout = true;
            this.Text = "مدير العقارات";
            this.TopMost = true;
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.tsMain.ResumeLayout(false);
            this.tsMain.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ToolStrip tsMain;
        private System.Windows.Forms.ToolStripButton tsbStatics;
        private System.Windows.Forms.ToolStripButton tsbSerach;
        private System.Windows.Forms.ToolStripButton tsbCashes;
        private System.Windows.Forms.ToolStripSeparator tss1;
        private System.Windows.Forms.ToolStripButton tsbAddPart;
        private System.Windows.Forms.ToolStripButton tbsAddBuild;
        private System.Windows.Forms.ToolStripButton tsbAddGround;
        private System.Windows.Forms.ToolStripButton tsbAddClient;
        private System.Windows.Forms.ToolStripSeparator tss2;
        private System.Windows.Forms.ToolStripButton tsbCalc;
        private System.Windows.Forms.ToolStripButton tsbHelp;
        private System.Windows.Forms.ToolStripButton tsbExit;
    }
}