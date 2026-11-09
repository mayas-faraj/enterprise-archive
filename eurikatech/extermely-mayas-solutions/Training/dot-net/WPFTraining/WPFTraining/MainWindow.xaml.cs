namespace WPFTraining
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : System.Windows.Window
    {
        public MainWindow()
        {
            InitializeComponent();

            System.Windows.Media.LinearGradientBrush lgb = new System.Windows.Media.LinearGradientBrush();

            lgb.GradientStops.Add(new System.Windows.Media.GradientStop(System.Windows.Media.Colors.Green, 0));
            lgb.GradientStops.Add(new System.Windows.Media.GradientStop(System.Windows.Media.Colors.Red, 1));

            this.Background = lgb;

            lgb.GradientStops[0].Color = System.Windows.Media.Colors.Gray;

            System.Windows.Controls.Button btn = new System.Windows.Controls.Button();
            btn.Content = "Mayas";

            System.Windows.Controls.Grid.SetColumn(btn, 2);
            System.Windows.Controls.Grid.SetRow(btn, 2);

            masGrid.Children.Add(btn);           
        }

        private void btnClick(System.Object sender, System.Windows.RoutedEventArgs e)
        {
            this.Cursor = System.Windows.Input.Cursors.Wait;
            System.Threading.Thread.Sleep(System.TimeSpan.FromSeconds(1));
            this.Cursor = System.Windows.Input.Cursors.Arrow;

            System.Windows.FrameworkElement em = new System.Windows.FrameworkElement();
            System.Windows.Controls.ContentControl ctrl = new System.Windows.Controls.ToolTip();
           
        }

        private void button1_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            win1 win = new win1();
            win.Owner = this;
            win.Show();
          
        }

        private void button2_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            win2 win = new win2();
            win.Owner = this;
            win.Show();
        }

        private void btnTop_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            //scrollMain.ScrollToTop();
            //MayasContent content = new MayasContent();
            //this.Content = content;
            System.Windows.Forms.ColorDialog clr = new System.Windows.Forms.ColorDialog();
            if (clr.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                this.Background = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromArgb(clr.Color.A, clr.Color.R, clr.Color.G, clr.Color.B));
        }

        private void btnBottom_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            scrollMain.ScrollToBottom();
        }

        private void btnLUp_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            scrollMain.LineUp();
        }

        private void btnLDn_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            scrollMain.LineDown();
        }

        private void btnXX_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            scrollMain.ScrollToVerticalOffset(30);
        }

        private void btnNewPage_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            win1 win = new win1();
            win.ShowActivated = true;
        }

        private void btnHide1_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            expander1.IsExpanded = !expander1.IsExpanded;
        }

        private void Mayaso_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            win1 win = new win1();
            win.Show();
        }

        private void grd_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            System.Array arr = null;
            grd.ItemsSource = arr;
            arr = new System.String[] { "Mayas", "Hetler", "Strlin" };
        }

        private void expander1_Expanded(object sender, System.Windows.RoutedEventArgs e)
        {

        }
    }

    public class MayasContent : System.Windows.Controls.ContentControl
    {
        public MayasContent()
        {
            System.Windows.Controls.StackPanel grid = new System.Windows.Controls.StackPanel();
            this.Content = grid;
            this.Background = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Colors.LightBlue);
            this.Foreground = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Colors.Pink);
            this.FontSize = 20;
            this.Margin = new System.Windows.Thickness(20);

            System.Windows.Controls.Button btn = new System.Windows.Controls.Button();
            btn.Content = "NEW BUTTON";
            
            System.Windows.Controls.TextBox tx = new System.Windows.Controls.TextBox();
            tx.Text = "Mayas Faraj";

            grid.Background = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Colors.Red);
            grid.Children.Add(btn);
            grid.Children.Add(tx);
        }
    }
}
