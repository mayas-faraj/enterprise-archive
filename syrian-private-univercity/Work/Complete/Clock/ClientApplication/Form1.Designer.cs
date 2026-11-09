namespace ClientApplication
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.btnRun = new System.Windows.Forms.Button();
            this.trm = new System.Windows.Forms.Timer(this.components);
            this.txTime = new System.Windows.Forms.TextBox();
            this.clk = new Maniyat.Clock();
            this.nIcon = new System.Windows.Forms.NotifyIcon(this.components);
            this.SuspendLayout();
            // 
            // btnRun
            // 
            this.btnRun.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.btnRun.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(64)))));
            this.btnRun.Location = new System.Drawing.Point(3, 235);
            this.btnRun.Name = "btnRun";
            this.btnRun.Size = new System.Drawing.Size(201, 23);
            this.btnRun.TabIndex = 1;
            this.btnRun.Text = "ضبط الوقت";
            this.btnRun.UseVisualStyleBackColor = false;
            this.btnRun.Click += new System.EventHandler(this.btnRun_Click);
            // 
            // trm
            // 
            this.trm.Enabled = true;
            this.trm.Interval = 1000;
            this.trm.Tick += new System.EventHandler(this.trm_Tick);
            // 
            // txTime
            // 
            this.txTime.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.txTime.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(64)))));
            this.txTime.Location = new System.Drawing.Point(3, 209);
            this.txTime.Name = "txTime";
            this.txTime.Size = new System.Drawing.Size(201, 20);
            this.txTime.TabIndex = 6;
            // 
            // clk
            // 
            this.clk.BackgroundImage = global::ClientApplication.Properties.Resources.background_Low;
            this.clk.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.clk.Location = new System.Drawing.Point(3, 6);
            this.clk.Name = "clk";
            this.clk.Pointers = null;
            this.clk.Size = new System.Drawing.Size(201, 197);
            this.clk.TabIndex = 5;
            this.clk.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.clk.TextColor = System.Drawing.Color.Black;
            this.clk.MouseClick += new System.Windows.Forms.MouseEventHandler(this.clk_MouseClick);
            // 
            // nIcon
            // 
            this.nIcon.BalloonTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            this.nIcon.BalloonTipText = "برنامج الساعة";
            this.nIcon.BalloonTipTitle = "المنبه";
            this.nIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("nIcon.Icon")));
            this.nIcon.Text = "برنامج التنبيه";
            this.nIcon.Click += new System.EventHandler(this.nIcon_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Black;
            this.ClientSize = new System.Drawing.Size(208, 262);
            this.Controls.Add(this.txTime);
            this.Controls.Add(this.clk);
            this.Controls.Add(this.btnRun);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "Form1";
            this.Text = "منبه";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnRun;
        private System.Windows.Forms.Timer trm;
        private Maniyat.Clock clk;
        private System.Windows.Forms.TextBox txTime;
        private System.Windows.Forms.NotifyIcon nIcon;
    }
}

