using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace PhonesDatabase
{
    public partial class form : Form
    {
        Company myCompany;

        public form()
        {
            InitializeComponent();
        }

        private void createCompany_Click(object sender, EventArgs e)
        {
            //إنشاء شركة حسب عدد المشتركين
            myCompany = new Company(Convert.ToInt32(maxCust.Text));

            //تفعيل الزر بعد إنشاء الشركة لتمكين إضافة المشتركين
            enter.Enabled = true;
        }

        private void enter_Click(object sender, EventArgs e)
        {
            Customer tmp;

            //تقنية تعدد الأشكل لإنشاء مرجع لمتحول المرجعي للزبون
            if (normal.Checked)
                tmp = new NormalCustomer();
            else
                tmp = new SubscriberCustomer();

            //القيم
            tmp.Id = Convert.ToInt32(id.Text);
            tmp.Name = name.Text;
            tmp.Balance = Convert.ToDouble(balance.Text);

            //إضافة الزبون للمصفوفة
            myCompany.Add(tmp);

            output.Text = myCompany.ToString();

            //طباعة أعداد الزبائن
            normalCust.Text = myCompany.numNormalCust().ToString();
            subscriberCust.Text = myCompany.numSubscriberCust().ToString();
        }

        private void sortByBalance_Click(object sender, EventArgs e)
        {
            //ترتيب حسب الرصيد وطباعة النتائج
            myCompany.SortByBalance();

            output.Text = myCompany.ToString();
        }

        private void sortByType_Click(object sender, EventArgs e)
        {
            //ترتيب الزبائن حسب النوع وطباعة النتائج
            myCompany.SortByCustomerType();

            output.Text = myCompany.ToString();
        }

        private void find_Click(object sender, EventArgs e)
        {
            //بحث عن الزبون حسب الرقم
            result.Text = myCompany.FindCust(Convert.ToInt32(findId.Text));
        }
    }

    internal abstract class Customer
    {
        public const int nor_mob_mob = 4;//تكلفة من جوال لجوال للزبون العادي
        public const int nor_mob_land = 6;//تكلفة من جوال لأرضي للزبون العادي
        public const int sub_mob_mob = 8;//تكلفة من جوال لجوال للزبون المشترك
        public const int sub_mob_land = 10;//تكلفة من جوال لأرضي للزبون المشترك

        //خاصية الإسم
        private string name;
        public string Name
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

        //خاصية الرقم
        private int id;
        public int Id
        {
            get
            {
                return id;
            }
            set
            {
                id = value;
            }
        }

        //خاصية الرصيد
        private double balance;
        public double Balance
        {
            get
            {
                return balance;
            }
            set
            {
                balance = value;
            }
        }

        //طريقة مجردة
        public abstract void RecordCall(Byte callType, UInt32 nMinutes);

        public void RecordPayment(Double amountPaid)
        {
            Balance = Balance - amountPaid;//طرح الرصيد
        }

  

        public override string ToString()
        {
            string result = id.ToString() + " , " + name + " , " + balance.ToString();
            return result;
        }
    }

    internal class NormalCustomer : Customer
    {
        public override void RecordCall(byte callType, uint nMinutes)
        {
            if (callType == 0)//هاتف جوال
                Balance = Balance + (nMinutes * nor_mob_mob);//الرصيد السابق مضاف إلية كلفة الدقيقة من جول لجوال
            else if (callType == 1)//هاتف أرضي
                Balance = Balance + (nMinutes * nor_mob_land);//الرصيد السابق مضاف إلية كلفة الدقيقة من جول لأرضي
        }
    }

    internal class SubscriberCustomer : Customer
    {
        public uint LandMinutes = 60;//دقائق الأرضي
        public uint MobileMinutes = 60;//دقائق الجوال

        public override void RecordCall(byte callType, uint nMinutes)
        {
            if (callType == 0)//أرضي
            {
                uint counter = nMinutes;

                //إنقاص حتى إنتهاء مدة المكالمة
                while (!(counter == 0))
                {

                    if (MobileMinutes > 0)
                        //يوجد دقائق جوال يتم الطرح منها
                        MobileMinutes--;
                    else
                        //لا يوجد دقائق جوال يتم الإضافة للرصيد
                        Balance = Balance - sub_mob_mob;

                    //إنقاص عداد مؤقت
                    counter--;
                }
            }
            else if (callType == 1)//الجوال
            {
                //نفس الإسلوب السابق
                uint counter = nMinutes;

                while (!(counter == 0))
                {
                    if (LandMinutes > 0)
                        LandMinutes--;
                    else
                        Balance = Balance - sub_mob_land;

                    counter--;
                }
            }
        }
    }

    internal class Company
    {
        private Customer[] customers;
        private int count = 0;
        private int maxCust;

        public Company(int MaxCust)
        {
            //التحقق من الوسيط أنه موجب
            if (MaxCust >= 0)
            {
                maxCust = MaxCust;
                customers = new Customer[maxCust];
            }
        }

        public void Add(Customer c)
        {
            //التحقق من عدد العناصر
            if (count < maxCust)
            {
                customers[count] = c;

                count++;//زيادة عدد الزبائن
            }
        }

        public override string ToString()
        {
            string str = "";

            for (int j = 0; j < count; j++)
                str += customers[j].ToString() + "\r\n";

            return str;
        }

        public void SortByBalance()
        {
            //خوارزمية الترتيب الشهيرة
            for (int x = 0; x < count - 1; x++)
            {
                for (int y = x; y < count; y++)
                {
                    if (customers[x].Balance > customers[y].Balance)
                    {
                        Customer tmpCust = customers[x];
                        customers[x] = customers[y];
                        customers[y] = tmpCust;
                    }
                }
            }
        }

        public void SortByCustomerType()
        {
            Customer[] cust = new Customer[customers.Length];

            int iCust = 0;

            for (int i = 0; i < count; i++)
            {
                if (customers[i].GetType() == typeof(NormalCustomer))
                {
                    cust[iCust] = customers[i];
                    ++iCust;
                }
            }

            for (int i = 0; i < count; i++)
            {
                if (customers[i].GetType() == typeof(SubscriberCustomer))
                {
                    cust[iCust] = customers[i];
                    ++iCust;
                }
            }

            customers = cust;
        }

        public int numSubscriberCust()
        {
            //دالة لمعرفة عدد الزبائن المشتركين
            int val = 0;//قيمة إبتدائية

            for (int x = 0; x < count; x++)
                if (customers[x].GetType() == typeof(SubscriberCustomer))//من أجل أن الزبون من نوع مشترك
                    ++val;

            //إعادة عدد الزبائن المشتركين
            return val;
        }

        public int numNormalCust()
        {
            //نفس الدالة السابقة إنما لمعرفة عدد الزبائن العاديين
            int val = 0;

            for (int x = 0; x < count; x++)
                if (customers[x].GetType() == typeof(NormalCustomer))
                    ++val;

            return val;
        }

        public string FindCust(int id)
        {
            //بحث عن زبون عن طريق رقمه
            string str = "";

            for (int x = 0; x < count; x++)
                if (customers[x].Id == id)//الزبون موجود
                    str = customers[x].ToString();

            return str;
        }
    }
}