using System;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace RentalItems
{
    public class DataInterface
    {
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader dReader;

        public event ErrorHandler ErrorEventHandler;

        private Int32 GetCount(String tableName, String condition)
        {
            command.CommandText = "SELECT COUNT(*) FROM " + tableName;

            if (condition != null && condition != "")
                command.CommandText += " WHERE " + condition;

            command.CommandText += ';';

            return Convert.ToInt32(command.ExecuteScalar());
        }

        private SqlDataReader GetReader(String tableName, String condition)
        {
            command.CommandText = "SELECT * FROM " + tableName;

            if (condition != null && condition != "")
                command.CommandText += " WHERE " + condition;

            command.CommandText += ';';

            return command.ExecuteReader();
        }

        public DataInterface(SqlConnection dataConnection)
        {
            connection = dataConnection;
            command = new SqlCommand();

            command.Connection = connection;
        }

        public SqlConnection Connection
        {
            get
            {
                return connection;
            }
            set
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();

                connection = value;
            }
        }

        public Int32 Insert(RoomType roomType)
        {
            command.CommandText = "INSERT INTO tRoomTypes (name,comment) VALUES ('" + roomType.Name + "','" + roomType.Description + "') SELECT @IDENTITY";
            roomType.Id = Convert.ToInt32(command.ExecuteScalar());
            return roomType.Id;
        }

        public Int32 Insert(PartFeature feature)
        {
            command.CommandText = "INSERT INTO tFeatures (name,comment) VALUES ('" + feature.Name + "','" + feature.Description + "') SELECT @IDENTITY";
            feature.Id = Convert.ToInt32(command.ExecuteScalar());
            return feature.Id;
        }

        public Int32 Insert(Part part, String buildId)
        {
            //precondition : part property : feature id must have value before first executing
            //               Part Property : Rooms : Type : id must have value before second executing
            command.CommandText = "INSERT INTO tParts (name,addr,comment,height,sn,featureId,buildId,voltmeter,watermeter,withItems,rentalPrice,rentalMonthes,sellPrice)"
                                          + " VALUES ('" + part.Name + "','" + part.Address + "','" + part.Description + "'," + part.Height + ",'" + part.Sn + "'," + part.Feature.Id + "," + buildId + "," + part.VoltMeter + "," + part.WaterMeter + "," + part.WithItems + "," + part.RentalMonthPrice + "," + part.RentalMonthesNum + "," + part.SellPrice + ") SELECT @IDENTITY";
            
            part.Id = Convert.ToInt32(command.ExecuteScalar());
            //comment : process every rom in part

            for (Int32 i = 0; i < part.Rooms.Length; i++)
            {
                command.CommandText = "INSERT INTO tRooms (name,comment,typeId,tall,width,partId) VALUES "
                    + "'" + part.Rooms[i].Name + "','" + part.Rooms[i].Description + "'," + part.Rooms[i].Type.Id + "," + part.Rooms[i].Tall + "," + part.Rooms[i].Width + "," + part.Id + ") SELECT @IDENTITY;";

                part.Rooms[i].Id = Convert.ToInt32(command.ExecuteScalar());
            }

            for (Int32 i = 0; i < part.Pictures.Length; i++)
            {
                command.CommandText = "INSERT INTO tPartImages (partId,location,name) VALUES (" + part.Id + ",'" + part.Pictures[i].Location + "','" + part.Pictures[i].Name + "') SELECT @IDENTITY;";
                part.Pictures[i].Id = Convert.ToInt32(command.ExecuteScalar());
            }

            for (Int32 i = 0; i < part.Owners.Length; i++)
            {
                command.CommandText = "INSERT INTO tOwners (clientId,partId,groundId) VALUES (" + part.Owners[i].Id + "," + part.Id + ",NULL);";
                command.ExecuteNonQuery();
            }

            return part.Id;
        }

        public Int32 Insert(Part part)
        {
            //comment : database table field - buildId - =0 for free part
            return Insert(part, "0");
        }

        public Int32 Insert(Ground ground)
        {
            //percondition : if the ground have owners , must have all owners id number
            command.CommandText = "INSERT INTO tGrounds (sn,addr,area,name,comment) VALUES ('" + ground.Sn + "','" + ground.Address + "'," + ground.Area + ",'" + ground.Name + "','" + ground.Description + "') SELECT @IDENTITY";
            ground.Id = Convert.ToInt32(command.ExecuteScalar());

            for (Int32 i = 0; i < ground.Owners.Length; i++)
            {
                command.CommandText = "INSERT INTO tOwners (clientId,partId,groundId) VALUES (" + ground.Owners[i].Id + ",NULL," + ground.Id + ");";
                command.ExecuteNonQuery();
            }

            return ground.Id;
        }

        public Int32 Insert(Build build)
        {
            command.CommandText = "INSERT INTO tBuilds (sn,name,comment,addr) VALUES ('" + build.Sn + "','" + build.Name + "','" + build.Description + "','" + build.Address + "') SELECT @IDENTITY";
            build.Id = Convert.ToInt32(command.ExecuteScalar());

            for (Int32 i = 0; i < build.Parts.Length; i++)
                Insert(build.Parts[i], build.Id.ToString());

            return build.Id;
        }

        public Int32 Insert(String state)
        {
            command.CommandText = "INSERT INTO tStates (name) VALUES ('" + state + "') SELECT @IDENTITY;";
            return Convert.ToInt32(command.ExecuteScalar());
        }

        public Int32 Insert(Client client)
        {
            command.CommandText = "INSERT INTO tClients (sn,fName,lName,fatName,motName,isMale,addrTemp,addrPerm,orignePlace,birthPlace,birthDate,reqPriceFrom,reqPriceTo,reqStateId,reqCity)"
                                            + "VALUES ('" + client.Sn + "','" + client.FirstName + "','" + client.LastName + "','" + client.Father.FirstName + "','" + client.Mother.FirstName + "'," + client.Male + ",'" + client.AddressTemp + "','" + client.AddressPerm + "','" + client.OrignePlace + "','" + client.BirthPlace + "','" + client.BirthDate + "'," + client.RequestPriceFrom + "," + client.RequestPriceTO + "," + client.RequestState + ",'" + client.RequestCity + "') SELECT @IDENTITY;";

            client.Id = Convert.ToInt32(command.ExecuteScalar());
            return client.Id;
        }

        public Int32 Insert(Cash cash)
        {
            command.CommandText = "INSERT INTO tCashes (name,comment) VALUES ('" + cash.Name + "','" + cash.Description + "') SELECT @IDENTITY'";
            cash.Id = Convert.ToInt32(command.ExecuteScalar());
            return cash.Id;
        }

        public Int32 Insert(Item item)
        {
            command.CommandText = "INSERT INTO tItem (name,comment,isIncome) VALUES ('" + item.Name + "','" + item.Description + "'," + item.IsIncome + ") SELECT @IDENTITY;";
            item.Id = Convert.ToInt32(command.ExecuteScalar());
            return item.Id;
        }

        public Int32 Insert(MoneyItem moneyItem,Cash ownerCash)
        {
            //comment : save money item from owner cash in tabel tMoneyItems
            //precondition : ownerCash : property id must have value , moneyItem : item : property id must have value

            command.CommandText = "INSERT INTO tMoneyItems (itemId,cashId,comment,itemDate,currentAccount,nextAccount)"
                                              + " VALUES (" + moneyItem.BaseItem.Id + "," + ownerCash.Id + ",'" + moneyItem.Description + "','" + moneyItem.Date + "'," + moneyItem.CurrentAccount + "," + moneyItem.NextAccount + ") SELECT @IDENTITY;";

            moneyItem.Id = Convert.ToInt32(command.ExecuteScalar());
            return moneyItem.Id;
        }

        public Int32 Insert(PictureBox roomShape, String partId)
        {
            String location = roomShape.Tag.ToString().Substring(roomShape.Tag.ToString().IndexOf(':') + 1);
            command.CommandText = "INSERT INTO tRoomShapes (partId,width,height,x,y,img,color) VALUES "
                                                        + "(" + partId + "," + roomShape.Width + "," + roomShape.Height + "," + roomShape.Left + "," + roomShape.Top + ",'" + location + "'," + roomShape.BackColor.ToArgb() + ") SELECT @IDENTITY;";

            String id = command.ExecuteScalar().ToString();
            roomShape.Tag = id + ':' + location;

            return Convert.ToInt32(id);
        }

        public Boolean Delete(MoneyItem moneyItem)
        {
            //precondition : money Item : id property must have value before delete
            command.CommandText = "DELETE FROM tMoneyItems WHERE id=" + moneyItem.Id;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public Boolean Delete(PictureBox roomShape)
        {
            String id = roomShape.Tag.ToString().Substring(0, roomShape.Tag.ToString().IndexOf(':'));
            command.CommandText = "DELETE FROM tRoomSahpes WHERE id=" + id;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public Boolean Update(RoomType roomType)
        {
            command.CommandText = "UPDATE tRoomTypes SET name='" + roomType.Name + "',comment='" + roomType.Description + "',deleted=" + roomType.Deleted + " WHERER id=" + roomType.Id;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public Boolean Update(PartFeature partFeature)
        {
            command.CommandText = "UPDATE tFeatures SET name='" + partFeature.Name + "',comment='" + partFeature.Description + "',deleted=" + partFeature.Deleted + " WHERER id=" + partFeature.Id;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public Boolean Update(Cash cash)
        {
            command.CommandText = "UPDATE tCashes SET name='" + cash.Name + "',comment='" + cash.Description + "',deleted=" + cash.Deleted + " WHERER id=" + cash.Id;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public Boolean Update(Part part)
        {
            //precondition : property Freature.Id must have value before executing
            command.CommandText = "UPDATE tParts SET"
                + "name='" + part.Name + "',addr='" + part.Address + "',comment='" + part.Description + "',height=" + part.Height + ",sn='" + part.Sn + "',featureId=" + part.Feature.Id + ",voltmeter=" + part.VoltMeter + ","
                + "watermeter=" + part.WaterMeter + ",withItems=" + part.WithItems + ",rentalPrice=" + part.RentalMonthPrice + ",rentalMonthes=" + part.RentalMonthesNum + ",sellPrice=" + part.SellPrice + ",deleted=" + part.Deleted + ";";

            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;

            //owners of part and build of part bend to , is not updated
        }

        public Boolean Update(Ground ground)
        {
            command.CommandText = "UPDATE tGrounds SET sn='" + ground.Sn + "',addr='" + ground.Address + "',area=" + ground.Area + ",name='" + ground.Name + "',comment='" + ground.Description + "',deleted=" + ground.Deleted + " WHERER id=" + ground.Id;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
            //owner of ground not updated
        }

        public Boolean Update(Build build)
        {
            command.CommandText = "UPDATE tBuilds SET sn='" + build.Sn + "',addr='" + build.Address + "',name='" + build.Name + "',comment='" + build.Description + "',deleted=" + build.Deleted + " WHERER id=" + build.Id;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public Boolean Update(Client client)
        {
            command.CommandText = "Update tClients SET" +
                "sn='" + client.Sn + "',fName='" + client.FirstName + "',lName='" + client.LastName + "',fatName='" + client.Father.FirstName + "',motName='" + client.Mother.FirstName + "',isMale=" + client.Male + ",addrTemp='" + client.AddressTemp + "',addrPerm='" + client.AddressPerm + "'," +
                "orignePlace='" + client.OrignePlace + "',birthPlace='" + client.BirthPlace + "',birthDate='" + client.BirthDate + "'," +
                "reqPriceFrom=" + client.RequestPriceFrom + ",reqPriceTo=" + client.RequestPriceTO + ",reqStateId=" + client.RequestState + ",reqCity='" + client.RequestCity + "',deleted=" + client.Deleted;

            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public Boolean Update(Item item)
        {
            command.CommandText = "UPDATE tItems SET name='" + item.Name + "',isIncome=" + item.IsIncome + ",comment='" + item.Description + "',deleted=" + item.Deleted + " WHERER id=" + item.Id;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public Boolean Update(MoneyItem moneyItem)
        {
            command.CommandText = "UPATE tMoneyItems SET itemId=" + moneyItem.BaseItem.Id + ",comment='" + moneyItem.Description + "',itemDate='" + moneyItem.Date + "',currentAccount=" + moneyItem.CurrentAccount + ",nextAccount=" + moneyItem.NextAccount + ",deleted=" + moneyItem.Deleted;
            Int32 result = command.ExecuteNonQuery();

            if (result == 0)
                return false;
            else
                return true;
        }

        public void Select(out RoomType[] roomTypes, String condition)
        {
            const String TABLE = "tRoomTypes";

            Int32 count = GetCount(TABLE, condition);

            if (count == 0)
                roomTypes = null;
            else
            {
                roomTypes = new RoomType[count];
                dReader = GetReader(TABLE, condition);

                for (Int32 i = 0; i < roomTypes.Length; i++)
                {
                    dReader.Read();
                    roomTypes[i].Id = Convert.ToInt32(dReader[0]);
                    roomTypes[i].Name = dReader[1].ToString();
                    roomTypes[i].Description = dReader[2].ToString();
                    roomTypes[i].Deleted = Convert.ToBoolean(dReader[3]);
                }

                dReader.Close();
            }
        }

        public void Select(out PartFeature[] partFeatures, String condition)
        {

            const String TABLE = "tFeatures";
            Int32 count = GetCount(TABLE, condition);


            if (count == 0)
                partFeatures = null;
            else
            {
                partFeatures = new PartFeature[count];
                dReader = GetReader(TABLE, condition);

                for (Int32 i = 0; i < partFeatures.Length; i++)
                {
                    dReader.Read();
                    partFeatures[i].Id = Convert.ToInt32(dReader[0]);
                    partFeatures[i].Name = dReader[1].ToString();
                    partFeatures[i].Description = dReader[2].ToString();
                    partFeatures[i].Deleted = Convert.ToBoolean(dReader[3]);
                }

                dReader.Close();
            }
        }

        public void Select(out Part[] parts, String condition)
        {
            const String TABLE = "tParts";
            Int32 count = GetCount(TABLE, condition);


            if (count == 0)
                parts = null;
            else
            {
                parts = new Part[count];
                dReader = GetReader(TABLE, condition);

                for (Int32 i = 0; i < parts.Length; i++)
                {
                    dReader.Read();
                    parts[i].Id = Convert.ToInt32(dReader[0]);
                    parts[i].Name = dReader[1].ToString();
                    parts[i].Address = dReader[2].ToString();
                    parts[i].Description = dReader[3].ToString();
                    parts[i].Height = Convert.ToDouble(dReader[4]);
                    parts[i].Sn = dReader[5].ToString();
                    parts[i].Feature=new PartFeature();
                    parts[i].Feature.Id=Convert.ToInt32(dReader[6]);
                    parts[i].VoltMeter = Convert.ToBoolean(dReader[8]);
                    parts[i].WaterMeter = Convert.ToBoolean(dReader[9]);
                    parts[i].WithItems = Convert.ToBoolean(dReader[10]);
                    parts[i].RentalMonthPrice = Convert.ToSingle(dReader[11]);
                    parts[i].SellPrice = Convert.ToSingle(dReader[13]);
                    parts[i].RentalMonthesNum = Convert.ToInt32(dReader[12]);
                    parts[i].Deleted = Convert.ToBoolean(dReader[14]);
                }

                dReader.Close();


                //fill features of parts with values
                for (Int32 i = 0; i < parts.Length; i++)
                {
                    PartFeature[] features;

                    Select(out features, "id=" + parts[i].Feature.Id);

                    if (features.Length == 1)
                    {
                        parts[i].Feature.Name = features[0].Name;
                        parts[i].Feature.Description = features[0].Description;
                        parts[i].Feature.Deleted = features[0].Deleted;
                    }
                }

                
            }
        }


    }
}
