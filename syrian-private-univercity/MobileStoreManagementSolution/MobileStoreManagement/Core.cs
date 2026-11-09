using System;

namespace MobileStoreManagement
{
    public static class Core
    {
        static Core()
        {
            connection = new System.Data.SqlClient.SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=" + Global.databasePath + ";Integrated Security=True;User Instance=True");
            command = new System.Data.SqlClient.SqlCommand("", connection);
        }

        public static void InsertMember(String userName, String password, String firstName, String lastName, String country)
        {
            command.CommandText = "INSERT INTO members (userName,password,firstName,lastName,country) VALUES (N'" + userName + "',N'" + password + "',N'" + firstName + "',N'" + lastName + "',N'" + country + "');";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static void DeleteMember(String userName)
        {
            command.CommandText = "DELETE FROM members WHERE userName=N'" + userName + "';";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static void ChangeLoginInfo(String userName, String nUserName, String nPassword)
        {
            command.CommandText = "UPDATE members SET userName=N'" + userName + "',password=N'" + nPassword + "' WHERE userName=N'" + userName + "'";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static void ChangeUserInfo(String userName, String firstName, String lastName, String country)
        {
            command.CommandText = "UPDATE members SET firstName=N'" + firstName + "',lastName=N'" + lastName + "',country=N'" + country + "' WHERE userName=N'" + userName + "'";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static Boolean Login(String name, String password, out Int32 userId, out Boolean isAdmin)
        {
            userId = -1;
            isAdmin = false;

            command.CommandText = "SELECT id FROM members WHERE userName=N'" + name + "' AND password=N'" + password + "';";

            connection.Open();
            Object result = command.ExecuteScalar();
            connection.Close();

            if (result == null)
            {
                return false;
            }
            else
            {
                userId = Convert.ToInt32(result);

                command.CommandText = "SELECT isAdmin FROM members WHERE userName=N'" + name + "' AND password=N'" + password + "';";
                connection.Open();
                Object admin = command.ExecuteScalar();
                connection.Close();

                if (result != null)
                    isAdmin = Convert.ToBoolean(admin);

                return true;
            }
        }

        public static void InsertCategory(String name, String img)
        {
            command.CommandText = "INSERT INTO categories (name,img) VALUES (N'" + name + "',N'" + img + "');";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static void DeleteCategory(String name)
        {
            command.CommandText = "DELETE FROM categories WHERE name=N'" + name + "';";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static void ChangeCategory(String name, String nName, String nImg)
        {
            command.CommandText = "UPDATE categories SET name=N'" + nName + "',img=N'" + nImg + "' WHERE name=N'" + name + "'";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static String[] GetCategoriesName()
        {
            System.Collections.Specialized.StringCollection stringCollection = new System.Collections.Specialized.StringCollection();

            command.CommandText = "SELECT name FROM categories;";
            connection.Open();

            reader = command.ExecuteReader();

            while (reader.Read())
                stringCollection.Add(Convert.ToString(reader[0]));

            connection.Close();

            String[] result = new String[stringCollection.Count];

            stringCollection.CopyTo(result, 0);

            return result;
        }

        public static void InsertProduct(String categoryName, String name, String img, Int32 count, Single price)
        {
            connection.Open();

            command.CommandText = "SELECT id FROM categories WHERE name=N'" + categoryName + "';";

            Object id = command.ExecuteScalar();

            if (id != null)
            {
                command.CommandText = "INSERT INTO products (categoryId,name,img,count,price) VALUES (N'" + id + "',N'" + name + "',N'" + img + "',N'" + count + "',N'" + price + "');";
                command.ExecuteNonQuery();
                
            }
            connection.Close();
        }

        public static void DeleteProduct(String name)
        {
            command.CommandText = "DELETE FROM products WHERE name=N'" + name + "';";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static void ChangeProduct(String name, String nName, String nImg, Int32 count, Single price)
        {
            command.CommandText = "UPDATE categories SET name=N'" + nName + "',img=N'" + nImg + "',count=" + count + ",price=" + price + " WHERE name=N'" + name + "'";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static String[] GetProductsName(String categoryName)
        {
            connection.Open();
            command.CommandText = "SELECT id FROM categories WHERE name=N'" + categoryName + "';";

            Object id = command.ExecuteScalar();

            if (id != null)
            {
                System.Collections.Specialized.StringCollection stringCollection = new System.Collections.Specialized.StringCollection();

                command.CommandText = "SELECT name FROM products WHERE categoryId=" + id + ";";
                reader = command.ExecuteReader();

                while (reader.Read())
                    stringCollection.Add(Convert.ToString(reader[0]));
   
                String[] result = new String[stringCollection.Count];

                stringCollection.CopyTo(result, 0);

                connection.Close();
                return result;
            }

            connection.Close();
            return new String[0];
        }

        public static void GetProduct(String name, out Int32 count, out Single price)
        {
            connection.Open();

            command.CommandText = "SELECT count FROM products WHERE name=N'" + name + "';";
            count = Convert.ToInt32(command.ExecuteScalar());

            command.CommandText = "SELECT price FROM products WHERE name=N'" + name + "';";
            price = Convert.ToSingle(command.ExecuteScalar());

            connection.Close();
        }

        public static Int32 InsertBill(Int32 memberId)
        {
            command.CommandText = "INSERT INTO bills (memberId,billDate) VALUES (" + memberId + ",'" + DateTime.Now.ToString("MM/dd/yyyy") + "') SELECT @@identity;";
            connection.Open();
            Int32 result = Convert.ToInt32(command.ExecuteScalar());
            connection.Close();

            return result;
        }

        public static void InsertBillItem(Int32 billId, String productName, Int32 count)
        {
            connection.Open();
            command.CommandText = "SELECT id FROM products WHERE name=N'" + productName + "';";

            String id = Convert.ToString(command.ExecuteScalar());

            command.CommandText = "INSERT INTO billItems (billId,productId,count) VALUES (" + billId + "," + id + "," + count + ");";
            
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static void DeleteBillItem(Int32 id)
        {
            command.CommandText = "DELETE FROM billItems WHERE id=" + id + ";";
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public static String[] GetBills(Int32 memberId)
        {
            command.CommandText = "SELECT id,billDate FROM bills WHERE memberId=" + memberId.ToString();
            System.Collections.Specialized.StringCollection str = new System.Collections.Specialized.StringCollection();
            connection.Open();
            reader = command.ExecuteReader();

            while (reader.Read())
                str.Add(reader[0].ToString() + '-' + Convert.ToDateTime(reader[1]).ToString("dd/MM/yyyy"));

            connection.Close();

            String[] result = new String[str.Count];
            str.CopyTo(result, 0);

            return result;
        }

        public static System.Collections.Specialized.StringCollection GetBillItems(Int32 billId)
        {
            System.Collections.Specialized.StringCollection stringCollection=new System.Collections.Specialized.StringCollection();
            command.CommandText = "SELECT products.Name,billItems.count,products.price FROM billItems,products WHERE billItems.productId=products.id AND billItems.billId=" + billId + ";";

            connection.Open();

            reader = command.ExecuteReader();

            while (reader.Read())
                stringCollection.Add(reader[0].ToString() + ';' + reader[1].ToString() + ';' + reader[2]);

            connection.Close();

            return stringCollection;
        }

        private static System.Data.SqlClient.SqlConnection connection;
        private static System.Data.SqlClient.SqlCommand command;
        private static System.Data.SqlClient.SqlDataReader reader;
    }
}
