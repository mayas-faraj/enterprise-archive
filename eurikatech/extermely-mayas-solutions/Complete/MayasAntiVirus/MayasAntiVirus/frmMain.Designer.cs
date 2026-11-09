namespace MayasAntiVirus
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.lbCaption = new System.Windows.Forms.Label();
            this.progressBar = new System.Windows.Forms.ProgressBar();
            this.lbReport = new System.Windows.Forms.Label();
            this.txReport = new System.Windows.Forms.TextBox();
            this.lblCaption2 = new System.Windows.Forms.Label();
            this.botRun = new System.Windows.Forms.Button();
            this.imageList = new System.Windows.Forms.ImageList(this.components);
            this.listView = new System.Windows.Forms.ListView();
            this.chkSubfolder = new System.Windows.Forms.CheckBox();
            this.botLog = new System.Windows.Forms.Button();
            this.txLog = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // lbCaption
            // 
            this.lbCaption.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbCaption.AutoSize = true;
            this.lbCaption.Font = new System.Drawing.Font("Times New Roman", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCaption.Location = new System.Drawing.Point(104, 20);
            this.lbCaption.Name = "lbCaption";
            this.lbCaption.Size = new System.Drawing.Size(284, 40);
            this.lbCaption.TabIndex = 0;
            this.lbCaption.Text = "Mayas Anti Virus";
            // 
            // progressBar
            // 
            this.progressBar.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.progressBar.Location = new System.Drawing.Point(226, 119);
            this.progressBar.Name = "progressBar";
            this.progressBar.Size = new System.Drawing.Size(162, 23);
            this.progressBar.TabIndex = 1;
            // 
            // lbReport
            // 
            this.lbReport.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lbReport.AutoSize = true;
            this.lbReport.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbReport.Location = new System.Drawing.Point(222, 234);
            this.lbReport.Name = "lbReport";
            this.lbReport.Size = new System.Drawing.Size(71, 19);
            this.lbReport.TabIndex = 4;
            this.lbReport.Text = "  Reports";
            // 
            // txReport
            // 
            this.txReport.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txReport.BackColor = System.Drawing.SystemColors.Window;
            this.txReport.Location = new System.Drawing.Point(226, 256);
            this.txReport.Multiline = true;
            this.txReport.Name = "txReport";
            this.txReport.ReadOnly = true;
            this.txReport.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txReport.Size = new System.Drawing.Size(254, 198);
            this.txReport.TabIndex = 5;
            // 
            // lblCaption2
            // 
            this.lblCaption2.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblCaption2.AutoSize = true;
            this.lblCaption2.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCaption2.Location = new System.Drawing.Point(174, 70);
            this.lblCaption2.Name = "lblCaption2";
            this.lblCaption2.Size = new System.Drawing.Size(126, 24);
            this.lblCaption2.TabIndex = 6;
            this.lblCaption2.Text = "for disk drive";
            // 
            // botRun
            // 
            this.botRun.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.botRun.Enabled = false;
            this.botRun.Location = new System.Drawing.Point(394, 118);
            this.botRun.Name = "botRun";
            this.botRun.Size = new System.Drawing.Size(86, 24);
            this.botRun.TabIndex = 7;
            this.botRun.Text = "Start";
            this.botRun.UseVisualStyleBackColor = true;
            // 
            // imageList
            // 
            this.imageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList.ImageStream")));
            this.imageList.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList.Images.SetKeyName(0, "fixed.ico");
            this.imageList.Images.SetKeyName(1, "removable.ico");
            this.imageList.Images.SetKeyName(2, "cdrom.ico");
            this.imageList.Images.SetKeyName(3, "ram.ico");
            this.imageList.Images.SetKeyName(4, "unkown.ico");
            // 
            // listView
            // 
            this.listView.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.listView.Location = new System.Drawing.Point(16, 119);
            this.listView.Name = "listView";
            this.listView.Size = new System.Drawing.Size(200, 335);
            this.listView.TabIndex = 8;
            this.listView.UseCompatibleStateImageBehavior = false;
            this.listView.View = System.Windows.Forms.View.Details;
            // 
            // chkSubfolder
            // 
            this.chkSubfolder.AutoSize = true;
            this.chkSubfolder.Location = new System.Drawing.Point(226, 185);
            this.chkSubfolder.Name = "chkSubfolder";
            this.chkSubfolder.Size = new System.Drawing.Size(116, 17);
            this.chkSubfolder.TabIndex = 9;
            this.chkSubfolder.Text = "Check Sub Folder .";
            this.chkSubfolder.UseVisualStyleBackColor = true;
            // 
            // botLog
            // 
            this.botLog.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.botLog.Location = new System.Drawing.Point(394, 148);
            this.botLog.Name = "botLog";
            this.botLog.Size = new System.Drawing.Size(86, 23);
            this.botLog.TabIndex = 10;
            this.botLog.Text = "Log Location";
            this.botLog.UseVisualStyleBackColor = true;
            // 
            // txLog
            // 
            this.txLog.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txLog.Location = new System.Drawing.Point(226, 148);
            this.txLog.Name = "txLog";
            this.txLog.ReadOnly = true;
            this.txLog.Size = new System.Drawing.Size(162, 20);
            this.txLog.TabIndex = 11;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(492, 466);
            this.Controls.Add(this.txLog);
            this.Controls.Add(this.botLog);
            this.Controls.Add(this.chkSubfolder);
            this.Controls.Add(this.listView);
            this.Controls.Add(this.botRun);
            this.Controls.Add(this.lblCaption2);
            this.Controls.Add(this.txReport);
            this.Controls.Add(this.lbReport);
            this.Controls.Add(this.progressBar);
            this.Controls.Add(this.lbCaption);
            this.MinimumSize = new System.Drawing.Size(400, 400);
            this.Name = "frmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Mayas Anti Virus";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbCaption;
        private System.Windows.Forms.ProgressBar progressBar;
        private System.Windows.Forms.Label lbReport;
        private System.Windows.Forms.TextBox txReport;
        private System.Windows.Forms.Label lblCaption2;
        private System.Windows.Forms.Button botRun;
        private System.Windows.Forms.ImageList imageList;
        private System.Windows.Forms.ListView listView;
        private System.Windows.Forms.CheckBox chkSubfolder;
        private System.Windows.Forms.Button botLog;
        private System.Windows.Forms.TextBox txLog;
    }
}