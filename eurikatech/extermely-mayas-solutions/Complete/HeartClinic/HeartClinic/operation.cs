using System;
using System.Collections.Generic;
using System.Text;

namespace HeartClinic
{
    struct Operation
    {
        private Int64 id, checkNum;
        private String operationHall, operationType, operationName, operationDescription;
        private String sickName, sickJob, friendName;
        private Sleep sickSleep, friendSleep;
        private DateTime dateEnter, dateExit, dateOperation, dateCheck;
        private Byte soldJob;
        private Int32 costOperation, costOperationRoom, costPenj, costDiscus, costCare;
        private Int32 costVector, costDiagram, costBalon, costOxider, costOxiderBig, costOxiderSmall;
        private Int32 plusCost, totalCost, checkCost, sold;
        private Help soldCompany, soldCorporation, soldFamilly;
        private MedicitsCollection medicits;
        private ChecksCollection checks;
        private Int32 priceVector, priceDiagram, priceBalon;
        private Int16 numVector, numDiagram, numBalon;
        private DoctorsCollection drM1, drM2, drPhysics, drNurs, drCare, drPenjTech;
        private Dasam dt, dm, da;
        private Ico icoColor, icoPenj1, icoPenj2;

        public Int64 Id
        {
            get { return id; }
        }

        public Int64 CheckNum
        {
            get { return checkNum; }
        }

        public String OperationHall
        {
            get { return operationHall; }
        }

        public String OperationType
        {
            get { return operationType; }
        }

        public String OperationName
        {
            get { return operationName; }
        }

        public String OperationDescription
        {
            get { return operationDescription; }
        }

        public String SickName
        {
            get { return sickName; }
        }

        public String SickJob
        {
            get { return sickJob; }
        }

        public String FriendName
        {
            get { return friendName; }
        }

        public Sleep SickSleep
        {
            get { return sickSleep; }
        }

        public Sleep FriendSleep
        {
            get { return friendSleep; }
        }

        public DateTime DateEnter
        {
            get { return dateEnter; }
        }

        public DateTime DateExit
        {
            get { return dateExit; }
        }

        public DateTime DateOperation
        {
            get { return dateOperation; }
        }

        public DateTime DateCheck
        {
            get { return dateCheck; }
        }

        public Byte SoldJob
        {
            get { return soldJob; }
        }

        public Int32 CostOperation
        {
            get { return costOperation; }
        }

        public Int32 CostOperationRoom
        {
            get { return costOperationRoom; }
        }

        public Int32 CostPenj
        {
            get { return costPenj; }
        }

        public Int32 CostDiscus
        {
            get { return costDiscus; }
        }

        public Int32 CostCare
        {
            get { return costCare; }
        }

        public Int32 CostVector
        {
            get { return costVector; }
        }

        public Int32 CostDiagram
        {
            get { return costDiagram; }
        }

        public Int32 CostBalon
        {
            get { return costBalon; }
        }

        public Int32 CostOxider
        {
            get { return costOxider; }
        }

        public Int32 CostOxiderBig
        {
            get { return costOxiderBig; }
        }

        public Int32 CostOxiderSmall
        {
            get { return costOxiderSmall; }
        }

        public Int32 Sold
        {
            get { return sold; }
        }

        public Int32 PlusCost
        {
            get { return plusCost; }
        }

        public Int32 TotalCost
        {
            get { return totalCost; }
        }

        public Int32 CheckCost
        {
            get { return checkCost; }
        }

        public Help SoldCompany
        {
            get { return soldCompany; }
        }

        public Help SoldCorporation
        {
            get { return soldCorporation; }
        }

        public Help SoldFamilly
        {
            get { return soldFamilly; }
        }

        public MedicitsCollection Medicits
        {
            get { return medicits; }
        }

        public ChecksCollection Checks
        {
            get { return checks; }
        }

        public Int32 PriceVector
        {
            get { return priceVector; }
        }

        public Int32 PriceDiagram
        {
            get { return priceDiagram; }
        }

        public Int32 PriceBalon
        {
            get { return priceBalon; }
        }

        public Int16 NumVector
        {
            get { return numVector; }
        }

        public Int16 NumDiagram
        {
            get { return numDiagram; }
        }

        public Int16 NumBalon
        {
            get { return numBalon; }
        }

        public DoctorsCollection DrM1
        {
            get { return drM1; }
        }

