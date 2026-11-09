using System;
using System.Collections.Generic;
using System.Text;

namespace Purveyance
{
    static class Database
    {
        //public properties region
        public static String ConnectionString
        {
            get
            {
                return connection.ConnectionString;
            }
            set
            {
                connection = new System.Data.SqlClient.SqlConnection(value);
                command = new System.Data.SqlClient.SqlCommand();

                command.Connection = connection;
            }
        }

        //public functions region
        public static void Save(Material material)
        {
            if (material != null)
                ExecuteNonQuery("INSERT INTO materials (name,defaultVendor,defaultBuyPrice,defaultSellPrice,defaultAmount,unit) VALUES (N'" + material.Name + "',N'" + material.DefaultVendor + "'," + material.DefaultBuyPrice + "," + material.DefaultSellPrice + "," + material.DefaultAmount + ",N'" + material.Unit + "');");
        }

        public static void Save(Income income)
        {
            if(income!=null)
                if (income.Material != null)
                {
                    ExecuteNonQuery("INSERT INTO income (materialId,vendor,buyPrice,amount,transportCost,otherCost,incomeDate,comment) VALUES (" + GetId(income.Material) + ",N'" + income.Vendor + "'," + income.BuyPrice + "," + income.Amount + "," + income.TransportCost + "," + income.OtherCosts + ",'" + income.Date.ToString("MM/dd/yyyy") + "',N'" + income.Description + "');");
                }
        }

        public static void Save(Outcome outcome)
        {
            if(outcome!=null)
                if (outcome.Income != null)
                {
                    ExecuteNonQuery("INSERT INTO outcome (incomeId,client,sellPrice,amount,transportCost,otherCost,outcomeDate,comment) VALUES (" + outcome.Income.Id + ",N'" + outcome.Client + "'," + outcome.SellPrice + "," + outcome.Amount + "," + outcome.TransportCost + "," + outcome.OtherCosts + ",'" + outcome.Date.ToString("MM/dd/yyyy") + "',N'" + outcome.Description + "');");
                }
        }

        public static Int32 Delete(Material material)
        {
            if (material != null)
                return ExecuteNonQuery("DELETE FROM materials WHERE id=" + material.Id);
            else
                return -1;
        }

        public static Int32 Delete(Income income)
        {
            if (income != null)
                return ExecuteNonQuery("DELETE FROM income WHERE id=" + income.Id);
            else
                return -1;
        }

        public static Int32 Delete(Outcome outcome)
        {
            if (outcome != null)
                return ExecuteNonQuery("DELETE FROM outcome WHERE id=" + outcome.Id);
            else
                return -1;    
        }

        public static Int32 Update(Material material)
        {
            if (material != null)
                return ExecuteNonQuery("UPDATE materials SET name=N'" + material.Name + "',defaultVendor=N'" + material.DefaultVendor + "',defaultBuyPrice=" + material.DefaultBuyPrice + ",defaultSellPrice=" + material.DefaultSellPrice + ",defaultAmount=" + material.DefaultAmount + ",unit=N'" + material.Unit + "' WHERE id=" + material.Id);
            else
                return -1;
        }

        public static Int32 Update(Income income)
        {
            if (income != null)
                return ExecuteNonQuery("UPDATE income SET vendor=N'" + income.Vendor + "',buyPrice=" + income.BuyPrice + ",amount=" + income.Amount + ",transportCost=" + income.TransportCost + ",otherCost=" + income.OtherCosts + ",incomeDate='" + income.Date.ToString("MM/dd/yyyy") + "',comment=N'" + income.Description + "' WHERE id=" + income.Id + ";");
            else
                return -1;
        }

        public static Int32 Update(Outcome outcome)
        {
            if (outcome != null)
                return ExecuteNonQuery("UPDATE outcome SET client=N'" + outcome.Client + "',sellPrice=" + outcome.SellPrice + ",amount=" + outcome.Amount + ",transportCost=" + outcome.TransportCost + ",otherCost=" + outcome.OtherCosts + ",outcomeDate='" + outcome.Date.ToString("MM/dd/yyyy") + "',comment=N'" + outcome.Description + "' WHERE id=" + outcome.Id + ";");
            else
                return -1;
        }

