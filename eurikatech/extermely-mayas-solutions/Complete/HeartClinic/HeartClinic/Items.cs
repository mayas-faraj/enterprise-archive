using System;

namespace HeartClinic
{
    using System;

    struct Doctor
    {
        private Int16 id, rankId;
        private String name, rank;
        private Byte percent, tax;
        private Int32 cost, costTaxEnter, costPure;

        public Int16 Id
        {
            get
            {
                return id;
            }
        }

        public Int16 RankId
        {
            get
            {
                return rankId;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
        }

        public String Rank
        {
            get
            {
                return rank;
            }
        }

        public Byte Percent
        {
            get
            {
                return percent;
            }
        }

        public Byte Tax
        {
            get
            {
                return tax;
            }
        }

        public Int32 Cost
        {
            get
            {
                return cost;
            }
        }

        public Int32 CostTaxEnter
        {
            get
            {
                return costTaxEnter;
            }
        }

        public Int32 CostPure
        {
            get
            {
                return costPure;
            }
        }
        public void Clear(Boolean clearData)
        {
            if (clearData)
            {
                id = 0; rankId = 0;
                name = ""; rank = "";
                percent = 0; tax = 0;
                cost = 0; costTaxEnter = 0; costPure = 0;
            }
        }

        public void SetDoctor(Int16 doctorId, String doctorName, Int16 doctorRankId, String doctorRank, Byte doctorPercent, Byte doctorTax, Int32 doctorCost, Int32 doctorCostTaxEnter, Int32 doctorCostPure)
        {
            id = doctorId;
            name = doctorName;
            rankId = doctorRankId;
            rank = doctorRank;
            cost = doctorCost;
            costTaxEnter = doctorCostTaxEnter;
            costPure = doctorCostPure;

            if (doctorPercent >= 0 || doctorPercent <= 100)
                percent = doctorPercent;
            else
                throw new PercentOutOfRangeException();

            if (doctorTax >= 0 || doctorTax <= 100)
                tax = doctorTax;
            else
                throw new PercentOutOfRangeException();
        }

        public override String ToString()
        {
            return name + " - " + rank;
        }
    }

    struct Check
    {
        private Int32 id;
        private String name;
        private Int16 num;
        private Int32 cost, totalCost;

        public Int32 Id
        {
            get
            {
                return id;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
        }

        public Int16 Num
        {
            get
            {
                return num;
            }
        }

        public Int32 Cost
        {
            get
            {
                return cost;
            }
        }

        public Int32 TotalCost
        {
            get
            {
                return totalCost;
            }
        }

        public void SetCheck(Int32 checkId, String checkName, Int16 checkNum, Int32 checkCost)
        {
            id = checkId;
            name = checkName;
            num = checkNum;
            cost = checkCost;
            totalCost = cost * num;
        }

        public void Clear()
        {
            id = 0;
            name = "";
            num = 0;
            cost = 0;
            totalCost = 0;
        }

        public override String ToString()
        {
            return id.ToString() + " - " + name;
        }
    }

    struct Medicit
    {
        private Int32 id;
        private String name;
        private Int16 num;
        private Int32 cost, totalCost;

        public Int32 Id
        {
            get
            {
                return id;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
        }

        public Int16 Num
        {
            get
            {
                return num;
            }
        }

        public Int32 Cost
        {
            get
            {
                return cost;
            }
        }

        public Int32 TotalCost
        {
            get
            {
                return totalCost;
            }
        }

        public void SetCheck(Int32 midicitId, String midicitName, Int16 midicitNum, Int32 midicitCost)
        {
            id = midicitId;
            name = midicitName;
            num = midicitNum;
            cost = midicitCost;
            totalCost = cost * num;
        }

        public void Clear()
        {
            id = 0;
            name = "";
            num = 0;
            cost = 0;
            totalCost = 0;
        }

        public override String ToString()
        {
            return id.ToString() + " - " + name;
        }
    }

    struct MedicitItem
    {
        private String name;
        private Int32 cost;

        public String Name
        {
            get
            {
                return name;
            }
        }

        public Int32 Cost
        {
            get
            {
                return cost;
            }
        }

        public void SetItem(String itemName, Int32 itemCost)
        {
            name = itemName;
            cost = itemCost;
        }
    }

    struct CheckItem
    {
        private String name;
        private Int32 cost;

