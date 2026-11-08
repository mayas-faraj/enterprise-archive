namespace MayasAntivirus
{
    partial class tests
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
            this.dgvResult = new System.Windows.Forms.DataGridView();
            this.btnPath = new System.Windows.Forms.Button();
            this.btnRun = new System.Windows.Forms.Button();
            this.txResult = new System.Windows.Forms.TextBox();
            this.pBar = new System.Windows.Forms.ProgressBar();
            this.txName = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvResult
            // 
            this.dgvResult.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResult.Location = new System.Drawing.Point(12, 86);
            this.dgvResult.Name = "dgvResult";
            this.dgvResult.Size = new System.Drawing.Size(623, 317);
            this.dgvResult.TabIndex = 0;
            // 
            // btnPath
            // 
            this.btnPath.Location = new System.Drawing.Point(560, 12);
            this.btnPath.Name = "btnPath";
            this.btnPath.Size = new System.Drawing.Size(75, 23);
            this.btnPath.TabIndex = 1;
            this.btnPath.Text = "المسار";
            this.btnPath.UseVisualStyleBackColor = true;
            this.btnPath.Click += new System.EventHandler(this.btnPath_Click);
            // 
            // btnRun
            // 
            this.btnRun.Location = new System.Drawing.Point(560, 41);
            this.btnRun.Name = "btnRun";
            this.btnRun.Size = new System.Drawing.Size(75, 23);
            this.btnRun.TabIndex = 2;
            this.btnRun.Text = "تشغيل";
            this.btnRun.UseVisualStyleBackColor = true;
            // 
            // txResult
            // 
            this.txResult.Location = new System.Drawing.Point(12, 438);
            this.txResult.Multiline = true;
            this.txResult.Name = "txResult";
            this.txResult.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txResult.Size = new System.Drawing.Size(625, 101);
            this.txResult.TabIndex = 3;
            // 
            // pBar
            // 
            this.pBar.Location = new System.Drawing.Point(12, 409);
            this.pBar.Name = "pBar";
            this.pBar.Size = new System.Drawing.Size(623, 23);
            this.pBar.TabIndex = 4;
            // 
            // txName
            // 
            this.txName.Location = new System.Drawing.Point(12, 12);
            this.txName.Name = "txName";
            this.txName.Size = new System.Drawing.Size(528, 20);
            this.txName.TabIndex = 5;
            // 
            // tests
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(647, 558);
            this.Controls.Add(this.txName);
            this.Controls.Add(this.pBar);
            this.Controls.Add(this.txResult);
            this.Controls.Add(this.btnRun);
            this.Controls.Add(this.btnPath);
            this.Controls.Add(this.dgvResult);
            this.Name = "tests";
            this.Text = "tests";
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvResult;
        private System.Windows.Forms.Button btnPath;
        private System.Windows.Forms.Button btnRun;
        private System.Windows.Forms.TextBox txResult;
        private System.Windows.Forms.ProgressBar pBar;
        private System.Windows.Forms.TextBox txName;

    }
}