using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maniyat
{
    public static class LocalDatabase
    {
        
        private static System.Data.SqlClient.SqlConnection connect;
        private static System.Data.SqlClient.SqlCommand cmd;
        private static System.Data.SqlClient.SqlDataReader dr;

        public static void Constructure(String mapPath)
        {
            connect = new System.Data.SqlClient.SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=" + mapPath +";Integrated Security=True;User Instance=True");
            cmd = new System.Data.SqlClient.SqlCommand();
            cmd.Connection = connect;
        }

        //verification code region
        public static String GetImageTone(String name)
        {           
            return ExecuteScalar("SELECT tone FROM tones WHERE name='" + name + "'");
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


        /*

        private static void ExecuteNotQuery(String queryString)
        {
            connect.Open();
            cmd.CommandText = queryString;
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        p

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

        public static void Edit(NotProg np)
        {
            ExecuteNotQuery("UPDATE notProgs SET name=N'" + np.Name + "',tone=N'" + np.Tone + "' WHERE id=" + np.Id);
        }

        public static void Load(out NotProg[] np)
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

        

        //replay data region
        public static void Save(Replay replay)
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

        public static void Edit(Replay replay)
        {
            ExecuteNotQuery("UPDATE replays SET notProgId=" + replay.NotProg.Id + ",email='" + replay.Email + "',subject='" + replay.Subject + "',sendDate='" + replay.SendDate + "',message='" + replay.Message + "' WHERE id=" + replay.Id);
        }

        public static void Load(out Replay[] replays)
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
        public static void Save(Message message)
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

        public static void Hide(Message message,Boolean isHide)
        {
            ExecuteNotQuery("UPDATE messages SET isHide=" + (isHide ? "1" : "0") + " WHERE id=" + message.Id.ToString());
        }

        public static void Edit(Message message)
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

        public static void Load(out Message[] messages)
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
    
         */
    }
}