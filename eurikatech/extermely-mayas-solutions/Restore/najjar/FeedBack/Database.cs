using System;
using System.Web;

namespace Maniyat
{
    public static class Database
    {
        private static System.Data.SqlClient.SqlConnection connect;
        private static System.Data.SqlClient.SqlCommand cmd;
        private static System.Data.SqlClient.SqlDataReader dr;

        public static void Constructure(String mapPath)
        {
            connect = new System.Data.SqlClient.SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=" + mapPath + ";Integrated Security=True;User Instance=True");
            cmd = new System.Data.SqlClient.SqlCommand();
            cmd.Connection = connect;
        }

        private static void ExecuteNotQuery(String queryString)
        {
            connect.Open();
            cmd.CommandText = queryString;
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        private static String ExecuteScalar(String queryString)
        {
            connect.Open();
            cmd.CommandText = queryString;
            Object result = cmd.ExecuteScalar();
            connect.Close();

            if (result == null)
                return null;
            else
                return result.ToString();
        }

        //not prog data region
        public static void Save(NotProg np)
        {
            ExecuteNotQuery("INSERT INTO notProgs (name,tone) VALUES (N'" + np.Name + "',N'" + np.Tone + "')");
        }

        public static void Find(ref NotProg np)
        {
            connect.Open();
            cmd.CommandText = "select name,tone FROM notProgs WHERE id=" + np.Id;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr[0] != null)
                    np.Name = dr[0].ToString();
                if (dr[1] != null)
                    np.Tone = dr[1].ToString();
            }
            else
                np = null;

            dr.Close();
            connect.Close();
        }

        public static void Delete(NotProg np)
        {

            ExecuteNotQuery("DELETE FROM notProgs WHERE id=" + np.Id.ToString());
        }

        public static void Update(NotProg np)
        {
            ExecuteNotQuery("UPDATE notProgs SET name=N'" + np.Name + "',tone=N'" + np.Tone + "' WHERE id=" + np.Id);
        }

        public static void Select(out NotProg[] np)
        {
            Int32 num = Int32.Parse(ExecuteScalar("SELECT COUNT(id) FROM notProgs"));

            if (num > 0)
            {
                np = new NotProg[num];
                cmd.CommandText = "SELECT id,name,tone FROM notProgs";

                connect.Open();
                dr = cmd.ExecuteReader();
                num = 0;

                while (dr.Read())
                {
                    np[num++] = new NotProg(Int32.Parse(dr[0].ToString()), dr[1].ToString(), dr[2].ToString());
                }

                dr.Close();
                connect.Close();
            }
            else
                np = null;
        }

        public static NotProg NotProgSign(NotProg np)
        {
            NotProg tmpNP = null;
            String id = ExecuteScalar("SELECT id FROM notProgs WHERE name='" + np.Name + "' AND tone='" + np.Tone + "'");

            if (id != null)
                tmpNP = new NotProg(Int32.Parse(id), np.Name, np.Tone);

            return tmpNP;
        }

        public static Boolean NotProgExist(String notProgName)
        {
            String result = ExecuteScalar("SELECT id FROM notProgs WHERE name=N'" + notProgName + "'");

            if (result == null)
                return false;
            else
                return true;
        }

        //verification code region
        public static String GetImageTone(String name)
        {
            return ExecuteScalar("SELECT tone FROM tones WHERE name='" + name + "'");
        }

        //replay data region
        public static void Insert(Replay replay)
        {
            ExecuteNotQuery("INSERT INTO replays (notProgId,email,subject,sendDate,message) VALUES (" + replay.NotProg.Id + ",'" + replay.Email + "',N'" + replay.Subject + "','" + replay.SendDate.ToString(Maniyat.Consts.DATA_DATEFORMAT) + "',N'" + replay.Message + "')");
        }

