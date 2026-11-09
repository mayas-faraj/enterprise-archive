namespace ClientApplication
{
    partial class frmTest
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
            this.btnMake = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnMake
            // 
            this.btnMake.BackColor = System.Drawing.Color.Black;
            this.btnMake.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnMake.Location = new System.Drawing.Point(12, 430);
            this.btnMake.Name = "btnMake";
            this.btnMake.Size = new System.Drawing.Size(800, 33);
            this.btnMake.TabIndex = 1;
            this.btnMake.Text = "Make card";
            this.btnMake.UseVisualStyleBackColor = false;
            this.btnMake.Click += new System.EventHandler(this.btnMake_Click);
            // 
            // frmTest
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(824, 476);
            this.Controls.Add(this.btnMake);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "frmTest";
            this.Text = "Test Card - Client Application";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnMake;
    }
}

