namespace Assistance
{
    partial class frmService
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
            this.txQuery = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txResult = new System.Windows.Forms.TextBox();
            this.btnAction2 = new System.Windows.Forms.Button();
            this.btnAction3 = new System.Windows.Forms.Button();
            this.btnRun = new System.Windows.Forms.Button();
            this.btnAction1 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txCode = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // txQuery
            // 
            this.txQuery.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txQuery.Location = new System.Drawing.Point(55, 12);
            this.txQuery.Name = "txQuery";
            this.txQuery.Size = new System.Drawing.Size(317, 20);
            this.txQuery.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(37, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Query";
            // 
            // txResult
            // 
            this.txResult.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txResult.Location = new System.Drawing.Point(15, 93);
            this.txResult.Multiline = true;
            this.txResult.Name = "txResult";
            this.txResult.Size = new System.Drawing.Size(357, 169);
            this.txResult.TabIndex = 2;
            // 
            // btnAction2
            // 
            this.btnAction2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAction2.Location = new System.Drawing.Point(12, 297);
            this.btnAction2.Name = "btnAction2";
            this.btnAction2.Size = new System.Drawing.Size(360, 23);
            this.btnAction2.TabIndex = 3;
            this.btnAction2.Text = "Action 2";
            this.btnAction2.UseVisualStyleBackColor = true;
            this.btnAction2.Click += new System.EventHandler(this.btnAction2_Click);
            // 
            // btnAction3
            // 
            this.btnAction3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAction3.Location = new System.Drawing.Point(12, 326);
            this.btnAction3.Name = "btnAction3";
            this.btnAction3.Size = new System.Drawing.Size(360, 23);
            this.btnAction3.TabIndex = 4;
            this.btnAction3.Text = "Action 3";
            this.btnAction3.UseVisualStyleBackColor = true;
            this.btnAction3.Click += new System.EventHandler(this.btnAction3_Click);
            // 
            // btnRun
            // 
            this.btnRun.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRun.Location = new System.Drawing.Point(15, 64);
            this.btnRun.Name = "btnRun";
            this.btnRun.Size = new System.Drawing.Size(360, 23);
            this.btnRun.TabIndex = 5;
            this.btnRun.Text = "Run Script";
            this.btnRun.UseVisualStyleBackColor = true;
            this.btnRun.Click += new System.EventHandler(this.btnRun_Click);
            // 
            // btnAction1
            // 
            this.btnAction1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAction1.Location = new System.Drawing.Point(12, 268);
            this.btnAction1.Name = "btnAction1";
            this.btnAction1.Size = new System.Drawing.Size(360, 23);
            this.btnAction1.TabIndex = 6;
            this.btnAction1.Text = "Action1";
            this.btnAction1.UseVisualStyleBackColor = true;
            this.btnAction1.Click += new System.EventHandler(this.btnAction1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 41);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "Code";
            // 
            // txCode
            // 
            this.txCode.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txCode.Location = new System.Drawing.Point(55, 38);
            this.txCode.Name = "txCode";
            this.txCode.Size = new System.Drawing.Size(317, 20);
            this.txCode.TabIndex = 7;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(384, 361);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txCode);
            this.Controls.Add(this.btnAction1);
            this.Controls.Add(this.btnRun);
            this.Controls.Add(this.btnAction3);
            this.Controls.Add(this.btnAction2);
            this.Controls.Add(this.txResult);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txQuery);
            this.Name = "frmMain";
            this.Text = "Mayas Assistance";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txQuery;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txResult;
        private System.Windows.Forms.Button btnAction2;
        private System.Windows.Forms.Button btnAction3;
        private System.Windows.Forms.Button btnRun;
        private System.Windows.Forms.Button btnAction1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txCode;
    }
}