        public String Name
        {
            get
            {
                return name;
            }
        }

        public Int32 Cost
        {
            get
            {
                return cost;
            }
        }

        public void SetItem(String itemName, Int32 itemCost)
        {
            name = itemName;
            cost = itemCost;
        }
    }

    struct DoctorItem
    {
        private String name, rank;

        public String Name
        {
            get
            {
                return name;
            }
        }

        public String Rank
        {
            get
            {
                return rank;
            }
        }

        public void SetItem(String itemName, String itemRank)
        {
            name = itemName;
            rank = itemRank;
        }

        public void Clear()
        {
            name = "";
            rank = "";
        }
    }

    struct RankItem
    {
        private String name;
        private Byte percent, tax;

        public String Name
        {
            get
            {
                return name;
            }
        }

        public Byte Percent
        {
            get
            {
                return percent;
            }
        }

        public Byte Tax
        {
            get
            {
                return tax;
            }
        }

        public void SetItem(String itemName, Byte itemTax, Byte itemPercent)
        {
            name = itemName;
           
            if (itemPercent >= 0 || itemPercent <= 100)
                percent = itemPercent;
            else
                throw new PercentOutOfRangeException();

            if (itemTax >= 0 || itemTax <= 100)
                tax = itemTax;
            else
                throw new PercentOutOfRangeException();
        }
    }

    class DoctorsCollection : System.Collections.CollectionBase
    {
        private Int32 plusCost, plusCostTaxEnter, plusCostPure;

        public Int32 PlusCost
        {
            get
            {
                return plusCost;
            }
        }

        public Int32 PlusCostTaxEnter
        {
            get
            {
                return plusCostTaxEnter;
            }
        }

        public Int32 PlusCostPure
        {
            get
            {
                return plusCostPure;
            }
        }

        public void ClearValue()
        {
            plusCost = 0;
            plusCostTaxEnter = 0;
            plusCostPure = 0;

            List.Clear();
        }

        public void Add(Doctor doctorItem)
        {
            plusCost += doctorItem.Cost;
            plusCostTaxEnter += doctorItem.CostTaxEnter;
            plusCostPure += doctorItem.CostPure;
            List.Add(doctorItem);
        }

        public void Remove(Doctor doctorItem)
        {
            plusCost -= doctorItem.Cost;
            plusCostTaxEnter -= doctorItem.CostTaxEnter;
            plusCostPure -= doctorItem.CostPure;
            List.Remove(doctorItem);
        }

        public Doctor this[Int32 doctorIndex]
        {
            set
            {
                List[doctorIndex] = value;
            }
            get
            {
                return (Doctor)List[doctorIndex];
            }
        }
    }

    class ChecksCollection : System.Collections.CollectionBase
    {
        private Int32 plusCost, plusTotalCost;
        private Int16 plusNum;

        public Int32 PlusCost
        {
            get
            {
                return plusCost;
            }
        }

        public Int32 PlusTotalCost
        {
            get
            {
                return plusTotalCost;
            }
        }

        public Int32 PlusNum
        {
            get
            {
                return plusNum;
            }
        }

        public void ClearValue()
        {
            plusCost = 0;
            plusTotalCost = 0;
            plusNum = 0;

            List.Clear();
        }

        public void Add(Check checkItem)
        {
            plusCost += checkItem.Cost;
            plusTotalCost += checkItem.TotalCost;
            plusNum += checkItem.Num;
            List.Add(checkItem);
        }

        public void Remove(Check checkItem)
        {
            plusCost -= checkItem.Cost;
            plusTotalCost -= checkItem.TotalCost;
            plusNum -= checkItem.Num;
            List.Remove(checkItem);
        }

        public Check this[Int32 checkIndex]
        {
            set
            {
                List[checkIndex] = value;
            }
            get
            {
                return (Check)List[checkIndex];
            }
        }
    }

    class MedicitsCollection : System.Collections.CollectionBase
    {
        private Int32 plusCost, plusTotalCost;
        private Int16 plusNum;

        public Int32 PlusCost
        {
            get
            {
                return plusCost;
            }
        }

        public Int32 PlusTotalCost
        {
            get
            {
                return plusTotalCost;
            }
        }

        public Int32 PlusNum
        {
            get
            {
                return plusNum;
            }
        }

        public void ClearValue()
        {
            plusCost = 0;
            plusTotalCost = 0;
            plusNum = 0;

            List.Clear();
        }

