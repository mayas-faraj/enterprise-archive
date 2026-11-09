namespace WpfTraining
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : System.Windows.Window
    {
        public Window1()
        {
            InitializeComponent();


            txt.Text = "Mayas!";
            System.Windows.Media.SolidColorBrush brush = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Colors.Green);
            txt.Foreground = brush;

            System.Windows.Controls.StackPanel pnl = new System.Windows.Controls.StackPanel();

            System.Windows.Controls.TextBlock tx = new System.Windows.Controls.TextBlock();
            tx.Text = "Mayas F";
            System.Windows.Controls.TextBlock tx2 = new System.Windows.Controls.TextBlock();
            tx2.Text = "other text";
            tx2.Background = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Colors.Red);

            pnl.Children.Add(tx);
            pnl.Children.Add(tx2);

            btn4.ToolTip = pnl;
            btn4.SetValue(System.Windows.Controls.ToolTipService.ShowDurationProperty, 3000);
        }

        private void buttons(object sender, System.Windows.RoutedEventArgs e)
        {
            if (e.Source.GetType() == typeof(System.Windows.Controls.Button))
            {
                if (e.Source == btnstar)
                    txt.Text = "";
                else
                    txt.Text += ((System.Windows.Controls.Primitives.ButtonBase)e.Source).Content.ToString();

                if (e.Source.GetType() == typeof(System.Windows.Controls.Primitives.ButtonBase))
                    System.Windows.DragDrop.DoDragDrop((System.Windows.Controls.Primitives.ButtonBase)e.Source, ((System.Windows.Controls.Primitives.ButtonBase)e.Source), System.Windows.DragDropEffects.Copy);
            }
        }

        private void Label_DragEnter_1(object sender, System.Windows.DragEventArgs e)
        {
            if (e.Data.GetDataPresent(typeof(System.Windows.Controls.Primitives.ButtonBase)))
                e.Effects = System.Windows.DragDropEffects.Link;
            else
                e.Effects = System.Windows.DragDropEffects.None;
        }

        private void Label_Drop_1(object sender, System.Windows.DragEventArgs e)
        {
            System.Windows.Controls.Primitives.ButtonBase btn = ((System.Windows.Controls.Primitives.ButtonBase)e.Data.GetData(typeof(System.Windows.Controls.Primitives.ButtonBase)));

            wrapPanel.Children.Remove(btn);

            ((System.Windows.Controls.WrapPanel)((System.Windows.Controls.Label)sender).Content).Children.Add((System.Windows.Controls.Primitives.ButtonBase)e.Data.GetData(typeof(System.Windows.Controls.Primitives.ButtonBase)));
        }
    }
}
