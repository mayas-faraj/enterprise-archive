namespace PaymentEditior
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
            this.ptnPrint = new System.Windows.Forms.Button();
            this.btnPreview = new System.Windows.Forms.Button();
            this.btnConfigure = new System.Windows.Forms.Button();
            this.pnlMove = new System.Windows.Forms.Panel();
            this.btndown = new System.Windows.Forms.Button();
            this.btnLeft = new System.Windows.Forms.Button();
            this.btnRight = new System.Windows.Forms.Button();
            this.btncenter = new System.Windows.Forms.Button();
            this.btnUp = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.txY = new System.Windows.Forms.TextBox();
            this.txX = new System.Windows.Forms.TextBox();
            this.txText = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnColor = new System.Windows.Forms.Button();
            this.btnFont = new System.Windows.Forms.Button();
            this.cbTransparent = new System.Windows.Forms.CheckBox();
            this.pnlPb = new System.Windows.Forms.Panel();
            this.pbMain = new System.Windows.Forms.PictureBox();
            this.pnlMove.SuspendLayout();
            this.pnlPb.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbMain)).BeginInit();
            this.SuspendLayout();
            // 
            // ptnPrint
            // 
            this.ptnPrint.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.ptnPrint.Location = new System.Drawing.Point(300, 400);
            this.ptnPrint.Name = "ptnPrint";
            this.ptnPrint.Size = new System.Drawing.Size(111, 41);
            this.ptnPrint.TabIndex = 8;
            this.ptnPrint.Text = "طباعة";
            this.ptnPrint.UseVisualStyleBackColor = true;
            this.ptnPrint.Click += new System.EventHandler(this.ptnPrint_Click);
            // 
            // btnPreview
            // 
            this.btnPreview.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnPreview.Location = new System.Drawing.Point(300, 353);
            this.btnPreview.Name = "btnPreview";
            this.btnPreview.Size = new System.Drawing.Size(111, 41);
            this.btnPreview.TabIndex = 9;
            this.btnPreview.Text = "معاينة";
            this.btnPreview.UseVisualStyleBackColor = true;
            this.btnPreview.Click += new System.EventHandler(this.btnPreview_Click);
            // 
            // btnConfigure
            // 
            this.btnConfigure.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnConfigure.Location = new System.Drawing.Point(300, 306);
            this.btnConfigure.Name = "btnConfigure";
            this.btnConfigure.Size = new System.Drawing.Size(111, 41);
            this.btnConfigure.TabIndex = 10;
            this.btnConfigure.Text = "إعدادات";
            this.btnConfigure.UseVisualStyleBackColor = true;
            this.btnConfigure.Click += new System.EventHandler(this.btnConfigure_Click);
            // 
            // pnlMove
            // 
            this.pnlMove.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlMove.Controls.Add(this.btndown);
            this.pnlMove.Controls.Add(this.btnLeft);
            this.pnlMove.Controls.Add(this.btnRight);
            this.pnlMove.Controls.Add(this.btncenter);
            this.pnlMove.Controls.Add(this.btnUp);
            this.pnlMove.Location = new System.Drawing.Point(448, 306);
            this.pnlMove.Name = "pnlMove";
            this.pnlMove.Size = new System.Drawing.Size(169, 135);
            this.pnlMove.TabIndex = 20;
            // 
            // btndown
            // 
            this.btndown.Location = new System.Drawing.Point(69, 91);
            this.btndown.Name = "btndown";
            this.btndown.Size = new System.Drawing.Size(30, 23);
            this.btndown.TabIndex = 25;
            this.btndown.Text = "v";
            this.btndown.UseVisualStyleBackColor = true;
            this.btndown.Click += new System.EventHandler(this.btndown_Click);
            // 
            // btnLeft
            // 
            this.btnLeft.Location = new System.Drawing.Point(33, 62);
            this.btnLeft.Name = "btnLeft";
            this.btnLeft.Size = new System.Drawing.Size(30, 23);
            this.btnLeft.TabIndex = 24;
            this.btnLeft.Text = ">";
            this.btnLeft.UseVisualStyleBackColor = true;
            this.btnLeft.Click += new System.EventHandler(this.btnLeft_Click);
            // 
            // btnRight
            // 
            this.btnRight.Location = new System.Drawing.Point(105, 62);
            this.btnRight.Name = "btnRight";
            this.btnRight.Size = new System.Drawing.Size(30, 23);
            this.btnRight.TabIndex = 23;
            this.btnRight.Text = "<";
            this.btnRight.UseVisualStyleBackColor = true;
            this.btnRight.Click += new System.EventHandler(this.btnRight_Click);
            // 
            // btncenter
            // 
            this.btncenter.Location = new System.Drawing.Point(69, 62);
            this.btncenter.Name = "btncenter";
            this.btncenter.Size = new System.Drawing.Size(30, 23);
            this.btncenter.TabIndex = 22;
            this.btncenter.Text = ".";
            this.btncenter.UseVisualStyleBackColor = true;
            this.btncenter.Click += new System.EventHandler(this.btncenter_Click);
            // 
            // btnUp
            // 
            this.btnUp.Location = new System.Drawing.Point(69, 33);
            this.btnUp.Name = "btnUp";
            this.btnUp.Size = new System.Drawing.Size(30, 23);
            this.btnUp.TabIndex = 21;
            this.btnUp.Text = "^";
            this.btnUp.UseVisualStyleBackColor = true;
            this.btnUp.Click += new System.EventHandler(this.btnUp_Click);
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 309);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(30, 13);
            this.label3.TabIndex = 32;
            this.label3.Text = "النص";
            // 
            // btnAdd
            // 
            this.btnAdd.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAdd.Location = new System.Drawing.Point(158, 306);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(111, 41);
            this.btnAdd.TabIndex = 31;
            this.btnAdd.Text = "إضافة";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDelete.Location = new System.Drawing.Point(158, 353);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(111, 41);
            this.btnDelete.TabIndex = 30;
            this.btnDelete.Text = "حذف";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEdit.Location = new System.Drawing.Point(158, 400);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(111, 41);
            this.btnEdit.TabIndex = 29;
            this.btnEdit.Text = "تعديل";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // txY
            // 
            this.txY.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txY.Location = new System.Drawing.Point(64, 358);
            this.txY.Name = "txY";
            this.txY.ReadOnly = true;
            this.txY.Size = new System.Drawing.Size(64, 20);
            this.txY.TabIndex = 28;
            // 
            // txX
            // 
            this.txX.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txX.Location = new System.Drawing.Point(64, 332);
            this.txX.Name = "txX";
            this.txX.ReadOnly = true;
            this.txX.Size = new System.Drawing.Size(64, 20);
            this.txX.TabIndex = 27;
            // 
            // txText
            // 
            this.txText.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txText.Location = new System.Drawing.Point(64, 306);
            this.txText.Name = "txText";
            this.txText.Size = new System.Drawing.Size(64, 20);
            this.txText.TabIndex = 26;
            this.txText.TextChanged += new System.EventHandler(this.txText_TextChanged);
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(14, 335);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 13);
            this.label2.TabIndex = 25;
            this.label2.Text = "أفقي";
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 361);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 13);
            this.label1.TabIndex = 24;
            this.label1.Text = "شاقولي";
            // 
            // btnColor
            // 
            this.btnColor.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnColor.Location = new System.Drawing.Point(79, 410);
            this.btnColor.Name = "btnColor";
            this.btnColor.Size = new System.Drawing.Size(49, 31);
            this.btnColor.TabIndex = 23;
            this.btnColor.Text = "اللون";
            this.btnColor.UseVisualStyleBackColor = true;
            this.btnColor.Click += new System.EventHandler(this.btnColor_Click);
            // 
            // btnFont
            // 
            this.btnFont.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnFont.Location = new System.Drawing.Point(12, 410);
            this.btnFont.Name = "btnFont";
            this.btnFont.Size = new System.Drawing.Size(49, 31);
            this.btnFont.TabIndex = 22;
            this.btnFont.Text = "الخط";
            this.btnFont.UseVisualStyleBackColor = true;
            this.btnFont.Click += new System.EventHandler(this.btnFont_Click);
            // 
            // cbTransparent
            // 
            this.cbTransparent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cbTransparent.AutoSize = true;
            this.cbTransparent.Checked = true;
            this.cbTransparent.CheckState = System.Windows.Forms.CheckState.Checked;
            this.cbTransparent.Location = new System.Drawing.Point(12, 387);
            this.cbTransparent.Name = "cbTransparent";
            this.cbTransparent.Size = new System.Drawing.Size(87, 17);
            this.cbTransparent.TabIndex = 33;
            this.cbTransparent.Text = "خلفية شفافة";
            this.cbTransparent.UseVisualStyleBackColor = true;
            // 
            // pnlPb
            // 
            this.pnlPb.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlPb.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlPb.Controls.Add(this.pbMain);
            this.pnlPb.Location = new System.Drawing.Point(17, 12);
            this.pnlPb.Name = "pnlPb";
            this.pnlPb.Size = new System.Drawing.Size(600, 283);
            this.pnlPb.TabIndex = 34;
            // 
            // pbMain
            // 
            this.pbMain.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pbMain.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pbMain.Location = new System.Drawing.Point(-1, -1);
            this.pbMain.Name = "pbMain";
            this.pbMain.Size = new System.Drawing.Size(10, 10);
            this.pbMain.TabIndex = 14;
            this.pbMain.TabStop = false;
            this.pbMain.Click += new System.EventHandler(this.pbMain_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(632, 453);
            this.Controls.Add(this.pnlPb);
            this.Controls.Add(this.cbTransparent);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.txY);
            this.Controls.Add(this.txX);
            this.Controls.Add(this.txText);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnColor);
            this.Controls.Add(this.btnFont);
            this.Controls.Add(this.pnlMove);
            this.Controls.Add(this.btnConfigure);
            this.Controls.Add(this.btnPreview);
            this.Controls.Add(this.ptnPrint);
            this.MinimumSize = new System.Drawing.Size(640, 480);
            this.Name = "frmMain";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RightToLeftLayout = true;
            this.Text = "محرر الإيصالات";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMain_FormClosing);
            this.pnlMove.ResumeLayout(false);
            this.pnlPb.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pbMain)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button ptnPrint;
        private System.Windows.Forms.Button btnPreview;
        private System.Windows.Forms.Button btnConfigure;
        private System.Windows.Forms.Panel pnlMove;
        private System.Windows.Forms.Button btndown;
        private System.Windows.Forms.Button btnLeft;
        private System.Windows.Forms.Button btnRight;
        private System.Windows.Forms.Button btncenter;
        private System.Windows.Forms.Button btnUp;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.TextBox txY;
        private System.Windows.Forms.TextBox txX;
        private System.Windows.Forms.TextBox txText;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnColor;
        private System.Windows.Forms.Button btnFont;
        private System.Windows.Forms.CheckBox cbTransparent;
        private System.Windows.Forms.Panel pnlPb;
        private System.Windows.Forms.PictureBox pbMain;
    }
}

