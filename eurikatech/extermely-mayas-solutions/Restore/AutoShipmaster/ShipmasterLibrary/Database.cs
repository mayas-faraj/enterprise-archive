using System;
using System.Data;
using System.Data.SqlClient;

namespace Library
{
    public static class Database
    {
        //public properties region
        public static string ConnectionString
        {
            get
            {
                return connectionString;
            }
            set
            {
                connectionString = value;

                connection = new SqlConnection(connectionString);
                command = new SqlCommand(null, connection);
            }
        }

        //public functions region
        public static void Save(OrderCollection orders, int operatonId)
        {
            //precondition: operationId have valid value
            if (orders != null && orders.Count > 0)
            {
                connection.Open();

                foreach (Order order in orders)
                {
                    command.CommandText = "INSERT INTO orders (operationId,x,y,velocity,serial) VALUES (" + operatonId + "," + order.X + "," + order.Y + "," + order.Velocity + "," + order.Serial + ");";
                    command.ExecuteNonQuery();
                }

                connection.Close();
            }
            //postcondition: orders will add to database
        }

        public static int Save(User user)
        {
            //precondition: none
            if (user != null)
            {
                Int32 id;
                command.CommandText = "INSERT INTO users (name,password) VALUES (N'" + user.Name + "',N'" + User.Hashing(user.Password) + "') SELECT @@IDENTITY;";

                connection.Open();
                id = Convert.ToInt32(command.ExecuteScalar());
                connection.Close();

                return id;
            }
            else
                return -1;
            //postcondition: user will add to database
            //return: identity to new row if user added, else return -1
        }

        public static int Save(Option option)
        {
            //precondition: none
            if (option != null)
            {
                Int32 id;
                command.CommandText = "INSERT INTO options (name,mapPath,mapScale,width,height,pointColor) VALUES (N'" + option.Name + "',N'" + option.MapPath + "'," + option.MapScale + "," + option.Width + "," + option.Height + "," + option.PointColor.ToInt32() + ") SELECT @@IDENTITY;";

                connection.Open();
                id = Convert.ToInt32(command.ExecuteScalar());
                connection.Close();

                return id;
            }
            else
                return -1;
            //postcondition: optoin will add to database
            //return: identity to new row if option is added, else return -1
        }

        public static int Save(Operation operation)
        {
            //precondition: none
            if (operation != null)
            {
                int id;
                command.CommandText = "INSERT INTO operations (name,comment,currentAngle,currentDistance,currentVelocity,userId,optionId,commandId) VALUES (N'" + operation.Name + "',N'" + operation.Comment + "'," + operation.CurrentAngle + "," + operation.CurrentDistance + "," + operation.CurrentVelocity + "," + operation.OperationUser.Id + "," + operation.OperationOption.Id + "," + Convert.ToInt32(operation.OperationCommand) + ") SELECT @@IDENTITY;";

                connection.Open();
                id = Convert.ToInt32(command.ExecuteScalar());
                connection.Close();

                Save(operation.Orders, id);

                return id;
            }
            else
                return -1;
            //postcondition: operation will add to database
            //return: identity to new row if operation added, else return -1
        }

        public static void Delete(Order order)
        {
            //precondition: none
            command.CommandText = "DELETE FROM orders WHERE id=" + order.Id + ";";

            executeNonQuery();
            //postcondition: order will delete from database
        }

        public static void Delete(User user)
        {
            //precondition: none
            command.CommandText = "DELETE FROM users WHERE id=" + user.Id + ";";

            executeNonQuery();
            //postcondition: user will delete from database
        }

        public static void Delete(Option option)
        {
            //precondition: none
            command.CommandText = "DELETE FROM options WHERE id=" + option.Id + ";";

            executeNonQuery();
            //postcondition: option will delete from database
        }

        public static void Delete(Operation operation)
        {
            //precondition: none
            if (operation != null)
            {
                if (operation.Orders != null && operation.Orders.Count > 0)
                    foreach (Order order in operation.Orders)
                        Delete(order);

                command.CommandText = "DELETE FROM operations WHERE id=" + operation.Id + ";";

                executeNonQuery();
            }
            //postcondition: operation will delete from database with the related orders
        }

        public static void Find(out Option option, int optionId)
        {
            //precondition: none
            command.CommandText = "SELECT name,mapPath,mapScale,width,height,pointColor FROM options WHERE id=" + optionId + ";";
            connection.Open();
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
                option = new Option(optionId, Convert.ToString(dataReader[0]), Convert.ToString(dataReader[1]), Convert.ToSingle(dataReader[2]), Convert.ToSingle(dataReader[3]), Convert.ToSingle(dataReader[4]), new Color(Convert.ToInt32(dataReader[5])));
            else
                option = null;

            connection.Close();
            //postconditoin: option will restore from database
            //return: return suitable option with an optionId
        }

