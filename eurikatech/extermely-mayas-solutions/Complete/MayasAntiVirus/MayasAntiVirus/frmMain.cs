using System;
using System.IO;
using System.Windows.Forms;

namespace MayasAntiVirus
{
    public partial class frmMain : Form
    {
        private const String dirPath = @"datafile\Discoverd";
        private const String logPath = @"log.vdb";


        VirusCollection viruses = new VirusCollection();
        VirusCollection folViruses = new VirusCollection();
        private String reportPath = @"c:\log.txt";
        private String drive = null;
        private String botRunText = "Check";

        public frmMain()
        {
            InitializeComponent();
            botRun.Text = botRunText;
            txLog.Text = reportPath;

            if (!Directory.Exists(dirPath))
                Directory.CreateDirectory(dirPath);

            listView.MultiSelect = false;
            listView.SmallImageList = imageList;
            ColumnHeader col1 = new ColumnHeader();
            ColumnHeader col2 = new ColumnHeader();

            col1.Text = "Name :";
            col2.Text = "Type :";

            col1.Width = (listView.Width * 2 / 3) - 5;
            col2.Width = (listView.Width * 1 / 3);
            listView.Columns.Add(col1);
            listView.Columns.Add(col2);

            foreach (DriveInfo di in DriveInfo.GetDrives())
            {
                if (di.IsReady)
                {
                    Int32 image;

                    switch (di.DriveType)
                    {
                        case DriveType.Fixed:
                            image = 0;
                            break;
                        case DriveType.Removable:
                            image = 1;
                            break;
                        case DriveType.CDRom:
                            image = 2;
                            break;
                        case DriveType.Ram:
                            image = 3;
                            break;
                        case DriveType.Unknown:
                        default:
                            image = 4;
                            break;
                    }
                    ListViewItem lvi = new ListViewItem(di.Name + di.VolumeLabel, image);
                    ListViewItem.ListViewSubItem lvsi = new ListViewItem.ListViewSubItem();     
                    lvsi.Text = di.DriveType.ToString();
                    lvi.SubItems.Add(lvsi);
                    listView.Items.Add(lvi);
                }
            }

            loadViruses(Shared.virusPath);
            botRun.Click += new EventHandler(botRun_Click);
            botLog.Click += new EventHandler(botLog_Click);
            listView.Click += new EventHandler(listView_Click);
        }

        private void loadViruses(String path)
        {
            FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            String[] split;
            String info;

            while ((info = Shared.Encode(sr.ReadLine())) != null)
            {
                virus vrs = new virus();
                split = info.Split(';');
                vrs.name = split[0];
                vrs.type = split[1];
                vrs.Length = Convert.ToInt64(split[2]);
                if (vrs.name.Substring(0, 1) == "[" && vrs.name.Substring(vrs.name.Length - 1, 1) == "]")
                    folViruses.Add(vrs);
                else
                    viruses.Add(vrs);
            }
            sr.Close();
        }

        private void checkFile(String path)
        {
            foreach (virus v in viruses)
            {
                if (v.name == "*" || v.name == Path.GetFileNameWithoutExtension(path))
                    if (v.type == "*" || v.type == Path.GetExtension(path).Substring(1))
                    {
                        if (v.Length == 0 || v.Length == File.ReadAllBytes(path).GetLength(0))
                        {
                            try
                            {
                                if ((File.GetAttributes(path) & FileAttributes.ReadOnly) == FileAttributes.ReadOnly)
                                    File.SetAttributes(path, FileAttributes.Normal);
                                File.Delete(path);
                                txReport.Text += "File : " + path + " : has been deleted\r\n";
                                break;
                            }
                            catch (IOException ex)
                            {
                                txReport.Text += "File : " + path + " : Error While Deleting ... " + ex.Message + "\r\n"; ;
                            }
                        }
                    }
            }

            if (File.Exists(path) && File.GetAttributes(path) == FileAttributes.Hidden)
                File.Move(path, dirPath + Path.GetFileNameWithoutExtension(path) + "extensionfile" + Path.GetExtension(path) + ".fdb");
        }

        private void checkFolder(String path)
        {
            if (path.IndexOf(':') == -1)
            {
                foreach (virus vrs in folViruses)
                {
                    if (vrs.name.Substring(1, vrs.name.Length - 2) == Path.GetDirectoryName(path))
                    {
                        try
                        {
                            Directory.Delete(path);
                            txReport.Text += "Directory : " + path + " : has been deleted\r\n";
                        }
                        catch (IOException ex)
                        {
                            txReport.Text += "Directory : " + path + " : Error While Deleting ... " + ex.Message + "\r\n";
                        }
                    }
                }
            }

            if (!chkSubfolder.Checked)
                progressBar.Maximum = Directory.GetFiles(path).Length;

            foreach (String filePath in Directory.GetFiles(path))
            {
                if (!chkSubfolder.Checked)
                    progressBar.Value++;
                checkFile(filePath);
            }

        }

        private void checkFolders(String path)
        {
            if (Directory.GetDirectories(path) == null)
                checkFolder(path);
            else
            {
                foreach (String folder in Directory.GetDirectories(path))
                    checkFolders(path);
            }
        }

        private void writeReport(String reportPath, String reportText)
        {
            FileStream fs = new FileStream(reportPath, FileMode.OpenOrCreate, FileAccess.Write);
            fs.Seek(0, SeekOrigin.End);
            fs.Write(System.Text.Encoding.ASCII.GetBytes((DateTime.Now.ToString() + "\r\n").ToCharArray()), 0, DateTime.Now.ToString().Length);
            fs.Write(System.Text.Encoding.ASCII.GetBytes(reportText.ToCharArray()), 0, reportText.Length);
            fs.Close();
        }

        private void botRun_Click(object sender, EventArgs e)
        {
            txReport.Clear();
            checkFolder(drive);
            if (chkSubfolder.Checked)
                checkFolders(drive);
            writeReport(reportPath, txReport.Text);
            txReport.Text += "Check your drive ( " + drive + " ) accomplished .";
            progressBar.Value = 0;
        }

        private void botLog_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Text File (*.txt)|*.txt|All Files (*.*)|*.*";
            ofd.Multiselect = false;

            if (ofd.ShowDialog() == DialogResult.OK)
            {
                reportPath = ofd.FileName;
                txLog.Text = reportPath;
            }
        }

        private void listView_Click(object sender, EventArgs e)
        {
            if (listView.SelectedItems.Count > 0)
            {
                drive = listView.SelectedItems[0].Text.Substring(0, 3);
                botRun.Text = botRunText + " " + drive.Substring(0, 2);
                botRun.Enabled = true;
            }
            else
            {
                botRun.Enabled = false;
                botRun.Text += botRunText;
            }
        }
    }

    struct virus
    {
        public String name;
        public String type;
        public Int64 Length;
    }

    internal class VirusCollection : System.Collections.CollectionBase
    {
        public void Add(virus newVirus)
        {
            List.Add(newVirus);
        }

        public void Remove(virus newVirus)
        {
            List.Remove(newVirus);
        }

        public void Clear()
        {
            List.Clear();
        }

        public virus this[Int32 virusIndex]
        {
            set
            {
                List[virusIndex] = value;
            }

            get
            {
                return (virus)List[virusIndex];
            }
        }
    }
}
