using System;

namespace NewsTv.Codes
{
    public class Settings
    {
        //public constructors region
        static Settings()
        {
            ConfirmDelete = confirmExit = confirmSave = labelsWidthCircle = true;
            BrushDialogColorAndName = true;
            LabelsToCircleXShift = 0;
            labelsToCircleYShift = -30;
            minimumMapZoom = 1;
            maximumMapZoom = 15;
        }

        //public properties region
        
        public static Boolean ConfirmDelete
        {
            get
            {
                return confirmDelete;
            }
            set
            {
                confirmDelete = value;
            }
        }

        public static Boolean ConfirmExit
        {
            get
            {
                return confirmExit;
            }
            set
            {
                confirmExit = value;
            }
        }

        public static Boolean ConfirmSave
        {
            get
            {
                return confirmSave;
            }
            set
            {
                confirmSave = value;
            }
        }

        public static Boolean LabelsWidthCircle
        {
            get
            {
                return labelsWidthCircle;
            }
            set
            {
                labelsWidthCircle = value;
            }
        }

        public static Boolean BrushDialogColorAndName
        {
            get
            {
                return brushDialogColorAndName;
            }
            set
            {
                brushDialogColorAndName = value;
            }
        }

        public static Double LabelsToCircleXShift
        {
            get
            {
                return labelsToCircleXShift;
            }
            set
            {
                labelsToCircleXShift = value;
            }
        }

        public static Double LabelsToCircleYShift
        {
            get
            {
                return labelsToCircleYShift;
            }
            set
            {
                labelsToCircleYShift = value;
            }
        }

        public static Double MinimumMapZoom
        {
            get
            {
                return minimumMapZoom;
            }
            set
            {
                minimumMapZoom = value;
            }
        }

        public static Double MaximumMapZoom
        {
            get
            {
                return maximumMapZoom;
            }
            set
            {
                maximumMapZoom = value;
            }
        }

        //public functions region
        public static void Save(String fileName)
        {
            //initial memory object
            System.Collections.Specialized.StringCollection strings = new System.Collections.Specialized.StringCollection();
            
            strings.Add(ConfirmDelete.ToString());
            strings.Add(ConfirmExit.ToString());
            strings.Add(ConfirmSave.ToString());
            strings.Add(LabelsWidthCircle.ToString());
            strings.Add(BrushDialogColorAndName.ToString());
            strings.Add(LabelsToCircleXShift.ToString());
            strings.Add(LabelsToCircleYShift.ToString());
            strings.Add(MinimumMapZoom.ToString());
            strings.Add(MaximumMapZoom.ToString());

            //save memory object
            System.Xml.Serialization.XmlSerializer serializer = new System.Xml.Serialization.XmlSerializer(typeof(System.Collections.Specialized.StringCollection), "Configures");
            System.IO.StreamWriter fs = new System.IO.StreamWriter(System.IO.Path.Combine(Variables.Consts.NAME_DIR_CONFIG, fileName + ".xml"));

            serializer.Serialize(fs, strings);
            fs.Close();
        }

        public static void Load(String fileName)
        {
            //load memory object
            System.Xml.Serialization.XmlSerializer serializer = new System.Xml.Serialization.XmlSerializer(typeof(System.Collections.Specialized.StringCollection), "Configures");
            System.IO.FileStream fs = new System.IO.FileStream(System.IO.Path.Combine(Variables.Consts.NAME_DIR_CONFIG, fileName + ".xml"), System.IO.FileMode.Open);
            System.Collections.Specialized.StringCollection strings = new System.Collections.Specialized.StringCollection();

            strings = (System.Collections.Specialized.StringCollection)serializer.Deserialize(fs);
            fs.Close();

            //get the values
            ConfirmDelete = Boolean.Parse(strings[0]);
            ConfirmExit = Boolean.Parse(strings[1]);
            ConfirmSave = Boolean.Parse(strings[2]);
            LabelsWidthCircle = Boolean.Parse(strings[3]);
            BrushDialogColorAndName = Boolean.Parse(strings[4]);
            LabelsToCircleXShift = Double.Parse(strings[5]);
            LabelsToCircleYShift = Double.Parse(strings[6]);
            MinimumMapZoom = Double.Parse(strings[7]);
            MaximumMapZoom = Double.Parse(strings[8]);
        }

        //private fields region
        private static Boolean confirmDelete;
        private static Boolean confirmExit;
        private static Boolean confirmSave;
        private static Boolean labelsWidthCircle;
        private static Boolean brushDialogColorAndName;

        private static Double labelsToCircleXShift;
        private static Double labelsToCircleYShift;
        private static Double minimumMapZoom;
        private static Double maximumMapZoom;
    }
}
