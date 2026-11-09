namespace ClientAppliction
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
            this.dgvWords = new System.Windows.Forms.DataGridView();
            this.txIName = new System.Windows.Forms.TextBox();
            this.txIPrexfix = new System.Windows.Forms.TextBox();
            this.txIDesc = new System.Windows.Forms.TextBox();
            this.txIHelp = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnAddLanguage = new System.Windows.Forms.Button();
            this.chkRightToLeft = new System.Windows.Forms.CheckBox();
            this.label6 = new System.Windows.Forms.Label();
            this.btnGetWords = new System.Windows.Forms.Button();
            this.btnSaveWords = new System.Windows.Forms.Button();
            this.cmDefaultLanguage = new System.Windows.Forms.ComboBox();
            this.cmLanguage = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnTranslate = new System.Windows.Forms.Button();
            this.btnClearRows = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvWords)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvWords
            // 
            this.dgvWords.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvWords.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvWords.Location = new System.Drawing.Point(231, 12);
            this.dgvWords.Name = "dgvWords";
            this.dgvWords.RowHeadersWidth = 20;
            this.dgvWords.Size = new System.Drawing.Size(389, 398);
            this.dgvWords.TabIndex = 0;
            this.dgvWords.UserDeletingRow += new System.Windows.Forms.DataGridViewRowCancelEventHandler(this.dgvWords_UserDeletingRow);
            // 
            // txIName
            // 
            this.txIName.Location = new System.Drawing.Point(102, 236);
            this.txIName.Name = "txIName";
            this.txIName.Size = new System.Drawing.Size(107, 20);
            this.txIName.TabIndex = 1;
            // 
            // txIPrexfix
            // 
            this.txIPrexfix.Location = new System.Drawing.Point(102, 262);
            this.txIPrexfix.Name = "txIPrexfix";
            this.txIPrexfix.Size = new System.Drawing.Size(107, 20);
            this.txIPrexfix.TabIndex = 2;
            // 
            // txIDesc
            // 
            this.txIDesc.Location = new System.Drawing.Point(102, 288);
            this.txIDesc.Name = "txIDesc";
            this.txIDesc.Size = new System.Drawing.Size(107, 20);
            this.txIDesc.TabIndex = 3;
            // 
            // txIHelp
            // 
            this.txIHelp.Location = new System.Drawing.Point(102, 314);
            this.txIHelp.Name = "txIHelp";
            this.txIHelp.Size = new System.Drawing.Size(107, 20);
            this.txIHelp.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 239);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "اللغة";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 265);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(37, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "إختصار";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(20, 291);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(31, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "وصف";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 317);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(76, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "ملف المساعدة";
            // 
            // btnAddLanguage
            // 
            this.btnAddLanguage.Location = new System.Drawing.Point(23, 387);
            this.btnAddLanguage.Name = "btnAddLanguage";
            this.btnAddLanguage.Size = new System.Drawing.Size(186, 23);
            this.btnAddLanguage.TabIndex = 10;
            this.btnAddLanguage.Text = "إضافة لغة";
            this.btnAddLanguage.UseVisualStyleBackColor = true;
            this.btnAddLanguage.Click += new System.EventHandler(this.btnAddLanguage_Click);
            // 
            // chkRightToLeft
            // 
            this.chkRightToLeft.AutoSize = true;
            this.chkRightToLeft.Location = new System.Drawing.Point(23, 350);
            this.chkRightToLeft.Name = "chkRightToLeft";
            this.chkRightToLeft.Size = new System.Drawing.Size(105, 17);
            this.chkRightToLeft.TabIndex = 12;
            this.chkRightToLeft.Text = "من اليمين لليسار";
            this.chkRightToLeft.UseVisualStyleBackColor = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(21, 15);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(78, 13);
            this.label6.TabIndex = 14;
            this.label6.Text = "اللغة الإفتراضية";
            // 
            // btnGetWords
            // 
            this.btnGetWords.Location = new System.Drawing.Point(23, 85);
            this.btnGetWords.Name = "btnGetWords";
            this.btnGetWords.Size = new System.Drawing.Size(185, 23);
            this.btnGetWords.TabIndex = 17;
            this.btnGetWords.Text = "إحضار الكلمات حسب اللغة";
            this.btnGetWords.UseVisualStyleBackColor = true;
            this.btnGetWords.Click += new System.EventHandler(this.btnGetWords_Click);
            // 
            // btnSaveWords
            // 
            this.btnSaveWords.Enabled = false;
            this.btnSaveWords.Location = new System.Drawing.Point(22, 114);
            this.btnSaveWords.Name = "btnSaveWords";
            this.btnSaveWords.Size = new System.Drawing.Size(186, 23);
            this.btnSaveWords.TabIndex = 18;
            this.btnSaveWords.Text = "حفظ";
            this.btnSaveWords.UseVisualStyleBackColor = true;
            this.btnSaveWords.Click += new System.EventHandler(this.btnSaveWords_Click);
            // 
            // cmDefaultLanguage
            // 
            this.cmDefaultLanguage.FormattingEnabled = true;
            this.cmDefaultLanguage.Location = new System.Drawing.Point(102, 12);
            this.cmDefaultLanguage.Name = "cmDefaultLanguage";
            this.cmDefaultLanguage.Size = new System.Drawing.Size(107, 21);
            this.cmDefaultLanguage.TabIndex = 19;
            this.cmDefaultLanguage.TextChanged += new System.EventHandler(this.cmDefaultLanguage_TextChanged);
            // 
            // cmLanguage
            // 
            this.cmLanguage.FormattingEnabled = true;
            this.cmLanguage.Location = new System.Drawing.Point(102, 39);
            this.cmLanguage.Name = "cmLanguage";
            this.cmLanguage.Size = new System.Drawing.Size(107, 21);
            this.cmLanguage.TabIndex = 21;
            this.cmLanguage.TextChanged += new System.EventHandler(this.cmLanguage_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(21, 42);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(29, 13);
            this.label5.TabIndex = 20;
            this.label5.Text = "اللغة";
            // 
            // btnTranslate
            // 
            this.btnTranslate.Location = new System.Drawing.Point(23, 172);
            this.btnTranslate.Name = "btnTranslate";
            this.btnTranslate.Size = new System.Drawing.Size(185, 23);
            this.btnTranslate.TabIndex = 22;
            this.btnTranslate.Text = "ترجم حسب اللغة";
            this.btnTranslate.UseVisualStyleBackColor = true;
            this.btnTranslate.Click += new System.EventHandler(this.btnTranslate_Click);
            // 
            // btnClearRows
            // 
            this.btnClearRows.Location = new System.Drawing.Point(23, 143);
            this.btnClearRows.Name = "btnClearRows";
            this.btnClearRows.Size = new System.Drawing.Size(185, 23);
            this.btnClearRows.TabIndex = 23;
            this.btnClearRows.Text = "مسح الأسطر";
            this.btnClearRows.UseVisualStyleBackColor = true;
            this.btnClearRows.Click += new System.EventHandler(this.btnClearRows_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(632, 422);
            this.Controls.Add(this.btnClearRows);
            this.Controls.Add(this.btnTranslate);
            this.Controls.Add(this.cmLanguage);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.cmDefaultLanguage);
            this.Controls.Add(this.btnSaveWords);
            this.Controls.Add(this.btnGetWords);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.chkRightToLeft);
            this.Controls.Add(this.btnAddLanguage);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txIHelp);
            this.Controls.Add(this.txIDesc);
            this.Controls.Add(this.txIPrexfix);
            this.Controls.Add(this.txIName);
            this.Controls.Add(this.dgvWords);
            this.MinimumSize = new System.Drawing.Size(460, 460);
            this.Name = "frmMain";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RightToLeftLayout = true;
            this.Text = "وسيلة إضافة لغة";
            ((System.ComponentModel.ISupportInitialize)(this.dgvWords)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvWords;
        private System.Windows.Forms.TextBox txIName;
        private System.Windows.Forms.TextBox txIPrexfix;
        private System.Windows.Forms.TextBox txIDesc;
        private System.Windows.Forms.TextBox txIHelp;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnAddLanguage;
        private System.Windows.Forms.CheckBox chkRightToLeft;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnGetWords;
        private System.Windows.Forms.Button btnSaveWords;
        private System.Windows.Forms.ComboBox cmDefaultLanguage;
        private System.Windows.Forms.ComboBox cmLanguage;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnTranslate;
        private System.Windows.Forms.Button btnClearRows;
    }
}

