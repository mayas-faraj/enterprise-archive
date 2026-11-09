using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace NewsTv
{
    public abstract class BaseWindow : Window
    {
        //public constructures region
        public BaseWindow()
        {
            //default properties
            this.Resources = new ResourceDictionary();
            this.Resources.Source = new Uri("pack://application:,,,/utilityWindows/windowDictionary.xaml");
            this.Background = (Brush)Resources["backgrounds"];
            this.FontSize = (Double)Resources["textsSize"];

            this.Loaded += BaseWindow_Loaded;
        }

        public BaseWindow(Codes.Profile profile, Codes.User user, Window caller)
            : this()
        {
            this.profile = profile;
            this.user = user;
            this.caller = caller;
        }

        //public properties region
        public Window Caller
        {
            get
            {
                return caller;
            }
            set
            {
                caller = value;
            }
        }

        public Codes.Profile Profile
        {
            get
            {
                return profile;
            }
            set
            {
                profile = value;
            }
        }

        public Codes.User User
        {
            get
            {
                return user;
            }
            set
            {
                user = value;
            }
        }

        //private events region
        private void BaseWindow_Loaded(object sender, RoutedEventArgs e)
        {
            constructWindow();
        }

        private void btnAbout_Click(object sender, RoutedEventArgs e)
        {
            if (Variables.Global.AboutWindow == null || !Variables.Global.AboutWindow.IsVisible)
            {
                Variables.Global.AboutWindow = new UtilityWindows.AboutWindow();
                Variables.Global.AboutWindow.Show();
            }
            else
                Variables.Global.AboutWindow.Activate();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            caller.Show();
            this.Close();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void txLogout_MouseDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            UtilityWindows.LoginWindow login = new UtilityWindows.LoginWindow();

            login.Show();
            this.Close();
        }

        //private functions region
        private void constructWindow()
        {
            //get the content
            FrameworkElement element = this.Content as FrameworkElement;

            if (element != null)
            {
                //define window schema grid
                Grid grid = new Grid();

                RowDefinition headerRow = new RowDefinition();
                RowDefinition contentRow = new RowDefinition();
                RowDefinition footerRow = new RowDefinition();

                headerRow.Height = new GridLength(1, GridUnitType.Auto);
                contentRow.Height = new GridLength(1, GridUnitType.Star);
                footerRow.Height = new GridLength(1, GridUnitType.Auto);

                grid.RowDefinitions.Add(headerRow);
                grid.RowDefinitions.Add(contentRow);
                grid.RowDefinitions.Add(footerRow);

                //define header
                //header grid
                Grid header = new Grid();

                //header content: user panel
                if (user != null)
                {
                    ColumnDefinition userColumn = new ColumnDefinition();
                    userColumn.Width = new GridLength(1, GridUnitType.Auto);
                    header.ColumnDefinitions.Add(userColumn);

                    StackPanel userPanel = new StackPanel();
                    userPanel = user.ToStackPanet(this.Resources, 30, 30);
                    userPanel.Orientation = Orientation.Horizontal;

                    Grid.SetColumn(userPanel, 0);
                    header.Children.Add(userPanel);
                }

                //header content: profile panel
                if (profile != null)
                {
                    ColumnDefinition profileColumn = new ColumnDefinition();
                    profileColumn.Width = new GridLength(1, GridUnitType.Auto);
                    header.ColumnDefinitions.Add(profileColumn);


                    StackPanel profilePanel = new StackPanel();
                    profilePanel = profile.ToStackPanet(this.Resources, 30, 30);
                    profilePanel.Orientation = Orientation.Horizontal;

                    Grid.SetColumn(profilePanel, 1);
                    header.Children.Add(profilePanel);
                }

                //header content: empty area
                ColumnDefinition emptyColumn = new ColumnDefinition();
                emptyColumn.Width = new GridLength(1, GridUnitType.Star);
                header.ColumnDefinitions.Add(emptyColumn);

                //header content: logout link
                ColumnDefinition logoutColumn = new ColumnDefinition();
                logoutColumn.Width = new GridLength(1, GridUnitType.Auto);
                header.ColumnDefinitions.Add(logoutColumn);

                TextBlock txLogout = new TextBlock();
                txLogout.TextDecorations = TextDecorations.Underline;
                txLogout.MouseDown += txLogout_MouseDown;
                txLogout.Text = Variables.Consts.WORD_LOGOUT;

                Grid.SetColumn(txLogout, 3);
                header.Children.Add(txLogout);

                //add header content to the window
                Grid.SetRow(header, 0);
                grid.Children.Add(header);

                //define footer
                //footer grid
                Grid footer = new Grid();

                //footer content: exit button
                footer.ColumnDefinitions.Add(new ColumnDefinition());

                Button btnExit = new Button();
                btnExit.Content = Variables.Consts.WORD_EXIT;
                btnExit.Background = (Brush)Resources["buttons"];
                btnExit.Foreground = (Brush)Resources["buttonsText"];
                btnExit.Margin = (Thickness)Resources["margin"];
                btnExit.Click += btnExit_Click;

                Grid.SetColumn(btnExit, 0);
                footer.Children.Add(btnExit);


                //footer content: back button
                footer.ColumnDefinitions.Add(new ColumnDefinition());

                Button btnBack = new Button();
                btnBack.Content = Variables.Consts.WORD_BACK;
                btnBack.Background = (Brush)Resources["buttons"];
                btnBack.Foreground = (Brush)Resources["buttonsText"];
                btnBack.Margin = (Thickness)Resources["margin"];
                btnBack.Click += btnBack_Click;

                Grid.SetColumn(btnBack, 1);
                footer.Children.Add(btnBack);

                if (caller == null)
                    btnBack.IsEnabled = false;

                //footer content: about window
                footer.ColumnDefinitions.Add(new ColumnDefinition());

                Button btnAbout = new Button();
                btnAbout.Content = Variables.Consts.WORD_ABOUT;
                btnAbout.Background = (Brush)Resources["buttons"];
                btnAbout.Foreground = (Brush)Resources["buttonsText"];
                btnAbout.Margin = (Thickness)Resources["margin"];
                btnAbout.Click += btnAbout_Click;

                Grid.SetColumn(btnAbout, 2);
                footer.Children.Add(btnAbout);

                //add footer to the window
                Grid.SetRow(footer, 2);
                grid.Children.Add(footer);

                //set the main content in the middle of header and footer
                this.Content = null;
                Grid.SetRow(element, 1);
                grid.Children.Add(element);

                this.Content = grid;
            }
        }

        //private fields region
        private Window caller;
        private Codes.Profile profile;
        private Codes.User user;
    }
}
