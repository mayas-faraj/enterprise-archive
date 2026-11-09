using System;

namespace MobileCompany
{
    abstract class Customer
    {
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

        public new void ToString()
        {
            Console.WriteLine("Customer Info : Identity: {0}, Name: {1}, Balance: {2}.", id, name, balance);
        }

        public void RecordPayment(double amountPaid)
        {
            balance = balance - amountPaid;
        }

        //callType : 0 mobile - 1 land
        public abstract void RecordCall(byte callType, uint nMinutes);

        private int id;
        private string name;
        private double balance;
    }

    class NormalCustomer : Customer
    {
        public override void RecordCall(byte callType, uint nMinutes)
        {
            if (callType == 0)
                //mobile call
                this.Balance = this.Balance + (4 * nMinutes);
            else
                if (callType == 1)
                    //land call
                    this.Balance = this.Balance + (6 * nMinutes);
        }
    }

    class SubscriberCustomer : Customer
    {
        public uint LandMinutes;
        public uint MobileMinutes;

        public override void RecordCall(byte callType, uint nMinutes)
        {
            if (callType == 0)
            {
                //mobile call
                if (MobileMinutes >= nMinutes)
                    MobileMinutes = MobileMinutes - nMinutes;
                else
                {
                    this.Balance = (nMinutes - MobileMinutes) * 8;
                    MobileMinutes = 0;
                }
            }
            else
                if (callType == 1)
                    //land call
                    if (LandMinutes >= nMinutes)
                        LandMinutes = LandMinutes - nMinutes;
                    else
                    {
                        this.Balance = (nMinutes - MobileMinutes) * 10;
                        LandMinutes = 0;
                    }
        }
    }

    class Company
    {
        private Customer[] Customers;
        private int MaxCust;
        private int count = 0;

        public Company(int MaxCust)
        {
            this.MaxCust = MaxCust;
            Customers = new Customer[MaxCust];
        }

        public void Add(Customer c)
        {
            if (count < MaxCust)
            {
                Customers[count] = c;
                count++;
            }
        }

        public new void ToString()
        {
            for (int i = 0; i < count; i++)
                Customers[i].ToString();
        }

        public void SortByBalance()
        {
            //buble sort
            for (int i = 0; i < count - 1; i++)
                for (int j = i; j < count; j++)
                    if (Customers[i].Balance > Customers[j].Balance)
                    {
                        Customer tmpCust = Customers[i];
                        Customers[i] = Customers[j];
                        Customers[j] = tmpCust;
                    }
        }

        public void SortByCustomerType()
        {
            Customer[] tmp = new Customer[MaxCust];
            int index = 0;

            for (int i = 0; i < count; i++)
                if (Customers[i].GetType() == typeof(NormalCustomer))
                {
                    tmp[index] = Customers[i];
                    index++;
                }

            for (int i = 0; i < count; i++)
                if (Customers[i].GetType() == typeof(SubscriberCustomer))
                {
                    tmp[index] = Customers[i];
                    index++;
                }

            Customers = tmp;
        }

        public int CountNormalCursomers()
        {
            int num = 0;
            for (int i = 0; i < count; i++)
                if (Customers[i].GetType() == typeof(NormalCustomer))
                    num++;

            return num;
        }

        public int CountSubscriberCursomers()
        {
            int num = 0;
            for (int i = 0; i < count; i++)
                if (Customers[i].GetType() == typeof(SubscriberCustomer))
                    num++;

            return num;
        }

        public void PrintById(int customerId)
        {
            for (int i = 0; i < count; i++)
                if (Customers[i].Id == customerId)
                {
                    Customers[i].ToString();
                    break;
                }
        }
    }

    class Tester
    {
        static void Main(string[] args)
        {
            //general variable
            int num = 0;
            int numNormal = 0;
            int numSub = 0;
            int id;

            int newId;
            string newName;
            double newBalance;

            //print number of customer
            Console.WriteLine("Number of normal Customers is {0}.", numNormal);
            Console.WriteLine("Number of normal Customers is {0}.", numSub);

            //create new company
            Console.WriteLine("Please enter max number of customers to your company?");
            num = int.Parse(Console.ReadLine());

            Company MyCompany = new Company(num);

            //enter subscriber customers
            Console.WriteLine();
            Console.WriteLine("Entering subscriber customers");
            Console.WriteLine("Enter number of subscriber customers?");
            numSub = int.Parse(Console.ReadLine());

            for (int i = 0; i < numSub; i++)
            {
                Console.WriteLine("entering customer number {0}.", i + 1);
                Console.WriteLine("enter id?");
                newId = int.Parse(Console.ReadLine());
                Console.WriteLine("enter name?");
                newName = Console.ReadLine();
                Console.WriteLine("enter balance?");
                newBalance = double.Parse(Console.ReadLine());

                SubscriberCustomer newCust = new SubscriberCustomer();
                newCust.Id = newId;
                newCust.Name = newName;
                newCust.Balance = newBalance;

                MyCompany.Add(newCust);
            }

            //entering normal customers
            Console.WriteLine();
            Console.WriteLine("Entering normal customers");
            Console.WriteLine("Enter number of normal customers?");
            numNormal = int.Parse(Console.ReadLine());

            for (int i = 0; i < numNormal; i++)
            {

                Console.WriteLine("entering customer number {0}.", i + 1);
                Console.WriteLine("enter id?");
                newId = int.Parse(Console.ReadLine());
                Console.WriteLine("enter name?");
                newName = Console.ReadLine();
                Console.WriteLine("enter balance?");
                newBalance = double.Parse(Console.ReadLine());

                NormalCustomer newCust = new NormalCustomer();
                newCust.Id = newId;
                newCust.Name = newName;
                newCust.Balance = newBalance;

                MyCompany.Add(newCust);
            }

            //show customer by id
            Console.WriteLine();
            Console.WriteLine("Enter customer id to print it?");
            id = int.Parse(Console.ReadLine());
            MyCompany.PrintById(id);

            //print all customer
            Console.WriteLine();
            Console.WriteLine("Print all cutomers");
            MyCompany.ToString();

            //sort customers depinding on balance
            Console.WriteLine();
            Console.WriteLine("Print all customer after sorting by balance");
            MyCompany.SortByBalance();
            MyCompany.ToString();

            //sort customers depinding on type
            Console.WriteLine();
            Console.WriteLine("Print all customer after sorting by type");
            MyCompany.SortByCustomerType();
            MyCompany.ToString();

            //end of program
            Console.WriteLine();
            Console.WriteLine("End of program");
            Console.Read();
        }
    }
}
