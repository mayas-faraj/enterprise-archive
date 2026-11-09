namespace MayasAntivirus
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
            //comments values for only .net framwork 3.5+;
            this.splitMain = new System.Windows.Forms.SplitContainer();
            this.pbSize = new System.Windows.Forms.PictureBox();
            this.pbClose = new System.Windows.Forms.PictureBox();
            this.pnlGrid = new System.Windows.Forms.Panel();
            this.lbPercent = new System.Windows.Forms.Label();
            this.lbInfo = new System.Windows.Forms.Label();
            this.pbProcess = new System.Windows.Forms.ProgressBar();
            this.dgvResult = new System.Windows.Forms.DataGridView();
            this.pnlFunctions = new System.Windows.Forms.Panel();
            this.btnScan = new System.Windows.Forms.PictureBox();
            this.btnAbout = new System.Windows.Forms.PictureBox();
            this.btnStyle = new System.Windows.Forms.PictureBox();
            this.btnConfigure = new System.Windows.Forms.PictureBox();
            this.btnFiles = new System.Windows.Forms.PictureBox();
            this.btnFlash = new System.Windows.Forms.PictureBox();
            this.pnlCommands = new System.Windows.Forms.Panel();
            this.btnStop = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnChangePath = new System.Windows.Forms.Button();
            this.btnAction = new System.Windows.Forms.Button();
            this.ttInformation = new System.Windows.Forms.ToolTip();
            //((System.ComponentModel.ISupportInitialize)(this.splitMain)).BeginInit();
            this.splitMain.Panel1.SuspendLayout();
            this.splitMain.Panel2.SuspendLayout();
            this.splitMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbSize)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbClose)).BeginInit();
            this.pnlGrid.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).BeginInit();
            this.pnlFunctions.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnScan)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnAbout)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnStyle)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnConfigure)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnFiles)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnFlash)).BeginInit();
            this.pnlCommands.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitMain
            // 
            this.splitMain.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.splitMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitMain.Location = new System.Drawing.Point(0, 0);
            this.splitMain.Name = "splitMain";
            this.splitMain.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitMain.Panel1
            // 
            this.splitMain.Panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.splitMain.Panel1.BackgroundImage = global::MayasAntivirus.Properties.Resources.bbannar;
            this.splitMain.Panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.splitMain.Panel1.Controls.Add(this.pbSize);
            this.splitMain.Panel1.Controls.Add(this.pbClose);
            this.splitMain.Panel1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.splitMain_Panel1_MouseDown);
            this.splitMain.Panel1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.splitMain_Panel1_MouseMove);
            this.splitMain.Panel1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.splitMain_Panel1_MouseUp);
            // 
            // splitMain.Panel2
            // 
            this.splitMain.Panel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.splitMain.Panel2.Controls.Add(this.pnlGrid);
            this.splitMain.Panel2.Controls.Add(this.pnlFunctions);
            this.splitMain.Panel2.Controls.Add(this.pnlCommands);
            this.splitMain.Size = new System.Drawing.Size(800, 500);
            this.splitMain.SplitterDistance = 100;
            this.splitMain.TabIndex = 0;
            // 
            // pbSize
            // 
            this.pbSize.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pbSize.BackColor = System.Drawing.Color.Transparent;
            this.pbSize.BackgroundImage = global::MayasAntivirus.Properties.Resources.bmax;
            this.pbSize.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pbSize.Location = new System.Drawing.Point(704, 54);
            this.pbSize.Name = "pbSize";
            this.pbSize.Size = new System.Drawing.Size(32, 32);
            this.pbSize.TabIndex = 1;
            this.pbSize.TabStop = false;
            this.pbSize.Click += new System.EventHandler(this.pbSize_Click);
            // 
            // pbClose
            // 
            this.pbClose.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pbClose.BackColor = System.Drawing.Color.Transparent;
            this.pbClose.BackgroundImage = global::MayasAntivirus.Properties.Resources.bclose;
            this.pbClose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pbClose.Location = new System.Drawing.Point(748, 12);
            this.pbClose.Name = "pbClose";
            this.pbClose.Size = new System.Drawing.Size(40, 40);
            this.pbClose.TabIndex = 0;
            this.pbClose.TabStop = false;
            this.pbClose.Click += new System.EventHandler(this.pbClose_Click);
            // 
            // pnlGrid
            // 
            this.pnlGrid.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlGrid.BackgroundImage = global::MayasAntivirus.Properties.Resources.b2;
            this.pnlGrid.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnlGrid.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlGrid.Controls.Add(this.lbPercent);
            this.pnlGrid.Controls.Add(this.lbInfo);
            this.pnlGrid.Controls.Add(this.pbProcess);
            this.pnlGrid.Controls.Add(this.dgvResult);
            this.pnlGrid.Location = new System.Drawing.Point(3, 95);
            this.pnlGrid.Name = "pnlGrid";
            this.pnlGrid.Size = new System.Drawing.Size(796, 249);
            this.pnlGrid.TabIndex = 0;
            // 
            // lbPercent
            // 
            this.lbPercent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.lbPercent.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.lbPercent.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lbPercent.Location = new System.Drawing.Point(699, 192);
            this.lbPercent.Name = "lbPercent";
            this.lbPercent.Size = new System.Drawing.Size(42, 22);
            this.lbPercent.TabIndex = 3;
            this.lbPercent.Text = "0 %";
            this.lbPercent.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lbInfo
            // 
            this.lbInfo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lbInfo.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.lbInfo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lbInfo.Location = new System.Drawing.Point(53, 192);
            this.lbInfo.Name = "lbInfo";
            this.lbInfo.Size = new System.Drawing.Size(640, 22);
            this.lbInfo.TabIndex = 2;
            this.lbInfo.Text = "Ready to check path C:";
            this.lbInfo.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // pbProcess
            // 
            this.pbProcess.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pbProcess.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(0)))));
            this.pbProcess.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.pbProcess.Location = new System.Drawing.Point(53, 217);
            this.pbProcess.Name = "pbProcess";
            this.pbProcess.Size = new System.Drawing.Size(688, 23);
            this.pbProcess.TabIndex = 1;
            // 
            // dgvResult
            // 
            this.dgvResult.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvResult.BackgroundColor = System.Drawing.Color.White;
            this.dgvResult.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResult.GridColor = System.Drawing.Color.Black;
            this.dgvResult.Location = new System.Drawing.Point(53, 14);
            this.dgvResult.Name = "dgvResult";
            this.dgvResult.RowHeadersVisible = false;
            this.dgvResult.Size = new System.Drawing.Size(688, 175);
            this.dgvResult.TabIndex = 0;
            // 
            // pnlFunctions
            // 
            this.pnlFunctions.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlFunctions.BackgroundImage = global::MayasAntivirus.Properties.Resources.b1;
            this.pnlFunctions.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnlFunctions.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlFunctions.Controls.Add(this.btnScan);
            this.pnlFunctions.Controls.Add(this.btnAbout);
            this.pnlFunctions.Controls.Add(this.btnStyle);
            this.pnlFunctions.Controls.Add(this.btnConfigure);
            this.pnlFunctions.Controls.Add(this.btnFiles);
            this.pnlFunctions.Controls.Add(this.btnFlash);
            this.pnlFunctions.Location = new System.Drawing.Point(3, 3);
            this.pnlFunctions.Name = "pnlFunctions";
            this.pnlFunctions.Size = new System.Drawing.Size(796, 86);
            this.pnlFunctions.TabIndex = 0;
            // 
            // btnScan
            // 
            this.btnScan.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnScan.BackgroundImage = global::MayasAntivirus.Properties.Resources.scan;
            this.btnScan.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnScan.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnScan.Location = new System.Drawing.Point(553, 16);
            this.btnScan.Name = "btnScan";
            this.btnScan.Size = new System.Drawing.Size(60, 60);
            this.btnScan.TabIndex = 9;
            this.btnScan.TabStop = false;
            this.ttInformation.SetToolTip(this.btnScan, "Deep scan disks");
            this.btnScan.Click += new System.EventHandler(this.btnScan_Click);
            // 
            // btnAbout
            // 
            this.btnAbout.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnAbout.BackgroundImage = global::MayasAntivirus.Properties.Resources.about;
            this.btnAbout.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnAbout.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnAbout.Location = new System.Drawing.Point(53, 16);
            this.btnAbout.Name = "btnAbout";
            this.btnAbout.Size = new System.Drawing.Size(60, 60);
            this.btnAbout.TabIndex = 8;
            this.btnAbout.TabStop = false;
            this.ttInformation.SetToolTip(this.btnAbout, "Learn more about computer risks");
            // 
            // btnStyle
            // 
            this.btnStyle.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnStyle.BackgroundImage = global::MayasAntivirus.Properties.Resources.r;
            this.btnStyle.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnStyle.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnStyle.Location = new System.Drawing.Point(178, 16);
            this.btnStyle.Name = "btnStyle";
            this.btnStyle.Size = new System.Drawing.Size(60, 60);
            this.btnStyle.TabIndex = 7;
            this.btnStyle.TabStop = false;
            this.ttInformation.SetToolTip(this.btnStyle, "Next style to this application");
            // 
            // btnConfigure
            // 
            this.btnConfigure.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnConfigure.BackgroundImage = global::MayasAntivirus.Properties.Resources.configure;
            this.btnConfigure.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnConfigure.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnConfigure.Location = new System.Drawing.Point(303, 16);
            this.btnConfigure.Name = "btnConfigure";
            this.btnConfigure.Size = new System.Drawing.Size(60, 60);
            this.btnConfigure.TabIndex = 6;
            this.btnConfigure.TabStop = false;
            this.ttInformation.SetToolTip(this.btnConfigure, "Configure Windows");
            this.btnConfigure.Click += new System.EventHandler(this.btnConfigure_Click);
            // 
            // btnFiles
            // 
            this.btnFiles.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnFiles.BackgroundImage = global::MayasAntivirus.Properties.Resources.fileManager;
            this.btnFiles.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnFiles.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnFiles.Location = new System.Drawing.Point(428, 16);
            this.btnFiles.Name = "btnFiles";
            this.btnFiles.Size = new System.Drawing.Size(60, 60);
            this.btnFiles.TabIndex = 5;
            this.btnFiles.TabStop = false;
            this.ttInformation.SetToolTip(this.btnFiles, "File Manager (browsing all files in your drive contain hidden and system files)");
            // 
            // btnFlash
            // 
            this.btnFlash.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnFlash.BackgroundImage = global::MayasAntivirus.Properties.Resources.flashscan;
            this.btnFlash.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnFlash.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnFlash.Location = new System.Drawing.Point(678, 16);
            this.btnFlash.Name = "btnFlash";
            this.btnFlash.Size = new System.Drawing.Size(60, 60);
            this.btnFlash.TabIndex = 4;
            this.btnFlash.TabStop = false;
            this.ttInformation.SetToolTip(this.btnFlash, "Quick Scan (suitable for removable disk drives)");
            this.btnFlash.Click += new System.EventHandler(this.btnFlash_Click);
            // 
            // pnlCommands
            // 
            this.pnlCommands.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlCommands.BackgroundImage = global::MayasAntivirus.Properties.Resources.b3;
            this.pnlCommands.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnlCommands.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlCommands.Controls.Add(this.btnStop);
            this.pnlCommands.Controls.Add(this.btnExit);
            this.pnlCommands.Controls.Add(this.btnChangePath);
            this.pnlCommands.Controls.Add(this.btnAction);
            this.pnlCommands.Location = new System.Drawing.Point(3, 350);
            this.pnlCommands.Name = "pnlCommands";
            this.pnlCommands.Size = new System.Drawing.Size(796, 45);
            this.pnlCommands.TabIndex = 0;
            // 
            // btnStop
            // 
            this.btnStop.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnStop.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnStop.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnStop.Location = new System.Drawing.Point(246, 3);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(110, 37);
            this.btnStop.TabIndex = 3;
            this.btnStop.Text = "Stop";
            this.btnStop.UseVisualStyleBackColor = false;
            this.btnStop.Click += new System.EventHandler(this.btnStop_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnExit.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnExit.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnExit.Location = new System.Drawing.Point(630, 3);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(110, 37);
            this.btnExit.TabIndex = 2;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = false;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnChangePath
            // 
            this.btnChangePath.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnChangePath.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnChangePath.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnChangePath.Location = new System.Drawing.Point(438, 3);
            this.btnChangePath.Name = "btnChangePath";
            this.btnChangePath.Size = new System.Drawing.Size(110, 37);
            this.btnChangePath.TabIndex = 1;
            this.btnChangePath.Text = "Change Path";
            this.btnChangePath.UseVisualStyleBackColor = false;
            this.btnChangePath.Click += new System.EventHandler(this.btnChangePath_Click);
            // 
            // btnAction
            // 
            this.btnAction.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnAction.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnAction.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnAction.Location = new System.Drawing.Point(54, 3);
            this.btnAction.Name = "btnAction";
            this.btnAction.Size = new System.Drawing.Size(110, 37);
            this.btnAction.TabIndex = 0;
            this.btnAction.Text = "Do Action";
            this.btnAction.UseVisualStyleBackColor = false;
            this.btnAction.Click += new System.EventHandler(this.btnAction_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.ClientSize = new System.Drawing.Size(800, 500);
            this.Controls.Add(this.splitMain);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MinimumSize = new System.Drawing.Size(800, 500);
            this.Name = "frmMain";
            this.Text = "MayasAntivirus";
            this.TransparencyKey = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.splitMain.Panel1.ResumeLayout(false);
            this.splitMain.Panel2.ResumeLayout(false);
            //((System.ComponentModel.ISupportInitialize)(this.splitMain)).EndInit();
            this.splitMain.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pbSize)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbClose)).EndInit();
            this.pnlGrid.ResumeLayout(false);
            //((System.ComponentModel.ISupportInitialize)(this.dgvResult)).EndInit();
            this.pnlFunctions.ResumeLayout(false);
            //((System.ComponentModel.ISupportInitialize)(this.btnScan)).EndInit();
            //((System.ComponentModel.ISupportInitialize)(this.btnAbout)).EndInit();
            //((System.ComponentModel.ISupportInitialize)(this.btnStyle)).EndInit();
            //((System.ComponentModel.ISupportInitialize)(this.btnConfigure)).EndInit();
            //((System.ComponentModel.ISupportInitialize)(this.btnFiles)).EndInit();
            //((System.ComponentModel.ISupportInitialize)(this.btnFlash)).EndInit();
            this.pnlCommands.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitMain;
        private System.Windows.Forms.Panel pnlGrid;
        private System.Windows.Forms.DataGridView dgvResult;
        private System.Windows.Forms.Panel pnlFunctions;
        private System.Windows.Forms.PictureBox btnAbout;
        private System.Windows.Forms.PictureBox btnStyle;
        private System.Windows.Forms.PictureBox btnConfigure;
        private System.Windows.Forms.PictureBox btnFiles;
        private System.Windows.Forms.PictureBox btnFlash;
        private System.Windows.Forms.Panel pnlCommands;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnChangePath;
        private System.Windows.Forms.Button btnAction;
        private System.Windows.Forms.ProgressBar pbProcess;
        private System.Windows.Forms.Label lbInfo;
        private System.Windows.Forms.Button btnStop;
        private System.Windows.Forms.Label lbPercent;
        private System.Windows.Forms.PictureBox btnScan;
        private System.Windows.Forms.PictureBox pbSize;
        private System.Windows.Forms.PictureBox pbClose;
        private System.Windows.Forms.ToolTip ttInformation;
    }
}

