namespace FunctionDrawer
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
            this.panel = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txStep = new System.Windows.Forms.TextBox();
            this.txParameter = new System.Windows.Forms.TextBox();
            this.txStartR = new System.Windows.Forms.TextBox();
            this.txEndR = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.botDraw = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // panel
            // 
            this.panel.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.panel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel.Location = new System.Drawing.Point(8, 8);
            this.panel.Name = "panel";
            this.panel.Size = new System.Drawing.Size(472, 315);
            this.panel.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(45, 352);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(57, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Parameter";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(45, 385);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Start Range";
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(283, 385);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "End Range";
            // 
            // txStep
            // 
            this.txStep.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.txStep.Location = new System.Drawing.Point(348, 349);
            this.txStep.Name = "txStep";
            this.txStep.Size = new System.Drawing.Size(100, 20);
            this.txStep.TabIndex = 5;
            this.txStep.Text = "1";
            // 
            // txParameter
            // 
            this.txParameter.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txParameter.Location = new System.Drawing.Point(116, 349);
            this.txParameter.Name = "txParameter";
            this.txParameter.Size = new System.Drawing.Size(100, 20);
            this.txParameter.TabIndex = 6;
            this.txParameter.Text = "1";
            // 
            // txStartR
            // 
            this.txStartR.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txStartR.Location = new System.Drawing.Point(116, 382);
            this.txStartR.Name = "txStartR";
            this.txStartR.Size = new System.Drawing.Size(100, 20);
            this.txStartR.TabIndex = 7;
            // 
            // txEndR
            // 
            this.txEndR.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.txEndR.Location = new System.Drawing.Point(348, 382);
            this.txEndR.Name = "txEndR";
            this.txEndR.Size = new System.Drawing.Size(100, 20);
            this.txEndR.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(283, 352);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(58, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "Step Value";
            // 
            // botDraw
            // 
            this.botDraw.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.botDraw.AutoSize = true;
            this.botDraw.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.botDraw.Font = new System.Drawing.Font("Times New Roman", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.botDraw.Location = new System.Drawing.Point(195, 417);
            this.botDraw.Name = "botDraw";
            this.botDraw.Size = new System.Drawing.Size(102, 42);
            this.botDraw.TabIndex = 10;
            this.botDraw.Text = "Draw";
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(492, 468);
            this.Controls.Add(this.botDraw);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txEndR);
            this.Controls.Add(this.txStartR);
            this.Controls.Add(this.txParameter);
            this.Controls.Add(this.txStep);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel);
            this.MinimumSize = new System.Drawing.Size(500, 500);
            this.Name = "frmMain";
            this.Text = "Mathmatic Function Drawer";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txStep;
        private System.Windows.Forms.TextBox txParameter;
        private System.Windows.Forms.TextBox txStartR;
        private System.Windows.Forms.TextBox txEndR;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label botDraw;
    }
}