        public void Add(Medicit medicitItem)
        {
            plusCost += medicitItem.Cost;
            plusTotalCost += medicitItem.TotalCost;
            plusNum += medicitItem.Num;
            List.Add(medicitItem);
        }

        public void Remove(Medicit medicitItem)
        {
            plusCost -= medicitItem.Cost;
            plusTotalCost -= medicitItem.TotalCost;
            plusNum -= medicitItem.Num;
            List.Remove(medicitItem);
        }

        public Medicit this[Int32 medicitIndex]
        {
            set
            {
                List[medicitIndex] = value;
            }
            get
            {
                return (Medicit)List[medicitIndex];
            }
        }
    }

    struct Ico
    {
        private Int32 cost, totalCost;
        private Int16 num;
        private Doctor drIco;

        public Int32 Cost
        {
            get { return cost; }
        }

        public Int32 TotalCost
        {
            get { return totalCost; }
        }

        public Int16 Num
        {
            get { return num; }
        }

        public Doctor DrIco
        {
            get { return drIco; }
        }

        public void SetIco(Doctor doctor, Int32 icoCost, Int16 icoNum)
        {
            cost = icoCost;
            num = icoNum;
            totalCost = cost * num;
            drIco = doctor;
        }

        public void Clear()
        {
            cost = 0;
            num = 0;
            totalCost = 0;
        }

        public override String ToString()
        {
            return drIco.Name;
        }
    }

    struct Dasam
    {
        private Int32 cost;
        private String name, size;

        public Int32 Cost
        {
            get { return cost; }
        }

        public String Name
        {
            get { return name; }
        }

        public String Size
        {
            get { return size; }
        }

        public void SetDasam(String dasamType, String dasamSize, Int32 dasamCost)
        {
            name = Module.CheckString(dasamType, 20);
            size = Module.CheckString(dasamSize, 20);
            cost = dasamCost;
        }

        public void Clear()
        {
            name = "";
            size = "";
            cost = 0;
        }

        public override String ToString()
        {
            return name + " - " + size + " - ( " + cost + " ) .";
        }
    }

    struct Help
    {
        private String name, bookNum;
        private Int32 cost;
        private DateTime bookDate;

        public String Name
        {
            get { return name; }
        }

        public String BookNum
        {
            get { return bookNum; }
        }

        public Int32 Cost
        {
            get { return cost; }
        }

        public DateTime BookDate
        {
            get { return bookDate; }
        }

        public void SetHelp(String companyName, String bookNumber, Int32 helpAmount, DateTime dateOfBook)
        {
            name = Module.CheckString(companyName, 100);
            bookNum = Module.CheckString(bookNumber, 50);
            cost = helpAmount;
            bookDate = dateOfBook;
        }

        public void Clear()
        {
            name = "";
            bookNum = "";
            cost = 0;
        }

        public override String ToString()
        {
            return name + " , / " + bookNum + " / , ( " + cost + " ) .";
        }
    }

    struct Sleep
    {
        private Int32 costCare, totalCostCare, costSweet, totalCostSweet, totalCost;
        private Int16 numCare, numSweet;

        public Int32 CostCare
        {
            get { return costCare; }
        }

        public Int32 TotalCostCare
        {
            get { return totalCostCare; }
        }

        public Int32 CostSweet
        {
            get { return costSweet; }
        }

        public Int32 TotalCostSweet
        {
            get { return totalCostSweet; }
        }

        public Int32 TotalCost
        {
            get { return totalCost; }
        }

        public Int16 NumCare
        {
            get { return numCare; }
        }

        public Int16 NumSweet
        {
            get { return numSweet; }
        }

        public void SetSleep(Int32 roomCareCost, Int16 roomCareNumber, Int32 roomSweetCost, Int16 roomSweetNumber)
        {
            costCare = roomCareCost;
            numCare = roomCareNumber;
            totalCostCare = costCare * numCare;

            costSweet = roomSweetCost;
            numSweet = roomSweetNumber;
            totalCostSweet = costSweet * numSweet;

            totalCost = totalCostSweet + totalCostCare;
        }

        public void Clear()
        {
            costCare = 0; numCare = 0; totalCostCare = 0;
            costSweet = 0; numSweet = 0; totalCostSweet = 0;
            totalCost = 0;
        }
    }
}