        public static Material[] GetMaterials()
        {
            Int32 n = GetMaterialsCount();

            if(n>0)
            {
                Material[] materials = new Material[n];
                Int32 index=0;

                connection.Open();

                dataReader = ExecuteDateReader("SELECT id,name,defaultVendor,defaultBuyPrice,defaultSellPrice,defaultAmount,unit FROM materials;");

                while (dataReader.Read())
                {
                    materials[index] = new Material();

                    materials[index].Id = Convert.ToInt32(dataReader[0]);
                    materials[index].Name = Convert.ToString(dataReader[1]);
                    materials[index].DefaultVendor = Convert.ToString(dataReader[2]);
                    materials[index].DefaultBuyPrice = Convert.ToSingle(dataReader[3]);
                    materials[index].DefaultSellPrice = Convert.ToSingle(dataReader[4]);
                    materials[index].DefaultAmount = Convert.ToSingle(dataReader[5]);
                    materials[index].Unit = Convert.ToString(dataReader[6]);

                    index++;
                }

                connection.Close();

                return materials;
            }

            return new Material[0];
        }

        public static Income[] GetIncome(Material material)
        {
            if (material != null)
            {
                Int32 n = GetIncomeCount(material);

                if (n > 0)
                {
                    Income[] income = new Income[n];
                    Int32 index = 0;

                    connection.Open();

                    dataReader = ExecuteDateReader("SELECT id,vendor,BuyPrice,amount,transportCost,otherCost,incomeDate,comment FROM income WHERE materialId=" + material.Id + ";");

                    while (dataReader.Read())
                    {
                        income[index] = new Income();

                        income[index].Id = Convert.ToInt32(dataReader[0]);
                        income[index].Vendor = Convert.ToString(dataReader[1]);
                        income[index].BuyPrice = Convert.ToSingle(dataReader[2]);
                        income[index].Amount = Convert.ToSingle(dataReader[3]);
                        income[index].TransportCost = Convert.ToSingle(dataReader[4]);
                        income[index].OtherCosts = Convert.ToSingle(dataReader[5]);
                        income[index].Date = Convert.ToDateTime(dataReader[6]);
                        income[index].Description = Convert.ToString(dataReader[7]);

                        index++;
                    }

                    dataReader.Close();

                    for (Int32 i = 0; i < income.Length; i++)
                    {
                        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT SUM(amount) FROM outcome WHERE incomeId=" + income[i].Id + ";", connection);

                        Object result = cmd.ExecuteScalar();

                        if (result != DBNull.Value)
                            income[i].MinusAmount = Convert.ToSingle(result);
                    }

                    connection.Close();

                    return income;

                }
            }

            return new Income[0];
        }

        public static Outcome[] GetOutcome(Income income)
        {
            if (income != null)
            {
                Int32 n = GetOutcomeCount(income);

                if (n > 0)
                {
                    Outcome[] outcome = new Outcome[n];
                    Int32 index = 0;

                    connection.Open();

                    dataReader = ExecuteDateReader("SELECT id,client,sellPrice,amount,transportCost,otherCost,outcomeDate,comment FROM outcome WHERE incomeId=" + income.Id + ";");

                    while (dataReader.Read())
                    {
                        outcome[index] = new Outcome();

                        outcome[index].Id = Convert.ToInt32(dataReader[0]);
                        outcome[index].Client = Convert.ToString(dataReader[1]);
                        outcome[index].SellPrice = Convert.ToSingle(dataReader[2]);
                        outcome[index].Amount = Convert.ToSingle(dataReader[3]);
                        outcome[index].TransportCost = Convert.ToSingle(dataReader[4]);
                        outcome[index].OtherCosts = Convert.ToSingle(dataReader[5]);
                        outcome[index].Date = Convert.ToDateTime(dataReader[6]);
                        outcome[index].Description = Convert.ToString(dataReader[7]);

                        index++;
                    }

                    connection.Close();

                    return outcome;
                }
            }

            return new Outcome[0];
        }

