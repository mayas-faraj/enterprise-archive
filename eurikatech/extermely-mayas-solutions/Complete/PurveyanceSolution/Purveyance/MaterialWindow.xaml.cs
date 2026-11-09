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

namespace Purveyance
{
    /// <summary>
    /// Interaction logic for MaterialWindow.xaml
    /// </summary>
    public partial class MaterialWindow : Window
    {
        public MaterialWindow(Window callerWindow, Material material)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;

            if (material != null)
            {
                isEdit = true;
                materialId = material.Id;

                txName.Text = material.Name;
                txVendor.Text = material.DefaultVendor;
                txSellPrice.Text = material.DefaultSellPrice.ToString();
                txBuyPrice.Text = material.DefaultBuyPrice.ToString();
                txAmount.Text = material.DefaultAmount.ToString();

                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                    imgLogo.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/Logo/" + material.Name + ".gif"));
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show();

            this.Close();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            UI.Exit();
        }

        private void btnBrowse_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();

            ofd.Filter = "Animation Image File (*.gif)|*.gif";

            if (ofd.ShowDialog() == true)
            {
                imagePath = ofd.FileName;
                imgLogo.Source = new BitmapImage(new Uri(imagePath, UriKind.Absolute));
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (txName.Text != "")
            {
                Material material = new Material();

                material.Name = txName.Text;
                material.DefaultVendor = txVendor.Text;

                try
                {
                    material.DefaultBuyPrice = Convert.ToSingle(txBuyPrice.Text);
                    material.DefaultSellPrice = Convert.ToSingle(txSellPrice.Text);
                    material.DefaultAmount = Convert.ToSingle(txAmount.Text);

                    if (imagePath != null)
                        System.IO.File.Copy(imagePath, System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif"), true);

                }
                catch (Exception ex)
                {
                    UI.ErrorMessage(ex);
                }

                if (isEdit)
                {
                    material.Id = materialId;

                    try
                    {
                        Database.Update(material);
                    }
                    catch (Exception ex)
                    {
                        UI.ErrorMessage(ex);
                        return;
                    }
                }
                else
                {
                    try
                    {
                        Database.Save(material);
                    }
                    catch (Exception ex)
                    {
                        UI.ErrorMessage(ex);
                        return;
                    }
                }

                callerWindow.Show();
                this.Close();
            }
            else
                UI.InformationMessage("يجب أدخال أسم المادة قبل المتابعة بعملية الحفظ", "لم تتم عملية الحفظ");
        }

        private Window callerWindow;
        private String imagePath;
        private Boolean isEdit;
        private Int32 materialId;
    }
}
