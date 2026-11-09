using System;
using System.Drawing;

namespace RentalItems
{
    public abstract class EconomicBuild
    {
        private Single sellPrice;
        private Single rentalMonthPrice;
        private Int32 rentalMonthesNum;

        public event ErrorHandler ErrorEventHandler;

        public Single SellPrice
        {
            get
            {
                return sellPrice;
            }
            set
            {
                if (value >= 0)
                    sellPrice = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Price must positive .\nEntered Value : " + value)));
            }
        }

        public Single RentalMonthPrice
        {
            get
            {
                return rentalMonthPrice;
            }
            set
            {
                if (value >= 0)
                    rentalMonthPrice = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Price must positive .\nEntered Value : " + value)));
            }
        }

        public Int32 RentalMonthesNum
        {
            get
            {
                return rentalMonthesNum;
            }
            set
            {
                if (value >= 0)
                    rentalMonthesNum = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Monthes Number must positive .\nEntered Value : " + value)));
            }
        }
    }

    public class RoomType
    {
        private Int32 id;
        private String name;
        private String description;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public RoomType(String roomName)
        {
            if (roomName == null || roomName == "")
                ErrorEventHandler(this, new ErrorEventArgs(new Exception("using null or empty string for room name is not permits")));
            else
                name = roomName;
        }

