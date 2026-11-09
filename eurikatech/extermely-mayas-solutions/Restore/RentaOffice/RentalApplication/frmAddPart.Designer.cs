namespace RentalApplication
{
    partial class frmAddPart
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
            this.pnlOrders = new System.Windows.Forms.Panel();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.scMain = new System.Windows.Forms.SplitContainer();
            this.btnShowPart = new System.Windows.Forms.Button();
            this.cmFeature = new System.Windows.Forms.ComboBox();
            this.txAddress = new System.Windows.Forms.TextBox();
            this.txSn = new System.Windows.Forms.TextBox();
            this.txHeight = new System.Windows.Forms.TextBox();
            this.cmItems = new System.Windows.Forms.CheckBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txName = new System.Windows.Forms.TextBox();
            this.cbWatermeter = new System.Windows.Forms.CheckBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cbVoltmeter = new System.Windows.Forms.CheckBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnOwner = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.btnImages = new System.Windows.Forms.Button();
            this.txDescription = new System.Windows.Forms.TextBox();
            this.btnRooms = new System.Windows.Forms.Button();
            this.lbCaption = new System.Windows.Forms.Label();
            this.lbFeatures = new System.Windows.Forms.Label();
            this.pnlOrders.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.scMain)).BeginInit();
            this.scMain.Panel1.SuspendLayout();
            this.scMain.Panel2.SuspendLayout();
            this.scMain.SuspendLayout();
            this.SuspendLayout();
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
            this.pnlOrders.Location = new System.Drawing.Point(12, 390);
            this.pnlOrders.Name = "pnlOrders";
            this.pnlOrders.Size = new System.Drawing.Size(600, 40);
            this.pnlOrders.TabIndex = 6;
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
            // scMain
            // 
            this.scMain.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.scMain.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.scMain.Location = new System.Drawing.Point(12, 65);
            this.scMain.Name = "scMain";
            // 
            // scMain.Panel1
            // 
            this.scMain.Panel1.Controls.Add(this.btnShowPart);
            this.scMain.Panel1.Controls.Add(this.cmFeature);
            this.scMain.Panel1.Controls.Add(this.txAddress);
            this.scMain.Panel1.Controls.Add(this.txSn);
            this.scMain.Panel1.Controls.Add(this.txHeight);
            this.scMain.Panel1.Controls.Add(this.cmItems);
            this.scMain.Panel1.Controls.Add(this.label2);
            this.scMain.Panel1.Controls.Add(this.txName);
            this.scMain.Panel1.Controls.Add(this.cbWatermeter);
            this.scMain.Panel1.Controls.Add(this.label5);
            this.scMain.Panel1.Controls.Add(this.cbVoltmeter);
            this.scMain.Panel1.Controls.Add(this.label4);
            this.scMain.Panel1.Controls.Add(this.label3);
            this.scMain.Panel1.Controls.Add(this.label1);
            this.scMain.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.scMain.Panel1MinSize = 50;
            // 
            // scMain.Panel2
            // 
            this.scMain.Panel2.Controls.Add(this.btnOwner);
            this.scMain.Panel2.Controls.Add(this.label7);
            this.scMain.Panel2.Controls.Add(this.btnImages);
            this.scMain.Panel2.Controls.Add(this.txDescription);
            this.scMain.Panel2.Controls.Add(this.btnRooms);
            this.scMain.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.scMain.Panel2MinSize = 50;
            this.scMain.Size = new System.Drawing.Size(600, 319);
            this.scMain.SplitterDistance = 300;
            this.scMain.TabIndex = 5;
            // 
            // btnShowPart
            // 
            this.btnShowPart.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnShowPart.Location = new System.Drawing.Point(33, 196);
            this.btnShowPart.Name = "btnShowPart";
            this.btnShowPart.Size = new System.Drawing.Size(117, 65);
            this.btnShowPart.TabIndex = 12;
            this.btnShowPart.Text = "عرض الوحدة العقارية";
            this.btnShowPart.UseVisualStyleBackColor = true;
            // 
            // cmFeature
            // 
            this.cmFeature.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.cmFeature.FormattingEnabled = true;
            this.cmFeature.Location = new System.Drawing.Point(33, 97);
            this.cmFeature.Name = "cmFeature";
            this.cmFeature.Size = new System.Drawing.Size(167, 21);
            this.cmFeature.TabIndex = 9;
            // 
            // txAddress
            // 
            this.txAddress.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txAddress.Location = new System.Drawing.Point(33, 71);
            this.txAddress.Name = "txAddress";
            this.txAddress.Size = new System.Drawing.Size(167, 20);
            this.txAddress.TabIndex = 7;
            // 
            // txSn
            // 
            this.txSn.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txSn.Location = new System.Drawing.Point(33, 45);
            this.txSn.Name = "txSn";
            this.txSn.Size = new System.Drawing.Size(167, 20);
            this.txSn.TabIndex = 6;
            // 
            // txHeight
            // 
            this.txHeight.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txHeight.Location = new System.Drawing.Point(33, 123);
            this.txHeight.Name = "txHeight";
            this.txHeight.Size = new System.Drawing.Size(167, 20);
            this.txHeight.TabIndex = 4;
            // 
            // cmItems
            // 
            this.cmItems.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cmItems.AutoSize = true;
            this.cmItems.Location = new System.Drawing.Point(207, 242);
            this.cmItems.Name = "cmItems";
            this.cmItems.Size = new System.Drawing.Size(73, 17);
            this.cmItems.TabIndex = 2;
            this.cmItems.Text = "يوجد فرش";
            this.cmItems.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(222, 126);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(61, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "إرتفاع العقار";
            // 
            // txName
            // 
            this.txName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txName.Location = new System.Drawing.Point(33, 19);
            this.txName.Name = "txName";
            this.txName.Size = new System.Drawing.Size(167, 20);
            this.txName.TabIndex = 5;
            // 
            // cbWatermeter
            // 
            this.cbWatermeter.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cbWatermeter.AutoSize = true;
            this.cbWatermeter.Location = new System.Drawing.Point(193, 219);
            this.cbWatermeter.Name = "cbWatermeter";
            this.cbWatermeter.Size = new System.Drawing.Size(87, 17);
            this.cbWatermeter.TabIndex = 1;
            this.cbWatermeter.Text = "يوجد عداد ماء";
            this.cbWatermeter.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(226, 22);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(57, 13);
            this.label5.TabIndex = 4;
            this.label5.Text = "اسم العقار";
            // 
            // cbVoltmeter
            // 
            this.cbVoltmeter.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cbVoltmeter.AutoSize = true;
            this.cbVoltmeter.Location = new System.Drawing.Point(180, 196);
            this.cbVoltmeter.Name = "cbVoltmeter";
            this.cbVoltmeter.Size = new System.Drawing.Size(100, 17);
            this.cbVoltmeter.TabIndex = 0;
            this.cbVoltmeter.Text = "يوجد عداد كهرباء";
            this.cbVoltmeter.UseVisualStyleBackColor = true;
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(231, 52);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(52, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "رقم العقار";
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(245, 78);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(38, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "العنوان";
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(242, 100);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "الكسوة";
            // 
            // btnOwner
            // 
            this.btnOwner.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnOwner.Location = new System.Drawing.Point(26, 75);
            this.btnOwner.Name = "btnOwner";
            this.btnOwner.Size = new System.Drawing.Size(247, 23);
            this.btnOwner.TabIndex = 12;
            this.btnOwner.Text = "مالك العقار";
            this.btnOwner.UseVisualStyleBackColor = true;
            // 
            // label7
            // 
            this.label7.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(239, 113);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(37, 13);
            this.label7.TabIndex = 6;
            this.label7.Text = "الوصف";
            // 
            // btnImages
            // 
            this.btnImages.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnImages.Location = new System.Drawing.Point(26, 46);
            this.btnImages.Name = "btnImages";
            this.btnImages.Size = new System.Drawing.Size(247, 23);
            this.btnImages.TabIndex = 11;
            this.btnImages.Text = "الصور";
            this.btnImages.UseVisualStyleBackColor = true;
            // 
            // txDescription
            // 
            this.txDescription.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txDescription.Location = new System.Drawing.Point(22, 110);
            this.txDescription.Multiline = true;
            this.txDescription.Name = "txDescription";
            this.txDescription.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txDescription.Size = new System.Drawing.Size(186, 151);
            this.txDescription.TabIndex = 5;
            // 
            // btnRooms
            // 
            this.btnRooms.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRooms.Location = new System.Drawing.Point(26, 17);
            this.btnRooms.Name = "btnRooms";
            this.btnRooms.Size = new System.Drawing.Size(247, 23);
            this.btnRooms.TabIndex = 10;
            this.btnRooms.Text = "تفاصيل الغرف";
            this.btnRooms.UseVisualStyleBackColor = true;
            this.btnRooms.Click += new System.EventHandler(this.btnRooms_Click);
            // 
            // lbCaption
            // 
            this.lbCaption.AutoSize = true;
            this.lbCaption.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lbCaption.Font = new System.Drawing.Font("Times New Roman", 27.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCaption.Location = new System.Drawing.Point(12, 9);
            this.lbCaption.Name = "lbCaption";
            this.lbCaption.Size = new System.Drawing.Size(254, 44);
            this.lbCaption.TabIndex = 4;
            this.lbCaption.Text = "إضافة وحدة عقارية";
            // 
            // lbFeatures
            // 
            this.lbFeatures.AutoSize = true;
            this.lbFeatures.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFeatures.ForeColor = System.Drawing.Color.Blue;
            this.lbFeatures.Location = new System.Drawing.Point(557, 47);
            this.lbFeatures.Name = "lbFeatures";
            this.lbFeatures.Size = new System.Drawing.Size(55, 15);
            this.lbFeatures.TabIndex = 5;
            this.lbFeatures.Text = "إكساء الغرف";
            this.lbFeatures.Click += new System.EventHandler(this.lbFeatures_Click);
            // 
            // frmAddPart
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(634, 452);
            this.Controls.Add(this.lbFeatures);
            this.Controls.Add(this.pnlOrders);
            this.Controls.Add(this.scMain);
            this.Controls.Add(this.lbCaption);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MinimumSize = new System.Drawing.Size(640, 480);
            this.Name = "frmAddPart";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RightToLeftLayout = true;
            this.Text = "إضافة وحدة عقارية";
            this.pnlOrders.ResumeLayout(false);
            this.scMain.Panel1.ResumeLayout(false);
            this.scMain.Panel1.PerformLayout();
            this.scMain.Panel2.ResumeLayout(false);
            this.scMain.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.scMain)).EndInit();
            this.scMain.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnlOrders;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.SplitContainer scMain;
        private System.Windows.Forms.Label lbCaption;
        private System.Windows.Forms.Button btnShowPart;
        private System.Windows.Forms.Button btnImages;
        private System.Windows.Forms.Button btnRooms;
        private System.Windows.Forms.ComboBox cmFeature;
        private System.Windows.Forms.TextBox txAddress;
        private System.Windows.Forms.TextBox txSn;
        private System.Windows.Forms.CheckBox cmItems;
        private System.Windows.Forms.TextBox txName;
        private System.Windows.Forms.CheckBox cbWatermeter;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.CheckBox cbVoltmeter;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txDescription;
        private System.Windows.Forms.TextBox txHeight;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lbFeatures;
        private System.Windows.Forms.Button btnOwner;

    }
}