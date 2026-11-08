namespace KafryScreenSaver
{
    partial class frmMain
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
            this.components = new System.ComponentModel.Container();
            this.lbSlave = new System.Windows.Forms.Label();
            this.lbMain = new System.Windows.Forms.Label();
            this.tmrMain = new System.Windows.Forms.Timer(this.components);
            this.lbManager = new System.Windows.Forms.Label();
            this.pb3 = new System.Windows.Forms.PictureBox();
            this.pb2 = new System.Windows.Forms.PictureBox();
            this.pb1 = new System.Windows.Forms.PictureBox();
            this.pbImage = new System.Windows.Forms.PictureBox();
            this.pbHeader = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pb3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pb2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pb1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbImage)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbHeader)).BeginInit();
            this.SuspendLayout();
            // 
            // lbSlave
            // 
            this.lbSlave.AutoSize = true;
            this.lbSlave.BackColor = System.Drawing.Color.Black;
            this.lbSlave.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbSlave.ForeColor = System.Drawing.Color.Red;
            this.lbSlave.Location = new System.Drawing.Point(12, 216);
            this.lbSlave.Name = "lbSlave";
            this.lbSlave.Size = new System.Drawing.Size(337, 24);
            this.lbSlave.TabIndex = 1;
            this.lbSlave.Text = "لتجارة العقارات والتسويق العقاري عبر الأنترنت";
            // 
            // lbMain
            // 
            this.lbMain.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lbMain.AutoSize = true;
            this.lbMain.BackColor = System.Drawing.Color.Black;
            this.lbMain.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbMain.ForeColor = System.Drawing.Color.Red;
            this.lbMain.Location = new System.Drawing.Point(610, 177);
            this.lbMain.Name = "lbMain";
            this.lbMain.Size = new System.Drawing.Size(178, 24);
            this.lbMain.TabIndex = 2;
            this.lbMain.Text = "شـــــركــــــة الكــــــــفري";
            // 
            // tmrMain
            // 
            this.tmrMain.Enabled = true;
            this.tmrMain.Interval = 1;
            this.tmrMain.Tick += new System.EventHandler(this.tmrMain_Tick);
            // 
            // lbManager
            // 
            this.lbManager.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.lbManager.AutoSize = true;
            this.lbManager.BackColor = System.Drawing.Color.Black;
            this.lbManager.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbManager.ForeColor = System.Drawing.Color.Blue;
            this.lbManager.Location = new System.Drawing.Point(497, 604);
            this.lbManager.Name = "lbManager";
            this.lbManager.Size = new System.Drawing.Size(271, 24);
            this.lbManager.TabIndex = 3;
            this.lbManager.Text = "رئيس مجلس الإدارة : م.حسين الكفري";
            // 
            // pb3
            // 
            this.pb3.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.pb3.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.pb3.BackgroundImage = global::KafryScreenSaver.Properties.Resources.جديدة_عرطوز;
            this.pb3.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pb3.Location = new System.Drawing.Point(79, 603);
            this.pb3.Name = "pb3";
            this.pb3.Size = new System.Drawing.Size(145, 128);
            this.pb3.TabIndex = 7;
            this.pb3.TabStop = false;
            // 
            // pb2
            // 
            this.pb2.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.pb2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.pb2.BackgroundImage = global::KafryScreenSaver.Properties.Resources.درعا;
            this.pb2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pb2.Location = new System.Drawing.Point(328, 603);
            this.pb2.Name = "pb2";
            this.pb2.Size = new System.Drawing.Size(145, 128);
            this.pb2.TabIndex = 6;
            this.pb2.TabStop = false;
            // 
            // pb1
            // 
            this.pb1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.pb1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.pb1.BackgroundImage = global::KafryScreenSaver.Properties.Resources.صلنفة;
            this.pb1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pb1.Location = new System.Drawing.Point(577, 603);
            this.pb1.Name = "pb1";
            this.pb1.Size = new System.Drawing.Size(145, 128);
            this.pb1.TabIndex = 5;
            this.pb1.TabStop = false;
            // 
            // pbImage
            // 
            this.pbImage.BackgroundImage = global::KafryScreenSaver.Properties.Resources.alkafry_pakege;
            this.pbImage.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pbImage.Location = new System.Drawing.Point(53, 258);
            this.pbImage.Name = "pbImage";
            this.pbImage.Size = new System.Drawing.Size(160, 0);
            this.pbImage.TabIndex = 4;
            this.pbImage.TabStop = false;
            // 
            // pbHeader
            // 
            this.pbHeader.BackgroundImage = global::KafryScreenSaver.Properties.Resources.install;
            this.pbHeader.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pbHeader.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pbHeader.Dock = System.Windows.Forms.DockStyle.Top;
            this.pbHeader.Location = new System.Drawing.Point(0, 0);
            this.pbHeader.Name = "pbHeader";
            this.pbHeader.Size = new System.Drawing.Size(800, 154);
            this.pbHeader.TabIndex = 0;
            this.pbHeader.TabStop = false;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Black;
            this.ClientSize = new System.Drawing.Size(800, 600);
            this.Controls.Add(this.pb3);
            this.Controls.Add(this.pb2);
            this.Controls.Add(this.pb1);
            this.Controls.Add(this.pbImage);
            this.Controls.Add(this.lbManager);
            this.Controls.Add(this.lbMain);
            this.Controls.Add(this.lbSlave);
            this.Controls.Add(this.pbHeader);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmMain";
            this.Text = "Demo";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmMain_Load);
            this.Click += new System.EventHandler(this.frmMain_Click);
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.frmMain_KeyPress);
            this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.frmMain_MouseMove);
            ((System.ComponentModel.ISupportInitialize)(this.pb3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pb2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pb1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbImage)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbHeader)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pbHeader;
        private System.Windows.Forms.Label lbSlave;
        private System.Windows.Forms.Label lbMain;
        private System.Windows.Forms.Timer tmrMain;
        private System.Windows.Forms.Label lbManager;
        private System.Windows.Forms.PictureBox pbImage;
        private System.Windows.Forms.PictureBox pb1;
        private System.Windows.Forms.PictureBox pb2;
        private System.Windows.Forms.PictureBox pb3;

    }
}

