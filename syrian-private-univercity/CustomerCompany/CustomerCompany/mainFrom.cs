using System;

namespace CustomerCompany
{
    public partial class mainFrom : System.Windows.Forms.Form
    {
        Company MyCompany;

        public mainFrom()
        {
            InitializeComponent();
        }

        private void company_Click(object sender, EventArgs e)
        {
            int max;

            if (int.TryParse(maxCust.Text, out max))
            {
                //max is numeric
                MyCompany = new Company(max);

                //enable inter
                enter.Enabled = true;
            }
        }

        private void enter_Click(object sender, EventArgs e)
        {
            //company created
            if (MyCompany != null)
            {
                Customer cust;//temp object

                if (isNormal.Checked == true)
                    cust = new NormalCustomer();
                else
                    cust = new SubscriberCustomer();

                //enter values
                cust.Id = Convert.ToInt32(id.Text);
                cust.Name = name.Text;
                cust.Balance = Convert.ToDouble(balance.Text);

                //out int from string
                int countN, countS;

                //add customer to array and return count of cust
                MyCompany.Add(cust, out countN, out countS);

                countNormal.Text = countN.ToString();
                countSubscribe.Text = countS.ToString();

                //output result in list
                customerList.Items.Clear();

                string[] result = MyCompany.ToString();

                foreach (string str in result)
                    if (str != null)
                        customerList.Items.Add(str);

                //clear values
                id.Text = "";
                name.Text = "";
                balance.Text = "";
            }
        }

        private void find_Click(object sender, EventArgs e)
        {
            int id;

            if (int.TryParse(idToFind.Text, out id))
            {
                //return fount customer
                Customer tmp=MyCompany.SearchingById(id);

                if (tmp != null)
                    textFromFind.Text = tmp.ToString();//object found
                else
                    textFromFind.Text = "";//object not found
            }

        }

        private void BSort_Click(object sender, EventArgs e)
        {
            MyCompany.SortByBalance();

            string[] result = MyCompany.ToString();

            customerList.Items.Clear();

            foreach (string str in result)
                customerList.Items.Add(str);
        }

        private void TSort_Click(object sender, EventArgs e)
        {
            MyCompany.SortByCustomerType();

            string[] result = MyCompany.ToString();

            customerList.Items.Clear();

            foreach (string str in result)
                customerList.Items.Add(str);
        }
    }

    internal abstract class Customer //define customers class.
    {
        //shourcut way to define properties
        public Int32 Id
        { get; set; }

        public String Name
        { get; set; }

        public Double Balance
        { get; set; }

        public override string ToString()
        {
            string ret = "Id : " + Id.ToString() + " - Name : " + Name + " - Balance : " + Balance.ToString();//define form for data
            return ret;
        }

        public void RecordPayment(Double amountPaid)
        {
            Balance -= amountPaid;//pay amount of money
        }

        public abstract void RecordCall(Byte callType, UInt32 nMinutes);
    }

    internal class NormalCustomer : Customer //define normal customer class.
    {
        public override void RecordCall(byte callType, uint nMinutes)
        {
            if (callType == 0)//mobile call
                Balance += 4 * nMinutes;//increase balance cost by nMinutes
            else//land call
                Balance += 6 * nMinutes;//increase balace cost by nMinutes
        }

    }

    internal class SubscriberCustomer : Customer //define sub customer class.
    {
        public uint LandMinutes = 60;//initial land minutes
        public uint MobileMinutes = 60;//initial mobile minuter

        public override void RecordCall(byte callType, uint nMinutes)
        {

            if (callType == 0)//to mobile call
            {
                //for all minutes
                for (uint nmin = nMinutes; nmin > 0; nmin--)
                {
                    //there is old subscriper mobile minutes
                    if (MobileMinutes > 0)
                        MobileMinutes = MobileMinutes - 1;//minus them
                    else
                        Balance = Balance + 8;//increase balance
                }
            }
            else //to land call
            {
                //for all minutes
                for (uint nmin = nMinutes; nmin > 0; nmin--)
                {
                    //there is old subscriper land minutes
                    if (MobileMinutes > 0)
                        MobileMinutes = MobileMinutes - 1;//decrease them
                    else
                        Balance = Balance + 10;//increase balance
                }
            }
        }
    }

    internal class Company //define company class.
    {
        private Customer[] customers;
        private int count = 0;
        private int maxCust;

        //constructure
        public Company(int MaxCust)
        {
            //build array depent on max cust number
            customers = new Customer[MaxCust];
            maxCust = MaxCust;
        }

        public void Add(Customer c, out int countNormalCust, out int countSubscriperCust)
        {
            if (count < maxCust)
            {
                customers[count] = c;
                count++;
            }

            //count costs
            countNormalCust = countSubscriperCust = 0;

            //for every customer
            foreach (Customer cust in customers)
            {
                if (cust != null)
                {
                    //check class typre
                    if (cust.GetType() == typeof(NormalCustomer))
                        //type is normal
                        countNormalCust++;//increase normal
                    else
                        countSubscriperCust++;//increase subscriper
                }
            }
        }

        public void SortByBalance()
        {
            //buble sort
            for (int i = 0; i < count - 1; i++)
                for (int j = i; j < count; j++)
                    if (customers[i].Balance > customers[j].Balance)
                    {
                        Customer tmpCust = customers[i];
                        customers[i] = customers[j];
                        customers[j] = tmpCust;
                    }
        }

        public void SortByCustomerType()
        {
            Customer[] tmp = new Customer[customers.Length];

            int x = 0;

            foreach (Customer c in customers)
            {
                if (c.GetType() == typeof(SubscriberCustomer))
                { tmp[x++] = c; }
            }

            foreach (Customer c in customers)
            {
                if (c.GetType() == typeof(NormalCustomer))
                { tmp[x++] = c; }
            }

            customers = tmp;
        }

        public String[] ToString()
        {
            string[] result = new string[customers.Length];
            int x = 0;

            //for all customers in array
            foreach (Customer c in customers)
                //add to result
                if (c != null)
                    result[x++] = c.ToString();

            return result;
        }

        public Customer SearchingById(int custId)
        {
            //for every customer in array
            foreach (Customer c in customers)
            {
                //paramerter equals any customer
                if (c.Id == custId)
                    //customer found ,return value
                    return c;
            }

            //cust not fount
            return null;
        }
    }
}