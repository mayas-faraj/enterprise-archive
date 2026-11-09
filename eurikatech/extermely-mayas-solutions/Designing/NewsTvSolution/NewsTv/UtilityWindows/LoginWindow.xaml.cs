using NewsTv;
using NewsTv.Codes;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace UtilityWindows
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window, ILoginWindow
    {
        //public constructions region
        public LoginWindow()
        {
            InitializeComponent();
  
            //private properties values
            isClicked = false;
            isKeypadOpen = false;
            isUsersOpen = false;
            focusedText = txName;
            defaultSource = imageUser.Source;
            ServersVisible = System.Windows.Visibility.Collapsed;
            HeaderContent = "TV News Program";
            FooterContent = "programmed by: Mayas Faraj, COD";

            //animations defentions
            keypadAnimation = new System.Windows.Media.Animation.DoubleAnimation();
            usersAnimation = new System.Windows.Media.Animation.DoubleAnimation();

            keypadAnimation.Duration = new Duration(TimeSpan.FromSeconds(1.5));
            keypadAnimation.DecelerationRatio = 1;
            keypadAnimation.Completed += keypadAnimation_Completed;

            usersAnimation.Duration = new Duration(TimeSpan.FromSeconds(1.5));
            usersAnimation.DecelerationRatio = 1;
            usersAnimation.Completed += usersAnimation_Completed;
  
            //appliying default values           
            draw();

            User user1 = new User();
            user1.Name = "mayas1";
            user1.ImagePath = "e:\\(4).png";

            User user2 = new User();
            user2.Name = "mayas2";
            user2.ImagePath = "e:\\(5).png";

            this.AddUser(user1);
            this.AddUser(user2);    
        }

        static LoginWindow()
        {
            //dependency properties defentions and default values
            LoginWidthProperty = DependencyProperty.Register("LoginWidth", typeof(Double), typeof(Window), new PropertyMetadata(350D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LoginHeightProperty = DependencyProperty.Register("LoginHeight", typeof(Double), typeof(Window), new PropertyMetadata(240D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LogoShiftPercentProperty = DependencyProperty.Register("LogoShiftPercent", typeof(Double), typeof(Window), new PropertyMetadata(-.8D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LogoIntersectPercentProperty = DependencyProperty.Register("LogoIntersectPercent", typeof(Double), typeof(Window), new PropertyMetadata(0.08D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            KeypadIntersectPercentProperty = DependencyProperty.Register("KeypadIntersectPercent", typeof(Double), typeof(Window), new PropertyMetadata(0.03D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            UsersIntersectPercentProperty = DependencyProperty.Register("UsersIntersectPercent", typeof(Double), typeof(Window), new PropertyMetadata(0.03D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LogoWidthPercentProperty = DependencyProperty.Register("LogoWidthPercent", typeof(Double), typeof(Window), new PropertyMetadata(.22D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LogoHeightPercentProperty = DependencyProperty.Register("LogoHeightPercent", typeof(Double), typeof(Window), new PropertyMetadata(.4D, new PropertyChangedCallback(dependencyPropertiesChanged)));
        }

        //public properties region
        public Double LoginWidth
        {
            get
            {
                return (Double)this.GetValue(LoginWidthProperty);
            }
            set
            {
                this.SetValue(LoginWidthProperty, value);
            }
        }

        public Double LoginHeight
        {
            get
            {
                return (Double)this.GetValue(LoginHeightProperty);
            }
            set
            {
                this.SetValue(LoginHeightProperty, value);
            }
        }

        public Visibility ImageVisible
        {
            get
            {
                return imageUser.Visibility;
            }

            set
            {
                imageUser.Visibility = value;
            }
        }

        public Visibility UsersVisible
        {
            get
            {
                return usersPanel.Visibility;
            }

            set
            {
                usersPanel.Visibility = value;
            }
        }

        public Visibility KeypadVisible
        {
            get
            {
                return keypadPanel.Visibility;
            }

            set
            {
                keypadPanel.Visibility = value;
            }
        }

        public Visibility LogoVisible
        {
            get
            {
                return logoPanel.Visibility;
            }

            set
            {
                logoPanel.Visibility = value;
            }
        }

        public Visibility UserNameVisible
        {
            get
            {
                return txName.Visibility;
            }

            set
            {
                tbName.Visibility = txName.Visibility = value;
            }
        }

        public Visibility PasswordVisible
        {
            get
            {
                return txPassword.Visibility;
            }

            set
            {
                tbPassword.Visibility = txPassword.Visibility = value;
            }
        }

        public Visibility ServersVisible
        {
            get
            {
                return cmServers.Visibility;
            }

            set
            {
                tbServers.Visibility = cmServers.Visibility = value;
            }
        }

        public Visibility ButtonLoginVisible
        {
            get
            {
                return btnLogin.Visibility;
            }

            set
            {
                btnLogin.Visibility = value;
            }
        }

        public Visibility ButtonClearVisible
        {
            get
            {
                return btnClear.Visibility;   
            }
            set
            {
                btnClear.Visibility = value;
            }
        }

        public Visibility ButtonExitVisible
        {
            get
            {
                return btnExit.Visibility;
            }
            set
            {
                btnExit.Visibility = value;
            }
        }
  
        public Visibility ButtonUsersVisible
        {
            get
            {
                return btnUsers.Visibility;
            }
            set
            {
                btnUsers.Visibility = value;
            }
        }

        public Visibility ButtonKeypadVisible
        {
            get
            {
                return btnKeypad.Visibility;
            }
            set
            {
                btnKeypad.Visibility = value;
            }
        }

        public String UserNameText
        {
            get
            {
                return tbName.Text;
            }
            set
            {
                tbName.Text = value;
            }
        }

        public String PasswordText
        {
            get
            {
                return tbPassword.Text;
            }
            set
            {
                tbPassword.Text = value;
            }
        }

        public String ServersText
        {
            get
            {
                return tbServers.Text;
            }
            set
            {
                tbServers.Text = value;
            }
        }

        public String ButtonLoginText
        {
            get
            {
                return Convert.ToString(btnLogin.Content);
            }
            set
            {
                btnLogin.Content = value;
            }
        }

        public String ButtonClearText
        {
            get
            {
                return Convert.ToString(btnClear.Content);
            }
            set
            {
                btnClear.Content = value;
            }
        }

        public String ButtonExitText
        {
            get
            {
                return Convert.ToString(btnExit.Content);
            }
            set
            {
                btnExit.Content = value;
            }
        }

        public Object HeaderContent
        {
            get
            {
                return header.Content;
            }
            set
            {
                header.Content = value;
            }
        }

        public Object FooterContent
        {
            get
            {
                return footer.Content;
            }
            set
            {
                footer.Content = value;
            }
        }

        public Double LogoShiftPercent
        {
            get
            {
                return (Double)this.GetValue(LogoShiftPercentProperty);
            }
            set
            {
                this.SetValue(LogoShiftPercentProperty, value);
            }
        }

        public Double LogoIntersectPercent
        {
            get
            {
                return (Double)this.GetValue(LogoIntersectPercentProperty);
            }
            set
            {
                this.SetValue(LogoIntersectPercentProperty, value);
            }
        }

        public Double KeypadIntersectPercent
        {
            get
            {
                return (Double)this.GetValue(KeypadIntersectPercentProperty);
            }
            set
            {
                this.SetValue(KeypadIntersectPercentProperty, value);
            }
        }

        public Double UsersIntersectPercent
        {
            get
            {
                return (Double)this.GetValue(UsersIntersectPercentProperty);
            }
            set
            {
                this.SetValue(UsersIntersectPercentProperty, value);
            }
        }

        public Double LogoWidthPercent
        {
            get
            {
                return (Double)this.GetValue(LogoWidthPercentProperty);
            }
            set
            {
                this.SetValue(LogoWidthPercentProperty, value);
            }
        }

        public Double LogoHeightPercent
        {
            get
            {
                return (Double)this.GetValue(LogoHeightPercentProperty);
            }
            set
            {
                this.SetValue(LogoHeightPercentProperty, value);
            }
        }

        //public functions region`
        public void AddUser(User user)
        {
            StackPanel userStack = user.ToStackPanet(this.Resources);
            usersWrapPanel.Children.Add(userStack);

            userStack.Cursor = Cursors.Hand;
            userStack.Tag = user;
            userStack.MouseUp += userStack_MouseUp;
        }
        
        public void RemoveUserAt(Int32 index)
        {
            usersWrapPanel.Children.RemoveAt(index);
        }

        public void ClearUsers()
        {
            usersWrapPanel.Children.Clear();
        }

        public void SetUser(User user)
        {
            this.user = user;

            txName.Text = user.Name;
            imageUser.Source = Library.LoadUserImage(user.ImagePath);
        }

        //public dependency properties
        public static readonly DependencyProperty LoginWidthProperty;
        public static readonly DependencyProperty LoginHeightProperty;
        public static readonly DependencyProperty LogoShiftPercentProperty;
        public static readonly DependencyProperty LogoIntersectPercentProperty;
        public static readonly DependencyProperty KeypadIntersectPercentProperty;
        public static readonly DependencyProperty UsersIntersectPercentProperty;
        public static readonly DependencyProperty LogoWidthPercentProperty;
        public static readonly DependencyProperty LogoHeightPercentProperty;

        //private events region
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            isClicked = true;

            top = e.GetPosition(this).Y;
            left = e.GetPosition(this).X;
        }

        private void Window_MouseMove(object sender, MouseEventArgs e)
        {
            if (isClicked)
            {
                this.Opacity = .75;
                this.Top += e.GetPosition(this).Y - top;
                this.Left += e.GetPosition(this).X - left;
            }
        }

        private void Window_MouseUp(object sender, MouseButtonEventArgs e)
        {
            this.Opacity = 1;
            isClicked = false;
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            Profile p1 = new Profile("mayas profile");
            p1.Image = "e:\\(1).png";

            NewsTv.MainWindow main = new NewsTv.MainWindow(p1, this.user, this);
            
            main.Show();
            this.Hide();
        }

        private void btnKeypad_Click(object sender, RoutedEventArgs e)
        {
            keypadAnimation.From = Convert.ToDouble(keypadPanel.GetValue(Canvas.LeftProperty));

            if (isKeypadOpen)
                keypadAnimation.To = keypadFrom;
            else
                keypadAnimation.To = keypadTo;

            isKeypadOpen = !isKeypadOpen;

            keypadPanel.BeginAnimation(Canvas.LeftProperty, keypadAnimation);
        }

        private void btnUsers_Click(object sender, RoutedEventArgs e)
        {
            usersAnimation.From = Convert.ToDouble(usersPanel.GetValue(Canvas.TopProperty));

            if (isUsersOpen)
                usersAnimation.To = usersFrom;
            else
                usersAnimation.To = usersTo;

            isUsersOpen = !isUsersOpen;

            usersPanel.BeginAnimation(Canvas.TopProperty, usersAnimation);
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            txName.Clear();
            txPassword.Clear();
            imageUser.Source = defaultSource;
            user = null;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnKey_Click(object sender, RoutedEventArgs e)
        {
            if (((Button)sender).Name == "btnBs")
            {
                if (focusedText == txPassword)
                {
                    if (txPassword.Password != "")
                        txPassword.Password = txPassword.Password.Substring(0, txPassword.Password.Length - 1);
                }
                else
                    if (txName.Text != "")
                        txName.Text = txName.Text.Substring(0, txName.Text.Length - 1);
            }
            else
            {
                if (focusedText == txPassword)
                    txPassword.Password += Convert.ToString(((Button)sender).Content);
                else
                    txName.Text += Convert.ToString(((Button)sender).Content);
            }
        }

        private void textBox_GotFocus(object sender, RoutedEventArgs e)
        {
            focusedText = txName;
        }

        private void password_GotFocus(object sender, RoutedEventArgs e)
        {
            focusedText = txPassword;
        }

        private void usersAnimation_Completed(object sender, EventArgs e)
        {
            if (isUsersOpen)
            {
                usersAnimation.From = usersFrom;
                usersAnimation.To = usersTo;
            }
            else
            {
                usersAnimation.From = usersFrom;
                usersAnimation.To = usersTo;
            }
        }

        private void keypadAnimation_Completed(object sender, EventArgs e)
        {
            if (isKeypadOpen)
            {
                keypadAnimation.From = keypadFrom;
                keypadAnimation.To = keypadTo;
            }
            else
            {
                keypadAnimation.From = keypadFrom;
                keypadAnimation.To = keypadTo;
            }
        }

        private void userStack_MouseUp(object sender, MouseButtonEventArgs e)
        {
            this.SetUser((User)((StackPanel)sender).Tag);
        }

        private static void dependencyPropertiesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            LoginWindow login = (LoginWindow)sender;
            login.draw();
        }

        //private functions region
        private void draw()
        {
            //defention
            Double x0, x, y, loginX, loginY, logoX, logoY;

            //layer orders
            Canvas.SetZIndex(logoPanel, 3);
            Canvas.SetZIndex(usersPanel, 1);
            Canvas.SetZIndex(keypadPanel, 0);
            Canvas.SetZIndex(loginGrid, 2);

            //login grid and logo panel dimentions
            loginGrid.Width = LoginWidth;
            loginGrid.Height = LoginHeight;

            logoPanel.Width = LoginWidth * LogoWidthPercent;
            logoPanel.Height = LoginHeight * LogoHeightPercent;

            x0 = (LoginWidth - logoPanel.Width) / 2;
            x = x0 + (LogoShiftPercent * (logoPanel.Width + LoginWidth) / 2);
            y = (LogoIntersectPercent * LoginHeight) - logoPanel.Height;

            if (x > 0)
            {
                loginX = 0;
                logoX = x;
            }
            else
            {
                loginX = -x;
                logoX = 0;
            }

            Canvas.SetLeft(loginGrid, loginX);
            Canvas.SetLeft(logoPanel, logoX);

            if (y > 0)
            {
                loginY = 0;
                logoY = y;
            }
            else
            {
                loginY = -y;
                logoY = 0;
            }

            Canvas.SetTop(loginGrid, loginY);
            Canvas.SetTop(logoPanel, logoY);

            //keypad dimentions & animations
            keypadPanel.Width = LoginWidth *KEYPAD_WIDTH_PERCENT;
            keypadPanel.Height = LoginHeight * KEYPAD_HEIGHT_PERCENT;
            keypadFrom = loginX + LoginWidth * (1 + KeypadIntersectPercent) - keypadPanel.Width;
            keypadTo = keypadFrom + keypadPanel.Width - (2 * KeypadIntersectPercent * LoginWidth);

            Canvas.SetLeft(keypadPanel, keypadFrom);
            Canvas.SetTop(keypadPanel, loginY + ((.9 - KEYPAD_HEIGHT_PERCENT) * LoginHeight));
            
            //users dimentions & animations
            usersPanel.Width = LoginWidth * USERS_WIDTH_PERCENT;
            usersPanel.Height = LoginHeight * USERS_HEIGHT_PERCENT;
            usersFrom = loginY + LoginHeight * (1 + UsersIntersectPercent) - usersPanel.Height;
            usersTo = usersFrom + usersPanel.Height - (2 * UsersIntersectPercent * LoginWidth);

            Canvas.SetLeft(usersPanel, loginX + ((.9 - USERS_WIDTH_PERCENT) * LoginWidth));
            Canvas.SetTop(usersPanel, usersFrom);         
        }

        //privte fields region
        private User user;
        private Boolean isClicked;
        public Boolean isKeypadOpen, isUsersOpen;
        private Double top, left;
        private Double keypadFrom, keypadTo;
        private Double usersFrom, usersTo;
        private Control focusedText;
        private ImageSource defaultSource;
        private System.Windows.Media.Animation.DoubleAnimation keypadAnimation;
        private System.Windows.Media.Animation.DoubleAnimation usersAnimation;

        //private constant region
        private const Double KEYPAD_WIDTH_PERCENT = .5;
        private const Double KEYPAD_HEIGHT_PERCENT = .7;
        private const Double USERS_WIDTH_PERCENT = .7;
        private const Double USERS_HEIGHT_PERCENT = 0.9;  
    }

    public interface ILoginWindow
    {
        Double LoginWidth
        {
            get;
            set;
        }

        Double LoginHeight
        {
            get;
            set;
        }

        Visibility ImageVisible
        {
            get;
            set;
        }

        Visibility UsersVisible
        {
            get;
            set;
        }

        Visibility KeypadVisible
        {
            get;
            set;
        }

        Visibility LogoVisible
        {
            get;
            set;
        }

        Visibility UserNameVisible
        {
            get;
            set;
        }

        Visibility PasswordVisible
        {
            get;
            set;
        }

        Visibility ServersVisible
        {
            get;
            set;
        }

        Visibility ButtonLoginVisible
        {
            get;
            set;
        }

        Visibility ButtonClearVisible
        {
            get;
            set;
        }

        Visibility ButtonExitVisible
        {
            get;
            set;
        }

        Visibility ButtonUsersVisible
        {
            get;
            set;
        }

        Visibility ButtonKeypadVisible
        {
            get;
            set;
        }

        String UserNameText
        {
            get;
            set;
        }

        String PasswordText
        {
            get;
            set;
        }

        String ServersText
        {
            get;
            set;
        }

        String ButtonLoginText
        {
            get;
            set;
        }

        String ButtonClearText
        {
            get;
            set;
        }

        String ButtonExitText
        {
            get;
            set;
        }

        Double LogoShiftPercent
        {
            get;
            set;
        }

        Double LogoIntersectPercent
        {
            get;
            set;
        }

        Double KeypadIntersectPercent
        {
            get;
            set;
        }

        Double UsersIntersectPercent
        {
            get;
            set;
        }

        Double LogoWidthPercent
        {
            get;
            set;
        }

        Double LogoHeightPercent
        {
            get;
            set;
        }

        Object HeaderContent
        {
            get;
            set;
        }

        Object FooterContent
        {
            get;
            set;
        }

        void AddUser(User user);

        void RemoveUserAt(Int32 index);

        void ClearUsers();

        void SetUser(User user);
    }  
}