        public static void Find(out User user, int userId)
        {
            //precondition: none
            command.CommandText = "SELECT name,password FROM users WHERE id=" + userId + ";";
            connection.Open();
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
                user = new User(userId, Convert.ToString(dataReader[0]), Convert.ToString(dataReader[1]));
            else
                user = null;

            connection.Close();
            //postconditoin: user restore from database
            //return: return suitable user with a userId
        }

        public static void Find(out Operation operation, int operationId)
        {
            //precondition: none
            User user;
            Option option;
            OrderCollection orders;

            command.CommandText = "SELECT id,name,comment,currentAngle,currentDistance,currentVelocity,userId,optionId,operationId FROM opteraions WHERE id=" + operationId + ";";
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                Int32 optionId = Convert.ToInt32(dataReader[7]);
                Int32 userId = Convert.ToInt32(dataReader[6]);
                Int32 id = Convert.ToInt32(dataReader[0]);

                connection.Close();
                Find(out option, optionId);
                Find(out user, userId);
                Load(out orders, id);
                connection.Open();
                operation = new Operation(Convert.ToInt32(dataReader[0]), Convert.ToString(dataReader[1]), Convert.ToString(dataReader[2]), orders, Convert.ToSingle(dataReader[3]), Convert.ToSingle(dataReader[4]), Convert.ToSingle(dataReader[5]), user, option, (Command)Convert.ToInt32(dataReader[8]));
            }
            else
                operation = null;
            
            connection.Close();
            //postconditoin: operation will restore from database
            //return: return suitlable operation with an operationId
        }

        public static void Load(out OrderCollection orders, int operationId)
        {
            //precondition: none
            orders = new OrderCollection();
            command.CommandText = "SELECT id,x,y,velocity,serial FROM orders WHERE operationId=" + operationId + " ORDER BY serial;";
            connection.Open();
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
                orders.Add(new Order(Convert.ToInt32(dataReader[0]), Convert.ToSingle(dataReader[1]), Convert.ToSingle(dataReader[2]), Convert.ToSingle(dataReader[3]), Convert.ToInt32(dataReader[4])));

            connection.Close();
            //postconditoin: orders will restore from database
            //return: return suitable orders with an operationId
        }

        public static void Load(out User[] users)
        {
            //precondition: none
            int length;
            int index = 0;

            command.CommandText = "SELECT COUNT(*) FROM users;";
            connection.Open();
            length = int.Parse(command.ExecuteScalar().ToString());

            if (length > 0)
            {
                users = new User[length];

                command.CommandText = "SELECT id,name,password FROM users;";
                dataReader = command.ExecuteReader();

                while (dataReader.Read())
                    users[index++] = new User(Convert.ToInt32(dataReader[0]), Convert.ToString(dataReader[1]), Convert.ToString(dataReader[2]));
            }
            else
                users = null;

            connection.Close();
            //postconditoin: users will restore from database
            //return: return all users
        }

        public static void Load(out Option[] option)
        {
            //precondition: none
            int length;
            int index = 0;

            command.CommandText = "SELECT COUNT(*) FROM options;";
            connection.Open();
            length = int.Parse(command.ExecuteScalar().ToString());

            if (length > 0)
            {
                option = new Option[length];

                command.CommandText = "SELECT id,name,mapPath,mapScale,width,height,pointColor FROM options;";
                dataReader = command.ExecuteReader();

                while (dataReader.Read())
                    option[index++] = new Option(Convert.ToInt32(dataReader[0]), Convert.ToString(dataReader[1]), Convert.ToString(dataReader[2]), Convert.ToSingle(dataReader[3]), Convert.ToSingle(dataReader[4]), Convert.ToSingle(dataReader[5]), new Color(Convert.ToInt32(dataReader[6])));
            }
            else
                option = null;

            connection.Close();
            //postconditoin: options will restore from database
            //return: return all options as array
        }