        public static void Find(ref Replay replay)
        {
            connect.Open();
            cmd.CommandText = "SELECT notProgs.id,notProgs.name,notProgs.tone,replays.email,replays.subject,replays.message,replays.sendDate FROM replays INNER JOIN notProgs ON replays.notProgId=notProgs.id WHERE replays.id=" + replay.Id;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                NotProg np = new NotProg(Int32.Parse(dr[0].ToString()), dr[1].ToString(), dr[2].ToString());
                replay.NotProg = np;

                if (dr[3] != null)
                    replay.Email = dr[3].ToString();
                if (dr[4] != null)
                    replay.Subject = dr[4].ToString();
                if (dr[5] != null)
                    replay.Message = dr[5].ToString();
                if (dr[6] != null)
                    replay.SendDate = DateTime.Parse(dr[6].ToString());
            }
            else
                replay = null;

            dr.Close();
            connect.Close();
        }

        public static void Delete(Replay replay)
        {
            ExecuteNotQuery("DELETE FROM replays WHERE id=" + replay.Id);
        }

        public static void Update(Replay replay)
        {
            ExecuteNotQuery("UPDATE replays SET notProgId=" + replay.NotProg.Id + ",email='" + replay.Email + "',subject='" + replay.Subject + "',sendDate='" + replay.SendDate + "',message='" + replay.Message + "' WHERE id=" + replay.Id);
        }

        public static void Select(out Replay[] replays)
        {
            Int32 num = Int32.Parse(ExecuteScalar("SELECT COUNT(id) FROM replays"));

            if (num > 0)
            {
                replays = new Replay[num];
                cmd.CommandText = "SELECT replays.id,notProgs.id,notProgs.name,notProgs.tone,replays.email,replays.subject,replays.message,replays.sendDate FROM replays INNER JOIN notProgs ON replays.notProgId=notProgs.id";

                connect.Open();
                dr = cmd.ExecuteReader();
                num = 0;

                while (dr.Read())
                {
                    replays[num++] = new Replay(Int32.Parse(dr[0].ToString()), new NotProg(Int32.Parse(dr[1].ToString()), dr[2].ToString(), dr[3].ToString()), dr[4].ToString(), dr[5].ToString(), dr[6].ToString(), DateTime.Parse(dr[7].ToString()));
                }

                dr.Close();
                connect.Close();
            }
            else
                replays = null;
        }

        //messages data region
        public static void Insert(Message message)
        {
            Int32 groupId;
            Int32 productId;

            if (message.GetType() == typeof(MessageToProduct))
                productId = ((MessageToProduct)message).ProductId;
            else
                productId = -1;

            if (message.GetType() == typeof(MessageToGroup))
                groupId = ((MessageToGroup)message).GroupId;
            else
                groupId = -1;

            ExecuteNotQuery("INSERT INTO messages (senderName,senderPhone,senderAddress,senderEmail,subject,sendDate,groupId,productId,message) VALUES (N'" + message.Name + "',N'" + message.Phone + "',N'" + message.Address + "','" + message.Email + "',N'" + message.Subject + "','" + message.Date.ToString(Maniyat.Consts.DATA_DATEFORMAT) + "'," + groupId + "," + productId + ",N'" + message.MessageText + "')");
        }

        public static void Find(ref Message message)
        {
            connect.Open();
            cmd.CommandText = "select senderName,senderPhone,senderAddress,senderEmail,subject,sendDate,message FROM messages WHERE id=" + message.Id;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                if (dr[0] != null)
                    message.Name = dr[0].ToString();
                if (dr[1] != null)
                    message.Phone = dr[1].ToString();
                if (dr[2] != null)
                    message.Address = dr[2].ToString();
                if (dr[3] != null)
                    message.Email = dr[3].ToString();
                if (dr[4] != null)
                    message.Subject = dr[4].ToString();
                if (dr[5] != null)
                    message.Date = DateTime.Parse(dr[5].ToString());
                if (dr[6] != null)
                    message.MessageText = dr[6].ToString();
            }
            else
                message = null;

            dr.Close();
            connect.Close();
        }

        public static void Delete(Message message)
        {
            ExecuteNotQuery("DELETE FROM messages WHERE id=" + message.Id);
        }

        public static void Hide(Message message, Boolean isHide)
        {
            ExecuteNotQuery("UPDATE messages SET isHide=" + (isHide ? "1" : "0") + " WHERE id=" + message.Id.ToString());
        }

        public static void Update(Message message)
        {
            Int32 groupId = -1;
            Int32 productId = -1;

            if (message.GetType() == typeof(MessageToGroup))
                groupId = ((MessageToGroup)message).GroupId;
            else
                if (message.GetType() == typeof(MessageToProduct))
                    productId = ((MessageToProduct)message).ProductId;

            ExecuteNotQuery("UPDATE messages SET senderName='" + message.Name + "',senderPhone='" + message.Phone + "',senderAddress='" + message.Address + "',senderEmail='" + message.Email + "',subject='" + message.Subject + "',sendDate='" + message.Date + "',groupId=" + groupId + ",productId=" + productId + ",message='" + message.MessageText + "'");
        }

        public static void Select(out Message[] messages)
        {
            Int32 num = Int32.Parse(ExecuteScalar("SELECT COUNT(id) FROM messages WHERE groupId=-1 AND productId=-1 AND isHide=0"));

            if (num > 0)
            {
                messages = new Message[num];
                cmd.CommandText = "SELECT id,senderName,senderPhone,senderAddress,senderEmail,subject,sendDate,message,isRead FROM messages WHERE groupId=-1 AND productId=-1 AND isHide=0";

                connect.Open();
                dr = cmd.ExecuteReader();
                num = 0;

                while (dr.Read())
                {
                    messages[num] = new Message(Int32.Parse(dr[0].ToString()), dr[1].ToString(), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[5].ToString(), dr[7].ToString(), DateTime.Parse(dr[6].ToString()));
                    messages[num++].IsRead = Boolean.Parse(dr[8].ToString());
                }

                dr.Close();
                connect.Close();
            }
            else
                messages = null;
        }

        public static void Select(out MessageToGroup[] messages)
        {
            Int32 num = Int32.Parse(ExecuteScalar("SELECT COUNT(id) FROM messages WHERE groupId<>-1 AND isHide=0"));

            if (num > 0)
            {
                messages = new MessageToGroup[num];
                cmd.CommandText = "SELECT id,senderName,senderPhone,senderAddress,senderEmail,subject,sendDate,groupId,message,isRead FROM messages WHERE groupId<>-1 AND isHide=0";

                connect.Open();
                dr = cmd.ExecuteReader();
                num = 0;

                while (dr.Read())
                {
                    messages[num] = new MessageToGroup(Int32.Parse(dr[0].ToString()), dr[1].ToString(), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[5].ToString(), dr[8].ToString(), DateTime.Parse(dr[6].ToString()), Int32.Parse(dr[7].ToString()));
                    messages[num++].IsRead = Boolean.Parse(dr[9].ToString());
                }

                dr.Close();
                connect.Close();
            }
            else
                messages = null;
        }

        public static void Select(out MessageToProduct[] messages)
        {
            Int32 num = Int32.Parse(ExecuteScalar("SELECT COUNT(id) FROM  messages WHERE productId<>-1 AND isHide=0"));

            if (num > 0)
            {
                messages = new MessageToProduct[num];
                cmd.CommandText = "SELECT id,senderName,senderPhone,senderAddress,senderEmail,subject,sendDate,productId,message,isRead FROM messages WHERE productId<>-1 AND isHide=0";

                connect.Open();
                dr = cmd.ExecuteReader();
                num = 0;

                while (dr.Read())
                {
                    messages[num] = new MessageToProduct(Int32.Parse(dr[0].ToString()), dr[1].ToString(), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[5].ToString(), dr[8].ToString(), DateTime.Parse(dr[6].ToString()), Int32.Parse(dr[7].ToString()));
                    messages[num++].IsRead = Boolean.Parse(dr[9].ToString());
                }

                dr.Close();
                connect.Close();
            }
            else
                messages = null;
        }

        public static void MessageReadedFlag(Int32 messageId)
        {
            ExecuteNotQuery("UPDATE messages SET isRead=1 WHERE id=" + messageId);
        }

        public static void MessageDeletedLoad(out Message[] messages)
        {
            Int32 num = 0;

            connect.Open();
            cmd.CommandText = "SELECT id,senderName,senderPhone,senderAddress,senderEmail,subject,sendDate,message,isRead FROM messages WHERE isHide=1";
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                num++;
            }

            messages = new Message[num];
            num = 0;

            dr.Close();
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                messages[num] = new Message(Int32.Parse(dr[0].ToString()), dr[1].ToString(), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[5].ToString(), dr[7].ToString(), DateTime.Parse(dr[6].ToString()));
                messages[num++].IsRead = Boolean.Parse(dr[8].ToString());
            }

            dr.Close();
            connect.Close();
        }

        public static Int32 MessageUnreadCount()
        {
            return Int32.Parse(ExecuteScalar("SELECT COUNT(id) FROM messages WHERE isRead=0;"));
        }

        //group region
        public static void Insert(Group group)
        {
            ExecuteNotQuery("INSERT INTO groups (parentId,name,comment,image,addDate,isHide) VALUES (" + group.ParentId.ToString() + ",'" + group.Name + "','" + group.Comment + "','" + group.Image + "','" + group.AddedDate.ToString(Maniyat.Consts.DATA_DATEFORMAT) + "',0)");
        }

        public static void Delete(Group group)
        {
            ExecuteNotQuery("DELETE FROM groups WHERE id=" + group.Id.ToString());

            //delete photo
        }

        public static void Update(Group group)
        {
            ExecuteNotQuery("UPDATE groups SET name='" + group.Name + "',comment='" + group.Comment + "',image='" + group.Image + "' WHERE id=" + group.Id);
        }

        public static void Hide(Group group, Boolean isHide)
        {
            ExecuteNotQuery("UPDATE groups SET isHide=" + (isHide ? "1" : "0") + " WHERE id=" + group.Id.ToString());
        }

        public static void Find(Group group)
        {
            connect.Open();
            cmd.CommandText = "SELECT parentId,name,comment,image,addDate,isHide FROM groups WHERE id=" + group.Id.ToString();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr[0] != null)
                    group.ParentId = Int32.Parse(dr[0].ToString());
                if (dr[1] != null)
                    group.Name = dr[1].ToString();
                if (dr[2] != null)
                    group.Comment = dr[2].ToString();
                if (dr[3] != null)
                    group.Image = dr[3].ToString();
                if (dr[4] != null)
                    group.AddedDate = DateTime.Parse(dr[4].ToString());
                if (dr[5] != null)
                    group.IsHide = Boolean.Parse(dr[5].ToString());
            }
            else
                group = null;

            dr.Close();
            connect.Close();
        }

        public static void Select(out Group[] groups, Int32 parentId, Boolean showHides)
        {
            String qCondition;

            if (!showHides)
                qCondition = "isHide=0 AND ";
            else
                qCondition = "";


            Int32 num = Int32.Parse(ExecuteScalar("SELECT COUNT(id) FROM groups WHERE " + qCondition + "parentId=" + parentId.ToString()));

            if (num > 0)
            {
                groups = new Group[num];
                cmd.CommandText = "SELECT id,parentId,name,comment,image,addDate,isHide FROM groups WHERE " + qCondition + "parentId=" + parentId.ToString();

                connect.Open();
                dr = cmd.ExecuteReader();
                num = 0;

                while (dr.Read())
                {
                    groups[num++] = new Group(Int32.Parse(dr[0].ToString()), Int32.Parse(dr[1].ToString()), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), DateTime.Parse(dr[5].ToString()), Boolean.Parse(dr[6].ToString()));
                }

                dr.Close();
                connect.Close();
            }
            else
                groups = null;
        }

        //product region
        public static void Save(Product product)
        {
            ExecuteNotQuery("INSERT INTO products (parentId,name,comment,image,addDate,isHide,validDate,expireDate,price,useDateRange,details) VALUES (" + product.ParentId.ToString() + ",'" + product.Name + "','" + product.Comment + "','" + product.Image + "','" + product.AddedDate.ToString(Maniyat.Consts.DATA_DATEFORMAT) + "',0,'" + product.ValidDate.ToString(Maniyat.Consts.DATA_DATEFORMAT) + "','" + product.ExpierDate.ToString(Maniyat.Consts.DATA_DATEFORMAT) + "','" + product.Price + "'," + (product.UseDateRange ? '1' : '0') + ",'" + product.Details + "')");
        }

        public static void Delete(Product product)
        {
            ExecuteNotQuery("DELETE FROM products WHERE id=" + product.Id.ToString());
        }

        public static void Update(Product product)
        {
            ExecuteNotQuery("UPDATE products SET name='" + product.Name + "',comment='" + product.Comment + "',validDate='" + product.ValidDate.ToString(Maniyat.Consts.DATA_DATEFORMAT) + "',expireDate='" + product.ExpierDate.ToString(Maniyat.Consts.DATA_DATEFORMAT) + "',price='" + product.Price + "',useDateRange=" + (product.UseDateRange ? '1' : '0') + ",details='" + product.Details + "' WHERE id=" + product.Id);
        }

        public static void Hide(Product product, Boolean isHide)
        {
            ExecuteNotQuery("UPDATE products SET isHide=" + (isHide ? "1" : "0") + " WHERE id=" + product.Id.ToString());
        }

        public static void Find(Product product)
        {
            connect.Open();
            cmd.CommandText = "SELECT parentId,name,comment,image,addDate,isHide,validDate,expireDate,price,useDateRange,details FROM products WHERE id=" + product.Id.ToString();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr[0] != null)
                    product.ParentId = Int32.Parse(dr[0].ToString());
                if (dr[1] != null)
                    product.Name = dr[1].ToString();
                if (dr[2] != null)
                    product.Comment = dr[2].ToString();
                if (dr[3] != null)
                    product.Image = dr[3].ToString();
                if (dr[4] != null)
                    product.AddedDate = DateTime.Parse(dr[4].ToString());
                if (dr[5] != null)
                    product.IsHide = Boolean.Parse(dr[5].ToString());
                if (dr[6] != null)
                    product.ValidDate = DateTime.Parse(dr[6].ToString());
                if (dr[7] != null)
                    product.ExpierDate = DateTime.Parse(dr[7].ToString());
                if (dr[8] != null)
                    product.Price = dr[8].ToString();
                if (dr[9] != null)
                    product.UseDateRange = Boolean.Parse(dr[9].ToString());
                if (dr[10] != null)
                    product.Details = dr[10].ToString();
            }
            else
                product = null;

            dr.Close();
            connect.Close();
        }

        public static void Select(out Product[] products, Int32 parentId, Boolean showHides)
        {
            String qCondition;

            if (!showHides)
                qCondition = "isHide=0 AND ";
            else
                qCondition = "";

            Int32 num = Int32.Parse(ExecuteScalar("SELECT COUNT(id) FROM products WHERE " + qCondition + "parentId=" + parentId.ToString()));

            if (num > 0)
            {
                products = new Product[num];
                cmd.CommandText = "SELECT id,parentId,name,comment,image,addDate,validDate,expireDate,price,isHide,useDateRange,details FROM products WHERE " + qCondition + "parentId=" + parentId.ToString();

                connect.Open();
                dr = cmd.ExecuteReader();
                num = 0;

                while (dr.Read())
                    products[num++] = new Product(Int32.Parse(dr[0].ToString()), Int32.Parse(dr[1].ToString()), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), DateTime.Parse(dr[5].ToString()), DateTime.Parse(dr[6].ToString()), DateTime.Parse(dr[7].ToString()), dr[8].ToString(), Boolean.Parse(dr[9].ToString()), Boolean.Parse(dr[10].ToString()), dr[11].ToString());

                dr.Close();
                connect.Close();
            }
            else
                products = null;
        }
    }
}