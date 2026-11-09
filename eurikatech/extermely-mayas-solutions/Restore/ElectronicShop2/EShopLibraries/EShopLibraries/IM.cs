using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maniyat
{
    public class Replay : IDatabase
    {
        //public construcutes region
        public Replay(Int32 replayId, NotProg replayNotProg, String replayEmail, String replaySubject, String replayMessage, DateTime replaySendDate)
        {
            id = replayId;
            notProg = replayNotProg;
            email = replayEmail;
            subject = replaySubject;
            message = replayMessage;
            sendDate = replaySendDate;

            CreateCollections();
        }

        public Replay()
        {
            id = -1;
            notProg = null;
            email = subject = message = null;
            sendDate = DateTime.Now;

            CreateCollections();
        }

        public Replay(DataFieldCollection dataFields)
        {
            id = -1;
            notProg = null;
            email = subject = message = null;
            sendDate = DateTime.Now;

            this.DataFields = dataFields;
        }

        //public properties region
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

        public NotProg NotProg
        {
            get
            {
                return notProg;
            }
            set
            {
                notProg = value;
            }
        }

        public String Email
        {
            get
            {
                return email;
            }
            set
            {
                email = value;
            }
        }

        public String Subject
        {
            get
            {
                return subject;
            }
            set
            {
                subject = value;
            }
        }

        public String Message
        {
            get
            {
                return message;
            }
            set
            {
                message = value;
            }
        }

        public DateTime SendDate
        {
            get
            {
                return sendDate;
            }
            set
            {
                sendDate = value;
            }
        }

        //private fields region
        private Int32 id;
        private NotProg notProg;
        private String email;
        private String subject;
        private String message;
        private DateTime sendDate;

        public IDatabase[] CreateNObjects(int count)
        {
            Replay[] replays = new Replay[count];

            for (Int32 i = 0; i < count; i++)
                replays[i] = new Replay(this.DataFields);

            return replays;
        }

        public void CreateCollections()
        {
            DataFields = new DataFieldCollection("ReplaysBox");

            DataFields.Add("id", new DataField("id", System.Data.SqlDbType.Int, true, true, this.GetType().GetProperty("Id")));
            DataFields.Add("email", new DataField("email", System.Data.SqlDbType.VarChar, 75, this.GetType().GetProperty("Email")));
            DataFields.Add("subject", new DataField("subject", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Subject")));
            DataFields.Add("message", new DataField("message", System.Data.SqlDbType.NText, this.GetType().GetProperty("Message")));
            DataFields.Add("sendDate", new DataField("sendDate", System.Data.SqlDbType.DateTime, 0, "getDate()", this.GetType().GetProperty("SendDate")));
        }

        public DataFieldCollection DataFields
        {
            get;
            set;
        }
    }

    public class Message : IDatabase
    {
        public Message(Int32 messageId, String senderName, String senderPhone, String senderAddress, String senderEmail, String messageSubject, String messagetext, DateTime messageDate, String messageLine)
        {
            id = messageId;
            name = senderName;
            phone = senderPhone;
            address = senderAddress;
            email = senderEmail;
            subject = messageSubject;
            messageText = messagetext;
            date = messageDate;
            isRead = false;
            link = messageLine;

            CreateCollections();
        }

        public Message()
        {
            id = -1;
            name = phone = address = email = subject = messageText = null;
            date = DateTime.Now;
            isRead = false;

            CreateCollections();
        }

        public Message(DataFieldCollection dataFields)
        {
            id = -1;
            name = phone = address = email = subject = messageText = null;
            date = DateTime.Now;
            isRead = false;
            DataFields = dataFields;
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

        public String Phone
        {
            get
            {
                return phone;
            }
            set
            {
                phone = value;
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

        public String Email
        {
            get
            {
                return email;
            }
            set
            {
                email = value;
            }
        }

        public String Subject
        {
            get
            {
                return subject;
            }
            set
            {
                subject = value;
            }
        }

        public String MessageText
        {
            get
            {
                return messageText;
            }
            set
            {
                messageText = value;
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

        public Boolean IsRead
        {
            get
            {
                return isRead;
            }
            set
            {
                isRead = value;
            }
        }

        public Boolean IsHide
        {
            get
            {
                return isHide;
            }
            set
            {
                isHide = value;
            }
        }

        public String Link
        {
            get
            {
                return link;
            }
            set
            {
                link = value;
            }
        }

        private Int32 id;
        private String name;
        private String phone;
        private String address;
        private String email;
        private String subject;
        private String messageText;
        private DateTime date;
        private Boolean isRead;
        private Boolean isHide;
        private String link;

        public IDatabase[] CreateNObjects(Int32 count)
        {
            IDatabase[] result = new Message[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new Message(this.DataFields);
            
            return result;
        }

        public void CreateCollections()
        {
            DataFields=new DataFieldCollection("messagesBox");

            DataFields.Add("id", new DataField("id", System.Data.SqlDbType.Int, true, true, this.GetType().GetProperty("Id")));
            DataFields.Add("name", new DataField("name", System.Data.SqlDbType.NVarChar, 75, this.GetType().GetProperty("Name")));
            DataFields.Add("phone", new DataField("phone", System.Data.SqlDbType.NVarChar, 75, this.GetType().GetProperty("Phone")));
            DataFields.Add("address", new DataField("address", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Address")));
            DataFields.Add("email", new DataField("email", System.Data.SqlDbType.VarChar, 75, this.GetType().GetProperty("Email")));
            DataFields.Add("subject", new DataField("subject", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Subject")));
            DataFields.Add("messageText", new DataField("messageText", System.Data.SqlDbType.NText, this.GetType().GetProperty("MessageText")));
            DataFields.Add("date", new DataField("sendDate", System.Data.SqlDbType.DateTime, 0, "getDate()", this.GetType().GetProperty("Date")));
            DataFields.Add("isRead", new DataField("isRead", System.Data.SqlDbType.Bit, 0, "0", this.GetType().GetProperty("IsRead")));
            DataFields.Add("isHide", new DataField("isHide", System.Data.SqlDbType.Bit, 0, "0", this.GetType().GetProperty("IsHide")));
            DataFields.Add("link", new DataField("link", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Link")));
        }

        public DataFieldCollection DataFields
        {
            get;
            set;
        }
    }
}
