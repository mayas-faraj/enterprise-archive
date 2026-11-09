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

            InformationControls.Add("Name", new Maniyat.InformationControl(this, "Name:", "name of person", Maniyat.ControlType.Text, 20, this.GetType().GetProperty("Name")));
            InformationControls.Add("Password", new Maniyat.InformationControl(this, "Password:", "write password here", Maniyat.ControlType.MaskText, 20, this.GetType().GetProperty("Password")));
            InformationControls.Add("IsMarried", new Maniyat.InformationControl(this, "IsMarried:", "family status", Maniyat.ControlType.Boolean, 20, this.GetType().GetProperty("IsMarried")));
            InformationControls.Add("Age", new Maniyat.InformationControl(this, "Age:", "interger indicate of age person", Maniyat.ControlType.NumericSlider, 1000, this.GetType().GetProperty("Age")));
            InformationControls.Add("Weigth", new Maniyat.InformationControl(this, "Weight:", "real number indicate weight in KG", Maniyat.ControlType.NumericText, 150, this.GetType().GetProperty("Weight")));
            InformationControls.Add("FileStorage", new Maniyat.InformationControl(this, "FileStorage:", "path on your computer to file profile", Maniyat.ControlType.FilePath, 20, this.GetType().GetProperty("FileStorage")));
            InformationControls.Add("FolderStorage", new Maniyat.InformationControl(this, "FolderStorage:", "path on your computer to main folder", Maniyat.ControlType.FolderPath, 20, this.GetType().GetProperty("FolderStorage")));
            InformationControls.Add("ImagePath", new Maniyat.InformationControl(this, "Image:", "path on your computer to your image", Maniyat.ControlType.Image, 20, this.GetType().GetProperty("ImagePath")));
            InformationControls.Add("birthDate", new Maniyat.InformationControl(this, "birthDate:", "choose you birthdate", Maniyat.ControlType.DateTime, System.DateTime.Now.Year, this.GetType().GetProperty("birthDate")));

            InformationControls["Age"].StartValue = 10;
            InformationControls["birthDate"].StartValue = 1900;
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

        public Byte Age
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

        public DateTime birthDate
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
