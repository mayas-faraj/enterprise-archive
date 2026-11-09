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
            this.splitMain = new System.Windows.Forms.SplitContainer();
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
            ((System.ComponentModel.ISupportInitialize)(this.splitMain)).BeginInit();
            this.splitMain.Panel2.SuspendLayout();
            this.splitMain.SuspendLayout();
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
            this.splitMain.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.splitMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitMain.Location = new System.Drawing.Point(0, 0);
            this.splitMain.Name = "splitMain";
            this.splitMain.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitMain.Panel2
            // 
            this.splitMain.Panel2.Controls.Add(this.pnlGrid);
            this.splitMain.Panel2.Controls.Add(this.pnlFunctions);
            this.splitMain.Panel2.Controls.Add(this.pnlCommands);
            this.splitMain.Size = new System.Drawing.Size(800, 500);
            this.splitMain.SplitterDistance = 100;
            this.splitMain.TabIndex = 0;
            // 
            // pnlGrid
            // 
            this.pnlGrid.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlGrid.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlGrid.Controls.Add(this.lbPercent);
            this.pnlGrid.Controls.Add(this.lbInfo);
            this.pnlGrid.Controls.Add(this.pbProcess);
            this.pnlGrid.Controls.Add(this.dgvResult);
            this.pnlGrid.Location = new System.Drawing.Point(3, 95);
            this.pnlGrid.Name = "pnlGrid";
            this.pnlGrid.Size = new System.Drawing.Size(794, 247);
            this.pnlGrid.TabIndex = 0;
            // 
            // lbPercent
            // 
            this.lbPercent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.lbPercent.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lbPercent.Location = new System.Drawing.Point(697, 194);
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
            this.lbInfo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lbInfo.Location = new System.Drawing.Point(53, 194);
            this.lbInfo.Name = "lbInfo";
            this.lbInfo.Size = new System.Drawing.Size(638, 22);
            this.lbInfo.TabIndex = 2;
            this.lbInfo.Text = "Ready to check path C:";
            this.lbInfo.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // pbProcess
            // 
            this.pbProcess.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pbProcess.Location = new System.Drawing.Point(53, 219);
            this.pbProcess.Name = "pbProcess";
            this.pbProcess.Size = new System.Drawing.Size(686, 23);
            this.pbProcess.TabIndex = 1;
            // 
            // dgvResult
            // 
            this.dgvResult.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvResult.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResult.Location = new System.Drawing.Point(53, 3);
            this.dgvResult.Name = "dgvResult";
            this.dgvResult.Size = new System.Drawing.Size(686, 188);
            this.dgvResult.TabIndex = 0;
            // 
            // pnlFunctions
            // 
            this.pnlFunctions.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlFunctions.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlFunctions.Controls.Add(this.btnScan);
            this.pnlFunctions.Controls.Add(this.btnAbout);
            this.pnlFunctions.Controls.Add(this.btnStyle);
            this.pnlFunctions.Controls.Add(this.btnConfigure);
            this.pnlFunctions.Controls.Add(this.btnFiles);
            this.pnlFunctions.Controls.Add(this.btnFlash);
            this.pnlFunctions.Location = new System.Drawing.Point(3, 3);
            this.pnlFunctions.Name = "pnlFunctions";
            this.pnlFunctions.Size = new System.Drawing.Size(794, 86);
            this.pnlFunctions.TabIndex = 0;
            // 
            // btnScan
            // 
            this.btnScan.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnScan.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnScan.Location = new System.Drawing.Point(545, 7);
            this.btnScan.Name = "btnScan";
            this.btnScan.Size = new System.Drawing.Size(70, 70);
            this.btnScan.TabIndex = 9;
            this.btnScan.TabStop = false;
            this.btnScan.Click += new System.EventHandler(this.btnScan_Click);
            // 
            // btnAbout
            // 
            this.btnAbout.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnAbout.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnAbout.Location = new System.Drawing.Point(53, 7);
            this.btnAbout.Name = "btnAbout";
            this.btnAbout.Size = new System.Drawing.Size(70, 70);
            this.btnAbout.TabIndex = 8;
            this.btnAbout.TabStop = false;
            // 
            // btnStyle
            // 
            this.btnStyle.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnStyle.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnStyle.Location = new System.Drawing.Point(176, 7);
            this.btnStyle.Name = "btnStyle";
            this.btnStyle.Size = new System.Drawing.Size(70, 70);
            this.btnStyle.TabIndex = 7;
            this.btnStyle.TabStop = false;
            // 
            // btnConfigure
            // 
            this.btnConfigure.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnConfigure.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnConfigure.Location = new System.Drawing.Point(299, 7);
            this.btnConfigure.Name = "btnConfigure";
            this.btnConfigure.Size = new System.Drawing.Size(70, 70);
            this.btnConfigure.TabIndex = 6;
            this.btnConfigure.TabStop = false;
            // 
            // btnFiles
            // 
            this.btnFiles.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnFiles.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnFiles.Location = new System.Drawing.Point(422, 7);
            this.btnFiles.Name = "btnFiles";
            this.btnFiles.Size = new System.Drawing.Size(70, 70);
            this.btnFiles.TabIndex = 5;
            this.btnFiles.TabStop = false;
            // 
            // btnFlash
            // 
            this.btnFlash.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnFlash.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnFlash.Location = new System.Drawing.Point(668, 7);
            this.btnFlash.Name = "btnFlash";
            this.btnFlash.Size = new System.Drawing.Size(70, 70);
            this.btnFlash.TabIndex = 4;
            this.btnFlash.TabStop = false;
            this.btnFlash.Click += new System.EventHandler(this.btnFlash_Click);
            // 
            // pnlCommands
            // 
            this.pnlCommands.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlCommands.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlCommands.Controls.Add(this.btnStop);
            this.pnlCommands.Controls.Add(this.btnExit);
            this.pnlCommands.Controls.Add(this.btnChangePath);
            this.pnlCommands.Controls.Add(this.btnAction);
            this.pnlCommands.Location = new System.Drawing.Point(3, 348);
            this.pnlCommands.Name = "pnlCommands";
            this.pnlCommands.Size = new System.Drawing.Size(794, 45);
            this.pnlCommands.TabIndex = 0;
            // 
            // btnStop
            // 
            this.btnStop.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnStop.Location = new System.Drawing.Point(245, 3);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(110, 37);
            this.btnStop.TabIndex = 3;
            this.btnStop.Text = "Stop";
            this.btnStop.UseVisualStyleBackColor = true;
            this.btnStop.Click += new System.EventHandler(this.btnStop_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnExit.Location = new System.Drawing.Point(629, 3);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(110, 37);
            this.btnExit.TabIndex = 2;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnChangePath
            // 
            this.btnChangePath.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnChangePath.Location = new System.Drawing.Point(437, 3);
            this.btnChangePath.Name = "btnChangePath";
            this.btnChangePath.Size = new System.Drawing.Size(110, 37);
            this.btnChangePath.TabIndex = 1;
            this.btnChangePath.Text = "Change Path";
            this.btnChangePath.UseVisualStyleBackColor = true;
            this.btnChangePath.Click += new System.EventHandler(this.btnChangePath_Click);
            // 
            // btnAction
            // 
            this.btnAction.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnAction.Location = new System.Drawing.Point(53, 3);
            this.btnAction.Name = "btnAction";
            this.btnAction.Size = new System.Drawing.Size(110, 37);
            this.btnAction.TabIndex = 0;
            this.btnAction.Text = "Do Action";
            this.btnAction.UseVisualStyleBackColor = true;
            this.btnAction.Click += new System.EventHandler(this.btnAction_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(64)))));
            this.ClientSize = new System.Drawing.Size(800, 500);
            this.Controls.Add(this.splitMain);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MinimumSize = new System.Drawing.Size(800, 500);
            this.Name = "frmMain";
            this.Text = "MayasAntivirus";
            this.TransparencyKey = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(64)))));
            this.splitMain.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitMain)).EndInit();
            this.splitMain.ResumeLayout(false);
            this.pnlGrid.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).EndInit();
            this.pnlFunctions.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.btnScan)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnAbout)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnStyle)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnConfigure)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnFiles)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnFlash)).EndInit();
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
    }
}

