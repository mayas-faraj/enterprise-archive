using System;

namespace Library
{
    public class Order
    {
        //public constructures region
        public Order()
        {
            id = -1;
            X = Y = Velocity = 0;
            Serial = -1;
        }

        public Order(float x, float y, float velocity, int serial)
        {
            X = x;
            Y = y;
            Velocity = velocity;
            Serial = serial;
        }

        public Order(int id, float x, float y, float velocity, int serial)
        {
            this.id = id;
            X = x;
            Y = y;
            Velocity = velocity;
            Serial = serial;
        }

        //public properties region
        public int Id
        {
            get
            {
                return id;
            }
        }

        public float X
        {
            get;
            set;
        }

        public float Y
        {
            get;
            set;
        }

        public float Velocity
        {
            get;
            set;
        }

        public int Serial
        {
            get;
            set;
        }

        //public functions region
        public override string ToString()
        {       
            return "الأمر " + Serial + " تم التوجيه للأحداثيات " + X + " , " + Y + "  وبسرعة " + Velocity + " سم في الثانية.";
        }

        public static void ConvertToPolar(float dx, float dy, out float radius, out float theta)
        {

            //mathmatical polar coodinate
            radius = Convert.ToSingle(Math.Sqrt(dx * dx + dy * dy));
            
            if (dx == 0)
            {
                if (dy > 0)
                    theta = 180;
                else
                    theta = 0;
            }
            else
            {
                if (dx > 0)
                    if (dy == 0)
                        theta = -90;
                    else
                    {
                        if (dy > 0)
                            theta = -90 - Convert.ToSingle(Math.Atan(Math.Abs(dy / dx)) * 180 / Math.PI);
                        else
                            theta = Convert.ToSingle(Math.Atan(Math.Abs(dy / dx)) * 180 / Math.PI) - 90;
                    }
                else
                    if (dy == 0)
                        theta = 90;
                    else
                        if (dy > 0)
                            theta = Convert.ToSingle(Math.Atan(Math.Abs(dy / dx)) * 180 / Math.PI) + 90;
                        else
                            theta = 90 - Convert.ToSingle(Math.Atan(Math.Abs(dy / dx)) * 180 / Math.PI);
            }
        }
        
        //private fields region
        private int id;
    }

    public class OrderCollection : System.Collections.CollectionBase
    {
        //public fuctions region
        public void Add(Order value)
        {
            this.List.Add(value);
        }

        public void Remove(Order value)
        {
            this.List.Remove(value);
        }

        public void Remove(int index)
        {
            this.List.RemoveAt(index);
        }

        public Order this[int index]
        {
            get
            {
                return (Order)List[index];
            }
            set
            {
                List[index] = value;
            }
        }

        public override string ToString()
        {
            string result = "";

            foreach (Order order in List)
                result += order.ToString() + System.Environment.NewLine;

            return result;
        }
    }

    public class User
    {
        //public constructures region
        public User()
        {
            id = -1;
            Name = Password = "";
        }

        public User(string name,string password)
        {
            id = -1;
            Name = name;
            Password = password;
        }

        public User(int id,string name, string password)
        {
            this.id = id;
            Name = name;
            Password = password;
        }

        //public properties region
        public int Id
        {
            get
            {
                return id;
            }
        }

        public string Name
        {
            get;
            set;
        }

        public string Password
        {
            get;
            set;
        }

        //public functions region
        public static int Hashing(string password)
        {
            return ("!@#$%^&*()" + password + "-=\\").GetHashCode();
        }

        public override string ToString()
        {
            return '(' + this.Name + ')';
        }

        //private fields region
        private int id;
    }

    public class Option
    {
        //public constructures region
        public Option()
        {
            id = -1;

            Name = "";
            MapPath = "";
            MapScale = 1;
            Width = Height = 100;
            PointColor = new Color(255,255, 0, 0);
        }

        public Option(string name, string mapPath, float mapScale, float width, float height, Color pointColor)
        {
            id = -1;

            Name = name;
            MapPath = mapPath;
            MapScale = mapScale;
            Width = width;
            Height = height;
            PointColor = pointColor;
        }

