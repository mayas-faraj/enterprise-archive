using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Assistance
{
    public partial class frmFileManager : Form
    {
        public frmFileManager()
        {
            InitializeComponent();
        }

        private void btnFiles_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();

            ofd.Filter = "Maniyat File Manager (*.mfm)|*.mfm|Text Files (*.txt)|*.txt|All files (*.*)|*.*";

            if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                System.IO.StreamReader sr = new System.IO.StreamReader(ofd.FileName);
                TreeNode currentNode = new TreeNode("A:\\");
                treeView.Nodes.Add(currentNode);
                
                while (!sr.EndOfStream)
                {
                    String line = sr.ReadLine();

                    if (line == "\\")
                        continue;

                    if (line.StartsWith("\\"))
                    {
                        TreeNode dirNode = new TreeNode(line.Substring(1));

                        currentNode.Nodes.Add(dirNode);
                        currentNode = dirNode;
                    }
                    else
                        if (line == ".")
                        {
                            currentNode = currentNode.Parent;
                        }
                        else
                        {
                            TreeNode node = new TreeNode(line);                          

                            switch (System.IO.Path.GetExtension(line).ToLower())
                            {
                                case ".txt":
                                case ".log":
                                    node.ImageIndex = 2;
                                    break;
                                case ".mp3":
                                case ".wav":
                                case ".wma":
                                case ".mid":
                                    node.ImageIndex = 5;
                                    break;
                                case ".mp4":
                                case ".3gp":
                                case ".wmv":
                                case ".dat":
                                case ".avi":
                                case ".mov":
                                    node.ImageIndex = 6;
                                    break;
                                case ".zip":
                                    node.ImageIndex = 8;
                                    break;
                                case ".rar":
                                    node.ImageIndex = 7;
                                    break;
                                case ".psd":
                                    node.ImageIndex = 0;
                                    break;
                                case ".pdf":
                                    node.ImageIndex = 4;
                                    break;
                                case ".jpg":
                                case ".bmp":
                                case ".jpeg":
                                case ".gif":
                                case ".png":
                                    node.ImageIndex = 3;
                                    break;
                                case ".rtf":
                                case ".doc":
                                case ".docx":
                                    node.ImageIndex = 10;
                                    break;
                                case ".xls":
                                case ".xlsx":
                                case ".csv":
                                    node.ImageIndex = 9;
                                    break;
                                case ".exe":
                                    node.ImageIndex = 12;
                                    break;
                                case ".htm":
                                case ".html":
                                    node.ImageIndex = 13;
                                    break;
                                case ".dll":
                                    node.ImageIndex = 11;
                                    break;
                                default:
                                    node.ImageIndex = 14;
                                    break;
                            }

                            currentNode.Nodes.Add(node);     
                        }
                }

                sr.Close();
            }
        }

        private void treeView_NodeMouseDoubleClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            System.Collections.Generic.List<TreeNode> nodes = new List<TreeNode>();
            String path = "";
            TreeNode node = treeView.SelectedNode;

            if (node != null)
            {
                nodes.Add(node);

                while (node.Parent != null)
                {
                    node = node.Parent;
                    nodes.Add(node);
                }

                for (Int32 i = nodes.Count - 1; i >= 0; i--)
                    path = System.IO.Path.Combine(path, nodes[i].Text);

                lstFiles.Items.Add(path);
            }
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog();

            sfd.Filter = "Text Files (*.txt)|*.txt|All files (*.*)|*.*";

            if (sfd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                System.IO.StreamWriter sw = new System.IO.StreamWriter(sfd.FileName);

                foreach (String item in lstFiles.Items)
                    sw.WriteLine(item);

                sw.Close();
            }
        }
    }
}