        public static Overall GetOverall(Material material, DateTime date)
        {
            Overall result = new Overall();

            result.Material = material;
            result.Date = date.ToString("dddd d/M/yyyy");

            connection.Open();
            dataReader = ExecuteDateReader("SELECT vendor,amount,transportCost+otherCost,buyPrice*amount FROM income WHERE materialId=" + material.Id + " AND incomeDate='" + date.ToString("MM/dd/yyyy") + "';");
            
            while (dataReader.Read())
            {
                if (dataReader[0] != DBNull.Value)
                    result.Vendors += Convert.ToString(dataReader[0]) + ", ";

                if (dataReader[1] != DBNull.Value)
                    result.InAmount += Convert.ToSingle(dataReader[1]);

                if (dataReader[2] != DBNull.Value)
                    result.InCost += Convert.ToSingle(dataReader[2]);

                if (dataReader[3] != DBNull.Value)
                    result.InPrice += Convert.ToSingle(dataReader[3]);
            }

            dataReader.Close();

            if (result.Vendors != null && result.Vendors.Length >= 2)
                result.Vendors = result.Vendors.Substring(0, result.Vendors.Length - 2);

            dataReader = ExecuteDateReader("SELECT outcome.client,outcome.amount,outcome.transportCost+outcome.otherCost,outcome.sellPrice*outcome.amount FROM income INNER JOIN outcome ON income.id=outcome.incomeId WHERE income.materialId=" + material.Id + " AND outcomeDate='" + date.ToString("MM/dd/yyyy") + "';");

            while (dataReader.Read())
            {
                if (dataReader[0] != DBNull.Value)
                    result.Clients += Convert.ToString(dataReader[0]) + ", ";

                if (dataReader[1] != DBNull.Value)
                    result.OutAmount += Convert.ToSingle(dataReader[1]);

                if (dataReader[2] != DBNull.Value)
                    result.OutCost += Convert.ToSingle(dataReader[2]);

                if (dataReader[3] != DBNull.Value)
                    result.OutPrice += Convert.ToSingle(dataReader[3]);
            }

            dataReader.Close();
            connection.Close();

            if (result.Clients != null && result.Clients.Length >= 2)
                result.Clients = result.Clients.Substring(0, result.Clients.Length - 2);

            result.Balance = result.OutPrice - (result.InPrice + result.OutCost + result.InCost);

            return result;
        }

        public static Overall GetOverall(Material material, DateTime date, String keyword)
        {
            Overall result = new Overall();

            result.Material = material;
            result.Date = date.ToString("dddd d/M/yyyy");

            connection.Open();
            dataReader = ExecuteDateReader("SELECT vendor,amount,transportCost+otherCost,buyPrice*amount FROM income WHERE materialId=" + material.Id + " AND incomeDate='" + date.ToString("MM/dd/yyyy") + "' AND vendor LIKE N'" + keyword + "';");
            

            while (dataReader.Read())
            {
                if (dataReader[0] != DBNull.Value)
                    result.Vendors += Convert.ToString(dataReader[0]) + ", ";

                if (dataReader[1] != DBNull.Value)
                    result.InAmount += Convert.ToSingle(dataReader[1]);

                if (dataReader[2] != DBNull.Value)
                    result.InCost += Convert.ToSingle(dataReader[2]);

                if (dataReader[3] != DBNull.Value)
                    result.InPrice += Convert.ToSingle(dataReader[3]);
            }

            if (result.Vendors != null && result.Vendors.Length >= 2)
                result.Vendors = result.Vendors.Substring(0, result.Vendors.Length - 2);

            dataReader.Close();

            dataReader = ExecuteDateReader("SELECT outcome.client,outcome.amount,outcome.transportCost+outcome.otherCost,outcome.sellPrice*outcome.amount FROM income INNER JOIN outcome ON income.id=outcome.incomeId WHERE income.materialId=" + material.Id + " AND outcomeDate='" + date.ToString("MM/dd/yyyy") + "' AND client LIKE N'" + keyword + "';");

            while (dataReader.Read())
            {
                if (dataReader[0] != DBNull.Value)
                    result.Clients += Convert.ToString(dataReader[0]) + ", ";

                if (dataReader[1] != DBNull.Value)
                    result.OutAmount += Convert.ToSingle(dataReader[1]);

                if (dataReader[2] != DBNull.Value)
                    result.OutCost += Convert.ToSingle(dataReader[2]);

                if (dataReader[3] != DBNull.Value)
                    result.OutPrice += Convert.ToSingle(dataReader[3]);
            }

            if (result.Clients != null && result.Clients.Length >= 2)
                result.Clients = result.Clients.Substring(0, result.Clients.Length - 2);

            dataReader.Close();
            connection.Close();

            result.Balance = result.OutPrice - (result.InPrice + result.OutCost + result.InCost);

            return result;
        }