        public Option(int id, string name, string mapPath, float mapScale, float width, float height, Color pointColor)
        {
            this.id = id;

            Name = name;
            MapPath = mapPath;
            MapScale = mapScale;
            Width = width;
            Height = height;
            PointColor = pointColor;
        }

        //public properties region
        public int Id
        {
            get
            {
                return id;
            }
        }

        public string Name
        {
            get;
            set;
        }

        public string MapPath
        {
            get;
            set;
        }

        public float MapScale
        {
            get;
            set;
        }

        public float Width
        {
            get;
            set;
        }

        public float Height
        {
            get;
            set;
        }

        public Color PointColor
        {
            get;
            set;
        }

        //public functions region
        public override string ToString()
        {
            return '(' + Name + ')';
        }

        //private fields region
        private int id;
    }

    public class Operation
    {
        //public constructures region
        public Operation()
        {
            id = -1;

            Name = Comment = "";
            Orders = new OrderCollection();
            CurrentAngle = CurrentDistance = CurrentVelocity = 0;
            OperationUser = null;
            OperationOption = null;
            OperationCommand = Command.stop;
        }

        public Operation(string name, string comment, OrderCollection orders, float currentAngle, float currentDistance, float currentVelocity, User operationUser, Option operationOption)
        {
            id = -1;

            Name = name;
            Comment = comment;
            Orders = orders;
            CurrentAngle = currentAngle;
            CurrentDistance = currentDistance;
            CurrentVelocity = currentVelocity;
            OperationUser = operationUser;
            OperationOption = operationOption;
            OperationCommand = Command.stop;
        }

        public Operation(int id, string name, string comment, OrderCollection orders, float currentAngle, float currentDistance, float currentVelocity, User operationUser, Option operationOption,Command operationCommand)
        {
            this.id = id;

            Name = name;
            Comment = comment;
            Orders = orders;
            CurrentAngle = currentAngle;
            CurrentDistance = currentDistance;
            CurrentVelocity = currentVelocity;
            OperationUser = operationUser;
            OperationOption = operationOption;
            OperationCommand = operationCommand;
        }

        //public properties region
        public int Id
        {
            get
            {
                return id;
            }
        }

        public string Name
        {
            get;
            set;
        }

        public string Comment
        {
            get;
            set;
        }

        public OrderCollection Orders
        {
            get;
            set;
        }

        public float CurrentAngle
        {
            get;
            set;
        }

        public float CurrentDistance
        {
            get;
            set;
        }

        public float CurrentVelocity
        {
            get;
            set;
        }

        public Command OperationCommand
        {
            get;
            set;
        }

        public User OperationUser
        {
            get;
            set;
        }

        public Option OperationOption
        {
            get;
            set;
        }

        //public functions region
        public override string ToString()
        {
            return "(" + Name + "[" + Orders.Count + "])";
        }

        //private fields region
        private int id;     
    }

    public struct Color
    {
        //public constructure region
        public Color(int color)
            :this()
        {
            FromInt32(color);
        }

        public Color(byte r, byte g, byte b)
            :this()
        {
            A = 255;
            R = r;
            G = g;
            B = b;
        }

        public Color(byte a,byte r, byte g, byte b)
            :this()
        {
            A = a;
            R = r;
            G = g;
            B = b;
        }

        //public functions region
        public byte A
        {
            get;
            set;
        }

        public byte R
        {
            get;
            set;
        }

        public byte G
        {
            get;
            set;
        }

        public byte B
        {
            get;
            set;
        }

        //pubic fuctions region
        public int ToInt32()
        {
            return A + 256 * R + 65536 * G + 16711680 * B;
        }

        public void FromInt32(int color)
        {
            B = System.Convert.ToByte(color / 16711680);
            color -= B * 16711680;

            G = System.Convert.ToByte(color / 65536);
            color -= G * 65536;

            R = System.Convert.ToByte(color / 256);
            color -= R * 256;

            A = System.Convert.ToByte(color);
        }
    }

    public enum Command
    {
        run,
        pause,
        stop
    }
}
