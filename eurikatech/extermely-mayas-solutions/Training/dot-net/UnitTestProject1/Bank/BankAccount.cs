using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bank
{
    public class BankAccount
    {
        public BankAccount(String name, Double beginningBalance)
        {
            m_name = name;
            m_balance = beginningBalance;
        }

        private String m_name;

        private double m_balance;

        public double Balance
        {
            get
            {
                return m_balance;
            }
            set
            {
                m_balance = value;
            }
        }

        public void Debit(double amount)
        {
            if (amount > m_balance)
            {
                throw new ArgumentOutOfRangeException("amount");
            }
            if (amount < 0)
            {
                throw new ArgumentOutOfRangeException("amount");
            }

            m_balance += amount;
        }
 
    }
}
