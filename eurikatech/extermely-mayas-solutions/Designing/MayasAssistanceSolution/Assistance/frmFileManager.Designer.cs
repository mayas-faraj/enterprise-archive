namespace Assistance
{
    partial class frmFileManager
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmFileManager));
            this.treeView = new System.Windows.Forms.TreeView();
            this.imageList = new System.Windows.Forms.ImageList(this.components);
            this.btnFiles = new System.Windows.Forms.Button();
            this.lstFiles = new System.Windows.Forms.ListBox();
            this.btnExport = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // treeView
            // 
            this.treeView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.treeView.ImageIndex = 1;
            this.treeView.ImageList = this.imageList;
            this.treeView.Location = new System.Drawing.Point(12, 12);
            this.treeView.Name = "treeView";
            this.treeView.SelectedImageIndex = 15;
            this.treeView.Size = new System.Drawing.Size(360, 158);
            this.treeView.StateImageList = this.imageList;
            this.treeView.TabIndex = 0;
            this.treeView.NodeMouseDoubleClick += new System.Windows.Forms.TreeNodeMouseClickEventHandler(this.treeView_NodeMouseDoubleClick);
            // 
            // imageList
            // 
            this.imageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList.ImageStream")));
            this.imageList.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList.Images.SetKeyName(0, "psd 3D.png");
            this.imageList.Images.SetKeyName(1, "closed folder.png");
            this.imageList.Images.SetKeyName(2, "TXT.png");
            this.imageList.Images.SetKeyName(3, "AQUA ICONS FILE IMAGE.png");
            this.imageList.Images.SetKeyName(4, "PDF.png");
            this.imageList.Images.SetKeyName(5, "Gloss PNGKKMenu_Audio.png");
            this.imageList.Images.SetKeyName(6, "Gloss PNGMicrosoft_Movie_Maker.png");
            this.imageList.Images.SetKeyName(7, "RAR.png");
            this.imageList.Images.SetKeyName(8, "AQUA ICONS DRIVE ZIP BLUE.png");
            this.imageList.Images.SetKeyName(9, "exel 2007 3D.PNG");
            this.imageList.Images.SetKeyName(10, "MS Word 2.png");
            this.imageList.Images.SetKeyName(11, "Files-dll.png");
            this.imageList.Images.SetKeyName(12, "Exe.png");
            this.imageList.Images.SetKeyName(13, "FILES EXPLORER HTML.png");
            this.imageList.Images.SetKeyName(14, "Files.png");
            this.imageList.Images.SetKeyName(15, "plus_symbol.png");
            // 
            // btnFiles
            // 
            this.btnFiles.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnFiles.Location = new System.Drawing.Point(12, 297);
            this.btnFiles.Name = "btnFiles";
            this.btnFiles.Size = new System.Drawing.Size(360, 23);
            this.btnFiles.TabIndex = 1;
            this.btnFiles.Text = "Get File Manager";
            this.btnFiles.UseVisualStyleBackColor = true;
            this.btnFiles.Click += new System.EventHandler(this.btnFiles_Click);
            // 
            // lstFiles
            // 
            this.lstFiles.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lstFiles.FormattingEnabled = true;
            this.lstFiles.Location = new System.Drawing.Point(12, 181);
            this.lstFiles.Name = "lstFiles";
            this.lstFiles.Size = new System.Drawing.Size(360, 108);
            this.lstFiles.TabIndex = 2;
            // 
            // btnExport
            // 
            this.btnExport.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExport.Location = new System.Drawing.Point(12, 326);
            this.btnExport.Name = "btnExport";
            this.btnExport.Size = new System.Drawing.Size(360, 23);
            this.btnExport.TabIndex = 3;
            this.btnExport.Text = "Export to file";
            this.btnExport.UseVisualStyleBackColor = true;
            this.btnExport.Click += new System.EventHandler(this.btnExport_Click);
            // 
            // frmFileManager
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(384, 361);
            this.Controls.Add(this.btnExport);
            this.Controls.Add(this.lstFiles);
            this.Controls.Add(this.btnFiles);
            this.Controls.Add(this.treeView);
            this.Name = "frmFileManager";
            this.Text = "fileManager";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TreeView treeView;
        private System.Windows.Forms.Button btnFiles;
        private System.Windows.Forms.ImageList imageList;
        private System.Windows.Forms.ListBox lstFiles;
        private System.Windows.Forms.Button btnExport;
    }
}