        public static void Load(out Operation[] operations)
        {
            //precondition: none
            int length;
            int index = 0;

            command.CommandText = "SELECT COUNT(*) FROM operations;";
            connection.Open();
            length = int.Parse(command.ExecuteScalar().ToString());

            if (length > 0)
            {
                operations = new Operation[length];

                command.CommandText = "SELECT Operations.id,Operations.name,Operations.comment,users.name,options.id,options.mapPath,options.mapScale,options.width,options.height,options.pointColor,options.name FROM Operations INNER JOIN options ON Operations.optionId = options.id INNER JOIN users ON Operations.userId = users.id";
                dataReader = command.ExecuteReader();

                while (dataReader.Read())
                    operations[index++] = new Operation(Convert.ToInt32(dataReader[0]), Convert.ToString(dataReader[1]), Convert.ToString(dataReader[2]), null, 0, 0, 0, new User(Convert.ToString(dataReader[3]), ""), new Option(Convert.ToInt32(dataReader[4]), Convert.ToString(dataReader[10]), Convert.ToString(dataReader[5]), Convert.ToSingle(dataReader[6]), Convert.ToSingle(dataReader[7]), Convert.ToSingle(dataReader[8]), new Color(Convert.ToInt32(dataReader[9]))), Command.stop);
            }
            else
                operations = null;

            connection.Close();

            if (operations != null)
                for (int i = 0; i < operations.Length; i++)
                {
                    OrderCollection orders;
                    Load(out orders, operations[i].Id);
                    operations[i].Orders = orders;
                }
            
            //postconditoin: operations will restore from database
            //return: return all operations as array
        }

        public static void Edit(Order order)
        {
            //precondition: none
            if (order != null && order.Id != -1)
            {
                command.CommandText = "UPDATE orders SET x=" + order.X + ",y=" + order.Y + ",velocity=" + order.Velocity + ",serial=" + order.Serial + " WHERE id=" + order.Id + ";";

                executeNonQuery();
            }
            //postcondition: edit the selected order to database
        }

        public static void Edit(User user)
        {
            //precondition: none
            if (user != null && user.Id != -1)
            {
                command.CommandText = "UPDATE users SET name=N'" + user.Name + "',password=N'" + user.Password + "' WHERE id=" + user.Id + ";";

                executeNonQuery();
            }
            //postcondition: edit the selected user to database
        }

        public static void Edit(Option option)
        {
            //precondition: none
            if (option != null && option.Id != -1)
            {
                command.CommandText = "UPDATE options SET name=N'" + option.Name + "',mapPath=N'" + option.MapPath + "',mapScale=" + option.MapScale + ",width=" + option.Width + ",height=" + option.Height + ",pointColor=" + option.PointColor.ToInt32() + " WHERE id=" + option.Id + ";";

                executeNonQuery();
            }
            //postcondition: edit the selected option to database
        }

        public static bool UserLogin(ref User user)
        {
            //precondition: none
            if (user != null)
            {
                string result;
                command.CommandText = "SELECT id FROM users WHERE name='" + user.Name + "' AND password='" + User.Hashing(user.Password) + "';";

                connection.Open();
                result = Convert.ToString(command.ExecuteScalar());
                connection.Close();

                if (result == null || result == "")
                    return false;
                else
                {
                    user = new User(Convert.ToInt16(result), user.Name, user.Password);
                    return true;
                }
            }
            else
                return false;
            //postcondition: id of suitable user with restore from database
            //return: if id found, return true, else return false
        }

        public static void OperationUpdateCommand(Operation operation, Command operationCommand)
        {
            //precondition: none
            if (operation != null)
            {
                command.CommandText = "UPDATE operations SET commandId=" + Convert.ToInt32(operationCommand) + ";";

                executeNonQuery();
            }
            //postcondition: commandId operations will changed is database
        }

        public static void OperationUpdateInfo(Operation operation)
        {
            //precondition: none
            if (operation != null)
            {
                command.CommandText = "UPDATE operations SET name=N'" + operation.Name + "',comment=N'" + operation.Comment + "',currentAngle=" + operation.CurrentAngle + ",currentDistance=" + operation.CurrentDistance + ",currentVelocity=" + operation.CurrentVelocity + ";";

                executeNonQuery();
            }
            //postcondition: name,comment,currentDistance, currentAngle and currentVelocity in operations table will changed is database
        }

        public static void LoadConnectionString(String dataSource)
        {
            System.IO.StreamReader sr = new System.IO.StreamReader(CS_FILE_NAME);
            String cs = sr.ReadToEnd();
            sr.Close();

            cs=cs.Replace(CS_REPLACE_WORD,dataSource);

            ConnectionString=cs;
        }

        //private functions region
        private static void executeNonQuery()
        {
            if (connection.State != ConnectionState.Open)
                connection.Open();

            command.ExecuteNonQuery();

            if (connection.State != ConnectionState.Closed)
                connection.Close();
        }

        //private fields region
        private static SqlConnection connection;
        private static SqlCommand command;
        private static SqlDataReader dataReader;
        private static String connectionString;

        //private constants region
        private const String CS_REPLACE_WORD = "*your Data Source*";
        private const String CS_FILE_NAME = "connectionString.txt";
    }
}
