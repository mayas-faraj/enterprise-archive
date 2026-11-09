using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClientApplication
{
    class Person : Maniyat.IInformation
    {
        public Person()
        {
            InformationControls = new Maniyat.InformationControlCollection();

            InformationControls.Add("Name", new Maniyat.InformationControl("Name:", "name of person", null, Maniyat.ControlType.Text, 0, 20, this.GetType().GetProperty("Name")));
            InformationControls.Add("Password", new Maniyat.InformationControl("Password:", "write password here", null, Maniyat.ControlType.MaskText, 0, 20, this.GetType().GetProperty("Password")));
            InformationControls.Add("IsMarried", new Maniyat.InformationControl("IsMarried:", "family status", Maniyat.ControlType.Boolean, this.GetType().GetProperty("IsMarried")));
            InformationControls.Add("Age", new Maniyat.InformationControl("Age:", "interger indicate of age person", "Year Old", Maniyat.ControlType.NumericText, 0, 1000, this.GetType().GetProperty("Age")));
            InformationControls.Add("Weight", new Maniyat.InformationControl("Weight:", "real number indicate weight in KG", "Kelogram", Maniyat.ControlType.NumericSlider, 0, 150, this.GetType().GetProperty("Weight")));
            InformationControls.Add("FileStorage", new Maniyat.InformationControl("FileStorage:", "path on your computer to file profile", Maniyat.ControlType.FilePath, this.GetType().GetProperty("FileStorage")));
            InformationControls.Add("FolderStorage", new Maniyat.InformationControl("FolderStorage:", "path on your computer to main folder", Maniyat.ControlType.FolderPath, this.GetType().GetProperty("FolderStorage")));
            InformationControls.Add("ImagePath", new Maniyat.InformationControl("Image:", "path on your computer to your image", Maniyat.ControlType.Image, this.GetType().GetProperty("ImagePath")));
            InformationControls.Add("BirthDate", new Maniyat.InformationControl("birthDate:", "choose your birthdate", "Year Old", Maniyat.ControlType.DateTime, 1920, System.DateTime.Now.Year, this.GetType().GetProperty("BirthDate")));
            InformationControls.Add("HairColor", new Maniyat.InformationControl("HairColor:", "choose your hair color", Maniyat.ControlType.Color, this.GetType().GetProperty("HairColor")));

            InformationControls["Age"].StartValue = 10;
            InformationControls["birthDate"].StartValue = 1900;
        }

        public Person(Maniyat.InformationControlCollection collection)
        {
            this.InformationControls = collection;
        }

        public String Name
        {
            get;
            set;
        }

        public String Password
        {
            get;
            set;
        }

        public Boolean IsMarried
        {
            get;
            set;
        }

        public Double Age
        {
            get;
            set;
        }

        public Double Weight
        {
            get;
            set;
        }

        public String FileStorage
        {
            get;
            set;
        }

        public String FolderStorage
        {
            get;
            set;
        }

        public String ImagePath
        {
            get;
            set;
        }

        public DateTime BirthDate
        {
            get;
            set;
        }

        public System.Windows.Media.Color HairColor
        {
            get;
            set;
        }

        public Maniyat.InformationControlCollection InformationControls
        {
            get;
            set;
        }

        public override string ToString()
        {
            return this.Name + " (" + this.Age + ')';
        }
    }
}
