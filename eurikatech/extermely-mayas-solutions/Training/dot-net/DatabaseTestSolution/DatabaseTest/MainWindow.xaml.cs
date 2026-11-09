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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DatabaseTest
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            System.Xml.XmlTextReader xmlTextReader = new System.Xml.XmlTextReader("e:\\mayas.xml");
            System.Xml.XmlTextWriter xmlTextWriter = new System.Xml.XmlTextWriter("e:\\mayas2.xml", Encoding.Default);


            tx1.Text = xmlTextReader.Name;
            tx2.Text = xmlTextReader.BaseURI;
            tx3.Text = xmlTextReader.LocalName;



            while (xmlTextReader.Read())
                if (xmlTextReader.HasValue && xmlTextReader.NodeType != System.Xml.XmlNodeType.Whitespace)
                {
                    list.Items.Add(xmlTextReader.Value);

                    if (xmlTextReader.NodeType == System.Xml.XmlNodeType.Element)
                        xmlTextWriter.WriteNode(xmlTextReader, true);

                }

            xmlTextReader.Close();
            xmlTextWriter.Close();
        }

        private void btnRun_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btnOther_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void list_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
        }
    }

    internal class Company
    {
        public Company(Int32 id, String name, String adress, Int32 rating)
        {
            Id = id;
            Name = name;
            Address = adress;
            Rating = rating;
        }

        public Int32 Id
        {
            get;
            set;
        }

        public String Name
        {
            get;
            set;
        }

        public String Address
        {
            get;
            set;
        }

        public Int32 Rating
        {
            get;
            set;
        }

        public override string ToString()
        {
            return "(" + this.Name + ")";
        }
    }

    internal class Pos
    {
        public Int32 Id
        {
            get;
            set;
        }

        public String Name
        {
            get;
            set;
        }

        public String Type
        {
            get;
            set;
        }
    }
}
