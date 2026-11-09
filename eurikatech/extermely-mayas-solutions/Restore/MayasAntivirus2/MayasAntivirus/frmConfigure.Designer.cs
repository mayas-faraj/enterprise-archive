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
            this.btnAbout = new System.Windows.Forms.PictureBox();
            this.pnlCommands = new System.Windows.Forms.Panel();
            this.btnDefault = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnStyle = new System.Windows.Forms.PictureBox();
            this.pnlMain = new System.Windows.Forms.Panel();
            this.chkMuteSound = new System.Windows.Forms.CheckBox();
            this.chkAutoDelete = new System.Windows.Forms.CheckBox();
            this.btnPassword = new System.Windows.Forms.Button();
            this.chkPassword = new System.Windows.Forms.CheckBox();
            this.chkRunTaskbar = new System.Windows.Forms.CheckBox();
            this.cmScreenSize = new System.Windows.Forms.ComboBox();
            this.chkAutoIgnore = new System.Windows.Forms.CheckBox();
            this.chkAutoStart = new System.Windows.Forms.CheckBox();
            this.chkAutoScan = new System.Windows.Forms.CheckBox();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.btnAbout)).BeginInit();
            this.pnlCommands.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnStyle)).BeginInit();
            this.pnlMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnAbout
            // 
            this.btnAbout.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAbout.BackColor = System.Drawing.Color.Transparent;
            this.btnAbout.BackgroundImage = global::MayasAntivirus.Properties.Resources.about;
            this.btnAbout.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnAbout.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnAbout.Location = new System.Drawing.Point(518, 157);
            this.btnAbout.Name = "btnAbout";
            this.btnAbout.Size = new System.Drawing.Size(70, 70);
            this.btnAbout.TabIndex = 33;
            this.btnAbout.TabStop = false;
            // 
            // pnlCommands
            // 
            this.pnlCommands.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlCommands.BackgroundImage = global::MayasAntivirus.Properties.Resources.b3;
            this.pnlCommands.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnlCommands.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlCommands.Controls.Add(this.btnDefault);
            this.pnlCommands.Controls.Add(this.btnExit);
            this.pnlCommands.Controls.Add(this.btnCancel);
            this.pnlCommands.Controls.Add(this.btnSave);
            this.pnlCommands.Location = new System.Drawing.Point(1, 347);
            this.pnlCommands.Name = "pnlCommands";
            this.pnlCommands.Size = new System.Drawing.Size(596, 47);
            this.pnlCommands.TabIndex = 32;
            // 
            // btnDefault
            // 
            this.btnDefault.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnDefault.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnDefault.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnDefault.Location = new System.Drawing.Point(167, 5);
            this.btnDefault.Name = "btnDefault";
            this.btnDefault.Size = new System.Drawing.Size(110, 37);
            this.btnDefault.TabIndex = 3;
            this.btnDefault.Text = "Default";
            this.btnDefault.UseVisualStyleBackColor = false;
            // 
            // btnExit
            // 
            this.btnExit.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnExit.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnExit.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnExit.Location = new System.Drawing.Point(475, 5);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(110, 37);
            this.btnExit.TabIndex = 2;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = false;
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnCancel.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnCancel.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnCancel.Location = new System.Drawing.Point(321, 5);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(110, 37);
            this.btnCancel.TabIndex = 1;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = false;
            // 
            // btnSave
            // 
            this.btnSave.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnSave.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnSave.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnSave.Location = new System.Drawing.Point(13, 5);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(110, 37);
            this.btnSave.TabIndex = 0;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = false;
            // 
            // btnStyle
            // 
            this.btnStyle.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnStyle.BackColor = System.Drawing.Color.Transparent;
            this.btnStyle.BackgroundImage = global::MayasAntivirus.Properties.Resources.r;
            this.btnStyle.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnStyle.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.btnStyle.Location = new System.Drawing.Point(518, 69);
            this.btnStyle.Name = "btnStyle";
            this.btnStyle.Size = new System.Drawing.Size(70, 70);
            this.btnStyle.TabIndex = 26;
            this.btnStyle.TabStop = false;
            this.btnStyle.Click += new System.EventHandler(this.btnStyle_Click);
            // 
            // pnlMain
            // 
            this.pnlMain.Controls.Add(this.chkMuteSound);
            this.pnlMain.Controls.Add(this.chkAutoDelete);
            this.pnlMain.Controls.Add(this.btnPassword);
            this.pnlMain.Controls.Add(this.chkPassword);
            this.pnlMain.Controls.Add(this.chkRunTaskbar);
            this.pnlMain.Controls.Add(this.cmScreenSize);
            this.pnlMain.Controls.Add(this.chkAutoIgnore);
            this.pnlMain.Controls.Add(this.chkAutoStart);
            this.pnlMain.Controls.Add(this.chkAutoScan);
            this.pnlMain.Controls.Add(this.label3);
            this.pnlMain.Location = new System.Drawing.Point(15, 69);
            this.pnlMain.Name = "pnlMain";
            this.pnlMain.Size = new System.Drawing.Size(466, 272);
            this.pnlMain.TabIndex = 39;
            // 
            // chkMuteSound
            // 
            this.chkMuteSound.AutoSize = true;
            this.chkMuteSound.BackColor = System.Drawing.Color.Transparent;
            this.chkMuteSound.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.chkMuteSound.Location = new System.Drawing.Point(20, 132);
            this.chkMuteSound.Name = "chkMuteSound";
            this.chkMuteSound.Size = new System.Drawing.Size(122, 17);
            this.chkMuteSound.TabIndex = 48;
            this.chkMuteSound.Text = "Mute buttons sound";
            this.chkMuteSound.UseVisualStyleBackColor = false;
            // 
            // chkAutoDelete
            // 
            this.chkAutoDelete.AutoSize = true;
            this.chkAutoDelete.BackColor = System.Drawing.Color.Transparent;
            this.chkAutoDelete.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.chkAutoDelete.Location = new System.Drawing.Point(20, 86);
            this.chkAutoDelete.Name = "chkAutoDelete";
            this.chkAutoDelete.Size = new System.Drawing.Size(196, 17);
            this.chkAutoDelete.TabIndex = 47;
            this.chkAutoDelete.Text = "Auto delete risky file after scanning";
            this.chkAutoDelete.UseVisualStyleBackColor = false;
            // 
            // btnPassword
            // 
            this.btnPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnPassword.Enabled = false;
            this.btnPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnPassword.Location = new System.Drawing.Point(324, 149);
            this.btnPassword.Name = "btnPassword";
            this.btnPassword.Size = new System.Drawing.Size(121, 26);
            this.btnPassword.TabIndex = 46;
            this.btnPassword.Text = "Set password";
            this.btnPassword.UseVisualStyleBackColor = false;
            // 
            // chkPassword
            // 
            this.chkPassword.AutoSize = true;
            this.chkPassword.BackColor = System.Drawing.Color.Transparent;
            this.chkPassword.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.chkPassword.Location = new System.Drawing.Point(20, 155);
            this.chkPassword.Name = "chkPassword";
            this.chkPassword.Size = new System.Drawing.Size(284, 17);
            this.chkPassword.TabIndex = 45;
            this.chkPassword.Text = "Prevent colsing application without entering password";
            this.chkPassword.UseVisualStyleBackColor = false;
            // 
            // chkRunTaskbar
            // 
            this.chkRunTaskbar.AutoSize = true;
            this.chkRunTaskbar.BackColor = System.Drawing.Color.Transparent;
            this.chkRunTaskbar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.chkRunTaskbar.Location = new System.Drawing.Point(20, 109);
            this.chkRunTaskbar.Name = "chkRunTaskbar";
            this.chkRunTaskbar.Size = new System.Drawing.Size(157, 17);
            this.chkRunTaskbar.TabIndex = 44;
            this.chkRunTaskbar.Text = "Run in taskbar after closing";
            this.chkRunTaskbar.UseVisualStyleBackColor = false;
            // 
            // cmScreenSize
            // 
            this.cmScreenSize.FormattingEnabled = true;
            this.cmScreenSize.Items.AddRange(new object[] {
            "Normal",
            "Minimize",
            "Maximize"});
            this.cmScreenSize.Location = new System.Drawing.Point(123, 203);
            this.cmScreenSize.Name = "cmScreenSize";
            this.cmScreenSize.Size = new System.Drawing.Size(121, 21);
            this.cmScreenSize.TabIndex = 43;
            // 
            // chkAutoIgnore
            // 
            this.chkAutoIgnore.AutoSize = true;
            this.chkAutoIgnore.BackColor = System.Drawing.Color.Transparent;
            this.chkAutoIgnore.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.chkAutoIgnore.Location = new System.Drawing.Point(20, 63);
            this.chkAutoIgnore.Name = "chkAutoIgnore";
            this.chkAutoIgnore.Size = new System.Drawing.Size(155, 17);
            this.chkAutoIgnore.TabIndex = 42;
            this.chkAutoIgnore.Text = "Auto ignore skepticism files";
            this.chkAutoIgnore.UseVisualStyleBackColor = false;
            // 
            // chkAutoStart
            // 
            this.chkAutoStart.AutoSize = true;
            this.chkAutoStart.BackColor = System.Drawing.Color.Transparent;
            this.chkAutoStart.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.chkAutoStart.Location = new System.Drawing.Point(20, 17);
            this.chkAutoStart.Name = "chkAutoStart";
            this.chkAutoStart.Size = new System.Drawing.Size(174, 17);
            this.chkAutoStart.TabIndex = 41;
            this.chkAutoStart.Text = "Auto start when windows start";
            this.chkAutoStart.UseVisualStyleBackColor = false;
            // 
            // chkAutoScan
            // 
            this.chkAutoScan.AutoSize = true;
            this.chkAutoScan.BackColor = System.Drawing.Color.Transparent;
            this.chkAutoScan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.chkAutoScan.Location = new System.Drawing.Point(20, 40);
            this.chkAutoScan.Name = "chkAutoScan";
            this.chkAutoScan.Size = new System.Drawing.Size(141, 17);
            this.chkAutoScan.TabIndex = 40;
            this.chkAutoScan.Text = "Auto scan flash memory";
            this.chkAutoScan.UseVisualStyleBackColor = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.label3.Location = new System.Drawing.Point(17, 206);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(100, 13);
            this.label3.TabIndex = 39;
            this.label3.Text = "Default Screen Size";
            // 
            // frmConfigure
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Black;
            this.BackgroundImage = global::MayasAntivirus.Properties.Resources.b2;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(600, 400);
            this.Controls.Add(this.pnlMain);
            this.Controls.Add(this.btnAbout);
            this.Controls.Add(this.pnlCommands);
            this.Controls.Add(this.btnStyle);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MinimumSize = new System.Drawing.Size(600, 400);
            this.Name = "frmConfigure";
            this.Text = "frmConfigure";
            ((System.ComponentModel.ISupportInitialize)(this.btnAbout)).EndInit();
            this.pnlCommands.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.btnStyle)).EndInit();
            this.pnlMain.ResumeLayout(false);
            this.pnlMain.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox btnAbout;
        private System.Windows.Forms.Panel pnlCommands;
        private System.Windows.Forms.Button btnDefault;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.PictureBox btnStyle;
        private System.Windows.Forms.Panel pnlMain;
        private System.Windows.Forms.CheckBox chkMuteSound;
        private System.Windows.Forms.CheckBox chkAutoDelete;
        private System.Windows.Forms.Button btnPassword;
        private System.Windows.Forms.CheckBox chkPassword;
        private System.Windows.Forms.CheckBox chkRunTaskbar;
        private System.Windows.Forms.ComboBox cmScreenSize;
        private System.Windows.Forms.CheckBox chkAutoIgnore;
        private System.Windows.Forms.CheckBox chkAutoStart;
        private System.Windows.Forms.CheckBox chkAutoScan;
        private System.Windows.Forms.Label label3;

    }
}