        public static Int32 GetMaterialsCount()
        {
            Object result = ExecuteScalar("SELECT COUNT(id) FROM materials");

            if (result == DBNull.Value)
                return -1;
            else
                return Convert.ToInt32(result);
        }

        public static Int32 GetIncomeCount(Material material)
        {
            if (material != null)
            {
                if (material.Id == 0)
                    material.Id = GetId(material);

                Object result = ExecuteScalar("SELECT COUNT(id) FROM income WHERE materialId=" + material.Id);

                if (result != DBNull.Value)
                    return Convert.ToInt32(result);
                else
                    return 0;
            }

            return -1;
        }

        public static Int32 GetOutcomeCount(Income income)
        {
            if (income != null)
            {
                Object result = ExecuteScalar("SELECT COUNT(id) FROM outcome WHERE incomeId=" + income.Id);

                if (result != DBNull.Value)
                    return Convert.ToInt32(result);
                else 
                    return 0;
            }

            return -1;
        }

        public static Single GetIncomeAmount(Material material,String vendor)
        {
            return ExecuteIncomeSum("amount", material.Id.ToString(), vendor);
        }

        public static Single GetIncomeAmount(Material material, String vendor, DateTime date1, DateTime date2)
        {
            return ExecuteIncomeSum("amount", material.Id.ToString(), date1, date2, vendor);
        }

        public static Single GetOutcomeAmount(Material material,String client)
        {
            return ExecuteOutcomeSum("amount", material.Id.ToString(), client);
        }

        public static Single GetOutcomeAmount(Material material, String client, DateTime date1, DateTime date2)
        {
            return ExecuteOutcomeSum("amount", material.Id.ToString(), date1, date2, client);
        }

        public static Single GetIncomeTransportCost(Material material,String vendor)
        {
            return ExecuteIncomeSum("transportCost", material.Id.ToString(), vendor);
        }

        public static Single GetIncomeTransportCost(Material material, String vendor,DateTime date1,DateTime date2)
        {
            return ExecuteIncomeSum("transportCost", material.Id.ToString(), date1, date2, vendor);
        }

        public static Single GetOutcomeTransportCost(Material material,String client)
        {
            return ExecuteOutcomeSum("transportCost", material.Id.ToString(), client);
        }

        public static Single GetOutcomeTransportCost(Material material, String client,DateTime date1,DateTime date2)
        {
            return ExecuteOutcomeSum("transportCost", material.Id.ToString(), date1, date2, client);
        }

        public static Single GetIncomeOtherCost(Material material, String vendor)
        {
            return ExecuteIncomeSum("otherCost", material.Id.ToString(), vendor);
        }

        public static Single GetIncomeOtherCost(Material material, String vendor, DateTime date1, DateTime date2)
        {
            return ExecuteIncomeSum("otherCost", material.Id.ToString(), date1, date2, vendor);
        }

        public static Single GetOutcomeOtherCost(Material material, String client)
        {
            return ExecuteOutcomeSum("otherCost", material.Id.ToString(), client);
        }

        public static Single GetOutcomeOtherCost(Material material, String client, DateTime date1, DateTime date2)
        {
            return ExecuteOutcomeSum("otherCost", material.Id.ToString(), date1, date2, client);
        }

        public static Single GetIncomeBuyPrice(Material material,String vendor)
        {
            return ExecuteIncomeSum("buyPrice*amount", material.Id.ToString(), vendor);
        }

        public static Single GetIncomeBuyPrice(Material material, String vendor, DateTime date1, DateTime date2)
        {
            return ExecuteIncomeSum("buyPrice*amount", material.Id.ToString(), date1, date2, vendor);
        }

