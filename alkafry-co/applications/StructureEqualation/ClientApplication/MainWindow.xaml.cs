namespace ClientApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : System.Windows.Window
    {
        //application variables
        private System.Windows.Forms.Timer tmr = new System.Windows.Forms.Timer();
        private System.Double offset;
        private System.Double time;

        //application costs
        private const System.Double MIN_OFFSET = 0;
        private const System.Double MAX_OFFSET = 1;
        private const System.Double END_TIME = 400;

        //constructure

        public MainWindow()
        {
            InitializeComponent();

            //clear initail values
            clear1();
            clear2();
            clear3();
            clearCosts1();
            clearCosts2();
            clearCosts3();

            prapartUnits();

            //default properties
            tmr.Interval = 100;
            tmr.Enabled = true;
            offset = time = 0;

            Unit cm = new Unit("سم", 0.01, System.Windows.Media.Color.FromRgb(180, 255, 180), System.Windows.Media.Color.FromRgb(30, 180, 20));
            Unit m = new Unit("م", 1, System.Windows.Media.Color.FromRgb(180, 180, 255), System.Windows.Media.Color.FromRgb(30, 20, 180));
            Unit m2 = new Unit("م²", 1, System.Windows.Media.Color.FromRgb(180, 180, 255), System.Windows.Media.Color.FromRgb(30, 20, 180));
            Unit m3 = new Unit("م³", 1, System.Windows.Media.Color.FromRgb(180, 180, 255), System.Windows.Media.Color.FromRgb(30, 20, 180));
            Unit kg = new Unit("كغ", 1, System.Windows.Media.Color.FromRgb(180, 255, 180), System.Windows.Media.Color.FromRgb(30, 180, 20));
            Unit ton = new Unit("طن", 1000, System.Windows.Media.Color.FromRgb(180, 180, 255), System.Windows.Media.Color.FromRgb(30, 20, 180));
            Unit pack = new Unit("كيس", 50, System.Windows.Media.Color.FromRgb(255, 180, 180), System.Windows.Media.Color.FromRgb(180, 30, 20));

            AddComboUnit(cmITall1, m);
            AddComboUnit(cmITall1, cm);
            AddComboUnit(cmIWidth1, m);
            AddComboUnit(cmIWidth1, cm);
            AddComboUnit(cmIHeight1, m);
            AddComboUnit(cmIHeight1, cm);
            AddComboUnit(cmOIron1, ton);
            AddComboUnit(cmOIron1, kg);
            AddComboUnit(cmOCement1, ton);
            AddComboUnit(cmOCement1, kg);
            AddComboUnit(cmOCement1, pack);
            AddComboUnit(cmOSand1, m3);
            AddComboUnit(cmORock1, m3);
            AddComboUnit(cmOConcrete1, m3);

            AddComboUnit(cmITall2, m);
            AddComboUnit(cmITall2, cm);
            AddComboUnit(cmIWidth2, m);
            AddComboUnit(cmIWidth2, cm);
            AddComboUnit(cmIHeight2, m);
            AddComboUnit(cmIHeight2, cm);
            AddComboUnit(cmOIron2, ton);
            AddComboUnit(cmOIron2, kg);
            AddComboUnit(cmOCement2, ton);
            AddComboUnit(cmOCement2, kg);
            AddComboUnit(cmOCement2, pack);
            AddComboUnit(cmOSand2, m3);
            AddComboUnit(cmORock2, m3);
            AddComboUnit(cmOConcrete2, m3);

            AddComboUnit(cmISpace3, m2);
            AddComboUnit(cmICube3, m3);
            AddComboUnit(cmIIron3, ton);
            AddComboUnit(cmIIron3, kg);
            AddComboUnit(cmICement3, pack);
            AddComboUnit(cmICement3, ton);
            AddComboUnit(cmICement3, kg);
            AddComboUnit(cmOIron3, ton);
            AddComboUnit(cmOIron3, kg);
            AddComboUnit(cmOCement3, pack);
            AddComboUnit(cmOCement3, ton);
            AddComboUnit(cmOCement3, kg);

            //application consts
            cmOIron1.Tag = txOIron1;
            cmOCement1.Tag = txOCement1;
            cmOIron2.Tag = txOIron2;
            cmOCement2.Tag = txOCement2;
            cmOIron3.Tag = txOIron3;
            cmOCement3.Tag = txOCement3;

            //control events
            tmr.Tick += new System.EventHandler(tmr_Tick);
            cmOIron1.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cmO1_SelectionChanged);
            cmOCement1.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cmO1_SelectionChanged);
            cmOIron2.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cmO2_SelectionChanged);
            cmOCement2.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cmO2_SelectionChanged);
            cmOIron3.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cmO3_SelectionChanged);
            cmOCement3.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cmO3_SelectionChanged);

            cmITall1.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cm1_SelectionChanged);
            cmIWidth1.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cm1_SelectionChanged);
            cmIHeight1.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cm1_SelectionChanged);

            cmITall2.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cm2_SelectionChanged);
            cmIWidth2.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cm2_SelectionChanged);
            cmIHeight2.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cm2_SelectionChanged);

            cmIIronConcentrate3.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cm3_SelectionChanged);
            cmICementConcentrate3.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(cm3_SelectionChanged);
        }

        public MainWindow(System.String args)
            : this()
        {
            ApplicationData appData = new ApplicationData();

            if (appData.Load(args))
            {
                txITall1.Text = appData.Tall1;
                txIWidth1.Text = appData.Width1;
                txIHeight1.Text = appData.Height1;
                cmITall1.SelectedIndex = System.Convert.ToInt32(appData.TallIndex1);
                cmIWidth1.SelectedIndex = System.Convert.ToInt32(appData.WidthIndex1);
                cmIHeight1.SelectedIndex = System.Convert.ToInt32(appData.HeightIndex1);
                txIIronCost1.Text = appData.CostIron1;
                txICementCost1.Text = appData.CostCement1;
                txIRockCost1.Text = appData.CostRock1;
                txISandCost1.Text = appData.CostSand1;
                txIMiscTotalCost1.Text = appData.CostMisc1;

                txITall2.Text = appData.Tall2;
                txIWidth2.Text = appData.Width2;
                txIHeight2.Text = appData.Height2;
                txINum2.Text = appData.Number2;
                cmITall2.SelectedIndex = System.Convert.ToInt32(appData.TallIndex2);
                cmIWidth2.SelectedIndex = System.Convert.ToInt32(appData.WidthIndex2);
                cmIHeight2.SelectedIndex = System.Convert.ToInt32(appData.HeightIndex2);
                txIIronCost2.Text = appData.CostIron2;
                txICementCost2.Text = appData.CostCement2;
                txIRockCost2.Text = appData.CostRock2;
                txISandCost2.Text = appData.CostSand2;
                txIMiscTotalCost2.Text = appData.CostMisc2;

                cmICementConcentrate3.SelectedIndex = System.Convert.ToInt32(appData.Cement3);
                cmIIronConcentrate3.SelectedIndex = System.Convert.ToInt32(appData.Iron3);
                cmICement3.SelectedIndex = System.Convert.ToInt32(appData.CementIndex3);
                cmIIron3.SelectedIndex = System.Convert.ToInt32(appData.IronIndex3);
                txICube3.Text = appData.Cube3;
                txICementCost3.Text = appData.CostCement3;
                txIIronCost3.Text = appData.CostIron3;
                txIMiscTotalCost3.Text = appData.CostMisc3;

                Math1();
                Math2();
                Math3(true);
            }
            else
                System.Windows.MessageBox.Show("حدث خطأ أثناء محاولة تحميل الملف , لم يتم تحميل الملف", "تحميل إعدادات البرنامج", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Stop);
        }

        //System.Windows.Controls Events

        void tmr_Tick(object sender, System.EventArgs e)
        {
            if (time == END_TIME)
                time = 0;

            ((System.Windows.Media.LinearGradientBrush)recBanner.Fill).GradientStops[0].Offset = (1 - (time++ / 400)) * System.Math.Sin((time * System.Math.PI * 6) / END_TIME);
        }

        private void textsCube_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
        {
            System.Double value;

            if (System.Double.TryParse(((System.Windows.Controls.TextBox)sender).Text, out value))
                Math1();
        }

        private void textsSurface_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
        {
            System.Double value;

            if (System.Double.TryParse(((System.Windows.Controls.TextBox)sender).Text, out value))
                Math3(((System.Windows.Controls.TextBox)sender).Name == "txICube3");
            
        }

        private void textsBases_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
        {
            System.Double value;

            if(System.Double.TryParse(((System.Windows.Controls.TextBox)sender).Text,out value))
                Math2();
        }

        private void texts_Keydown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            ProcessinputKey((System.Windows.Controls.TextBox)sender, e);
        }

        private void texts_LostFocus(object sender, System.Windows.RoutedEventArgs e)
        {
            ProcessLeaveControl((System.Windows.Controls.TextBox)sender);
        }

        private void lb1_MouseUp(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (e.ClickCount == 1)
                clear1();
        }

        private void lbCosts1_MouseUp(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (e.ClickCount == 1)
                clearCosts1();
        }

        private void lb2_MouseUp(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (e.ClickCount == 1)
                clear2();
        }

        private void lbCosts2_MouseUp(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (e.ClickCount == 1)
                clearCosts2();
        }

        private void lb3_MouseUp(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (e.ClickCount == 1)
                clear3();
        }

        private void lbConsts3_MouseUp(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (e.ClickCount == 1)
                clearCosts3();
        }

        private void btnExit_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.Close();
            System.Windows.Forms.Application.Exit();
        }

        private void btnClear_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            clear1();
            clear2();
            clear3();
            clearCosts1();
            clearCosts2();
            clearCosts3();
            MathTotal();
        }

        private void cm1_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            Math1();
        }

        private void cm2_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            Math2();
        }

        private void cm3_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            Math3(false);
        }

        private void cmO1_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            System.Double value;
            System.Double.TryParse((((System.Windows.Controls.TextBox)((System.Windows.Controls.ComboBox)sender).Tag).Text), out value);
            ((System.Windows.Controls.TextBox)((System.Windows.Controls.ComboBox)sender).Tag).Text = (value * ((Unit)((System.Windows.Controls.ComboBoxItem)((System.Windows.Controls.ComboBox)sender).SelectedItem).Content).Multiply).ToString();
            Math1();
        }

        private void cmO2_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            System.Double value;
            System.Double.TryParse(((System.Windows.Controls.TextBox)((System.Windows.Controls.ComboBox)sender).Tag).Text,out value);
            ((System.Windows.Controls.TextBox)((System.Windows.Controls.ComboBox)sender).Tag).Text = (value * ((Unit)((System.Windows.Controls.ComboBoxItem)((System.Windows.Controls.ComboBox)sender).SelectedItem).Content).Multiply).ToString();
            Math2();
        }

        private void cmO3_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            System.Double value;
            System.Double.TryParse(((System.Windows.Controls.TextBox)((System.Windows.Controls.ComboBox)sender).Tag).Text, out value);
            ((System.Windows.Controls.TextBox)((System.Windows.Controls.ComboBox)sender).Tag).Text = (value * ((Unit)((System.Windows.Controls.ComboBoxItem)((System.Windows.Controls.ComboBox)sender).SelectedItem).Content).Multiply).ToString();
            Math3(false);
        }

        private void btnPrint_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Info info = new Info();
            PrintWindow pWin = new PrintWindow(info);

            info.I1CementCost = txICementCost1.Text;
            info.I1IronCost = txIIronCost1.Text;
            info.I1Misc = txIMiscTotalCost1.Text;
            info.I1RockCost = txIRockCost1.Text;
            info.I1SandCost = txISandCost1.Text;
            info.I1Total = txOTotalCost1.Text;
            info.I1CementLot = txOCement1.Text + " " + ((System.Windows.Controls.ComboBoxItem)cmOCement1.SelectedItem).Content.ToString();
            info.I1IronLot = txOIron1.Text + " " + ((System.Windows.Controls.ComboBoxItem)cmOIron1.SelectedItem).Content.ToString();
            info.I1RockLot = txORock1.Text + " " + ((System.Windows.Controls.ComboBoxItem)cmORock1.SelectedItem).Content.ToString();
            info.I1SandLot = txOSand1.Text + "  " + ((System.Windows.Controls.ComboBoxItem)cmOSand1.SelectedItem).Content.ToString();

            info.I2CementCost = txICementCost2.Text;
            info.I2IronCost = txIIronCost2.Text;
            info.I2Misc = txIMiscTotalCost2.Text;
            info.I2RockCost = txIRockCost2.Text;
            info.I2SandCost = txISandCost2.Text;
            info.I2Total = txOTotalCost2.Text;
            info.I2CementLot = txOCement2.Text + " " + ((System.Windows.Controls.ComboBoxItem)cmOCement2.SelectedItem).Content.ToString();
            info.I2IronLot = txOIron2.Text + " " + ((System.Windows.Controls.ComboBoxItem)cmOIron2.SelectedItem).Content.ToString();
            info.I2RockLot = txORock2.Text + " " + ((System.Windows.Controls.ComboBoxItem)cmORock2.SelectedItem).Content.ToString();
            info.I2SandLot = txOSand2.Text + "  " + ((System.Windows.Controls.ComboBoxItem)cmOSand2.SelectedItem).Content.ToString();

            info.I3CementCost = txICementCost3.Text;
            info.I3IronCost = txIIronCost3.Text;
            info.I3Misc = txIMiscTotalCost3.Text;
            info.I3Total = txOTotalCost3.Text;
            info.I3IronLot = txOIron3.Text + " " + ((System.Windows.Controls.ComboBoxItem)cmOIron3.SelectedItem).Content.ToString();
            info.I3CementLot = txOCement3.Text + " " + ((System.Windows.Controls.ComboBoxItem)cmOCement3.SelectedItem).Content.ToString();

            info.ITotal = txOTotal.Text;

            pWin.Show();
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Microsoft.Win32.SaveFileDialog sfd = new Microsoft.Win32.SaveFileDialog();

            sfd.Filter = "Maniyat Configure File (*.mnc)|*.mnc";
            sfd.DefaultExt = "mnc";

            if (sfd.ShowDialog() == true)
            {
                ApplicationData appData = new ApplicationData();

                appData.Tall1 = txITall1.Text;
                appData.Width1 = txIWidth1.Text;
                appData.Height1 = txIHeight1.Text;
                appData.TallIndex1 = cmITall1.SelectedIndex.ToString();
                appData.WidthIndex1 = cmIWidth1.SelectedIndex.ToString();
                appData.HeightIndex1 = cmIHeight1.SelectedIndex.ToString();
                appData.CostIron1 = txIIronCost1.Text;
                appData.CostCement1 = txICementCost1.Text;
                appData.CostSand1 = txISandCost1.Text;
                appData.CostRock1 = txIRockCost1.Text;
                appData.CostMisc1 = txIMiscTotalCost1.Text;

                appData.Tall2 = txITall2.Text;
                appData.Width2 = txIWidth2.Text;
                appData.Height2 = txIHeight2.Text;
                appData.Number2 = txINum2.Text;
                appData.TallIndex2 = cmITall2.SelectedIndex.ToString();
                appData.WidthIndex2 = cmIWidth2.SelectedIndex.ToString();
                appData.HeightIndex2 = cmIHeight2.SelectedIndex.ToString();
                appData.CostIron2 = txIIronCost2.Text;
                appData.CostCement2 = txICementCost2.Text;
                appData.CostSand2 = txISandCost2.Text;
                appData.CostRock2 = txIRockCost2.Text;
                appData.CostMisc2 = txIMiscTotalCost2.Text;

                appData.Cube3 = txICube3.Text;
                appData.Cement3 = cmICementConcentrate3.SelectedIndex.ToString();
                appData.Iron3 = cmIIronConcentrate3.SelectedIndex.ToString();
                appData.CementIndex3 = cmICement3.SelectedIndex.ToString();
                appData.IronIndex3 = cmIIron3.SelectedIndex.ToString();
                appData.CostCement3 = txICementCost3.Text;
                appData.CostIron3 = txIIronCost3.Text;
                appData.CostMisc3 = txIMiscTotalCost3.Text;

                if (!appData.Save(sfd.FileName))
                    System.Windows.MessageBox.Show("حدث خطأ إثناء حفظ الملف , لم يتم حفظ الملف!", "حفظ إعدادات البرنامج", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Stop);
            }
        }

        private void btnLoad_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();

            ofd.Filter = "Maniyat Configure File (*.mnc)|*.mnc|All Files (*.*)|*.*";

            if (ofd.ShowDialog() == true)
            {
                ApplicationData appData = new ApplicationData();

                if (appData.Load(ofd.FileName))
                {
                    txITall1.Text = appData.Tall1;
                    txIWidth1.Text = appData.Width1;
                    txIHeight1.Text = appData.Height1;
                    cmITall1.SelectedIndex = System.Convert.ToInt32(appData.TallIndex1);
                    cmIWidth1.SelectedIndex = System.Convert.ToInt32(appData.WidthIndex1);
                    cmIHeight1.SelectedIndex = System.Convert.ToInt32(appData.HeightIndex1);
                    txIIronCost1.Text = appData.CostIron1;
                    txICementCost1.Text = appData.CostCement1;
                    txIRockCost1.Text = appData.CostRock1;
                    txISandCost1.Text = appData.CostSand1;
                    txIMiscTotalCost1.Text = appData.CostMisc1;

                    txITall2.Text = appData.Tall2;
                    txIWidth2.Text = appData.Width2;
                    txIHeight2.Text = appData.Height2;
                    txINum2.Text = appData.Number2;
                    cmITall2.SelectedIndex = System.Convert.ToInt32(appData.TallIndex2);
                    cmIWidth2.SelectedIndex = System.Convert.ToInt32(appData.WidthIndex2);
                    cmIHeight2.SelectedIndex = System.Convert.ToInt32(appData.HeightIndex2);
                    txIIronCost2.Text = appData.CostIron2;
                    txICementCost2.Text = appData.CostCement2;
                    txIRockCost2.Text = appData.CostRock2;
                    txISandCost2.Text = appData.CostSand2;
                    txIMiscTotalCost2.Text = appData.CostMisc2;

                    cmICementConcentrate3.SelectedIndex = System.Convert.ToInt32(appData.Cement3);
                    cmIIronConcentrate3.SelectedIndex = System.Convert.ToInt32(appData.Iron3);
                    cmICement3.SelectedIndex = System.Convert.ToInt32(appData.CementIndex3);
                    cmIIron3.SelectedIndex = System.Convert.ToInt32(appData.IronIndex3);
                    txICube3.Text = appData.Cube3;
                    txICementCost3.Text = appData.CostCement3;
                    txIIronCost3.Text = appData.CostIron3;
                    txIMiscTotalCost3.Text = appData.CostMisc3;

                    Math1();
                    Math2();
                    Math3(true);
                }
                else
                    System.Windows.MessageBox.Show("حدث خطأ أثناء محاولة تحميل الملف , لم يتم تحميل الملف", "تحميل إعدادات البرنامج", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Stop);
            }
        }

        //Defind functions

        private void ProcessinputKey(System.Windows.Controls.TextBox textBox, System.Windows.Input.KeyEventArgs e)
        {
            System.Int32 key = System.Convert.ToInt32(e.Key);

            if ((key >= 34 && key <= 43) || (key >= 74 && key <= 83) || key == 144 || key == 88)
            {
                if ((key == 144 || key == 88) && textBox.Text.IndexOf('.') != -1)
                    e.Handled = true;
            }
            else
                e.Handled = true;
        }

        private void ProcessLeaveControl(System.Windows.Controls.TextBox textBox)
        {
            System.Double value;

            if (System.Double.TryParse(textBox.Text, out value))
                textBox.Text = value.ToString();
            else
            {
                if (textBox.Text.LastIndexOf('.') == textBox.Text.Length)
                    textBox.Text = textBox.Text.Substring(0, textBox.Text.Length - 1);
                else
                    textBox.Text = "0";
            }
        }

        private void clear1()
        {
            txITall1.Text = "";
            txIHeight1.Text = "";
            txIWidth1.Text = "";

            txOCement1.Text = "";
            txOConcrete1.Text = "";
            txOIron1.Text = "";
            txORock1.Text = "";
            txOSand1.Text = "";

            txIIronCost1.Text = "";
            txIRockCost1.Text = "";
            txISandCost1.Text = "";
            txICementCost1.Text = "";
        }

        private void clearCosts1()
        {
            txOCementTotalCost1.Text = "";
            txOIronTotalCost1.Text = "";
            txORockTotalCost1.Text = "";
            txOSandTotalCost1.Text = "";
            txIMiscTotalCost1.Text = "";
            txOTotalCost1.Text = "";
        }

        private void clear2()
        {
            txITall2.Text = "";
            txIHeight2.Text = "";
            txIWidth2.Text = "";
            txINum2.Text = "1";

            txOCement2.Text = "";
            txOConcrete2.Text = "";
            txOIron2.Text = "";
            txORock2.Text = "";
            txOSand2.Text = "";

            txIIronCost2.Text = "";
            txIRockCost2.Text = "";
            txISandCost2.Text = "";
            txICementCost2.Text = "";

        }

        private void clearCosts2()
        {
            txOCementTotalCost2.Text = "";
            txOIronTotalCost2.Text = "";
            txORockTotalCost2.Text = "";
            txOSandTotalCost2.Text = "";
            txIMiscTotalCost2.Text = "";
            txOTotalCost2.Text = "";
        }

        private void clear3()
        {
            txISpace3.Text = "";
            txICube3.Text = "";
            txOIron3.Text = "";
            txOCement3.Text = "";
            txICementCost3.Text = "";
            txIIronCost3.Text = "";
            cmICementConcentrate3.SelectedIndex = 4;
            cmIIronConcentrate3.SelectedIndex = 2;
        }

        private void clearCosts3()
        {
            txOCementTotalCost3.Text = "";
            txOIronTotalCost3.Text = "";
            txIMiscTotalCost3.Text = "";
            txOTotalCost3.Text = "";
        }

        private void prapartUnits()
        {
            cmICement3.SelectedIndex = 0;
            cmICube3.SelectedIndex = 0;
            cmIHeight1.SelectedIndex = 0;
            cmIHeight2.SelectedIndex = 0;
            cmIIron3.SelectedIndex = 0;
            cmISpace3.SelectedIndex = 0;
            cmITall1.SelectedIndex = 0;
            cmITall2.SelectedIndex = 0;
            cmIWidth1.SelectedIndex = 0;
            cmIWidth2.SelectedIndex = 0;
            cmOCement1.SelectedIndex = 0;
            cmOCement2.SelectedIndex = 0;
            cmOCement3.SelectedIndex = 0;
            cmOConcrete1.SelectedIndex = 0;
            cmOConcrete2.SelectedIndex = 0;
            cmOIron1.SelectedIndex = 0;
            cmOIron2.SelectedIndex = 0;
            cmOIron3.SelectedIndex = 0;
            cmORock2.SelectedIndex = 0;
            cmOSand1.SelectedIndex = 0;
            cmOSand1.SelectedIndex = 0;
            cmOSand2.SelectedIndex = 0;
            cmORock1.SelectedIndex = 0;
        }

        private void Math1()
        {
            try
            {
                //inputs
                System.Double tall, width, height;
                System.Double ironCost, cementCost, rockCost, sandCost, miscCost;

                System.Double.TryParse(txITall1.Text, out tall); 
                System.Double.TryParse(txIWidth1.Text, out width); 
                System.Double.TryParse(txIHeight1.Text, out height); 

                tall *= ((Unit)(((System.Windows.Controls.ComboBoxItem)cmITall1.SelectedItem).Content)).Multiply;
                width *= ((Unit)((System.Windows.Controls.ComboBoxItem)cmIWidth1.SelectedItem).Content).Multiply;
                height *= ((Unit)((System.Windows.Controls.ComboBoxItem)cmIHeight1.SelectedItem).Content).Multiply;

                System.Double.TryParse(txIIronCost1.Text,out ironCost);
                System.Double.TryParse(txICementCost1.Text,out cementCost);
                System.Double.TryParse(txIRockCost1.Text,out rockCost);
                System.Double.TryParse(txISandCost1.Text,out sandCost);
                System.Double.TryParse(txIMiscTotalCost1.Text,out miscCost);

                //equalation
                System.Double concret = tall * width * height;
                System.Double iron = concret * 100 / ((Unit)((System.Windows.Controls.ComboBoxItem)cmOIron1.SelectedItem).Content).Multiply;
                System.Double cement = (concret * 350) / ((Unit)((System.Windows.Controls.ComboBoxItem)cmOCement1.SelectedItem).Content).Multiply;
                System.Double rock = concret * 0.8;
                System.Double sand = concret * 0.6;

                System.Double ironTotalCost = iron * ironCost;
                System.Double cementTotalCost = cement * cementCost;
                System.Double rockTotalCost = rock * rockCost;
                System.Double sandTotalCost = sand * sandCost;

                miscCost = Unit.MathMisc(ironTotalCost + cementTotalCost + rockTotalCost + sandTotalCost);

                System.Double total = ironTotalCost + cementTotalCost + rockTotalCost + sandTotalCost + miscCost;

                //outputs
                txOConcrete1.Text = concret.ToString("###,###,###.##");
                txOIron1.Text = iron.ToString("###,###,###.##");
                txOCement1.Text = cement.ToString("###,###,###.##");
                txORock1.Text = rock.ToString("###,###,###.##");
                txOSand1.Text = sand.ToString("###,###,###.##");
                txIMiscTotalCost1.Text = System.Convert.ToInt32(miscCost).ToString();

                txOCementTotalCost1.Text = cementTotalCost.ToString("###,###,###");
                txOIronTotalCost1.Text = ironTotalCost.ToString("###,###,###");
                txORockTotalCost1.Text = rockTotalCost.ToString("###,###,###");
                txOSandTotalCost1.Text = sandTotalCost.ToString("###,###,###");

                txOTotalCost1.Text = total.ToString("###,###,###");

                MathTotal();
            }
            catch
            {
            }
        }

        private void Math2()
        {
            try
            {
            //inputs
            System.Double tall, width, height, multi;
            System.Double ironCost, cementCost, rockCost, sandCost, miscCost;

            System.Double.TryParse(txITall2.Text, out tall);
            System.Double.TryParse(txIWidth2.Text, out width);
            System.Double.TryParse(txIHeight2.Text, out height);

            tall *= ((Unit)(((System.Windows.Controls.ComboBoxItem)cmITall2.SelectedItem).Content)).Multiply;
            width *= ((Unit)((System.Windows.Controls.ComboBoxItem)cmIWidth2.SelectedItem).Content).Multiply;
            height *= ((Unit)((System.Windows.Controls.ComboBoxItem)cmIHeight2.SelectedItem).Content).Multiply;

            System.Double.TryParse(txIIronCost2.Text, out ironCost);
            System.Double.TryParse(txICementCost2.Text, out cementCost);
            System.Double.TryParse(txIRockCost2.Text, out rockCost);
            System.Double.TryParse(txISandCost2.Text, out sandCost);
            System.Double.TryParse(txIMiscTotalCost2.Text, out miscCost);

            multi = System.Double.Parse(txINum2.Text);

            //equalation
            System.Double concret = tall * width * height * multi;
            System.Double iron = concret * 100 / ((Unit)((System.Windows.Controls.ComboBoxItem)cmOIron2.SelectedItem).Content).Multiply;
            System.Double cement = (concret * 350) / ((Unit)((System.Windows.Controls.ComboBoxItem)cmOCement2.SelectedItem).Content).Multiply;
            System.Double rock = concret * 0.8;
            System.Double sand = concret * 0.6;

            System.Double ironTotalCost = iron * ironCost;
            System.Double cementTotalCost = cement * cementCost;
            System.Double rockTotalCost = rock * rockCost;
            System.Double sandTotalCost = sand * sandCost;

            miscCost = Unit.MathMisc(ironTotalCost + cementTotalCost + rockTotalCost + sandTotalCost);

            System.Double total = ironTotalCost + cementTotalCost + rockTotalCost + sandTotalCost + miscCost;

            //outputs
            txOConcrete2.Text = concret.ToString("###,###,###.##");
            txOIron2.Text = iron.ToString("###,###,###.##");
            txOCement2.Text = cement.ToString("###,###,###.##");
            txORock2.Text = rock.ToString("###,###,###.##");
            txOSand2.Text = sand.ToString("###,###,###.##");
            txIMiscTotalCost2.Text = System.Convert.ToInt32(miscCost).ToString();

            txOCementTotalCost2.Text = cementTotalCost.ToString("###,###,###");
            txOIronTotalCost2.Text = ironTotalCost.ToString("###,###,###");
            txORockTotalCost2.Text = rockTotalCost.ToString("###,###,###");
            txOSandTotalCost2.Text = sandTotalCost.ToString("###,###,###");

            txOTotalCost2.Text = total.ToString("###,###,###");

            MathTotal();
            }
            catch
            {
            }
        }

        private void Math3(System.Boolean isCubeSender)
        {
            try
            {
                //preprocessing inputs
                if (isCubeSender)
                    txISpace3.Text = (System.Convert.ToDouble(txICube3.Text) * 3).ToString();
                else
                    txICube3.Text = (System.Convert.ToDouble(txISpace3.Text) / 3).ToString();

                //inputs
                System.Double cube, ironPM, cementPM;
                System.Double ironCost, cementCost, miscCost;

                System.Double.TryParse(txICube3.Text, out cube);
                System.Double.TryParse(cmIIronConcentrate3.Text, out ironPM);
                System.Double.TryParse(cmICementConcentrate3.Text, out cementPM);

                ironPM *= ((Unit)(((System.Windows.Controls.ComboBoxItem)cmIIron3.SelectedItem).Content)).Multiply;
                cementPM *= ((Unit)(((System.Windows.Controls.ComboBoxItem)cmICement3.SelectedItem).Content)).Multiply;
                
                System.Double.TryParse(txIIronCost3.Text,out ironCost);
                System.Double.TryParse(txICementCost3.Text,out cementCost);
                System.Double.TryParse(txIMiscTotalCost3.Text,out miscCost);

                //equalation
                System.Double iron = ironPM * cube / ((Unit)((System.Windows.Controls.ComboBoxItem)cmOIron3.SelectedItem).Content).Multiply;
                System.Double cement = cementPM * cube / ((Unit)((System.Windows.Controls.ComboBoxItem)cmOCement3.SelectedItem).Content).Multiply;

                System.Double ironTotalCost = iron * ironCost;
                System.Double cementTotalCost = cement * cementCost;

                miscCost = Unit.MathMisc(ironTotalCost + cementTotalCost);

                System.Double total = ironTotalCost + cementTotalCost + miscCost;

                //outputs
                txOIron3.Text = iron.ToString("###,###,###.##");
                txOCement3.Text = cement.ToString("###,###,###.##");
                txOIronTotalCost3.Text = ironTotalCost.ToString("###,###,###");
                txOCementTotalCost3.Text = cementTotalCost.ToString("###,###,###");
                txIMiscTotalCost3.Text = System.Convert.ToInt32(miscCost).ToString();
                txOTotalCost3.Text = total.ToString("###,###,###");

                MathTotal();
            }
            catch
            {
            }
        }

        private void MathTotal()
        {
            //inputs
            System.Double total1, total2, total3;

            System.Double.TryParse(txOTotalCost1.Text, out total1);
            System.Double.TryParse(txOTotalCost2.Text, out total2);
            System.Double.TryParse(txOTotalCost3.Text, out total3);

            //function
            System.Double total = total1 + total2 + total3;

            //outputs
            txOTotal.Text = total.ToString("###,###,###");
        }

        private void AddComboUnit(System.Windows.Controls.ComboBox comboBox, Unit comboUnit)
        {
            System.Windows.Controls.ComboBoxItem cbi = new System.Windows.Controls.ComboBoxItem();
            cbi.Content = comboUnit;
            cbi.Background = new System.Windows.Media.SolidColorBrush(comboUnit.Background);
            cbi.Foreground = new System.Windows.Media.SolidColorBrush(comboUnit.Foreground);
            comboBox.Items.Add(cbi);
        }
    }
}
