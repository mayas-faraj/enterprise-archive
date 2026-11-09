namespace RentalApplication
{
    partial class frmPartFeature
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
            this.lbCaption = new System.Windows.Forms.Label();
            this.scMain = new System.Windows.Forms.SplitContainer();
            this.lstFeatures = new System.Windows.Forms.ListBox();
            this.txDescription = new System.Windows.Forms.TextBox();
            this.txName = new System.Windows.Forms.TextBox();
            this.lbName = new System.Windows.Forms.Label();
            this.lbDescription = new System.Windows.Forms.Label();
            this.pnlOrders = new System.Windows.Forms.Panel();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.scMain)).BeginInit();
            this.scMain.Panel1.SuspendLayout();
            this.scMain.Panel2.SuspendLayout();
            this.scMain.SuspendLayout();
            this.pnlOrders.SuspendLayout();
            this.SuspendLayout();
            // 
            // lbCaption
            // 
            this.lbCaption.AutoSize = true;
            this.lbCaption.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lbCaption.Font = new System.Drawing.Font("Times New Roman", 27.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCaption.Location = new System.Drawing.Point(22, 9);
            this.lbCaption.Name = "lbCaption";
            this.lbCaption.Size = new System.Drawing.Size(198, 44);
            this.lbCaption.TabIndex = 1;
            this.lbCaption.Text = "إكساء العقارات";
            // 
            // scMain
            // 
            this.scMain.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.scMain.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.scMain.Location = new System.Drawing.Point(22, 65);
            this.scMain.Name = "scMain";
            // 
            // scMain.Panel1
            // 
            this.scMain.Panel1.Controls.Add(this.lstFeatures);
            this.scMain.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.scMain.Panel1MinSize = 50;
            // 
            // scMain.Panel2
            // 
            this.scMain.Panel2.Controls.Add(this.txDescription);
            this.scMain.Panel2.Controls.Add(this.txName);
            this.scMain.Panel2.Controls.Add(this.lbName);
            this.scMain.Panel2.Controls.Add(this.lbDescription);
            this.scMain.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.scMain.Panel2MinSize = 50;
            this.scMain.Size = new System.Drawing.Size(600, 319);
            this.scMain.SplitterDistance = 150;
            this.scMain.TabIndex = 2;
            // 
            // lstFeatures
            // 
            this.lstFeatures.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lstFeatures.FormattingEnabled = true;
            this.lstFeatures.Location = new System.Drawing.Point(3, 3);
            this.lstFeatures.Name = "lstFeatures";
            this.lstFeatures.Size = new System.Drawing.Size(142, 303);
            this.lstFeatures.TabIndex = 0;
            // 
            // txDescription
            // 
            this.txDescription.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txDescription.Location = new System.Drawing.Point(44, 42);
            this.txDescription.Multiline = true;
            this.txDescription.Name = "txDescription";
            this.txDescription.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txDescription.Size = new System.Drawing.Size(278, 264);
            this.txDescription.TabIndex = 3;
            // 
            // txName
            // 
            this.txName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txName.Location = new System.Drawing.Point(44, 16);
            this.txName.Name = "txName";
            this.txName.Size = new System.Drawing.Size(278, 20);
            this.txName.TabIndex = 2;
            // 
            // lbName
            // 
            this.lbName.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lbName.AutoSize = true;
            this.lbName.Location = new System.Drawing.Point(366, 19);
            this.lbName.Name = "lbName";
            this.lbName.Size = new System.Drawing.Size(59, 13);
            this.lbName.TabIndex = 1;
            this.lbName.Text = "نوع الإكساء";
            // 
            // lbDescription
            // 
            this.lbDescription.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lbDescription.AutoSize = true;
            this.lbDescription.Location = new System.Drawing.Point(388, 45);
            this.lbDescription.Name = "lbDescription";
            this.lbDescription.Size = new System.Drawing.Size(37, 13);
            this.lbDescription.TabIndex = 0;
            this.lbDescription.Text = "الوصف";
            // 
            // pnlOrders
            // 
            this.pnlOrders.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlOrders.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlOrders.Controls.Add(this.btnNew);
            this.pnlOrders.Controls.Add(this.btnSave);
            this.pnlOrders.Controls.Add(this.btnRefresh);
            this.pnlOrders.Controls.Add(this.btnClose);
            this.pnlOrders.Location = new System.Drawing.Point(22, 390);
            this.pnlOrders.Name = "pnlOrders";
            this.pnlOrders.Size = new System.Drawing.Size(600, 40);
            this.pnlOrders.TabIndex = 3;
            // 
            // btnNew
            // 
            this.btnNew.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNew.Location = new System.Drawing.Point(466, 8);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(114, 23);
            this.btnNew.TabIndex = 4;
            this.btnNew.Text = "جديد";
            this.btnNew.UseVisualStyleBackColor = true;
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(318, 8);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(116, 23);
            this.btnSave.TabIndex = 2;
            this.btnSave.Text = "حفظ";
            this.btnSave.UseVisualStyleBackColor = true;
            // 
            // btnRefresh
            // 
            this.btnRefresh.Location = new System.Drawing.Point(170, 8);
            this.btnRefresh.Name = "btnRefresh";
            this.btnRefresh.Size = new System.Drawing.Size(116, 23);
            this.btnRefresh.TabIndex = 1;
            this.btnRefresh.Text = "مسح";
            this.btnRefresh.UseVisualStyleBackColor = true;
            // 
            // btnClose
            // 
            this.btnClose.Location = new System.Drawing.Point(22, 8);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(116, 23);
            this.btnClose.TabIndex = 0;
            this.btnClose.Text = "خروج";
            this.btnClose.UseVisualStyleBackColor = true;
            // 
            // frmPartFeature
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(634, 452);
            this.Controls.Add(this.pnlOrders);
            this.Controls.Add(this.scMain);
            this.Controls.Add(this.lbCaption);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MinimumSize = new System.Drawing.Size(640, 480);
            this.Name = "frmPartFeature";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RightToLeftLayout = true;
            this.Text = "إكساء العقارات";
            this.scMain.Panel1.ResumeLayout(false);
            this.scMain.Panel2.ResumeLayout(false);
            this.scMain.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.scMain)).EndInit();
            this.scMain.ResumeLayout(false);
            this.pnlOrders.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbCaption;
        private System.Windows.Forms.SplitContainer scMain;
        private System.Windows.Forms.ListBox lstFeatures;
        private System.Windows.Forms.TextBox txDescription;
        private System.Windows.Forms.TextBox txName;
        private System.Windows.Forms.Label lbName;
        private System.Windows.Forms.Label lbDescription;
        private System.Windows.Forms.Panel pnlOrders;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Button btnClose;
    }
}