        public static Single GetOutcomeSellPrice(Material material, String client)
        {
            return ExecuteOutcomeSum("sellPrice*outcome.amount", material.Id.ToString(), client);
        }

        public static Single GetOutcomeSellPrice(Material material, String client, DateTime date1, DateTime date2)
        {
            return ExecuteOutcomeSum("sellPrice*outcome.amount", material.Id.ToString(), date1, date2, client);
        }
        
        public static Int32 GetId(Material material)
        {
            Object result = ExecuteScalar("SELECT id FROM materials WHERE name=N'" + material.Name + "';");

            if (result == DBNull.Value)
                return -1;
            else
                return Convert.ToInt32(result);
        }

        public static Single GetMinusAmount(Income income)
        {
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT SUM(amount) FROM outcome WHERE incomeId=" + income.Id + ";", connection);

            connection.Open();
            Object result = cmd.ExecuteScalar();
            connection.Close();

            if (result != DBNull.Value)
                return Convert.ToSingle(result);
            else
                return 0;
        }

        //private functions region
        private static Int32 ExecuteNonQuery(String commandText)
        {
            if (connection != null)
            {
                command.CommandText = commandText;

                connection.Open();
                Int32 resutl = command.ExecuteNonQuery();
                connection.Close();

                return resutl;
            }
            else
                return -1;
        }

        private static Object ExecuteScalar(String commandText)
        {
            if (connection != null)
            {
                command.CommandText = commandText;

                connection.Open();
                Object resutl = command.ExecuteScalar();
                connection.Close();

                return resutl;
            }
            else
                return null;
        }

        private static Single ExecuteSum(String cmd)
        {
            Object result = ExecuteScalar(cmd);
            
            if (result != DBNull.Value)
                return Convert.ToSingle(result);
            else
                return 0;
        }

        private static Single ExecuteIncomeSum(String fieldName, String materialId, DateTime date1, DateTime date2, String vendor)
        {
            String cmd = "SELECT SUM(" + fieldName + ") FROM income WHERE materialId=" + materialId + " AND incomeDate>='" + date1.ToString("MM/dd/yyyy") + "' AND incomeDate<='" + date2.ToString("MM/dd/yyyy") + "'";

            if (vendor != "")
                cmd += " AND vendor LIKE N'" + vendor + "'";

            return ExecuteSum(cmd);
        }

        private static Single ExecuteOutcomeSum(String fieldName, String materialId, DateTime date1, DateTime date2, String client)
        {
            String cmd = "SELECT SUM(outcome." + fieldName + ") FROM income INNER JOIN outcome ON income.id=outcome.incomeId WHERE income.materialId=" + materialId + " AND outcomeDate>='" + date1.ToString("MM/dd/yyyy") + "' AND outcomeDate<='" + date2.ToString("MM/dd/yyyy") + "'";

            if (client != "")
                cmd += " AND clientLIKE N'" + client + "'";

            return ExecuteSum(cmd);
        }

        private static Single ExecuteIncomeSum(String fieldName, String materialId, String vendor)
        {
            String cmd = "SELECT SUM(" + fieldName + ") FROM income WHERE materialId=" + materialId + "";

            if (vendor != "")
                cmd += " AND vendor LIKE N'" + vendor + "'";

            return ExecuteSum(cmd);
        }

        private static Single ExecuteOutcomeSum(String fieldName, String materialId, String client)
        {
            String cmd = "SELECT SUM(outcome." + fieldName + ") FROM income INNER JOIN outcome ON income.id=outcome.incomeId WHERE income.materialId=" + materialId + "";

            if (client != "")
                cmd += " AND client LIKE N'" + client + "'";

            return ExecuteSum(cmd);
        }

        private static System.Data.SqlClient.SqlDataReader ExecuteDateReader(String commandText)
        {
            if (connection != null)
            {
                command.CommandText = commandText;

                return command.ExecuteReader();
            }
            else
                return null;
        }

        //private fields region
        private static System.Data.SqlClient.SqlConnection connection;
        private static System.Data.SqlClient.SqlCommand command;
        private static System.Data.SqlClient.SqlDataReader dataReader;
    }
}
