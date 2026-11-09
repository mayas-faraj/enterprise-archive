using System;
using System.IO;
using System.Windows.Forms;
using System.Drawing;

namespace MayasAntivirus
{
    public delegate void ExceptionEventHandler(Object sender,ExceptionEventArgs e);

    public delegate void PassDirectoryEventHandler(Object sender,PassDirectoryEventArgs e);

    public class Style
    {
        private Font font;
        private Color backColor;
        private Color foreColor;
        private Image backgroundImage;

        public Font Font
        {
            get
            {
                return font;
            }
            set
            {
                font = value;
            }
        }

        public Color BackColor
        {
            get
            {
                return backColor;
            }
            set
            {
                backColor = value;
            }
        }

        public Color ForeColor
        {
            get
            {
                return foreColor;
            }
            set
            {
                foreColor = value;
            }
        }

        public Image BackgroundImage
        {
            get
            {
                return backgroundImage;
            }
            set
            {
                backgroundImage = value;
            }
        }
    }

    public class ControlStyles
    {
        private Style headerTextStyle;
        private Style labelStyle;
        private Style textStyle;
        private Style formStyle;
        private Style buttonStyle;
        private Style gridHeaderStyle;
        private Style gridTextStyle;

        public Style HeaderTextStyle
        {
            get
            {
                return headerTextStyle;
            }
            set
            {
                headerTextStyle = value;
            }
        }

        public Style LabelStyle
        {
            get
            {
                return labelStyle;
            }
            set
            {
                labelStyle = value;
            }
        }

        public Style TextStyle
        {
            get
            {
                return textStyle;
            }
            set
            {
                textStyle = value;
            }
        }

        public Style FormStyle
        {
            get
            {
                return formStyle;
            }
            set
            {
                formStyle = value;
            }
        }

        public Style ButtonStyle
        {
            get
            {
                return buttonStyle;
            }
            set
            {
                buttonStyle = value;
            }
        }

        public Style GridHeaderStyle
        {
            get
            {
                return gridHeaderStyle;
            }
            set
            {
                gridHeaderStyle = value;
            }
        }

        public Style GridTextStyle
        {
            get
            {
                return gridTextStyle;
            }
            set
            {
                gridTextStyle = value;
            }
        }
    }
    
    public class Scaner
    {
        //consts region ============================
        private const Char SPERATOR_CHAR = ';';

        //events region ============================
        public event ExceptionEventHandler OnError;
        public event PassDirectoryEventHandler OnPassDirectory;
        public event EventHandler OnScanStarted;
        public event EventHandler OnScanFinished;
        public event EventHandler OnScanStoppet;

        //properties and functions region
        private String[] virusesName;
        private Virus[] viruses;
        private DataGridView gridResult;
        private Int32 numOfDirs;
        private Boolean stop;

        public Scaner()
        {
            virusesName = null;
            viruses = null;
            numOfDirs = 0;
            Stop = false;
        }

        private Boolean isVirusFile(String fileName)
        {
            //binary search to check fileName

            //precondition : viruses haved values

            //postcondition : indecate if fileNames in virusesName
            fileName = Path.GetFileName(fileName);

            if (virusesName.Length == 0 || fileName == "" || fileName == null)
                return false;
            else
            {
                Int32 firstIndex = 0;
                Int32 midIndex = 0;
                Int32 lastIndex = virusesName.Length - 1;

                while (lastIndex >= firstIndex)
                {
                    midIndex = Convert.ToInt32((firstIndex + lastIndex) / 2);

                    //critical operation
                    if (virusesName[midIndex] == fileName)
                        return true;
                    else
                        if (virusesName[midIndex].CompareTo(fileName) > 0)
                            lastIndex = midIndex - 1;
                        else
                            firstIndex = midIndex + 1;
                }
            }

            return false;

            //big O notation for viruses.Length=n is log2(n)
        }

        private Boolean isVirusMode(String fileName)
        {
            //virus mode : virus set attribute for random folder is hidden and make exe file have name of that folder (not hidden)
            String[] dirs = Directory.GetDirectories(Path.GetDirectoryName(fileName));

                foreach (String dn in dirs)
                    if ((File.GetAttributes(dn) & FileAttributes.Hidden) != 0)
                        if (Path.GetFileName(fileName) == Path.GetFileName(dn) + ".exe" || Path.GetFileName(fileName) == Path.GetFileName(dn) + ".cmd" || Path.GetFileName(fileName) == Path.GetFileName(dn) + ".bat")
                            return true;
            
            return false;
        }