        public DoctorsCollection DrM2
        {
            get { return drM2; }
        }

        public DoctorsCollection DrPhysics
        {
            get { return drPhysics; }
        }

        public DoctorsCollection DrNurs
        {
            get { return drNurs; }
        }

        public DoctorsCollection DrPenjTech
        {
            get { return drPenjTech; }
        }

        public DoctorsCollection DrCare
        {
            get { return drCare; }
        }

        public Dasam DT
        {
            get { return dt; }
        }

        public Dasam DA
        {
            get { return da; }
        }

        public Dasam DM
        {
            get { return dm; }
        }

        public Ico IcoColor
        {
            get { return icoColor; }
        }

        public Ico IcoPenj1
        {
            get { return icoPenj1; }
        }

        public Ico IcoPenj2
        {
            get { return icoPenj2; }
        }

        public void SetOperation(Int64 operationId, String hall, String type, String nameOfOperation,
        String descriptionOfOperation, String nameOfSick, String nameOfFriend, String JobOfFriend, 
        Sleep sleepOfSick, Sleep sleepOfFriend, Int32 costOfOperation, Int32 costOfDiscus, Int32 costOfCare, 
        Int32 priceOfVector, Int16 numOfVector, Int32 priceOfDiagram, Int16 numOfDiagram, Int32 priceOfBalon,
        Int16 numOfBalon, Int32 OxiderBig, Int32 OxiderSmall, Help corporation, Help company, Help familly, 
        Int64 numOfCheck, MedicitsCollection operationMedicits, ChecksCollection operationChecks, 
        DoctorsCollection M1,DoctorsCollection M2,DoctorsCollection physics,DoctorsCollection nurs,DoctorsCollection care,DoctorsCollection penj,
        Dasam dasamT, Dasam dasamM, Dasam dasamA, Ico color, Ico penj1,
        Ico penj2, DateTime enter, DateTime exit, DateTime operation, DateTime check)
        {
            id = operationId;
            checkNum = numOfCheck;
            dateEnter = enter; dateOperation = operation;
            dateExit = exit; ; dateCheck = check;
            operationHall = Module.CheckString(hall, 50); operationType = Module.CheckString(type, 20);
            operationName = Module.CheckString(nameOfOperation, 150);
            operationDescription = Module.CheckString(descriptionOfOperation, 200);
            sickName = Module.CheckString(nameOfSick, 60);
            friendName = Module.CheckString(nameOfFriend, 50);
            sickJob = Module.CheckString(JobOfFriend, 20);
            sickSleep = sleepOfSick; friendSleep = sleepOfFriend;
            costOperation = costOfOperation;
            costDiscus = costOfDiscus;
            costCare = costOfCare;
            priceVector = priceOfVector;
            numVector = numOfVector;
            priceDiagram = priceOfDiagram;
            numDiagram = numOfDiagram;
            priceBalon = priceOfBalon;
            numBalon = numOfBalon;
            costOxiderBig = OxiderBig;
            costOxiderSmall = OxiderSmall;
            soldCorporation = corporation;
            soldFamilly = familly;
            soldCompany = company;
            medicits = operationMedicits;
            checks = operationChecks;
            dt = dasamT; da = dasamA; dm = dasamM;
            icoColor = color; icoPenj1 = penj1; icoPenj2 = penj2;
            drCare = care; drPenjTech = penj; drPhysics = physics;
            drNurs = nurs; drM1 = M1; drM2 = M2;

            //math the value of operation
            costOperationRoom = Convert.ToInt32(costOperation * 0.35);
            costPenj = Convert.ToInt32(costOperation * 0.3);
            costVector = numVector * priceVector;
            costDiagram = numDiagram * priceDiagram;
            costBalon = numBalon * priceBalon;
            costOxider = costOxiderBig + costOxiderSmall;

            //total cost
            plusCost = costOperation + costOperationRoom + costPenj + costDiscus + costCare + costVector + costBalon + costOxider +
                icoColor.TotalCost + icoPenj1.TotalCost + icoPenj2.TotalCost + medicits.PlusTotalCost + checks.PlusTotalCost +
                dt.Cost + dm.Cost + da.Cost;

            //solds
            totalCost = plusCost - (Int32)(plusCost * (soldJob / 100));
            sold = soldCompany.Cost + soldCorporation.Cost + soldFamilly.Cost;
            checkCost = totalCost - sold;

        }
    }
}

