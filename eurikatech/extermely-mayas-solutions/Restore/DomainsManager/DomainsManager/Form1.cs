using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DomainsManager
{

    public partial class Form1 : Form
    {
        UserCollection users = new UserCollection();

        public Form1()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            txName.Text = "";
            txPassword.Text = "";
            txSettings.Text = "";
            txIconPath.Text = "";
            txMisc.Text = "";
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            DatabaseInterface database = new DatabaseInterface();
            users.Fill();
            updataList();
        }

        private void updataList()
        {
            listBox1.Items.Clear();
            users.Clear();
            users.Fill();

            for (Int32 i = 0; i < users.Count(); i++)
                listBox1.Items.Add(users[i].Identify.ToString() + ":" + users[i].Name);
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            for (Int32 i = 0; i < users.Count(); i++)
                if (users[i].Name == listBox1.SelectedItem.ToString())
                {
                    txName.Text = users[i].Name;
                    txPassword.Text = users[i].Password;
                    txIconPath.Text = users[i].IconPath;
                    txSettings.Text = users[i].Setting;

                    break;
                }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            User tmp = new User(txName.Text, txPassword.Text, txIconPath.Text, txSettings.Text);
            DatabaseInterface.Connection.Open();
            tmp.Save();
            DatabaseInterface.Connection.Close();
            updataList();
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
