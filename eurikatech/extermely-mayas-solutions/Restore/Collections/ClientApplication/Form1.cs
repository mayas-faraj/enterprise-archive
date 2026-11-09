using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ClientApplication
{
    public partial class frmMain : Form
    {
        Collections.Collections users = new Collections.Collections(4);

        
        public frmMain()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Exit();
            
        }

        private void frmMain_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            User tmp = new User(tx1.Text, tx2.Text, Convert.ToInt32(tx3.Text));
            users.Add(tmp);

            refreshList();

            txO1.Text = users.list.Length.ToString();
            txO2.Text = users.count.ToString();
            txO3.Text = users.garbageNum.ToString();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            User tmp = new User(tx1.Text, tx2.Text, Convert.ToInt32(tx3.Text));
            users.Remove(tmp);

            refreshList();

            txO1.Text = users.list.Length.ToString();
            txO2.Text = users.count.ToString();
            txO3.Text = users.garbageNum.ToString();
        }

        private void refreshList()
        {
            lst.Items.Clear();

            for (Int32 x = 0; x < users.list.Length; x++)
            {
                if (users.list[x].IsUsed)
                    lst.Items.Add(users.list[x].Value.ToString());
                else
                    lst.Items.Add("<unused>");
            }
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            //User tmp = new User(tx1.Text, tx2.Text, Convert.ToInt32(tx3.Text));
            //users.Find(tmp);
        }
    }

    internal class User
    {
        public String Name;
        public String Password;
        public Int32 Age;

        public User()
        {
            Name = "No Name";
            Password = null;
            Age = 30;
        }

        public User(String name, String password, Int32 age)
        {
            Name = name;
            Password = password;
            Age = age;
        }

        public override string ToString()
        {
            return Name + " ,Age : " + Age.ToString() + ", pwd (" + Password + ").";
        }

        public static Boolean operator==(User u1,User u2)
        {
            if(u1.Name==u2.Name && u1.Age==u2.Age)
                return true;
            else
                return false;
        }

        public static Boolean operator !=(User u1, User u2)
        {
            if (u1.Name != u2.Name || u1.Age != u2.Age)
                return true;
            else
                return false;
        }
    }
}