        public RoomType(String roomName, String roomDescription)
            : this(roomName)
        {
            description = roomDescription;
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

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Picture
    {
        private Int32 id;
        private String name;
        private String location;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public Picture(String pictureLocation)
        {
            if (pictureLocation == null || pictureLocation == "")
                ErrorEventHandler(this, new ErrorEventArgs(new Exception("using null or empty string for room name is not permits")));
            else
                location = pictureLocation;
        }

        public Picture(String pictureLocation, String pictureName)
            : this(pictureLocation)
        {
            name = pictureName;
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

        public String Location
        {
            get
            {
                return location;
            }
            set
            {
                location = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class PartFeature
    {
        private Int32 id;
        private String name;
        private String description;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public PartFeature()
        {
            name = "";
            description = "";
            deleted = false;
        }

        public PartFeature(String feature)
        {
            if (feature == null || feature == "")
                ErrorEventHandler(this, new ErrorEventArgs(new Exception("using null or empty string for feature is not permits")));
            else
                name = feature;
        }

        public PartFeature(String feature, String featureDescription)
            : this(feature)
        {
            description = featureDescription;
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

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Room
    {
        private Int32 id;
        private Double width;
        private Double tall;
        private String name;
        private RoomType type;
        private String description;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Room()
        {
            width = tall = 0;
            name = "";
            type = null;
            description = "";
        }

        public Room(String roomName, RoomType roomType, Double roomWidth, Double roomTall, String roomDescription)
        {
            name = roomName;
            type = roomType;
            width = roomWidth;
            tall = roomTall;
            description = roomDescription;
        }

        public Int32 Id
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

        public Double Width
        {
            get
            {
                return width;
            }
            set
            {
                if (value >= 0)
                    width = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Deminsion must non nigative value\nEntered Value : " + value)));
            }
        }

        public Double Tall
        {
            get
            {
                return tall;
            }
            set
            {
                if (value >= 0)
                    tall = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Deminsion must non nigative value\nEntered Value : " + value)));
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

        public RoomType Type
        {
            get
            {
                return type;
            }
            set
            {
                type = value;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Part : EconomicBuild
    {
        private Int32 id;
        private Room[] rooms;
        private String name;
        private String description;
        private String address;
        private String sn;
        private Client[] owners;
        private PartFeature feature;
        private Double height;
        private Boolean withItems;
        private Boolean voltMeter;
        private Boolean waterMeter;
        private Picture[] pictures;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public Room[] Rooms
        {
            get
            {
                return rooms;
            }
            set
            {
                rooms = value;
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

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public String Address
        {
            get
            {
                return address;
            }
            set
            {
                address = value;
            }
        }

        public PartFeature Feature
        {
            get
            {
                return feature;
            }
            set
            {
                feature = value;
            }
        }

        public String Sn
        {
            get
            {
                return sn;
            }
            set
            {
                sn = value;
            }
        }

        public Double Height
        {
            get
            {
                return height;
            }
            set
            {
                if (value >= 0)
                    height = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Deminsion must non nigative value\nEntered Value : " + value)));
            }
        }

        public Boolean WithItems
        {
            get
            {
                return withItems;
            }
            set
            {
                withItems = value;
            }
        }

        public Boolean VoltMeter
        {
            get
            {
                return voltMeter;
            }
            set
            {
                voltMeter = value;
            }
        }

        public Boolean WaterMeter
        {
            get
            {
                return waterMeter;
            }
            set
            {
                waterMeter = value;
            }
        }

        public Client[] Owners
        {
            get
            {
                return owners;
            }
            set
            {
                owners = value;
            }
        }

        public Picture[] Pictures
        {
            get
            {
                return pictures;
            }
            set
            {
                pictures = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Build
    {
        private Int32 id;
        private Part[] parts;
        private String sn;
        private String name;
        private String address;
        private String description;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public Part[] Parts
        {
            get
            {
                return parts;
            }
            set
            {
                parts = value;
            }
        }

        public String Sn
        {
            get
            {
                return sn;
            }
            set
            {
                sn = value;
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

        public String Address
        {
            get
            {
                return address;
            }
            set
            {
                address = value;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Ground : EconomicBuild
    {
        private Int32 id;
        private String sn;
        private String name;
        private String description;
        private String address;
        private Single area;
        private Client[] owners;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public String Sn
        {
            get
            {
                return sn;
            }
            set
            {
                sn = value;
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

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public String Address
        {
            get
            {
                return address;
            }
            set
            {
                address = value;
            }
        }

        public Single Area
        {
            get
            {
                return area;
            }
            set
            {
                if (value >= 0)
                    area = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Area must positive value .\nEntered Value : " + value)));
            }
        }

        public Client[] Owners
        {
            get
            {
                return owners;
            }
            set
            {
                owners = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Person
    {
        private Int32 id;
        private String firstName;
        private String lastName;
        private String sn;
        private String father;
        private String mother;
        private String addressPerm;
        private String addressTemp;
        private String orignePlace;
        private String birthPlace;
        private DateTime birthDate;
        private Boolean male;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public String FirstName
        {
            get
            {
                return firstName;
            }
            set
            {
                firstName = value;
            }
        }

        public String LastName
        {
            get
            {
                return lastName;
            }
            set
            {
                lastName = value;
            }
        }

        public String Sn
        {
            get
            {
                return sn;
            }
            set
            {
                sn = value;
            }
        }

        public String Father
        {
            get
            {
                return father;
            }
            set
            {
                father = value;
            }
        }

        public String Mother
        {
            get
            {
                return mother;
            }
            set
            {
                mother = value;
            }
        }

        public String AddressPerm
        {
            get
            {
                return addressPerm;
            }
            set
            {
                addressPerm = value;
            }
        }

        public String AddressTemp
        {
            get
            {
                return addressTemp;
            }
            set
            {
                addressTemp = value;
            }
        }

        public String OrignePlace
        {
            get
            {
                return orignePlace;
            }
            set
            {
                orignePlace = value;
            }
        }

        public String BirthPlace
        {
            get
            {
                return birthPlace;
            }
            set
            {
                birthPlace = value;
            }
        }

        public DateTime BirthDate
        {
            get
            {
                return birthDate;
            }
            set
            {
                birthDate = value;
            }
        }

        public Boolean Male
        {
            get
            {
                return male;
            }
            set
            {
                male = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Client : Person
    {
        private Single requestPriceFrom;
        private Single requestPriceTo;
        private Int32 requestState;
        private String requestCity;
        private EconomicBuild[] requestedBuilds;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Single RequestPriceFrom
        {
            get
            {
                return requestPriceFrom;
            }
            set
            {
                if (value >= 0)
                    requestPriceFrom = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Price must positive value .\nEntered value : " + value)));
            }
        }

        public Single RequestPriceTO
        {
            get
            {
                return requestPriceTo;
            }
            set
            {
                if (value >= 0)
                    requestPriceTo = value;
                else
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("Price must positive value .\nEntered value : " + value)));
            }
        }

        public Int32 RequestState
        {
            get
            {
                return requestState;
            }
            set
            {
                requestState = value;
            }
        }

        public String RequestCity
        {
            get
            {
                return requestCity;
            }
            set
            {
                requestCity = value;
            }
        }

        public EconomicBuild[] RequestedBuilds
        {
            get
            {
                return requestedBuilds;
            }
            set
            {
                requestedBuilds = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Item
    {
        private Int32 id;
        private String name;
        private String description;
        private Boolean isIncome;
        private Boolean deleted;

        public event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                if (name == "" || name == null)
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("null or empty name for item is pirmitts .")));
                else
                    name = value;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Boolean IsIncome
        {
            get
            {
                return isIncome;
            }
            set
            {
                isIncome = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class MoneyItem
    {
        private Int32 id;
        private Item baseItem;
        private String description;
        private DateTime date;
        private Single currentAccount;
        private Single nextAccount;
        private Boolean deleted;

        public Int32 Id
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

        public Item BaseItem
        {
            get
            {
                return baseItem;
            }
            set
            {
                baseItem = value;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public DateTime Date
        {
            get
            {
                return date;
            }
            set
            {
                date = value;
            }
        }

        public Single CurrentAccount
        {
            get
            {
                return currentAccount;
            }
            set
            {
                currentAccount = value;
            }
        }

        public Single NextAccount
        {
            get
            {
                return nextAccount;
            }
            set
            {
                nextAccount = value;
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class Cash
    {
        private Int32 id;
        private String name;
        private String description;
        private Single incomeMoneyCurrent;
        private Single incomeMoneyNext;
        private Single paymentMoneyCurrent;
        private Single paymentMoneyNext;
        private MoneyItem[] items;
        private Boolean deleted;

        event ErrorHandler ErrorEventHandler;

        public Int32 Id
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

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Single IncomeMoneyCurrent
        {
            get
            {
                return incomeMoneyCurrent;
            }
        }

        public Single IncomeMoneyNext
        {
            get
            {
                return incomeMoneyNext;
            }
        }

        public Single PaymentMoneyCurrent
        {
            get
            {
                return paymentMoneyCurrent;
            }
        }

        public Single PaymentMonetNext
        {
            get
            {
                return paymentMoneyNext;
            }
        }

        public MoneyItem[] Items
        {
            get
            {
                return items;
            }
            set
            {
                incomeMoneyCurrent = 0;
                incomeMoneyNext = 0;
                items = value;

                for (Int32 i = 0; i < items.Length; i++)
                {
                    if (items[i].BaseItem.IsIncome)
                    {
                        incomeMoneyCurrent += Items[i].CurrentAccount;
                        incomeMoneyNext += Items[i].NextAccount;
                    }
                    else
                    {
                        paymentMoneyCurrent += Items[i].CurrentAccount;
                        paymentMoneyNext += Items[i].NextAccount;
                    }
                }
            }
        }

        public Boolean Deleted
        {
            get
            {
                return deleted;
            }
            set
            {
                deleted = value;
            }
        }
    }

    public class NprogType
    {
        private Int32 id;
        private String name;
        private String description;
        private Boolean isProg;

        private Boolean insertEconomicBuild;
        private Boolean insertPerson;
        private Boolean insertCash;

        private Boolean updateEconomicBuild;
        private Boolean updatePerson;
        private Boolean updateCash;

        private Boolean deleteEconomicBuild;
        private Boolean deletePerson;
        private Boolean deleteCash;

        private Boolean selectEconomicBuild;
        private Boolean selectPerson;
        private Boolean selectCash;

        public Int32 Id
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

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Boolean IsProg
        {
            get
            {
                return isProg;
            }
            set
            {
                isProg = value;
            }
        }

        public Boolean InsertEconomicBuild
        {
            get
            {
                return insertEconomicBuild;
            }
            set
            {
                insertEconomicBuild = value;
            }
        }

        public Boolean InsertPerson
        {
            get
            {
                return insertPerson;
            }
            set
            {
                insertPerson = value;
            }
        }

        public Boolean InsertCash
        {
            get
            {
                return insertCash;
            }
            set
            {
                insertCash = value;
            }
        }

        public Boolean UpdateEconomicBuild
        {
            get
            {
                return updateEconomicBuild;
            }
            set
            {
                updateEconomicBuild = value;
            }
        }

        public Boolean UpdatePerson
        {
            get
            {
                return updatePerson;
            }
            set
            {
                updatePerson = value;
            }
        }

        public Boolean UpdateCash
        {
            get
            {
                return updateCash;
            }
            set
            {
                updateCash = value;
            }
        }

        public Boolean DeleteEconomicBuild
        {
            get
            {
                return deleteEconomicBuild;
            }
            set
            {
                deleteEconomicBuild = value;
            }
        }

        public Boolean DeletePerson
        {
            get
            {
                return deletePerson;
            }
            set
            {
                deletePerson = value;
            }
        }

        public Boolean DeleteCash
        {
            get
            {
                return deleteCash;
            }
            set
            {
                deleteCash = value;
            }
        }

        public Boolean SelectEconomicBuild
        {
            get
            {
                return selectEconomicBuild;
            }
            set
            {
                selectEconomicBuild = value;
            }
        }

        public Boolean SelectPerson
        {
            get
            {
                return selectPerson;
            }
            set
            {
                selectPerson = value;
            }
        }

        public Boolean SelectCash
        {
            get
            {
                return selectCash;
            }
            set
            {
                selectCash = value;
            }
        }
    }

    public class Nprog
    {
        private Int32 id;
        private String name;
        private String enter;
        private String description;
        private Nprog type;

        public Int32 Id
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

        public String Enter
        {
            get
            {
                return enter;
            }
            set
            {
                enter = value;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Nprog Type
        {
            get
            {
                return type;
            }
            set
            {
                type = value;
            }
        }
    }
}
