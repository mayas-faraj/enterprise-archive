namespace RentalApplication
{
    partial class frmAddClient
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
            this.txAddrPerm = new System.Windows.Forms.TextBox();
            this.cmGender = new System.Windows.Forms.ComboBox();
            this.label15 = new System.Windows.Forms.Label();
            this.txBirthDate = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txBirthPlace = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txSn = new System.Windows.Forms.TextBox();
            this.txLName = new System.Windows.Forms.TextBox();
            this.txAddrTemp = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txFName = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cmState = new System.Windows.Forms.ComboBox();
            this.txOrignePlace = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txMotherName = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.txFatherName = new System.Windows.Forms.TextBox();
            this.label14 = new System.Windows.Forms.Label();
            this.txCity = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.txReqPriceTo = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txReqPriceFrom = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.lbCaption = new System.Windows.Forms.Label();
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
            this.pnlOrders.Location = new System.Drawing.Point(12, 400);
            this.pnlOrders.Name = "pnlOrders";
            this.pnlOrders.Size = new System.Drawing.Size(610, 40);
            this.pnlOrders.TabIndex = 10;
            // 
            // btnNew
            // 
            this.btnNew.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNew.Location = new System.Drawing.Point(466, 8);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(124, 23);
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
            this.scMain.Panel1.Controls.Add(this.txAddrPerm);
            this.scMain.Panel1.Controls.Add(this.cmGender);
            this.scMain.Panel1.Controls.Add(this.label15);
            this.scMain.Panel1.Controls.Add(this.txBirthDate);
            this.scMain.Panel1.Controls.Add(this.label8);
            this.scMain.Panel1.Controls.Add(this.txBirthPlace);
            this.scMain.Panel1.Controls.Add(this.label6);
            this.scMain.Panel1.Controls.Add(this.txSn);
            this.scMain.Panel1.Controls.Add(this.txLName);
            this.scMain.Panel1.Controls.Add(this.txAddrTemp);
            this.scMain.Panel1.Controls.Add(this.label2);
            this.scMain.Panel1.Controls.Add(this.txFName);
            this.scMain.Panel1.Controls.Add(this.label5);
            this.scMain.Panel1.Controls.Add(this.label4);
            this.scMain.Panel1.Controls.Add(this.label3);
            this.scMain.Panel1.Controls.Add(this.label1);
            this.scMain.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.scMain.Panel1MinSize = 50;
            // 
            // scMain.Panel2
            // 
            this.scMain.Panel2.Controls.Add(this.cmState);
            this.scMain.Panel2.Controls.Add(this.txOrignePlace);
            this.scMain.Panel2.Controls.Add(this.label9);
            this.scMain.Panel2.Controls.Add(this.txMotherName);
            this.scMain.Panel2.Controls.Add(this.label13);
            this.scMain.Panel2.Controls.Add(this.txFatherName);
            this.scMain.Panel2.Controls.Add(this.label14);
            this.scMain.Panel2.Controls.Add(this.txCity);
            this.scMain.Panel2.Controls.Add(this.label7);
            this.scMain.Panel2.Controls.Add(this.label10);
            this.scMain.Panel2.Controls.Add(this.txReqPriceTo);
            this.scMain.Panel2.Controls.Add(this.label11);
            this.scMain.Panel2.Controls.Add(this.txReqPriceFrom);
            this.scMain.Panel2.Controls.Add(this.label12);
            this.scMain.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.scMain.Panel2MinSize = 50;
            this.scMain.Size = new System.Drawing.Size(610, 329);
            this.scMain.SplitterDistance = 305;
            this.scMain.TabIndex = 8;
            // 
            // txAddrPerm
            // 
            this.txAddrPerm.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txAddrPerm.Location = new System.Drawing.Point(33, 123);
            this.txAddrPerm.Name = "txAddrPerm";
            this.txAddrPerm.Size = new System.Drawing.Size(172, 20);
            this.txAddrPerm.TabIndex = 16;
            // 
            // cmGender
            // 
            this.cmGender.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.cmGender.FormattingEnabled = true;
            this.cmGender.Location = new System.Drawing.Point(33, 71);
            this.cmGender.Name = "cmGender";
            this.cmGender.Size = new System.Drawing.Size(172, 21);
            this.cmGender.TabIndex = 15;
            // 
            // label15
            // 
            this.label15.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(250, 74);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(38, 13);
            this.label15.TabIndex = 14;
            this.label15.Text = "الجنس";
            // 
            // txBirthDate
            // 
            this.txBirthDate.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txBirthDate.Location = new System.Drawing.Point(33, 201);
            this.txBirthDate.Name = "txBirthDate";
            this.txBirthDate.Size = new System.Drawing.Size(172, 20);
            this.txBirthDate.TabIndex = 13;
            // 
            // label8
            // 
            this.label8.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(229, 204);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(59, 13);
            this.label8.TabIndex = 12;
            this.label8.Text = "تاريخ الولادة";
            // 
            // txBirthPlace
            // 
            this.txBirthPlace.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txBirthPlace.Location = new System.Drawing.Point(33, 175);
            this.txBirthPlace.Name = "txBirthPlace";
            this.txBirthPlace.Size = new System.Drawing.Size(172, 20);
            this.txBirthPlace.TabIndex = 11;
            // 
            // label6
            // 
            this.label6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(228, 178);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(60, 13);
            this.label6.TabIndex = 10;
            this.label6.Text = "مكان الولادة";
            // 
            // txSn
            // 
            this.txSn.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txSn.Location = new System.Drawing.Point(33, 97);
            this.txSn.Name = "txSn";
            this.txSn.Size = new System.Drawing.Size(172, 20);
            this.txSn.TabIndex = 7;
            // 
            // txLName
            // 
            this.txLName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txLName.Location = new System.Drawing.Point(33, 45);
            this.txLName.Name = "txLName";
            this.txLName.Size = new System.Drawing.Size(172, 20);
            this.txLName.TabIndex = 6;
            // 
            // txAddrTemp
            // 
            this.txAddrTemp.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txAddrTemp.Location = new System.Drawing.Point(33, 149);
            this.txAddrTemp.Name = "txAddrTemp";
            this.txAddrTemp.Size = new System.Drawing.Size(172, 20);
            this.txAddrTemp.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(214, 152);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(74, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "العنوان المؤقت";
            // 
            // txFName
            // 
            this.txFName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txFName.Location = new System.Drawing.Point(33, 19);
            this.txFName.Name = "txFName";
            this.txFName.Size = new System.Drawing.Size(172, 20);
            this.txFName.TabIndex = 5;
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(227, 22);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(61, 13);
            this.label5.TabIndex = 4;
            this.label5.Text = "الاسم الأول";
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(222, 52);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(66, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "الاسم الثاني";
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(235, 100);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "رقم الهوية";
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(221, 126);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "العنوان الدائم";
            // 
            // cmState
            // 
            this.cmState.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.cmState.FormattingEnabled = true;
            this.cmState.Location = new System.Drawing.Point(24, 149);
            this.cmState.Name = "cmState";
            this.cmState.Size = new System.Drawing.Size(172, 21);
            this.cmState.TabIndex = 28;
            // 
            // txOrignePlace
            // 
            this.txOrignePlace.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txOrignePlace.Location = new System.Drawing.Point(24, 71);
            this.txOrignePlace.Name = "txOrignePlace";
            this.txOrignePlace.Size = new System.Drawing.Size(172, 20);
            this.txOrignePlace.TabIndex = 15;
            // 
            // label9
            // 
            this.label9.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(256, 74);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(35, 13);
            this.label9.TabIndex = 14;
            this.label9.Text = "الأمانة";
            // 
            // txMotherName
            // 
            this.txMotherName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txMotherName.Location = new System.Drawing.Point(24, 45);
            this.txMotherName.Name = "txMotherName";
            this.txMotherName.Size = new System.Drawing.Size(172, 20);
            this.txMotherName.TabIndex = 27;
            // 
            // label13
            // 
            this.label13.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(267, 48);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(24, 13);
            this.label13.TabIndex = 26;
            this.label13.Text = "الأم";
            // 
            // txFatherName
            // 
            this.txFatherName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txFatherName.Location = new System.Drawing.Point(24, 19);
            this.txFatherName.Name = "txFatherName";
            this.txFatherName.Size = new System.Drawing.Size(172, 20);
            this.txFatherName.TabIndex = 25;
            // 
            // label14
            // 
            this.label14.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(265, 22);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(26, 13);
            this.label14.TabIndex = 24;
            this.label14.Text = "الأب";
            // 
            // txCity
            // 
            this.txCity.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txCity.Location = new System.Drawing.Point(24, 175);
            this.txCity.Name = "txCity";
            this.txCity.Size = new System.Drawing.Size(172, 20);
            this.txCity.TabIndex = 23;
            // 
            // label7
            // 
            this.label7.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(207, 178);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(86, 13);
            this.label7.TabIndex = 22;
            this.label7.Text = "المنطقة المطلوبة";
            // 
            // label10
            // 
            this.label10.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(202, 152);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(91, 13);
            this.label10.TabIndex = 20;
            this.label10.Text = "المحافظة المطلوبة";
            // 
            // txReqPriceTo
            // 
            this.txReqPriceTo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txReqPriceTo.Location = new System.Drawing.Point(24, 123);
            this.txReqPriceTo.Name = "txReqPriceTo";
            this.txReqPriceTo.Size = new System.Drawing.Size(172, 20);
            this.txReqPriceTo.TabIndex = 19;
            // 
            // label11
            // 
            this.label11.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(199, 126);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(94, 13);
            this.label11.TabIndex = 18;
            this.label11.Text = "الحد الأعلى للسعر";
            // 
            // txReqPriceFrom
            // 
            this.txReqPriceFrom.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txReqPriceFrom.Location = new System.Drawing.Point(24, 97);
            this.txReqPriceFrom.Name = "txReqPriceFrom";
            this.txReqPriceFrom.Size = new System.Drawing.Size(172, 20);
            this.txReqPriceFrom.TabIndex = 17;
            // 
            // label12
            // 
            this.label12.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(202, 100);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(91, 13);
            this.label12.TabIndex = 16;
            this.label12.Text = "الحد الأدني للسعر";
            // 
            // lbCaption
            // 
            this.lbCaption.AutoSize = true;
            this.lbCaption.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lbCaption.Font = new System.Drawing.Font("Times New Roman", 27.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCaption.Location = new System.Drawing.Point(12, 9);
            this.lbCaption.Name = "lbCaption";
            this.lbCaption.Size = new System.Drawing.Size(163, 44);
            this.lbCaption.TabIndex = 7;
            this.lbCaption.Text = "إضافة عميل";
            // 
            // frmAddClient
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(634, 452);
            this.Controls.Add(this.pnlOrders);
            this.Controls.Add(this.scMain);
            this.Controls.Add(this.lbCaption);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MinimumSize = new System.Drawing.Size(640, 480);
            this.Name = "frmAddClient";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RightToLeftLayout = true;
            this.Text = "إضافة عميل";
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
        private System.Windows.Forms.TextBox txSn;
        private System.Windows.Forms.TextBox txLName;
        private System.Windows.Forms.TextBox txAddrTemp;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txFName;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lbCaption;
        private System.Windows.Forms.TextBox txOrignePlace;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txBirthDate;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txBirthPlace;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txMotherName;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox txFatherName;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.TextBox txCity;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txReqPriceTo;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txReqPriceFrom;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.ComboBox cmState;
        private System.Windows.Forms.TextBox txAddrPerm;
        private System.Windows.Forms.ComboBox cmGender;
        private System.Windows.Forms.Label label15;
    }
}