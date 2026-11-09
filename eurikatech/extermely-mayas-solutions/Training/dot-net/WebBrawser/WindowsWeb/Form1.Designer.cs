namespace WindowsWeb
{
    partial class Form1
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
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.gMapCtrl = new GMap.NET.WindowsForms.GMapControl();
            this.btnRun = new System.Windows.Forms.Button();
            this.label30 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txOffsetY = new System.Windows.Forms.TextBox();
            this.txBrearing = new System.Windows.Forms.TextBox();
            this.txAddress = new System.Windows.Forms.TextBox();
            this.txLang = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txLati = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txOffsetX = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.btnImage = new System.Windows.Forms.Button();
            this.btnTimer = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // gMapCtrl
            // 
            this.gMapCtrl.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.gMapCtrl.Bearing = 0F;
            this.gMapCtrl.CanDragMap = true;
            this.gMapCtrl.GrayScaleMode = false;
            this.gMapCtrl.LevelsKeepInMemmory = 5;
            this.gMapCtrl.Location = new System.Drawing.Point(12, 8);
            this.gMapCtrl.MarkersEnabled = true;
            this.gMapCtrl.MaxZoom = 2;
            this.gMapCtrl.MinZoom = 2;
            this.gMapCtrl.MouseWheelZoomType = GMap.NET.MouseWheelZoomType.MousePositionAndCenter;
            this.gMapCtrl.Name = "gMapCtrl";
            this.gMapCtrl.NegativeMode = false;
            this.gMapCtrl.PolygonsEnabled = true;
            this.gMapCtrl.RetryLoadTile = 0;
            this.gMapCtrl.RoutesEnabled = true;
            this.gMapCtrl.ShowTileGridLines = false;
            this.gMapCtrl.Size = new System.Drawing.Size(360, 189);
            this.gMapCtrl.TabIndex = 0;
            this.gMapCtrl.Zoom = 0D;
            this.gMapCtrl.MouseUp += new System.Windows.Forms.MouseEventHandler(this.gMapCtrl_MouseUp);
            // 
            // btnRun
            // 
            this.btnRun.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRun.Location = new System.Drawing.Point(311, 206);
            this.btnRun.Name = "btnRun";
            this.btnRun.Size = new System.Drawing.Size(61, 95);
            this.btnRun.TabIndex = 1;
            this.btnRun.Text = "Run";
            this.btnRun.UseVisualStyleBackColor = true;
            this.btnRun.Click += new System.EventHandler(this.btnRun_Click);
            // 
            // label30
            // 
            this.label30.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label30.AutoSize = true;
            this.label30.Location = new System.Drawing.Point(11, 258);
            this.label30.Name = "label30";
            this.label30.Size = new System.Drawing.Size(47, 13);
            this.label30.TabIndex = 2;
            this.label30.Text = "Offset Y";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(11, 206);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(43, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Bearing";
            // 
            // txOffsetY
            // 
            this.txOffsetY.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txOffsetY.Location = new System.Drawing.Point(97, 255);
            this.txOffsetY.Name = "txOffsetY";
            this.txOffsetY.Size = new System.Drawing.Size(207, 20);
            this.txOffsetY.TabIndex = 4;
            this.txOffsetY.Text = "0";
            // 
            // txBrearing
            // 
            this.txBrearing.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txBrearing.Location = new System.Drawing.Point(97, 203);
            this.txBrearing.Name = "txBrearing";
            this.txBrearing.Size = new System.Drawing.Size(207, 20);
            this.txBrearing.TabIndex = 5;
            this.txBrearing.Text = "0";
            // 
            // txAddress
            // 
            this.txAddress.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txAddress.Location = new System.Drawing.Point(97, 281);
            this.txAddress.Name = "txAddress";
            this.txAddress.Size = new System.Drawing.Size(207, 20);
            this.txAddress.TabIndex = 9;
            // 
            // txLang
            // 
            this.txLang.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txLang.Location = new System.Drawing.Point(97, 307);
            this.txLang.Name = "txLang";
            this.txLang.Size = new System.Drawing.Size(207, 20);
            this.txLang.TabIndex = 8;
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(11, 284);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(72, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Goto Address";
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(11, 310);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(30, 13);
            this.label4.TabIndex = 6;
            this.label4.Text = "Lang";
            // 
            // txLati
            // 
            this.txLati.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txLati.Location = new System.Drawing.Point(97, 333);
            this.txLati.Name = "txLati";
            this.txLati.Size = new System.Drawing.Size(207, 20);
            this.txLati.TabIndex = 11;
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(11, 336);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(24, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Lati";
            // 
            // txOffsetX
            // 
            this.txOffsetX.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txOffsetX.Location = new System.Drawing.Point(97, 229);
            this.txOffsetX.Name = "txOffsetX";
            this.txOffsetX.Size = new System.Drawing.Size(207, 20);
            this.txOffsetX.TabIndex = 13;
            this.txOffsetX.Text = "0";
            // 
            // label6
            // 
            this.label6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(11, 232);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(47, 13);
            this.label6.TabIndex = 12;
            this.label6.Text = "Offset X";
            // 
            // btnImage
            // 
            this.btnImage.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnImage.Location = new System.Drawing.Point(311, 307);
            this.btnImage.Name = "btnImage";
            this.btnImage.Size = new System.Drawing.Size(61, 20);
            this.btnImage.TabIndex = 14;
            this.btnImage.Text = "Add Image";
            this.btnImage.UseVisualStyleBackColor = true;
            this.btnImage.Click += new System.EventHandler(this.btnImage_Click);
            // 
            // btnTimer
            // 
            this.btnTimer.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnTimer.Location = new System.Drawing.Point(311, 333);
            this.btnTimer.Name = "btnTimer";
            this.btnTimer.Size = new System.Drawing.Size(61, 20);
            this.btnTimer.TabIndex = 15;
            this.btnTimer.Text = "Timer";
            this.btnTimer.UseVisualStyleBackColor = true;
            this.btnTimer.Click += new System.EventHandler(this.btnTimer_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.ClientSize = new System.Drawing.Size(384, 362);
            this.Controls.Add(this.btnTimer);
            this.Controls.Add(this.btnImage);
            this.Controls.Add(this.txOffsetX);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txLati);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txAddress);
            this.Controls.Add(this.txLang);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txBrearing);
            this.Controls.Add(this.txOffsetY);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label30);
            this.Controls.Add(this.btnRun);
            this.Controls.Add(this.gMapCtrl);
            this.MinimumSize = new System.Drawing.Size(400, 400);
            this.Name = "Form1";
            this.Text = "frmMain";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Timer timer1;
        private GMap.NET.WindowsForms.GMapControl gMapCtrl;
        private System.Windows.Forms.Button btnRun;
        private System.Windows.Forms.Label label30;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txOffsetY;
        private System.Windows.Forms.TextBox txBrearing;
        private System.Windows.Forms.TextBox txAddress;
        private System.Windows.Forms.TextBox txLang;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txLati;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txOffsetX;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnImage;
        private System.Windows.Forms.Button btnTimer;
    }
}

