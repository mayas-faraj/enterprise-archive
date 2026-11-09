using System;
using System.Windows;
using Microsoft.Win32;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Input;

namespace AutoShipmaster
{
    /// <summary>
    /// Interaction logic for frmMaps.xaml
    /// </summary>
    public partial class frmMaps : Window
    {
        //public constructure region
        public frmMaps(Window caller)
        {
            InitializeComponent();

            LoadMaps();
            setNewMode();

            callerWindow = caller;
        }

        //private functions region
        private void LoadMaps()
        {
            lsMaps.Items.Clear();
            Library.Option[] options;
            Library.Database.Load(out options);

            if (options != null)
                for (int i = 0; i < options.Length; i++)
                    lsMaps.Items.Add(options[i]);
        }

        private void setEditingMode()
        {
            btnAdd.IsEnabled = false;
            btnEdit.IsEnabled = true;
            btnDelete.IsEnabled = true;

            txName.Text = ((Library.Option)lsMaps.SelectedItem).Name;
            txWidth.Text = ((Library.Option)lsMaps.SelectedItem).Width.ToString();
            txHeight.Text = ((Library.Option)lsMaps.SelectedItem).Height.ToString();
            txScale.Text = ((Library.Option)lsMaps.SelectedItem).MapScale.ToString();
            imgMap.Source = new BitmapImage(new Uri(((Library.Option)lsMaps.SelectedItem).MapPath));

            Library.Color color = ((Library.Option)lsMaps.SelectedItem).PointColor;
            btnColor.Background = new SolidColorBrush(Color.FromArgb(color.A, color.R, color.G, color.B));
        }

        private void setNewMode()
        {
            btnAdd.IsEnabled = true;
            btnEdit.IsEnabled = false;
            btnDelete.IsEnabled = false;

            txName.Clear();
            txWidth.Clear();
            txHeight.Clear();
            txScale.Clear();
            imgMap.Source = null;
            btnColor.Background = new SolidColorBrush(Colors.Black);
            lsMaps.SelectedItem = null;

            txName.Focus();
        }

        //private events region
        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show(); 
            this.Close();
        }

        private void btnNew_Click(object sender, RoutedEventArgs e)
        {
            setNewMode();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
                if (txName.Text != "")
                    try
                    {
                        Library.Color color = new Library.Color(((SolidColorBrush)btnColor.Background).Color.A, ((SolidColorBrush)btnColor.Background).Color.R, ((SolidColorBrush)btnColor.Background).Color.G, ((SolidColorBrush)btnColor.Background).Color.B);
                        Library.Database.Save(new Library.Option(txName.Text,Convert.ToString(imgMap.Tag),float.Parse(txScale.Text),float.Parse(txWidth.Text),float.Parse(txHeight.Text),color));
                        MessageBox.Show(" تم إضافة الخريطة" + txName.Text + " بنجاح", "إضافة خريطة جديدة", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                        LoadMaps();
                        setNewMode();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "خطأ أثناء عملية الإدخال", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                else
                    MessageBox.Show("تتطلب عملية الإدخال قيمة غير فارغة في الأسم", "إضافة خريطة جديدة", MessageBoxButton.OK, MessageBoxImage.Information);
            }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (txName.Text != "")
                try
                {
                    Library.Color color = new Library.Color(((SolidColorBrush)btnColor.Background).Color.A, ((SolidColorBrush)btnColor.Background).Color.R, ((SolidColorBrush)btnColor.Background).Color.G, ((SolidColorBrush)btnColor.Background).Color.B);
                    Library.Database.Edit(new Library.Option(((Library.Option)lsMaps.SelectedItem).Id, txName.Text, Convert.ToString(imgMap.Tag), float.Parse(txScale.Text), float.Parse(txWidth.Text), float.Parse(txHeight.Text), color));
                    MessageBox.Show(" تم تعديل الخريطة" + ((Library.Option)lsMaps.SelectedItem).ToString() + " بنجاح", "تعديل خريطة", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                    LoadMaps();
                    setNewMode();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "خطأ أثناء عملية التعديل", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            else
                MessageBox.Show("تتطلب عملية التعديل قيمة غير فارغة في الأسم", "تعديل خريطة", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Library.Database.Delete(new Library.Option(((Library.Option)lsMaps.SelectedItem).Id, "", "", 0, 0, 0, new Library.Color()));
                MessageBox.Show(" تم حذف الخريطة" + ((Library.Option)lsMaps.SelectedItem).ToString() + " بنجاح", "حذف خريطة", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                LoadMaps();
                setNewMode();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "خطأ أثناء عملية الحذف", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnLocation_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();

            ofd.Title = "مسار الخريطة...";
            ofd.Multiselect = false;
            ofd.Filter = "Images Files (*.jpg,*.bmp,*.gif,*.png,*.ico)|*.jpg;*.bmp;*.gif;*.png;*.ico";

            if (ofd.ShowDialog() == true)
            {
                imgMap.Source = new BitmapImage(new Uri(ofd.FileName));
                imgMap.Tag = ofd.FileName;
            }
        }

        private void btnColor_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void txNumeric_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            switch (e.Key)
            {
                case Key.D0:
                case Key.D1:
                case Key.D2:
                case Key.D3:
                case Key.D4:
                case Key.D5:
                case Key.D6:
                case Key.D7:
                case Key.D8:
                case Key.D9:
                case Key.NumPad0:
                case Key.NumPad1:
                case Key.NumPad2:
                case Key.NumPad3:
                case Key.NumPad4:
                case Key.NumPad5:
                case Key.NumPad6:
                case Key.NumPad7:
                case Key.NumPad8:
                case Key.NumPad9:
                case Key.Tab:
                    {
                        //do nothing
                        break;
                    }
                case Key.OemPeriod:
                case Key.Decimal:
                    {
                        if (((TextBox)sender).Text.IndexOf('.') > 0)
                            e.Handled = true;
                        break;
                    }
                default:
                    {
                        e.Handled = true;
                        break;
                    }
            }
        }

        private void txInteger_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == Key.OemPeriod || e.Key == Key.Decimal)
                e.Handled = true;
            else
                txNumeric_KeyDown(sender, e);
        }

        private void lsMaps_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lsMaps.SelectedItem != null)
            {
                setEditingMode();

                Library.Color color=((Library.Option)lsMaps.SelectedItem).PointColor;
                txName.Text = ((Library.Option)lsMaps.SelectedItem).Name;
                txScale.Text = ((Library.Option)lsMaps.SelectedItem).MapScale.ToString();
                txWidth.Text = ((Library.Option)lsMaps.SelectedItem).Width.ToString();
                txHeight.Text = ((Library.Option)lsMaps.SelectedItem).Height.ToString();
                btnColor.Background = new SolidColorBrush(Color.FromArgb(color.A, color.R, color.G, color.B));

                imgMap.Tag = ((Library.Option)lsMaps.SelectedItem).MapPath;
                imgMap.Source = new BitmapImage(new Uri(((Library.Option)lsMaps.SelectedItem).MapPath));
            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (callerWindow.Visibility != System.Windows.Visibility.Visible)
                callerWindow.Close();
        }

        //private fields region
        private Window callerWindow;
    }
}
