using System;

namespace LoanApplication
{
    class Person
    {
        private String name;
        private Int32 msalary;

        public Person(String personName, Int32 monthSalary)
        {
            name = personName;

            //salary must positive number
            if (monthSalary >= 0)
                msalary = monthSalary;
            else
                msalary = 0;
        }

        public Int32 MonthSalary
        {
            get
            {
                return msalary;
            }
        }

        public override String ToString()
        {
            return "Name : " + name + " , Month Salary : " + msalary.ToString();
        }

    }

    abstract class Loan
    {
        public Loan(Int32 loanId, Single loanAmount, Byte NumOfMonthes, Person loanPerson)
        {
            loanNumber = loanId;
            person = loanPerson;

            //number of monthes must be a positive integer
            if (NumOfMonthes > 0)
                NBMonth = NumOfMonthes;
            else
                NBMonth = 0;

            //loan amount must be also a positive integer
            if (loanAmount >= 0)
                amount = loanAmount;
            else
                amount = -1;
        }

        public override string ToString()
        {
            return "Loan Info : Id (" + loanNumber.ToString() + ") - Amount (" + amount.ToString() + ") - For Monthes (" + NBMonth.ToString() + ")" + Environment.NewLine + "For Person : " + person.ToString();
        }

        public abstract Boolean isApproved();

        public Int32 loanNumber;
        public Single amount;
        public Byte NBMonth;
        public Person person;
    }

    class CarLoan : Loan
    {
        public CarLoan(Int32 loanId, Single loanAmount, Byte numOfMonthes, Person loanPerson, String selectedCarType)
            : base(loanId, loanAmount, numOfMonthes, loanPerson)
        {
            carType = selectedCarType;
        }

        public override string ToString()
        {
            return base.ToString() + Environment.NewLine + "Loan For Car Type : " + carType;
        }

        public override Boolean isApproved()
        {
            if ((amount / NBMonth < (person.MonthSalary / 3)))
                return true;
            else
                return false;   
        }

        private String carType;
    }

    class HomeLoan : Loan
    {
        public HomeLoan(Int32 loanId, Single loanAmount, Byte numOfMonthes, Person loanPerson, String selectedAddress)
            : base(loanId, loanAmount, numOfMonthes, loanPerson)
        {
            homeaddress = selectedAddress;
        }

        public override string ToString()
        {
            return base.ToString() + Environment.NewLine + "Loan For Home in Address : " + homeaddress;
        }

        public override Boolean isApproved()
        {
            if ((amount / NBMonth < (person.MonthSalary / 4)))
                return true;
            else
                return false;
        }

        private String homeaddress;
    }

    class BankLoans
    {
        public BankLoans(Int32 maxLoansBank)
        {
            MaxLoans = maxLoansBank;
            Loans = new Loan[MaxLoans];
        }

        private Loan[] Loans;
        private Int32 MaxLoans;
        private Int32 NumberOfLoans;

        public Int32 GetLength()
        {
            return NumberOfLoans;
        }

        public Boolean AddLoan(Loan loan)
        {
            //number of loans must less than array length or equal
            if (NumberOfLoans < Loans.Length)
            {
                Loans[NumberOfLoans++] = loan;
                //true to indicate the operation is success
                return true;
            }
            else
                //false to indicate to operation is falid
                return false;
        }

        public String PaintLoadId(Int32 loanId)
        {
            for (Int32 i = 0; i < NumberOfLoans; i++)
                if (Loans[i].loanNumber == loanId)
                    if (Loans.GetType() == typeof(CarLoan))
                        return ((CarLoan)Loans[i]).ToString();
                    else
                        return ((HomeLoan)Loans[i]).ToString();

            return "Not Found!";
        }

        public String PrintHomeLoadGrt(Single amount)
        {
            String result = "";

            for (Int32 i = 0; i < NumberOfLoans; i++)
                if ((Loans[i].GetType() == typeof(HomeLoan)) && (Loans[i].amount > amount))
                    result += ((HomeLoan)Loans[i]).ToString() + Environment.NewLine;

            return result;
        }

        public String PrintAllLoans()
        {
            String result = "";

            for (Int32 i = 0; i < NumberOfLoans; i++)
                result += Loans[i].ToString() + Environment.NewLine;

            return result;
        }
    }
}