        private String getAutorunTarget(String autorunFileName)
        {
            FileStream fs = new FileStream(autorunFileName, FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            String[] lines = sr.ReadToEnd().Split(new String[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);
            String result = null;

            sr.Close();
            fs.Close();

            for (Int32 i = 0; i < lines.Length; i++)
                if ((lines[i].ToLower() == "[autorun]") && (i < lines.Length - 1))
                {
                    for (Int32 j = i + 1; j < lines.Length; j++)
                        if ((lines[j].ToLower().Substring(0, 12) == "shellexecute") || ((lines[j].ToLower().Substring(0, 4) == "open")))
                        {
                            result = lines[j].Substring(lines[j].IndexOf('=') + 1);

                            for (Int32 k = result.Length; k > 1; k--)
                                result = result.Replace(new String('\\', k), "\\");

                            result = result.Trim();

                            if (result[1] != ':')
                                result = Path.Combine(Path.GetDirectoryName(autorunFileName), result);

                            if (File.Exists(result))
                                return result;
                            else
                                return null;

                        }
                }

            return null;
        }

        private void getDirectoryNumber(String baseDirectory)
        {
            numOfDirs++;

            try
            {
                foreach (String sub in Directory.GetDirectories(baseDirectory))
                    if (sub != baseDirectory)
                        getDirectoryNumber(sub);
            }
            catch
            {
                //OnError(this, new ExceptionEventArgs(ex));
            }
           
        }

        public Int32 GetDirectoryNumber(String baseDirectory)
        {
            numOfDirs = 0;

            getDirectoryNumber(baseDirectory);

            return --numOfDirs;
        }

        public void VirusTopScan(String folderPath)
        {
            stop = false;

            if (OnScanStarted != null)
                OnScanStarted(this, new EventArgs());

            //precondition : viruses have initil value , folderPath is exist
            //postcondition : gridResult.Items += virusesInfo
            DriveInfo currentDrive;

            folderPath = folderPath.ToLower();
            
            if (Directory.Exists(folderPath))
            {
                currentDrive = new DriveInfo(Path.GetPathRoot(Path.GetFullPath(folderPath)));

                try
                {
                    String[] files = Directory.GetFiles(folderPath);
                    foreach (String fn in files)
                    {
                        if (stop)
                        {
                            if (OnScanStoppet != null)
                                OnScanStoppet(this, new EventArgs());
                            return;
                        }

                        if ((Path.GetFileName(fn.ToLower()) == "autorun.inf") && (currentDrive.DriveType != DriveType.CDRom))
                        {
                            String autorun = getAutorunTarget(fn);

                            if (autorun != null)
                                gridResult.Rows.Add(Path.GetFileName(autorun), Path.Combine(currentDrive.Name, autorun), "Danger", "Delete");
                        }
                        else
                            if (isVirusFile(fn.ToLower()))
                                gridResult.Rows.Add(Path.GetFileName(fn), Path.GetFullPath(fn), "Danger", "Delete");
                            else
                                //in this state virus execute file must not hidden to make user maniually run them
                                if ((File.GetAttributes(fn.ToLower()) & FileAttributes.Hidden) == 0)
                                {
                                    //the folder contain the virus must not hidden too
                                    if ((File.GetAttributes(folderPath) & FileAttributes.Hidden) == 0)
                                        if (Path.GetFileName(fn.ToLower()) == Path.GetFileName(folderPath) + ".exe" || Path.GetFileName(fn.ToLower()) == Path.GetFileName(folderPath) + ".cmd" || Path.GetFileName(fn.ToLower()) == Path.GetFileName(folderPath) + ".bat")
                                            gridResult.Rows.Add(Path.GetFileName(fn), Path.GetFullPath(fn), "Skepticism", "Ignore");
                                        else
                                            if (isVirusMode(fn.ToLower()))
                                                gridResult.Rows.Add(Path.GetFileName(fn), Path.GetFullPath(fn), "more Skepticism", "Ignore");
                                }
                    }
                }
                catch (Exception ex)
                {
                    if (OnError != null)
                        OnError(this, new ExceptionEventArgs(ex));
                }
            }

            if (OnScanFinished != null)
                OnScanFinished(this, new EventArgs());
        }

        private void virusTopScan(String folderPath)
        {
            //precondition : viruses have initil value , folderPath is exist
            //postcondition : gridResult.Items += virusesInfo

            folderPath = folderPath.ToLower();
            DriveInfo currentDrive = new DriveInfo(Path.GetPathRoot(Path.GetFullPath(folderPath)));

            if (Directory.Exists(folderPath))
            {
                try
                {
                    String[] files = Directory.GetFiles(folderPath);
                    foreach (String fn in files)
                    { 
                        //starting temp code

                       
                        if ((Path.GetFileName(fn.ToLower()) == "autorun.inf") && (currentDrive.DriveType != DriveType.CDRom))
                        {
                            String autorun = getAutorunTarget(fn);

                            if (autorun != null)
                                gridResult.Rows.Add(Path.GetFileName(autorun), Path.Combine(currentDrive.Name, autorun), "Danger", "Delete");
                        }
                        else
                        //end temp code
                        if (false)//(isVirusFile(fn.ToLower()))
                            gridResult.Rows.Add(Path.GetFileName(fn), fn, "Danger", "Delete");
                        else
                            //in this state virus execute file must not hidden to make user maniually run them
                            if ((File.GetAttributes(fn.ToLower()) & FileAttributes.Hidden) == 0)
                            {
                                //the folder contain the virus must not hidden too
                                if ((File.GetAttributes(folderPath) & FileAttributes.Hidden) == 0)
                                    if (Path.GetFileName(fn.ToLower()) == Path.GetFileName(folderPath) + ".exe" || Path.GetFileName(fn.ToLower()) == Path.GetFileName(folderPath) + ".cmd" || Path.GetFileName(fn.ToLower()) == Path.GetFileName(folderPath) + ".bat")
                                        gridResult.Rows.Add(Path.GetFileName(fn), fn, "Skepticism", "Ignore");
                                    else
                                        if (isVirusMode(fn.ToLower()))
                                            gridResult.Rows.Add(Path.GetFileName(fn), fn, "more Skepticism", "Ignore");
                            }
                    }
                }
                catch (Exception ex)
                {
                    if (OnError != null)
                        OnError(this, new ExceptionEventArgs(ex));
                }
            }
        }

        public void VirusScan(String folderPath)
        {
            stop = false;

            if (OnScanStarted != null)
                OnScanStarted(this, new EventArgs());

            virusScan(folderPath);

            if (OnScanFinished != null)
                OnScanFinished(this, new EventArgs());
        }

        private void virusScan(String folderPath)
        {
            virusTopScan(folderPath);

            try
            {
                foreach (String subFolder in Directory.GetDirectories(folderPath))
                    if ((folderPath != subFolder))
                    {
                        if (stop)
                        {
                            if (OnScanStoppet != null)
                                OnScanStoppet(this, new EventArgs());
                            return;
                        }
                        if (OnPassDirectory != null)
                            OnPassDirectory(this, new PassDirectoryEventArgs(subFolder));
                        virusScan(subFolder);
                    }
            }
            catch (Exception ex)
            {
                if (OnError != null)
                    OnError(this, new ExceptionEventArgs(ex));
            }
        }

        public Boolean Stop
        {
            get
            {
                return stop;
            }
            set
            {
                stop = value;
            }
        }

        public Virus[] Viruses
        {
            set
            {
                //set value of property and get only names of viruses from viruses[] and store in virusesName
                viruses = value;
                virusesName = new String[viruses.Length];

                for (Int32 i = 0; i < virusesName.Length; i++)
                    virusesName[i] = viruses[i].Name.ToLower();
            }
            get
            {
                return viruses;
            }
        }

        public DataGridView GridResult
        {
            set
            {
                gridResult = value;
            }
            get
            {
                return gridResult;
            }
        }
    }

    public struct Virus
    {
        private readonly String name;
        private readonly String description;

        public Virus(String virusName,String virusDescription)
        {
            name = virusName;
            description = virusDescription;
        }

        public String Name
        {
            get
            {
                return name;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
        }

        public static Virus[] LoadViruses()
        {
            FileStream fs = new FileStream(Path.Combine(System.Windows.Forms.Application.StartupPath, "codec.exe"), FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);

            String[] texts = sr.ReadToEnd().Split('|');
            Virus[] viruses = new Virus[texts.Length];

            for (Int32 i = 0; i < viruses.Length; i++)
            {
                Int32 idx = texts[i].IndexOf('?');

                if (idx == -1)
                    viruses[i] = new Virus(texts[i], "");
                else
                    viruses[i] = new Virus(texts[i].Substring(0, idx), texts[i].Substring(idx + 1));
            }

            return viruses;
        }
    }

    public class ExceptionEventArgs : EventArgs
    {
        private Exception sourceException;

        public ExceptionEventArgs(Exception exception)
        {
            sourceException = exception;
        }

        public Exception SourceException
        {
            get
            {
                return sourceException;
            }
            set
            {
                sourceException = value;
            }
        }
    }

    public class PassDirectoryEventArgs : EventArgs
    {
        private String directoryName;

        public PassDirectoryEventArgs(String nameOfDirectory)
        {
            directoryName = nameOfDirectory;
        }

        public String DirectoryName
        {
            get
            {
                return directoryName;
            }
            set
            {
                directoryName = value;
            }
        }
    }

}
