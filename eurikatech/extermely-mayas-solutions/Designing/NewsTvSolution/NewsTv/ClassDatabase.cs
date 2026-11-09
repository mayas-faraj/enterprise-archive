using System;
using System.Data.SqlClient;

namespace NewsTv
{
    static class Database
    {
        //public properties region
        public static String ConnectionString
        {
            get
            {
                if (connection == null)
                    return "";
                else
                    return connection.ConnectionString;
            }
            set
            {
                connection = new SqlConnection(value);
            }
        }

        //public functions region
        public static Int32 ExecuteNonQuery(String commandText)
        {
            Int32 result;
            command.CommandText = commandText;
            connection.Open();
            result = command.ExecuteNonQuery();
            connection.Close();
            return result;
        }

        public static String ExecuteScallar(String commandText)
        {
            Object result;
            command.CommandText = commandText;
            connection.Open();
            result = command.ExecuteScalar();
            connection.Close();

            if (result == null)
                return null;
            else
                return result.ToString();
        }

        public static void Insert(Profile profile)
        {
            if (profile != null)
            {
                String code = profile.Language == null ? "" : profile.Language.Code;
                ExecuteNonQuery("INSERT INTO options (name,language,path) VALUES (N'" + profile.Name + "',N'" + code + "',N'" + profile.Path + "');");
            }
        }

        public static void Insert(Site site, Int32 profileId)
        {
            //precondition: none
            if (site != null)
            {
                //String imgPath = site.Image == null ? "" : site.Image.Tag.ToString();
                //ExecuteNonQuery("INSERT INTO (profileId,name,longitude,latitude,zoom,motionVelocity,motionAccelerate,sweepStartAngle,sweepEndAngle,sweepVelocityAngle,sweepAttunationAngle,image) VALUES (" + profileId + ",N'" + site.Name + "'," + site.Longitude + "," + site.Latitude + "," + site.Zoom + "," + site.MotionVelocity + "," + site.MotionAccelerate + "," + site.SweepStartAngle + "," + site.SweepEndAngle + "," + site.SweepVelocityAngle + "," + site.SweepAttunationAngle + ",N'" + imgPath + "')");
            }
        }

        public static void Insert(Circle circle, Int32 profileId)
        {
            //precondition: none 
            if (circle != null)
                ExecuteNonQuery("INSERT INTO Circles (profileId,color1,color2,thikness) VALUES (" + profileId + "," + circle.Color1 + "," + circle.Color2 + "," + circle.Thikness + ")");
        }

        public static void Insert(Pointer pointer, Int32 profileId)
        {
            //precondition: none
            if (pointer != null)
                ExecuteNonQuery("INSERT INTO pointers (profileId,color1,color2,bodythikness,headthikness,headhieght) VALUES (" + profileId + "," + pointer.Color1 + "," + pointer.Color2 + "," + pointer.BodyThikness + ",'" + pointer.HeadThikness + "','" + pointer.HeadHeight + "')");
        }

        public static void Insert(Image image, Int32 profileId)
        {
            //precondition: none
            if (image != null)
                ExecuteNonQuery("INSERT INTO images (profileId,path,width,height) VALUES (" + profileId + ",N'" + image.Path + "'," + image.Width + "," + image.Height + "," + 0 + "," + 0 + ")");
        }

        public static void Delete(Profile profile)
        {
            //precondition: profile has valid id number
            if (profile != null)
                ExecuteNonQuery("DELETE FROM profiles WHERE id=" + profile.Id + ";");
        }

        public static void Delete(Site site)
        {
            //precondition: profile has valid id number
            if (site != null)
                ExecuteNonQuery("DELETE FROM sites WHERE id=" + site.Id + ";");
        }

        public static void Delete(Circle circle)
        {
            //precondition: profile has valid id number
            if (circle != null)
                ExecuteNonQuery("DELETE FROM circles WHERE id=" + circle.Id + ";");
        }

        public static void Delete(Pointer pointer)
        {
            //precondition: profile has valid id number
            if (pointer != null)
                ExecuteNonQuery("DELETE FROM pointers WHERE id=" + pointer.Id + ";");
        }

        public static void Delete(Image image)
        {
            //precondition: profile has valid id number
            if (image != null)
                ExecuteNonQuery("DELETE FROM images WHERE id=" + image.Id + ";");
        }

        public static void Update(Profile profile)
        {
            //precondition: none
            if (profile != null)
                ExecuteNonQuery("UPDATE profile SET name=N'" + profile.Name + "',language=N'" + profile.Language + "',path=N'" + profile.Path + "' WHERE id=" + profile.Id + "");
        }

        public static void Update(Site site)
        {
            //precondition: none
            if (site != null)
                ExecuteNonQuery("UPDATE sites SET name=N'" + site.Name + "',longitude=" + site.Longitude + ",latitude=" + site.Latitude + ",zoom=" + site.Zoom + ",motionVelocity=" + site.MotionVelocity + ",motionAccelerate=" + site.MotionAccelerate + ",sweepStartAngle=" + site.SweepStartAngle + ",sweepEndAngle=" + site.SweepEndAngle + ",sweepVelocityAngle=" + site.SweepVelocityAngle + ",sweepAttunationAngle=" + site.SweepAttunationAngle + ",image=N'" + site.Image + "' WHERE id=" + site.Id + "");
        }

        public static void Update(Circle circle)
        {
            //precondition: none
            if (circle != null)
                ExecuteNonQuery("UPDATE circles SET color1=" + circle.Color1 + ",color2=" + circle.Color2 + ",thikness=" + circle.Thikness + " WHERE id=" + circle.Id + ";");
        }

        public static void Update(Pointer pointer)
        {
            //precondition: none
            if (pointer != null)
                ExecuteNonQuery("UPDATE circles SET color1=" + pointer.Color1 + ",color2=" + pointer.Color2 + ",bodythikness=" + pointer.BodyThikness + ",headthikness=" + pointer.HeadThikness + ",headheight=" + pointer.HeadThikness + " WHERE id=" + pointer.Id + ";");
        }

        public static void Update(Image image)
        {
            //precondition: none
            if (image != null)
                ExecuteNonQuery("UPDATE images SET path=N'" + image.Path + "',width=" + image.Width + ",height=" + image.Height + " WHERE id=" + image.Id + ";");
        }

        public static void Select(ref Profile[] profiles)
        {
            //precondition: none
            Int32 num = Convert.ToInt32(ExecuteScallar("SELECT COUNT(*) FROM profiles"));

            if (num > 0)
            {
                profiles = new Profile[num];
                Int32 idx = 0;

                command.CommandText = "SELECT id,name,language,path FROM profiles";

                connection.Open();
                dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    profiles[idx] = new Profile();

                    profiles[idx].Id = Convert.ToInt32(dataReader[0]);
                    profiles[idx].Name = Convert.ToString(dataReader[1]);
                    //profiles[idx].Language = Convert.ToString(dataReader[1]);
                    profiles[idx].Path = Convert.ToString(dataReader[1]);

                    idx++;
                }
            }

            

            connection.Close();

        }

        //private properties region
        private static SqlConnection connection;
        private static SqlCommand command;
        private static SqlDataReader dataReader;
    }
}
