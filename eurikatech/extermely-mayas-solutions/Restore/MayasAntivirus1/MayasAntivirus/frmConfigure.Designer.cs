namespace MayasAntivirus
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
            this.splitMain = new System.Windows.Forms.SplitContainer();
            this.btnStyle = new System.Windows.Forms.PictureBox();
            this.chkAutoScan = new System.Windows.Forms.CheckBox();
            this.chkAutoStart = new System.Windows.Forms.CheckBox();
            this.chkAutoIgnore = new System.Windows.Forms.CheckBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cmScreenSize = new System.Windows.Forms.ComboBox();
            this.pnlCommands = new System.Windows.Forms.Panel();
            this.btnDefault = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnAbout = new System.Windows.Forms.PictureBox();
            this.chkRunTaskbar = new System.Windows.Forms.CheckBox();
            this.chkPassword = new System.Windows.Forms.CheckBox();
            this.btnPassword = new System.Windows.Forms.Button();
            this.chkAutoDelete = new System.Windows.Forms.CheckBox();
            this.chkMuteSound = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.splitMain)).BeginInit();
            this.splitMain.Panel2.SuspendLayout();
            this.splitMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnStyle)).BeginInit();
            this.pnlCommands.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnAbout)).BeginInit();
            this.SuspendLayout();
            // 
            // splitMain
            // 
            this.splitMain.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.splitMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitMain.Location = new System.Drawing.Point(0, 0);
            this.splitMain.Name = "splitMain";
            this.splitMain.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitMain.Panel2
            // 
            this.splitMain.Panel2.Controls.Add(this.chkMuteSound);
            this.splitMain.Panel2.Controls.Add(this.chkAutoDelete);
            this.splitMain.Panel2.Controls.Add(this.btnPassword);
            this.splitMain.Panel2.Controls.Add(this.chkPassword);
            this.splitMain.Panel2.Controls.Add(this.chkRunTaskbar);
            this.splitMain.Panel2.Controls.Add(this.btnAbout);
            this.splitMain.Panel2.Controls.Add(this.pnlCommands);
            this.splitMain.Panel2.Controls.Add(this.cmScreenSize);
            this.splitMain.Panel2.Controls.Add(this.chkAutoIgnore);
            this.splitMain.Panel2.Controls.Add(this.chkAutoStart);
            this.splitMain.Panel2.Controls.Add(this.chkAutoScan);
            this.splitMain.Panel2.Controls.Add(this.label3);
            this.splitMain.Panel2.Controls.Add(this.btnStyle);
            this.splitMain.Size = new System.Drawing.Size(800, 500);
            this.splitMain.SplitterDistance = 108;
            this.splitMain.TabIndex = 0;
            // 
            // btnStyle
            // 
            this.btnStyle.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnStyle.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnStyle.Location = new System.Drawing.Point(709, 3);
            this.btnStyle.Name = "btnStyle";
            this.btnStyle.Size = new System.Drawing.Size(70, 70);
            this.btnStyle.TabIndex = 8;
            this.btnStyle.TabStop = false;
            // 
            // chkAutoScan
            // 
            this.chkAutoScan.AutoSize = true;
            this.chkAutoScan.Location = new System.Drawing.Point(38, 59);
            this.chkAutoScan.Name = "chkAutoScan";
            this.chkAutoScan.Size = new System.Drawing.Size(141, 17);
            this.chkAutoScan.TabIndex = 15;
            this.chkAutoScan.Text = "Auto scan flash memory";
            this.chkAutoScan.UseVisualStyleBackColor = true;
            // 
            // chkAutoStart
            // 
            this.chkAutoStart.AutoSize = true;
            this.chkAutoStart.Location = new System.Drawing.Point(38, 36);
            this.chkAutoStart.Name = "chkAutoStart";
            this.chkAutoStart.Size = new System.Drawing.Size(174, 17);
            this.chkAutoStart.TabIndex = 16;
            this.chkAutoStart.Text = "Auto start when windows start";
            this.chkAutoStart.UseVisualStyleBackColor = true;
            // 
            // chkAutoIgnore
            // 
            this.chkAutoIgnore.AutoSize = true;
            this.chkAutoIgnore.Location = new System.Drawing.Point(38, 82);
            this.chkAutoIgnore.Name = "chkAutoIgnore";
            this.chkAutoIgnore.Size = new System.Drawing.Size(155, 17);
            this.chkAutoIgnore.TabIndex = 17;
            this.chkAutoIgnore.Text = "Auto ignore skepticism files";
            this.chkAutoIgnore.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(35, 225);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(100, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Default Screen Size";
            // 
            // cmScreenSize
            // 
            this.cmScreenSize.FormattingEnabled = true;
            this.cmScreenSize.Items.AddRange(new object[] {
            "Normal",
            "Maxmize",
            "Minimize"});
            this.cmScreenSize.Location = new System.Drawing.Point(141, 222);
            this.cmScreenSize.Name = "cmScreenSize";
            this.cmScreenSize.Size = new System.Drawing.Size(121, 21);
            this.cmScreenSize.TabIndex = 18;
            // 
            // pnlCommands
            // 
            this.pnlCommands.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlCommands.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlCommands.Controls.Add(this.btnDefault);
            this.pnlCommands.Controls.Add(this.btnExit);
            this.pnlCommands.Controls.Add(this.btnCancel);
            this.pnlCommands.Controls.Add(this.btnSave);
            this.pnlCommands.Location = new System.Drawing.Point(2, 339);
            this.pnlCommands.Name = "pnlCommands";
            this.pnlCommands.Size = new System.Drawing.Size(794, 45);
            this.pnlCommands.TabIndex = 19;
            // 
            // btnDefault
            // 
            this.btnDefault.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnDefault.Location = new System.Drawing.Point(245, 3);
            this.btnDefault.Name = "btnDefault";
            this.btnDefault.Size = new System.Drawing.Size(110, 37);
            this.btnDefault.TabIndex = 3;
            this.btnDefault.Text = "Default";
            this.btnDefault.UseVisualStyleBackColor = true;
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
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnCancel.Location = new System.Drawing.Point(437, 3);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(110, 37);
            this.btnCancel.TabIndex = 1;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            // 
            // btnSave
            // 
            this.btnSave.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnSave.Location = new System.Drawing.Point(53, 3);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(110, 37);
            this.btnSave.TabIndex = 0;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            // 
            // btnAbout
            // 
            this.btnAbout.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAbout.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnAbout.Location = new System.Drawing.Point(709, 82);
            this.btnAbout.Name = "btnAbout";
            this.btnAbout.Size = new System.Drawing.Size(70, 70);
            this.btnAbout.TabIndex = 20;
            this.btnAbout.TabStop = false;
            // 
            // chkRunTaskbar
            // 
            this.chkRunTaskbar.AutoSize = true;
            this.chkRunTaskbar.Location = new System.Drawing.Point(38, 128);
            this.chkRunTaskbar.Name = "chkRunTaskbar";
            this.chkRunTaskbar.Size = new System.Drawing.Size(157, 17);
            this.chkRunTaskbar.TabIndex = 21;
            this.chkRunTaskbar.Text = "Run in taskbar after closing";
            this.chkRunTaskbar.UseVisualStyleBackColor = true;
            // 
            // chkPassword
            // 
            this.chkPassword.AutoSize = true;
            this.chkPassword.Location = new System.Drawing.Point(38, 174);
            this.chkPassword.Name = "chkPassword";
            this.chkPassword.Size = new System.Drawing.Size(284, 17);
            this.chkPassword.TabIndex = 22;
            this.chkPassword.Text = "Prevent colsing application without entering password";
            this.chkPassword.UseVisualStyleBackColor = true;
            // 
            // btnPassword
            // 
            this.btnPassword.Location = new System.Drawing.Point(342, 168);
            this.btnPassword.Name = "btnPassword";
            this.btnPassword.Size = new System.Drawing.Size(136, 26);
            this.btnPassword.TabIndex = 23;
            this.btnPassword.Text = "Set password";
            this.btnPassword.UseVisualStyleBackColor = true;
            // 
            // chkAutoDelete
            // 
            this.chkAutoDelete.AutoSize = true;
            this.chkAutoDelete.Location = new System.Drawing.Point(38, 105);
            this.chkAutoDelete.Name = "chkAutoDelete";
            this.chkAutoDelete.Size = new System.Drawing.Size(196, 17);
            this.chkAutoDelete.TabIndex = 24;
            this.chkAutoDelete.Text = "Auto delete risky file after scanning";
            this.chkAutoDelete.UseVisualStyleBackColor = true;
            // 
            // chkMuteSound
            // 
            this.chkMuteSound.AutoSize = true;
            this.chkMuteSound.Location = new System.Drawing.Point(38, 151);
            this.chkMuteSound.Name = "chkMuteSound";
            this.chkMuteSound.Size = new System.Drawing.Size(122, 17);
            this.chkMuteSound.TabIndex = 25;
            this.chkMuteSound.Text = "Mute buttons sound";
            this.chkMuteSound.UseVisualStyleBackColor = true;
            // 
            // frmConfigure
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 500);
            this.Controls.Add(this.splitMain);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MinimumSize = new System.Drawing.Size(800, 500);
            this.Name = "frmConfigure";
            this.Text = "frmConfigure";
            this.splitMain.Panel2.ResumeLayout(false);
            this.splitMain.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitMain)).EndInit();
            this.splitMain.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.btnStyle)).EndInit();
            this.pnlCommands.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.btnAbout)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitMain;
        private System.Windows.Forms.PictureBox btnStyle;
        private System.Windows.Forms.ComboBox cmScreenSize;
        private System.Windows.Forms.CheckBox chkAutoIgnore;
        private System.Windows.Forms.CheckBox chkAutoStart;
        private System.Windows.Forms.CheckBox chkAutoScan;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Panel pnlCommands;
        private System.Windows.Forms.Button btnDefault;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.PictureBox btnAbout;
        private System.Windows.Forms.CheckBox chkRunTaskbar;
        private System.Windows.Forms.CheckBox chkMuteSound;
        private System.Windows.Forms.CheckBox chkAutoDelete;
        private System.Windows.Forms.Button btnPassword;
        private System.Windows.Forms.CheckBox chkPassword;
    }
}