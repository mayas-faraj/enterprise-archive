namespace ClientApplication
{
    /// <summary>
    /// Interaction logic for PringConfigure.xaml
    /// </summary>
    public partial class PrintWindow : System.Windows.Window
    {
        internal class ItemColor
        {
            public ItemColor(System.String name, System.String code, System.Windows.Media.Color backColor)
            {
                Name = name;
                Code = code;
                BackColor = backColor;
            }

            public System.String Name
            { get; set; }

            public System.String Code
            { get; set; }

            public System.Windows.Media.Color BackColor
            { get; set; }

            public override System.String ToString()
            {
                return Name;
            }
        }

        private Info info;

        public PrintWindow()
        {
            InitializeComponent();
        }

        public PrintWindow(Info printInfo)
            : this()
        {
            //default values
            info = printInfo;

            ItemColor[] colors = new ItemColor[8];
            colors[0] = new ItemColor("أسود", "#000000", System.Windows.Media.Color.FromRgb(0, 0, 0));
            colors[1] = new ItemColor("أحمر", "#ff0000", System.Windows.Media.Color.FromRgb(255, 0, 0));
            colors[2] = new ItemColor("أخضر", "#00ff00", System.Windows.Media.Color.FromRgb(0, 255, 0));
            colors[3] = new ItemColor("أزرق", "#0000ff", System.Windows.Media.Color.FromRgb(0, 0, 255));
            colors[4] = new ItemColor("أصفر", "#ffff00", System.Windows.Media.Color.FromRgb(255, 255, 0));
            colors[5] = new ItemColor("نهدي", "#ff00ff", System.Windows.Media.Color.FromRgb(255, 0, 255));
            colors[6] = new ItemColor("سماوي", "#00ffff", System.Windows.Media.Color.FromRgb(0, 255, 255));
            colors[7] = new ItemColor("أبيض", "#ffffff", System.Windows.Media.Color.FromRgb(255, 255, 255));

            addComboItems(cmDataColor, colors);
            addComboItems(cmTableColor, colors);
            addComboItems(cmTitlesColor, colors);

            for (System.Int32 i = 0; i <= 10; i++)
            {
                System.Windows.Controls.ComboBoxItem item = new System.Windows.Controls.ComboBoxItem();
                System.Byte n = System.Convert.ToByte(255 - (i * 12));
                item.Content = i;
                item.Background = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromRgb(n, n, n));
                cmBorderWidth.Items.Add(item);
            }

            cmBorderWidth.SelectedIndex = 1;
        }

        //defined functions

        private void addComboItems(System.Windows.Controls.ComboBox comboBox, ItemColor[] colors)
        {
            for (System.Int32 i = 0; i < colors.Length; i++)
            {
                System.Windows.Controls.ComboBoxItem item = new System.Windows.Controls.ComboBoxItem();
                item.Content = colors[i];
                item.Background = new System.Windows.Media.LinearGradientBrush(colors[i].BackColor, System.Windows.Media.Color.FromRgb(255, 255, 255), 0);
                item.Foreground = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromRgb(System.Convert.ToByte(255 - colors[i].BackColor.R), System.Convert.ToByte(255 - colors[i].BackColor.G), System.Convert.ToByte(255 - colors[i].BackColor.B)));
                comboBox.Items.Add(item);
            }
            comboBox.SelectedIndex = 0;
        }

        private System.String tm(System.String number1, System.String number2)
        {
            System.Double n1, n2;

            if (!System.Double.TryParse(number1, out n1) && number1 != "")
            {
                number1 = number1.Substring(0, number1.IndexOf(' '));
                if (!System.Double.TryParse(number1, out n1))
                    return "";
            }

            if (!System.Double.TryParse(number2, out n2) && number2 != "")
            {
                number2 = number2.Substring(0, number2.IndexOf(' '));
                if (!System.Double.TryParse(number2, out n2))
                    return "";
            }

            return (n1 * n2).ToString();
        }

        //framword element events

        private void btnCancel_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnPring_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            System.String borderWidth = ((System.Windows.Controls.ComboBoxItem)cmBorderWidth.SelectedItem).Content.ToString();
            System.String titleColor = ((ItemColor)((System.Windows.Controls.ComboBoxItem)cmTitlesColor.SelectedItem).Content).Code;
            System.String dataColor = ((ItemColor)((System.Windows.Controls.ComboBoxItem)cmDataColor.SelectedItem).Content).Code;
            System.String tableColor = ((ItemColor)((System.Windows.Controls.ComboBoxItem)cmTableColor.SelectedItem).Content).Code;

            System.IO.FileStream fs = new System.IO.FileStream("printPreview.htm", System.IO.FileMode.Create, System.IO.FileAccess.Write);
            System.IO.StreamWriter sw = new System.IO.StreamWriter(fs);

            sw.WriteLine("<html dir=\"rtl\"><head><title>معاينة الطباعة</title>");
            sw.WriteLine("<style type=\"text/css\"> .header {font-family:impact;font-size:14pt;font-weight:bold}.subHeader {font-family:times new roman;font-size:13pt;font-weight:bold;color:" + titleColor + "}");
            sw.WriteLine(".text {font-family:traditional arabic;font-size:12pt;color:" + dataColor + "}.headText {font-family:traditional arabic;font-size:12pt;font-weight:bold;color:" + dataColor + "}");
            sw.WriteLine("</style></head><body><table width=\"95%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td class=\"header\">شـــــــركــة الكــفــــري<br/>لــتجارة العقـارات والتسويق العقاري عبر الأنترنت</td><td>");

            if (chkShowTitle.IsChecked == true)
                sw.WriteLine("<img src=\"header.gif\" width=\"50\" height=\"50\" align=\"left\"/><br/><br/>");

            sw.WriteLine("</td></tr></table><br/><center>");

            if (txTitle.Text != "")
                sw.WriteLine("<table border=\"" + borderWidth + "\" style=\"border-color:" + tableColor + "\" cellspacing=\"0\" cellpadding=\"4\"><tr><td class=\"header\">" + txTitle.Text + "</td></tr></table></center><br/>");

            if (info.I1Total != "0" && info.I1Total != "")
            {
                sw.WriteLine("<center><div class=\"subHeader\">تكاليف البلاطة</div><br/>");
                sw.WriteLine("<table style=\"border-color:" + tableColor + "\" border=\"" + borderWidth + "\" class=\"text\" width=\"90%\" cellspacing=\"0\" cellpadding=\"2\">");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">المادة</td><td class=\"headText\">الكمية</td><td class=\"headText\">الكلفة بالواحدة</td><td class=\"headText\">المجموع</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">حديد</td><td>" + info.I1IronLot + "</td><td>" + info.I1IronCost + "</td><td>" + tm(info.I1IronCost, info.I1IronLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">أسمنت</td><td>" + info.I1CementLot + "</td><td>" + info.I1CementCost + "</td><td>" + tm(info.I1CementCost, info.I1CementLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">بحص</td><td>" + info.I1RockLot + "</td><td>" + info.I1RockCost + "</td><td>" + tm(info.I1RockCost, info.I1RockLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">رمل</td><td>" + info.I1SandLot + "</td><td>" + info.I1SandCost + "</td><td>" + tm(info.I1SandCost, info.I1SandLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">متفرقات</td><td colspan=\"2\">&nbsp;</td><td>" + info.I1Misc + "</td></tr></table>");
                sw.WriteLine("<span class=\"text\">المجموع الكلي : " + info.I1Total + "</span><br /><hr width=\"90%\" /><br />");
            }

            if (info.I2Total != "0" && info.I2Total != "")
            {
                sw.WriteLine("<div class=\"subHeader\">تكاليف الأعمدة والأساسات</div><br/>");
                sw.WriteLine("<table style=\"border-color:" + tableColor + "\" border=\"" + borderWidth + "\" class=\"text\" width=\"90%\" cellspacing=\"0\" cellpadding=\"2\">");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">المادة</td><td class=\"headText\">الكمية</td><td class=\"headText\">الكلفة بالواحدة</td><td>المجموع</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">حديد</td><td>" + info.I2IronLot + "</td><td>" + info.I2IronCost + "</td><td>" + tm(info.I2IronCost, info.I2IronLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">أسمنت</td><td>" + info.I2CementLot + "</td><td>" + info.I2CementCost + "</td><td>" + tm(info.I2CementCost, info.I2CementLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">بحص</td><td>" + info.I2RockLot + "</td><td>" + info.I2RockCost + "</td><td>" + tm(info.I2RockCost, info.I2RockLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">رمل</td><td>" + info.I2SandLot + "</td><td>" + info.I2SandCost + "</td><td>" + tm(info.I2SandCost, info.I2SandLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">متفرقات</td><td colspan=\"2\">&nbsp;</td><td>" + info.I2Misc + "</td></tr></table>");
                sw.WriteLine("<span class=\"text\">المجموع الكلي : " + info.I2Total + "</span><br /><hr width=\"90%\" /><br />");
            }

            if (info.I3Total != "0" && info.I3Total != "")
            {
                sw.WriteLine("<div class=\"subHeader\">تكاليف المسطحات</div><br/>");
                sw.WriteLine("<table style=\"border-color:" + tableColor + "\" border=\"" + borderWidth + "\" class=\"text\" width=\"90%\" cellspacing=\"0\" cellpadding=\"2\">");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">المادة</td><td class=\"headText\">الكمية</td><td class=\"headText\">الكلفة بالواحدة</td><td>المجموع</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">حديد</td><td>" + info.I3IronLot + "</td><td>" + info.I3IronCost + "</td><td>" + tm(info.I3IronCost, info.I3IronLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">أسمنت</td><td>" + info.I3CementLot + "</td><td>" + info.I3CementCost + "</td><td>" + tm(info.I3CementCost, info.I3CementLot) + "</td></tr>");
                sw.WriteLine("<tr align=\"center\"><td class=\"headText\">متفرقات</td><td colspan=\"2\">&nbsp;</td><td>" + info.I3Misc + "</td></tr></table>");
                sw.WriteLine("<span class=\"text\">المجموع الكلي : " + info.I3Total + "</span><br /><hr width=\"90%\" /><br />");
            }

            sw.WriteLine("<span class=\"text\">الكلفة الكلية للمشروع : " + info.ITotal + "</span><br /><hr width=\"90%\" /><br />");
            sw.WriteLine("<table width=\"90%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:bottom\">");
            sw.WriteLine("<tr><td align=\"right\" class=\"headText\">المهندس الدارس</td><td align=\"left\" class=\"headText\">رئيس مجلس الإدارة<br />م/حسين الكفري</td></tr>");
            sw.WriteLine("</table></center></body></html>");

            sw.Close();

            System.Diagnostics.Process.Start("printPreview.htm");

            this.Close();
        }
    }
}
