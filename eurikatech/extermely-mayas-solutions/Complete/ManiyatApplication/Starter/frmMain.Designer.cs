namespace Starter
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
            this.btnOk = new System.Windows.Forms.Button();
            this.tx2 = new System.Windows.Forms.TextBox();
            this.tx1 = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(12, 64);
            this.btnOk.Name = "btnOk";
            this.btnOk.Size = new System.Drawing.Size(229, 23);
            this.btnOk.TabIndex = 0;
            this.btnOk.Text = "button1";
            this.btnOk.UseVisualStyleBackColor = true;
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // tx2
            // 
            this.tx2.Location = new System.Drawing.Point(12, 38);
            this.tx2.Name = "tx2";
            this.tx2.Size = new System.Drawing.Size(229, 20);
            this.tx2.TabIndex = 1;
            // 
            // tx1
            // 
            this.tx1.Location = new System.Drawing.Point(12, 12);
            this.tx1.Name = "tx1";
            this.tx1.Size = new System.Drawing.Size(229, 20);
            this.tx1.TabIndex = 2;
            // 
            // frmMain
            // 
            this.ClientSize = new System.Drawing.Size(253, 105);
            this.Controls.Add(this.tx1);
            this.Controls.Add(this.tx2);
            this.Controls.Add(this.btnOk);
            this.Name = "frmMain";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnOk;
        private System.Windows.Forms.TextBox tx2;
        private System.Windows.Forms.TextBox tx1;
    }
}

