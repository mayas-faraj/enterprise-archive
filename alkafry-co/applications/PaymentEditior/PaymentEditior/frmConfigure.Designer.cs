namespace PaymentEditior
{
    partial class frmConfigure
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
            this.btnsave = new System.Windows.Forms.Button();
            this.txHeight = new System.Windows.Forms.TextBox();
            this.txWidth = new System.Windows.Forms.TextBox();
            this.txSpace = new System.Windows.Forms.TextBox();
            this.btnImage = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.nudPayNum = new System.Windows.Forms.NumericUpDown();
            this.nudCopesNum = new System.Windows.Forms.NumericUpDown();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.btnDefault = new System.Windows.Forms.Button();
            this.cbTransparent = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.nudPayNum)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudCopesNum)).BeginInit();
            this.SuspendLayout();
            // 
            // btnsave
            // 
            this.btnsave.Location = new System.Drawing.Point(11, 304);
            this.btnsave.Name = "btnsave";
            this.btnsave.Size = new System.Drawing.Size(140, 39);
            this.btnsave.TabIndex = 0;
            this.btnsave.Text = "حفظ الإعدادات";
            this.btnsave.UseVisualStyleBackColor = true;
            this.btnsave.Click += new System.EventHandler(this.btnsave_Click);
            // 
            // txHeight
            // 
            this.txHeight.Location = new System.Drawing.Point(102, 148);
            this.txHeight.Name = "txHeight";
            this.txHeight.Size = new System.Drawing.Size(130, 20);
            this.txHeight.TabIndex = 9;
            // 
            // txWidth
            // 
            this.txWidth.Location = new System.Drawing.Point(101, 122);
            this.txWidth.Name = "txWidth";
            this.txWidth.Size = new System.Drawing.Size(130, 20);
            this.txWidth.TabIndex = 10;
            // 
            // txSpace
            // 
            this.txSpace.Location = new System.Drawing.Point(101, 96);
            this.txSpace.Name = "txSpace";
            this.txSpace.Size = new System.Drawing.Size(130, 20);
            this.txSpace.TabIndex = 11;
            // 
            // btnImage
            // 
            this.btnImage.Location = new System.Drawing.Point(11, 275);
            this.btnImage.Name = "btnImage";
            this.btnImage.Size = new System.Drawing.Size(220, 23);
            this.btnImage.TabIndex = 12;
            this.btnImage.Text = "صورة الإيصال";
            this.btnImage.UseVisualStyleBackColor = true;
            this.btnImage.Click += new System.EventHandler(this.btnImage_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(12, 151);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(68, 13);
            this.label6.TabIndex = 18;
            this.label6.Text = "إرتفاع الإيصال";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 125);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(67, 13);
            this.label5.TabIndex = 17;
            this.label5.Text = "عرض الإيصال";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 99);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(83, 13);
            this.label4.TabIndex = 16;
            this.label4.Text = "المسافة الفاصلة";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 73);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(58, 13);
            this.label3.TabIndex = 15;
            this.label3.Text = "عدد النسخ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 47);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(56, 13);
            this.label2.TabIndex = 14;
            this.label2.Text = "عدد العقود";
            // 
            // nudPayNum
            // 
            this.nudPayNum.Location = new System.Drawing.Point(101, 45);
            this.nudPayNum.Name = "nudPayNum";
            this.nudPayNum.Size = new System.Drawing.Size(130, 20);
            this.nudPayNum.TabIndex = 19;
            // 
            // nudCopesNum
            // 
            this.nudCopesNum.Location = new System.Drawing.Point(101, 71);
            this.nudCopesNum.Name = "nudCopesNum";
            this.nudCopesNum.Size = new System.Drawing.Size(130, 20);
            this.nudCopesNum.TabIndex = 20;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(11, 217);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(220, 23);
            this.button1.TabIndex = 21;
            this.button1.Text = "لون الخط الإفتراضي";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(11, 246);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(220, 23);
            this.button2.TabIndex = 22;
            this.button2.Text = "الخط الإفتراضي";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // btnDefault
            // 
            this.btnDefault.Location = new System.Drawing.Point(157, 304);
            this.btnDefault.Name = "btnDefault";
            this.btnDefault.Size = new System.Drawing.Size(75, 39);
            this.btnDefault.TabIndex = 23;
            this.btnDefault.Text = "الإعدادات الإفتراضية";
            this.btnDefault.UseVisualStyleBackColor = true;
            this.btnDefault.Click += new System.EventHandler(this.btnDefault_Click);
            // 
            // cbTransparent
            // 
            this.cbTransparent.AutoSize = true;
            this.cbTransparent.Checked = true;
            this.cbTransparent.CheckState = System.Windows.Forms.CheckState.Checked;
            this.cbTransparent.Location = new System.Drawing.Point(15, 183);
            this.cbTransparent.Name = "cbTransparent";
            this.cbTransparent.Size = new System.Drawing.Size(128, 17);
            this.cbTransparent.TabIndex = 34;
            this.cbTransparent.Text = "خلفية شفافة للنصوص";
            this.cbTransparent.UseVisualStyleBackColor = true;
            // 
            // frmConfigure
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(244, 355);
            this.Controls.Add(this.cbTransparent);
            this.Controls.Add(this.btnDefault);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.nudCopesNum);
            this.Controls.Add(this.nudPayNum);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnImage);
            this.Controls.Add(this.txSpace);
            this.Controls.Add(this.txWidth);
            this.Controls.Add(this.txHeight);
            this.Controls.Add(this.btnsave);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(250, 380);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(250, 380);
            this.Name = "frmConfigure";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RightToLeftLayout = true;
            this.Text = "إعدادات البرنامج";
            ((System.ComponentModel.ISupportInitialize)(this.nudPayNum)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudCopesNum)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnsave;
        private System.Windows.Forms.TextBox txHeight;
        private System.Windows.Forms.TextBox txWidth;
        private System.Windows.Forms.TextBox txSpace;
        private System.Windows.Forms.Button btnImage;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown nudPayNum;
        private System.Windows.Forms.NumericUpDown nudCopesNum;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button btnDefault;
        private System.Windows.Forms.CheckBox cbTransparent;
    }
}