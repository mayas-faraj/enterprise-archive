using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ClientAppliction
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();

            Maniyat.DataBase.ConnectionString = "Data Source=.\\sqlexpress;Initial Catalog=DataBridgeTest;Integrated Security=True;Pooling=False";
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            
            
            person ps = new person();


            txResult.Text = Maniyat.DataBase.GetValues(ps);
            //person[] pss = (person[])Maniyat.DataBase.Select(ps);

            //for (Int32 i = 0; i < pss.Length; i++)
            //    txResult.Text += pss[i].ToString() + Environment.NewLine;

            //ps.DataTable = "persons2";

            

            //if (Maniyat.DataBase.DropTable(ps))
            //    MessageBox.Show("done!");
            //else
            //    MessageBox.Show("Un done !!!");

           
           
            //txResult.Text += Maniyat.DataBase.Delete(def, new Maniyat.DataCondition(def.DataFields[1], ">", 20)).ToString() + Environment.NewLine;
            //txResult.Text += Maniyat.DataBase.Select(def, new Maniyat.DataCondition(def.DataFields[2],"=", "True")).ToString() + Environment.NewLine;
            //txResult.Text += Maniyat.DataBase.Select(def, new Maniyat.DataCondition(def.DataFields[0], "like", "ali")).ToString() + Environment.NewLine;

            //def.Name = "mezzzo";
            //def.Age = 35;
            //def.IsMarried = true;
            //def.DataFields[1].IsUsed = true ;



          
        

            //txResult.Text = Maniyat.DataBase.Update(def, new Maniyat.DataCondition[] { new Maniyat.DataCondition(def.DataFields[0], "=", "*ali?"), new Maniyat.DataCondition(def.DataFields[1], ">", -1), new Maniyat.DataCondition(def.DataFields[2], "=", false) }, "XOR").ToString() + Environment.NewLine;
            //txResult.Text += Maniyat.DataBase.Update(def);

        }
    }

    public class person : Maniyat.IDataBase
    {
        private Maniyat.DataItem[] dataFields;
        private Maniyat.IDataBase[] innerType;
        private String dataTable;

        private String name;
        private Int32 age;
        private Boolean isMaried;
        private Image[] images;

        public person()
        {
            dataTable = "persons";

            dataFields = new Maniyat.DataItem[5];
            innerType = new Maniyat.IDataBase[1];


            dataFields[0] = new Maniyat.DataItem("pId", SqlDbType.Int, 0);
            dataFields[1] = new Maniyat.DataItem("pName", SqlDbType.NVarChar, 50);
            dataFields[2] = new Maniyat.DataItem("pAge", SqlDbType.TinyInt, 0);
            dataFields[3] = new Maniyat.DataItem("pMarried", SqlDbType.Bit, 0);
            dataFields[4] = new Maniyat.DataItem("personId", SqlDbType.Bit, 0);

            

            name = "noname";
            age = -1;
        }

        public void DbRead()
        {
            dataFields[0].Value = name;
            dataFields[1].Value = age;
            dataFields[2].Value = isMaried;
        }

        public void DbWrite()
        {
            name = dataFields[0].Value.ToString();
            age = Convert.ToInt32(dataFields[1].Value);
            isMaried = Convert.ToBoolean(dataFields[2].Value);
            
        }

        public Maniyat.IDataBase[] DbCreate(Int32 n)
        {
            person[] result = new person[n];

            for (Int32 i = 0; i < n; i++)
                result[i] = new person();

            return result;
        }

        public Maniyat.DataItem[] DataFields
        {
            get
            {
                return dataFields;
            }
            set
            {
                dataFields = value;
            }    
        }

        public String DataTable
        {
            set
            {
                dataTable = value;
            }
            get
            {
                return dataTable;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public Int32 Age
        {
            get
            {
                return age;
            }
            set
            {
                age = value;
            }
        }

        public Boolean IsMarried
        {
            get
            {
                return isMaried;
            }
            set
            {
                isMaried = value;
            }
        }

        public Image[] Images
        {
            get
            {
                return images;
            }
            set
            {
                images = value;
            }
        }

        public override string ToString()
        {
            return name + " \\" + age.ToString() + "\\ -" + isMaried.ToString();
        }
    }

    public class Image : Maniyat.IDataBase
    {
        public Image()
        {
            Name = "no name";
            Width = 50;
            Height = 50;

            DataFields = new Maniyat.DataItem[3];

            DataTable = "images";

            DataFields[0] = new Maniyat.DataItem("name", SqlDbType.NVarChar, 255);
            DataFields[1] = new Maniyat.DataItem("width", SqlDbType.Int, 0);
            DataFields[2] = new Maniyat.DataItem("height", SqlDbType.Int, 0);
        }

        public String Name
        {
            get;
            set;
        }

        public Int32 Width
        {
            get;
            set;
        }

        public Int32 Height
        {
            get;
            set;
        }

        public String DataTable
        {
            get;
            set;
        }

        public Maniyat.DataItem[] DataFields
        {
            get;
            set;
        }

        public Maniyat.IDataBase[] DbCreate(Int32 n)
        {
            Image[] images = new Image[n];

            for (Int32 i = 0; i < n; i++)
                images[i] = new Image();

            return images;
        }

        public void DbRead()
        {
            DataFields[0].Value = Name;
            DataFields[1].Value = Width;
            DataFields[2].Value = Height;
        }

        public void DbWrite()
        {
            Name = Convert.ToString(DataFields[0]);
            Width = Convert.ToInt32(DataFields[1]);
            Height = Convert.ToInt32(DataFields[2]);
        }
    }
}

