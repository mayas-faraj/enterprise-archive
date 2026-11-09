namespace ClientApplication
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
            this.btnAdd = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.tx1 = new System.Windows.Forms.TextBox();
            this.lst = new System.Windows.Forms.ListBox();
            this.btnFind = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.tx2 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.tx3 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txO2 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txO1 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txO3 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(285, 271);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(191, 23);
            this.btnAdd.TabIndex = 3;
            this.btnAdd.Text = "إضافة";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(424, 76);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "البند الأول";
            // 
            // tx1
            // 
            this.tx1.Location = new System.Drawing.Point(285, 73);
            this.tx1.Name = "tx1";
            this.tx1.Size = new System.Drawing.Size(114, 20);
            this.tx1.TabIndex = 0;
            // 
            // lst
            // 
            this.lst.FormattingEnabled = true;
            this.lst.Location = new System.Drawing.Point(26, 73);
            this.lst.Name = "lst";
            this.lst.Size = new System.Drawing.Size(237, 394);
            this.lst.TabIndex = 3;
            this.lst.TabStop = false;
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(285, 300);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(191, 23);
            this.btnFind.TabIndex = 4;
            this.btnFind.Text = "بحث";
            this.btnFind.UseVisualStyleBackColor = true;
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(285, 329);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(191, 23);
            this.btnDelete.TabIndex = 4;
            this.btnDelete.Text = "حذف";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(285, 444);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(191, 23);
            this.button4.TabIndex = 5;
            this.button4.Text = "خروج";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // tx2
            // 
            this.tx2.Location = new System.Drawing.Point(285, 99);
            this.tx2.Name = "tx2";
            this.tx2.Size = new System.Drawing.Size(114, 20);
            this.tx2.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(419, 102);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "البند الثاني";
            // 
            // tx3
            // 
            this.tx3.Location = new System.Drawing.Point(285, 125);
            this.tx3.Name = "tx3";
            this.tx3.Size = new System.Drawing.Size(114, 20);
            this.tx3.TabIndex = 2;
            this.tx3.Text = "0";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(420, 128);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(56, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "البند الثالث";
            // 
            // txO2
            // 
            this.txO2.Location = new System.Drawing.Point(285, 201);
            this.txO2.Name = "txO2";
            this.txO2.Size = new System.Drawing.Size(114, 20);
            this.txO2.TabIndex = 14;
            this.txO2.TabStop = false;
            this.txO2.Text = "0";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(413, 178);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(63, 13);
            this.label4.TabIndex = 13;
            this.label4.Text = "العدد الحالي";
            // 
            // txO1
            // 
            this.txO1.Location = new System.Drawing.Point(285, 175);
            this.txO1.Name = "txO1";
            this.txO1.Size = new System.Drawing.Size(114, 20);
            this.txO1.TabIndex = 12;
            this.txO1.TabStop = false;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(400, 204);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(76, 13);
            this.label5.TabIndex = 11;
            this.label5.Text = "العدد الأعظمي";
            // 
            // txO3
            // 
            this.txO3.Location = new System.Drawing.Point(285, 227);
            this.txO3.Name = "txO3";
            this.txO3.Size = new System.Drawing.Size(114, 20);
            this.txO3.TabIndex = 16;
            this.txO3.TabStop = false;
            this.txO3.Text = "0";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(435, 230);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(41, 13);
            this.label6.TabIndex = 15;
            this.label6.Text = "النفايات";
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(506, 507);
            this.Controls.Add(this.txO3);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txO2);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txO1);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.tx3);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tx2);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnFind);
            this.Controls.Add(this.lst);
            this.Controls.Add(this.tx1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnAdd);
            this.Name = "frmMain";
            this.Tag = " ";
            this.Text = "نموذج إختباري";
            this.Load += new System.EventHandler(this.frmMain_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tx1;
        private System.Windows.Forms.ListBox lst;
        private System.Windows.Forms.Button btnFind;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.TextBox tx2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tx3;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txO2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txO1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txO3;
        private System.Windows.Forms.Label label6;
    }
}

