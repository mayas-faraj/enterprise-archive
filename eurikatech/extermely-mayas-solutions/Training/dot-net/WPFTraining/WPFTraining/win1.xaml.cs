using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Speech.Synthesis;
using System.Windows.Media.Animation;

namespace WPFTraining
{
    /// <summary>
    /// Interaction logic for win1.xaml
    /// </summary>
    public partial class win1 : Window
    {
        Polygon mainPoly;

        /// <summary>
        /// win 1 usage here
        /// </summary>
        public win1()
        {
            InitializeComponent();

            LinearGradientBrush lgb = new LinearGradientBrush();
            LinearGradientBrush lgb2 = new LinearGradientBrush();
            DataGridTextColumn col1 = new DataGridTextColumn();
            DataGridCheckBoxColumn col2 = new DataGridCheckBoxColumn();
            DataGridHyperlinkColumn col3 = new DataGridHyperlinkColumn();
            DataGridTextColumn col4 = new DataGridTextColumn();
            Binding bindingNum = new Binding();

            bindingNum.Path = new PropertyPath("Value");
            bindingNum.ElementName = "slider";
            bindingNum.Mode = BindingMode.OneTime;

            txSlider.SetBinding(TextBox.TextProperty, bindingNum);

            lgb.StartPoint = new Point(0, 0);
            lgb.EndPoint = new Point(1, 0);
            lgb.GradientStops.Add(new GradientStop(Colors.Pink, 0));
            lgb.GradientStops.Add(new GradientStop(Colors.Silver, 0.5));
            lgb.GradientStops.Add(new GradientStop(Colors.Pink, 1));

            lgb2.StartPoint = new Point(0, 0);
            lgb2.EndPoint = new Point(1, 0);
            lgb2.GradientStops.Add(new GradientStop(Colors.Lime, 0));
            lgb2.GradientStops.Add(new GradientStop(Colors.Silver, 0.5));
            lgb2.GradientStops.Add(new GradientStop(Colors.Lime, 1));

            dGrid.Width = 500;
            dGrid.CanUserAddRows = true;
            dGrid.BeginningEdit += new EventHandler<DataGridBeginningEditEventArgs>(dGrid_BeginningEdit);
            dGrid.AutoGenerateColumns = false;
            dGrid.RowBackground = lgb2;
            dGrid.AlternatingRowBackground = lgb;
            dGrid.IsReadOnly = true;
           
            Style style = new Style();
            style.Setters.Add(new Setter(DataGridCell.ForegroundProperty, new SolidColorBrush(Colors.Green)));

            col1.EditingElementStyle = col2.EditingElementStyle = col3.EditingElementStyle = style;      

            col1.Header = "Column (1)";
            col2.Header = "Column (2)";
            col3.Header = "Column (3)";
            col4.Header = "Column (4)";

            col1.Width = 0.3 * dGrid.Width;
            col2.Width = 0.2 * dGrid.Width;
            col3.Width = 0.3 * dGrid.Width;
            col4.Width = 0.15 * dGrid.Width;

            dGrid.Columns.Add(col1);
            dGrid.Columns.Add(col2);
            dGrid.Columns.Add(col3);
            dGrid.Columns.Add(col4);

            dGrid.Items.Add(new Person("Mayas", 25, false, "Zahera"));
            dGrid.Items.Add(new Person("Zaher", 23, false, "Mohajeren"));
            dGrid.Items.Add(new Person("Mouammar", 24, false, "BabMousalla"));
            dGrid.Items.Add(new Person("Mohammad", 22, false, "Lebanon"));
            dGrid.Items.Add(new Person("Shadaida", 21, true, "BabTomma"));

            Binding binding = new Binding();
            binding.Mode = BindingMode.TwoWay;

            ((DataGridTextColumn)dGrid.Columns[0]).Binding = setBinding("Name");
            ((DataGridCheckBoxColumn)dGrid.Columns[1]).Binding = setBinding("IsMarried");
            ((DataGridHyperlinkColumn)dGrid.Columns[2]).Binding = setBinding("City");
            ((DataGridTextColumn)dGrid.Columns[3]).Binding = setBinding("Age");


            LinearGradientBrush lgb3 = new LinearGradientBrush();
            lgb3.GradientStops.Add(new GradientStop(Colors.Yellow, 0));
            lgb3.GradientStops.Add(new GradientStop(Colors.Blue, 1));

            mainPoly = new Polygon();

            mainPoly.Stroke = new SolidColorBrush(Colors.Red);
            mainPoly.StrokeThickness = 1;
            mainPoly.Fill = lgb3;
            mainPoly.Opacity = 0.4;
            mainPoly.MouseEnter += new MouseEventHandler(poly_MouseEnter);
            mainPoly.MouseLeave += new MouseEventHandler(poly_MouseLeave);

            mainCanvas.Children.Add(mainPoly);
        }

        /// <summary>
        /// data usage here for this event
        /// </summary>
        /// <param name="sender">objects </param>
        /// <param name="e">e mezo</param>
        private void dGrid_BeginningEdit(object sender, DataGridBeginningEditEventArgs e)
        {
            this.Title = "Editing";
        }

        private void btnRun_Click(object sender, RoutedEventArgs e)
        {
            this.Title = ((Person)dGrid.SelectedItem).ToString();
        }

        /// <summary>
        /// other test
        /// </summary>
        /// <param name="pathName">111111111</param>
        /// <returns>222222222 returns</returns>
        private Binding setBinding(String pathName)
        {
            Binding binding = new Binding(pathName);
            binding.Mode = BindingMode.TwoWay;
            binding.UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged;

            return binding;
        }

        private void btnCalture_Click(object sender, RoutedEventArgs e)
        {
            mainPoly.Points.Clear();
        }

        void poly_MouseLeave(object sender, MouseEventArgs e)
        {
            ((Polygon)sender).Opacity = .4;
        }

        void poly_MouseEnter(object sender, MouseEventArgs e)
        {
            ((Polygon)sender).Opacity = .95;
            
        }

        private void ContentControl_MouseDown(object sender, MouseButtonEventArgs e)
        {

        }

        private void Canvas_MouseDown(object sender, MouseButtonEventArgs e)
        {
            mainPoly.Points.Add(e.GetPosition(mainCanvas));
            this.Title = e.GetPosition(mainCanvas) + "-" + e.GetPosition(mainCanvas).Y;
        }
    }

    public class Person
    {
        public Person(String personName, Int32 personAge, Boolean isPersonMarried, String personCity)
        {
            Name = personName;
            Age = personAge;
            IsMarried = isPersonMarried;
            City = personCity;
        }

        public String Name
        {
            get;
            set;
        }

        public Int32 Age
        {
            get;
            set;
        }

        public Boolean IsMarried
        {
            get;
            set;
        }

        public String City
        {
            get;
            set;
        }

        public override string ToString()
        {
            return Name + "," + Age.ToString() + "," + IsMarried.ToString() + "," + City;
        }
    }
}
