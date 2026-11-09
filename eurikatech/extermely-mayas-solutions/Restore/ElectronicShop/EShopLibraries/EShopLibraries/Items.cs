using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maniyat
{
    public class Group
    {
        private Int32 id;
        private Int32 parentId;
        private String name;
        private String comment;
        private String image;
        private DateTime addedDate;
        private Boolean isHide;

        public Group()
        {
            id = -1;
            parentId = -1;
            name = comment = image = null;
            addedDate = DateTime.Now;
        }

        public Group(Int32 groupId)
        {
            id = groupId;
            parentId = -1;
            name = comment = image = null;
            addedDate = DateTime.Now;
        }

        public Group(Int32 groupId, Int32 parentGroupId, String groupName, String groupComment,String groupImage, DateTime groupCreationDate, Boolean isGroupHide)
        {
            id = groupId;
            parentId = parentGroupId;
            name = groupName;
            comment = groupComment;
            image = groupImage;
            addedDate = groupCreationDate;
            isHide = isGroupHide;
        }

        public Int32 Id
        {
            get
            {
                return id;
            }
        }

        public Int32 ParentId
        {
            get
            {
                return parentId;
            }
            set
            {
                parentId = value;
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

        public String Comment
        {
            get
            {
                return comment;
            }
            set
            {
                comment = value;
            }
        }

        public String Image
        {
            get
            {
                return image;
            }
            set
            {
                image = value;
            }
        }

        public DateTime AddedDate
        {
            get
            {
                return addedDate;
            }
            set
            {
                addedDate = value;
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
                isHide=value;
            }
        }
    }

    public class Product : Group
    {
        private String price;
        private String details;
        private DateTime validDate;
        private DateTime expierDate;
        private Boolean useDateRange;

        public Product()
            : base()
        {
            price = null;
            validDate = expierDate = DateTime.Now;
        }

        public Product(Int32 productId)
            : base(productId)
        {

            price = null;
            validDate = expierDate = DateTime.Now;
        }

        public Product(Int32 productId, Int32 parentProductId, String productName, String productComment, String productImage, DateTime productCreationDate, DateTime productValidDate, DateTime productExpierDate, String productPrice, Boolean isProductHide,Boolean isUsedDate,String productDetails)
            : base(productId, parentProductId, productName, productComment, productImage, productCreationDate, isProductHide)
        {
            price = productPrice;
            validDate = productValidDate;
            expierDate = productExpierDate;
            details = productDetails;
            useDateRange = isUsedDate;
        }

        public String Price
        {
            get
            {
                return price;
            }
            set
            {
                price = value;
            }
        }

        public String Details
        {
            get
            {
                return details;
            }
            set
            {
                details = value;
            }
        }
        
        public DateTime ValidDate
        {
            get
            {
                return validDate;
            }
            set
            {
                validDate = value;
            }
        }

        public DateTime ExpierDate
        {
            get
            {
                return expierDate;
            }
            set
            {
                expierDate = value;
            }
        }

        public Boolean UseDateRange
        {
            get
            {
                return useDateRange;
            }
            set
            {
                useDateRange = value;
            }
        }
    }

    public class Replay
    {
        private Int32 id;
        private NotProg notProg;
        private String email;
        private String subject;
        private String message;
        private DateTime sendDate;

        public Replay(Int32 replayId, NotProg replayNotProg, String replayEmail, String replaySubject, String replayMessage, DateTime replaySendDate)
        {
            id = replayId;
            notProg = replayNotProg;
            email = replayEmail;
            subject = replaySubject;
            message = replayMessage;
            sendDate = replaySendDate;
        }

        public Replay()
        {
            id = -1;
            notProg = null;
            email = subject = message = null;
            sendDate = DateTime.Now;
        }

        public Int32 Id
        {
            get
            {
                return id;
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
    }

    public class Message
    {
        private Int32 id;
        private String name;
        private String phone;
        private String address;
        private String email;
        private String subject;
        private String messageText;
        private DateTime date;
        private Boolean isRead;

        public Message(Int32 messageId, String senderName, String senderPhone, String senderAddress, String senderEmail, String messageSubject, String messagetext, DateTime messageDate)
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
        }

        public Message()
        {
            id = -1;
            name = phone = address = email = subject = messageText = null;
            date = DateTime.Now;
            isRead = false;
        }

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
    }

    public class MessageToGroup : Message
    {
        private Int32 groupId;

        public MessageToGroup(Int32 messageId, String senderName, String senderPhone, String senderAddress, String senderEmail, String messageSubject, String messageText, DateTime messageDate, Int32 messageGroup)
            : base(messageId, senderName, senderPhone, senderAddress, senderEmail, messageSubject, messageText, messageDate)
        {
            groupId = messageGroup;
        }

        public Int32 GroupId
        {
            get
            {
                return groupId;
            }
            set
            {
                groupId = value;
            }
        }
    }

    public class MessageToProduct : Message
    {
        private Int32 productId;

        public MessageToProduct(Int32 messageId, String senderName, String senderPhone, String senderAddress, String senderEmail, String messageSubject, String messageText, DateTime messageDate, Int32 messageProduct)
            : base(messageId, senderName, senderPhone, senderAddress, senderEmail, messageSubject, messageText, messageDate)
        {
            productId = messageProduct;
        }

        public Int32 ProductId
        {
            get
            {
                return productId;
            }
            set
            {
                productId = value;
            }
        }
    }
}
