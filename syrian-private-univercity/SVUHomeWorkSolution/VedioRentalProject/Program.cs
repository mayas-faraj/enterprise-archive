using System;

namespace VedioRentalProject
{
    class Program
    {
        static void Main(string[] args)
        {
            MemberCustomer member = new MemberCustomer("Rana saleh", "Jaramana", false);
            member.MemberYear = 2005;

            Console.WriteLine("Member #1");
            Console.WriteLine("***basic info***");
            member.Print();
            Console.WriteLine("***full info***");
            member.PrintFullInfo();
            Console.WriteLine("***rent***");
            member.Rent();

            TempCustomer temp = new TempCustomer("Hazem Jab", "Bagdat st.", true);
            temp.SecurityDeposit = 500;

            Console.WriteLine("\nMember #2");
            Console.WriteLine("***basic info***");
            temp.Print();
            Console.WriteLine("***full info***");
            temp.PrintFullInfo();
            Console.WriteLine("***rent***");
            temp.Rent();

            Console.Read();
        }
    }

    abstract class Customer
    {
        public Customer(String custName, String custAddress, Boolean custMale)
        {
            name = custName;
            address = custAddress;
            isMale = custMale;
        }

        private String name;
        private String address;
        private Boolean isMale;

        public void Print()
        {
            Console.WriteLine("Name: {0}.\nAddress: {1}.", name, address);
        }

        public void PrintBasicInfo()
        {
            Console.WriteLine("Name: {0}.\nAddress: {1}.", name, address);
            Console.WriteLine("Gender: {0}.", isMale ? "male" : "female");
        }

        public abstract void Rent();

        public abstract void PrintFullInfo();  
    }

    class MemberCustomer : Customer
    {
        public MemberCustomer(String custName, String custAddress, Boolean custMale)
            : base(custName, custAddress, custMale)
        {
        }

        public Int16 MemberYear;

        public override void Rent()
        {
            Console.WriteLine("please return the tab after 5 days.");
        }

        public override void PrintFullInfo()
        {
            this.PrintBasicInfo();
            Console.WriteLine("Member Year: {0}.", MemberYear);
        }
    }
    class TempCustomer : Customer
    {
        public TempCustomer(String custName, String custAddress, Boolean custMale)
            : base(custName, custAddress, custMale)
        {
        }

        public Double SecurityDeposit;

        public override void Rent()
        {
            Console.WriteLine("please return the tab after 3 days and pay {0}.", SecurityDeposit);
        }

        public override void PrintFullInfo()
        {
            this.PrintBasicInfo();
            Console.WriteLine("Security Deposit: {0}.", SecurityDeposit);
        }
    }
}
