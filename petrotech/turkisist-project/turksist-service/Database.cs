//class database is used to connect to database and save data

using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
namespace TurksistService;

class Database
{
    //constructor function contains the dbname and server, access
    public Database(string server, string user, string password)
    {
        //public connection string
        string cs = "Server=" + server + ";Database=" + DB_NAME + ";";

        //decide to use windows authentication or user name, password
        if ((user == null || user == "") && (password == null || password == ""))
            cs += "Trusted_Connection=True;";
        else
            cs += "user=" + user + ";password=" + password + ";";

        //define connection object depends on connection string
        connection = new SqlConnection(cs);
        
        try
        {
            //test is connection successfull and send empty command
            //connection.Open();
            command = new SqlCommand("", connection);
        }
        catch (Exception ex)
        {
            Environment.Exit(1);
        }

        //initial queries
        tableQueries=new Dictionary<string, string>(11);
        tableQueries.Add("calibrationchart", "SELECT ChartId, TankId, Height, Volume, IsSend, IsSendHQ, DateOfSend, DateOfHQ, DateOfReg, IsDeleted, IsUpdated, DateOfUpdate FROM CalibrationChart");
        tableQueries.Add("epdkfueltype", "SELECT Id, EpdkNo, Name, Opacification FROM EpdkFuelType");
        tableQueries.Add("epdkue3", "SELECT Id, TankId, DateOfData, Stock1, Filling, PumpSales, Stock2, EpdkFuelId, TankNumber, DateOfReg, IsSend, IsSendHQ, DateOfSend, DateOfHQ, PumpName FROM EpdkUE3");
        tableQueries.Add("filling", "SELECT FillingId, TankId, ShiftId, TankFilling, FillingType, InitialVolume, EndVolume, InitialStock, EndStock, Tempereture, PumpSales, StartingDate, EndDate, DateofWaybill, WaybillNumber, DateOfReg, FillingMissing, WaybillVolume, IsSend, DateOfSend, IsSendHQ, DateOfHQ FROM Filling");
        tableQueries.Add("fillingtemp", "SELECT FillingId, TankId, ShiftId, Filling, FillingType, InitialVolume, EndVolume, InitialStock, EndStock, Tempereture, PumpSales, StartingDate, EndDate, DateofWaybill, WaybillNumber, DateOfReg, FillingMissing, WaybillVolume, IsSend, DateOfSend, IsSendHQ, DateOfHQ FROM FillingTemp");
        tableQueries.Add("probefault", "SELECT Id, FaultCode, StartingDate, EndDate, TankId, IsSend, DateOfSend, IsSendHQ, DateOfHQ, Statu, IsUpdate, DateOfUpdate FROM ProbeFault");
        tableQueries.Add("sales", "SELECT SalesId, PumpNo, DisplayNo, NozzleNo, FuelId, EpdkFuelId, ShiftNo, TankId, EmployeeId, ReceiptNumber, Plate, UnitPrice, Volume, Amount, VillageId, TankerId, CustomerId, VehicleId, SalesType, Temperature, InitialHeight, EndHeight, InitialVolume, EndVolume, InitialTotalizer, EndTotalizer, DiscountPrice, DiscountAmount, IsSend, DateOfSend, DateOfReg, DateOfSale, IsSendHQ, DateOfHQ, DateOfBegin, DateOfEnd, Bap, PriceId, RUPrice, MxIx, CurrentKm, CustDecVal, Prepayment, AmountRequest, AmountPaid, AmountBalance, LoginName, PreId, EOT FROM Sales");
        tableQueries.Add("salestemp", "SELECT SalesId, PumpNo, DisplayNo, NozzleNo, FuelId, EpdkFuelId, ShiftNo, TankId, EmployeeId, ReceiptNumber, Plate, UnitPrice, Volume, Amount, VillageId, TankerId, CustomerId, VehicleId, SalesType, Temperature, InitialHeight, EndHeight, InitialVolume, EndVolume, InitialTotalizer, EndTotalizer, DiscountPrice, DiscountAmount, IsSend, DateOfSend, DateOfReg, DateOfSale, IsSendHQ, DateOfHQ, DateOfBegin, DateOfEnd, Bap, PriceId, RUPrice, MxIx, CurrentKm FROM SalesTemp");
        tableQueries.Add("tankmeasure", "SELECT Id, TankId, FuelId, ShiftId, FuelHeigth, WaterHeight, FuelVolume, WaterVolume, Temperature, DateOfReg, IsSend, IsSendHQ, DateOfSend, DateOfHQ, IsControl, PortData FROM TankMeasure");
        tableQueries.Add("tankmeasuretemp", "SELECT Id, TankId, FuelId, ShiftId, FuelHeigth, WaterHeight, FuelVolume, WaterVolume, Temperature, DateOfReg, PortData, IsSend, IsSendHQ, DateOfSend, DateOfHQ, IsControl FROM TankMeasureTemp");
        tableQueries.Add("tanksettings", "SELECT TankId, TankName, DisplayNo, FuelId, EpdkFuelId, ProtokolId, Addr, PortName, Height, Length, Camber, ManifoltId, Capacity, AutoCalibration, AutoFilling, FillingControl, ProbeHeight, SpeedWare, MaxAlarm, MinAlarm, WaterAlarm, MeasureId, FuelSpace, WaterSpace, Inventory, DateOfReg, DateOfUpdate, IsSend, IsSendHQ, DateOfSend, DateOfHQ, IsUpdated, Statu, IsDeleted, IsOnline, WaterHeight, FuelHeight, WaterVolume, FuelVolume, Temperature, StopSelling, Orders, DisableWater, TankStyle, AutoCalibValue, PumpName, TankErrorCode, ChNo FROM TankSettings");
    }

    //other constructor for windows authentication db connection
    public Database(string server) : this(server, "", "") { }

    //public functions region
    public string Query(string table, string field, string fromValue, string toValue)
    {
        if(connection!=null)
            if (true) //connection.State == System.Data.ConnectionState.Open)
            {
                try
                {
                    //retreve select command
                    string cmd = tableQueries[table];
                    if(field!=null && field!="") {
                        if(fromValue!="" && toValue!="")
                            cmd+=string.Format(" WHERE {0}>={1} AND {0}<{2}", field, fromValue, toValue);
                        else if(fromValue!="")
                            cmd+=string.Format(" WHERE {0}={1}", field, fromValue);
                        else
                            cmd+=string.Format(" WHERE {0} IS NOT NULL", field);
                    }

                    command.CommandText = cmd+";";

                    //execute command command
                    dataReader=command.ExecuteReader();
                    return toJson(dataReader);
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            else
                return connection.State.ToString();
        else
            return "";
    }

    public string Query(string table, string field, string value) 
    {
        return Query(table, field, value, "");
    }

    public string Query(string table, string field) 
    {
        return Query(table, field, "", "");
    }

    public string Query(string table)
    {
        return Query(table, "", "", "");
    }

    private string toJson(SqlDataReader dataReader)
    {
        var table=new DataTable();
        table.Load(dataReader);
        return JsonConvert.SerializeObject(table);
    }

    //when destruct the class, close db connection
    ~Database()
    {
        //connection.Close();
    }

    public const string DB_NAME = "TurksistAutomation";

    private SqlConnection connection;
    private SqlCommand command;
    private SqlDataReader dataReader;

    //constants of db schema
    private Dictionary<string, string> tableQueries;
}
