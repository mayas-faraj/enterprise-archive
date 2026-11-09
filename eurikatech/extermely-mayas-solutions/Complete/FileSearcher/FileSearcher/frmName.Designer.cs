namespace FileSearcher
{
    partial class frmName
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
            this.btnMain = new System.Windows.Forms.Button();
            this.txMain = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txPattern = new System.Windows.Forms.TextBox();
            this.txPath = new System.Windows.Forms.TextBox();
            this.btnBrowse = new System.Windows.Forms.Button();
            this.rbAll = new System.Windows.Forms.RadioButton();
            this.rbTop = new System.Windows.Forms.RadioButton();
            this.label4 = new System.Windows.Forms.Label();
            this.nudDepth = new System.Windows.Forms.NumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.nudDepth)).BeginInit();
            this.SuspendLayout();
            // 
            // btnMain
            // 
            this.btnMain.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnMain.Location = new System.Drawing.Point(12, 134);
            this.btnMain.Name = "btnMain";
            this.btnMain.Size = new System.Drawing.Size(360, 23);
            this.btnMain.TabIndex = 0;
            this.btnMain.Text = "Run";
            this.btnMain.UseVisualStyleBackColor = true;
            this.btnMain.Click += new System.EventHandler(this.btnMain_Click);
            // 
            // txMain
            // 
            this.txMain.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txMain.Location = new System.Drawing.Point(12, 163);
            this.txMain.Multiline = true;
            this.txMain.Name = "txMain";
            this.txMain.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txMain.Size = new System.Drawing.Size(360, 187);
            this.txMain.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Browsing Path";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 88);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(79, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Search Pattern";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 113);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(75, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Search Option";
            // 
            // txPattern
            // 
            this.txPattern.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txPattern.Location = new System.Drawing.Point(126, 85);
            this.txPattern.Name = "txPattern";
            this.txPattern.Size = new System.Drawing.Size(246, 20);
            this.txPattern.TabIndex = 5;
            this.txPattern.Text = "*";
            // 
            // txPath
            // 
            this.txPath.Location = new System.Drawing.Point(126, 33);
            this.txPath.Name = "txPath";
            this.txPath.Size = new System.Drawing.Size(169, 20);
            this.txPath.TabIndex = 6;
            // 
            // btnBrowse
            // 
            this.btnBrowse.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnBrowse.Location = new System.Drawing.Point(301, 30);
            this.btnBrowse.Name = "btnBrowse";
            this.btnBrowse.Size = new System.Drawing.Size(71, 49);
            this.btnBrowse.TabIndex = 8;
            this.btnBrowse.Text = "Browse";
            this.btnBrowse.UseVisualStyleBackColor = true;
            this.btnBrowse.Click += new System.EventHandler(this.btnBrowse_Click);
            // 
            // rbAll
            // 
            this.rbAll.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.rbAll.AutoSize = true;
            this.rbAll.Location = new System.Drawing.Point(282, 111);
            this.rbAll.Name = "rbAll";
            this.rbAll.Size = new System.Drawing.Size(90, 17);
            this.rbAll.TabIndex = 9;
            this.rbAll.Text = "All Directories";
            this.rbAll.UseVisualStyleBackColor = true;
            // 
            // rbTop
            // 
            this.rbTop.AutoSize = true;
            this.rbTop.Checked = true;
            this.rbTop.Location = new System.Drawing.Point(126, 111);
            this.rbTop.Name = "rbTop";
            this.rbTop.Size = new System.Drawing.Size(115, 17);
            this.rbTop.TabIndex = 10;
            this.rbTop.TabStop = true;
            this.rbTop.Text = "Effective Directory";
            this.rbTop.UseVisualStyleBackColor = true;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 61);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(72, 13);
            this.label4.TabIndex = 11;
            this.label4.Text = "Search Depth";
            // 
            // nudDepth
            // 
            this.nudDepth.Location = new System.Drawing.Point(126, 59);
            this.nudDepth.Maximum = new decimal(new int[] {
            1000,
            0,
            0,
            0});
            this.nudDepth.Name = "nudDepth";
            this.nudDepth.Size = new System.Drawing.Size(170, 20);
            this.nudDepth.TabIndex = 12;
            this.nudDepth.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // frmName
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(384, 362);
            this.Controls.Add(this.nudDepth);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.rbTop);
            this.Controls.Add(this.rbAll);
            this.Controls.Add(this.btnBrowse);
            this.Controls.Add(this.txPath);
            this.Controls.Add(this.txPattern);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txMain);
            this.Controls.Add(this.btnMain);
            this.Name = "frmName";
            this.Text = "Searching";
            ((System.ComponentModel.ISupportInitialize)(this.nudDepth)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnMain;
        private System.Windows.Forms.TextBox txMain;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txPattern;
        private System.Windows.Forms.TextBox txPath;
        private System.Windows.Forms.Button btnBrowse;
        private System.Windows.Forms.RadioButton rbAll;
        private System.Windows.Forms.RadioButton rbTop;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown nudDepth;
    }
}

