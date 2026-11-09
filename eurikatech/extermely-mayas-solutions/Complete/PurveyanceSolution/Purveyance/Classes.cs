using System;
using System.Collections.Generic;
using System.Text;

namespace Purveyance
{
    public class Material
    {
        //public constructures region
        public Material()
        {    
        }

        public Material(Int32 id, String name)
        {
            this.Id = id;
            this.Name = name;
        }

        public Material(Int32 id, String name, String unit, String defaultVendor, Single defaultSellPrice, Single defaultBuyPrice, Single defaultAmount)
        {
            this.Id = id;
            this.Name = name;
            this.Unit = unit;
            this.DefaultAmount = defaultAmount;
            this.DefaultBuyPrice = defaultBuyPrice;
            this.DefaultSellPrice = defaultSellPrice;
            this.DefaultVendor = defaultVendor;
        }

        //public properties region
        public Int32 Id
        {
            get;
            set;
        }

        public String Name
        {
            get;
            set;
        }

        public String DefaultVendor
        {
            get;
            set;
        }

        public Single DefaultSellPrice
        {
            get;
            set;
        }

        public Single DefaultBuyPrice
        {
            get;
            set;
        }

        public Single DefaultAmount
        {
            get;
            set;
        }

        public String Unit
        {
            get;
            set;
        }    

        //public functions region
        public override String ToString()
        {
            return Name;
        }
    }

    public class Income
    {
        //public Constructions region
        public Income()
        {
            Date = DateTime.Now;
        }

        //public properties region
        public Int32 Id
        {
            get;
            set;
        }

        public Material Material
        {
            get;
            set;
        }

        public String Vendor
        {
            get;
            set;
        }

        public Single BuyPrice
        {
            get;
            set;
        }

        public Single Amount
        {
            get;
            set;
        }

        public Single MinusAmount
        {
            get;
            set;
        }

        public Single TransportCost
        {
            get;
            set;
        }

        public Single OtherCosts
        {
            get;
            set;
        }

        public DateTime Date
        {
            get;
            set;
        }

        public String Description
        {
            get;
            set;
        }

        //public functions region
        public override string ToString()
        {
            return Id.ToString() + '-' + Date.ToShortDateString() + ' ' + '(' + MinusAmount.ToString() + '/' + Amount.ToString() + ')';
        }
    }

    public class Outcome
    {
        //public Constructions region
        public Outcome()
        {
            Date = DateTime.Now;
        }

        //public properties region
        public Int32 Id
        {
            get;
            set;
        }

        public Income Income
        {
            get;
            set;
        }

        public String Client
        {
            get;
            set;
        }

        public Single SellPrice
        {
            get;
            set;
        }

        public Single Amount
        {
            get;
            set;
        }

        public Single TransportCost
        {
            get;
            set;
        }

        public Single OtherCosts
        {
            get;
            set;
        }

        public DateTime Date
        {
            get;
            set;
        }

        public String Description
        {
            get;
            set;
        }

        //public functions region
        public override string ToString()
        {
            return Client + '(' + Amount.ToString() + ')';
        }
    }

    public class Overall
    {
        //public constructures region
        public Overall(Material material, Single inAmount, Single inCost, Single inPrice, Single outAmount, Single outCost, Single outPrice)
        {
            this.Material = material;

            this.InAmount = inAmount;
            this.InCost = inCost;
            this.InPrice = inPrice;
            this.OutAmount = outAmount;
            this.OutCost = outCost;
            this.OutPrice = outPrice;

            this.Balance = InPrice - (InCost + OutCost + outPrice);
        }

        public Overall()
        {
        }

        //public properties region
        public Material Material
        {
            get;
            set;
        }

        public String Date
        {
            get;
            set;
        }

        public String Vendors
        {
            get;
            set;
        }

        public Single InAmount
        {
            get;
            set;
        }

        public Single InCost
        {
            get;
            set;
        }

        public Single InPrice
        {
            get;
            set;
        }

        public String Clients
        {
            get;
            set;
        }

        public Single OutAmount
        {
            get;
            set;
        }

        public Single OutCost
        {
            get;
            set;
        }

        public Single OutPrice
        {
            get;
            set;
        }

        public Single Balance
        {
            get;
            set;
        }
    }

    public class UI
    {
        //public constructures region
        static UI()
        {
            directory = System.Environment.CurrentDirectory;
        }

        //public functions region
        public static void ErrorMessage(Exception ex)
        {
            System.Windows.MessageBox.Show(ex.Message, ex.Source, System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
        }

        public static void InformationMessage(String message, String caption)
        {
            System.Windows.MessageBox.Show(message, caption, System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Information);
        }

        public static void Exit()
        {
            if (System.Windows.MessageBox.Show("الخروج من البرنامج?", "تأكيد الخروج", System.Windows.MessageBoxButton.YesNo, System.Windows.MessageBoxImage.Question) == System.Windows.MessageBoxResult.Yes)
                App.Current.Shutdown();
        }

        public static void Exit(System.ComponentModel.CancelEventArgs e)
        {
            if (System.Windows.MessageBox.Show("الخروج من البرنامج?", "تأكيد الخروج", System.Windows.MessageBoxButton.YesNo, System.Windows.MessageBoxImage.Question) == System.Windows.MessageBoxResult.Yes)
                App.Current.Shutdown();
            else
                e.Cancel = true;
        }

        public static String GetCurrentDirectory()
        {
            return directory;
        }

        //private fields region
        private static String directory;
    }

}
