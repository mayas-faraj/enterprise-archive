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
    public partial class frmTest : Form
    {
        public frmTest()
        {
            InitializeComponent();

            Maniyat.DataBase.ConnectionString = "Data Source=.\\sqlexpress;Initial Catalog=DataBridgeTest;Integrated Security=True;Pooling=False"; 
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            Person pr = new Person();

            txOutput.Text += Maniyat.DataBase.DropTable(pr);

        }

        class Person : Maniyat.DataItem
        {
            public Person()
            {
                Id = new Maniyat.DFInt16("pId", SqlDbType.SmallInt, true, true);
                Name = new Maniyat.DFString("pName", SqlDbType.NVarChar, 50);
                Age = new Maniyat.DFInt32("pAge", SqlDbType.TinyInt);
                IsMarried = new Maniyat.DFBoolean("pMarried", SqlDbType.Bit);
                BirthDate = new Maniyat.DFDateTime("pBirthDate", SqlDbType.DateTime);

                DataTable = "thePersons";
            }

            public Maniyat.DFInt16 Id
            {
                get;
                set;
            }

            public Maniyat.DFString Name
            {
                get;
                set;
            }

            public Maniyat.DFInt32 Age
            {
                get;
                set;
            }

            public Maniyat.DFBoolean IsMarried
            {
                get;
                set;
            }

            public Maniyat.DFDateTime BirthDate
            {
                get;
                set;
            }

            public Int32 count
            {
                get;
                set;
            }

            public String comment
            {
                get;
                set;
            }

            public override Maniyat.DataItem[] CreateObjects(Int32 count)
            {
                Person[] persons = new Person[count];

                for (Int32 i = 0; i < count; i++)
                    persons[i] = new Person();

                return persons;
            }  
        }
    }
}
