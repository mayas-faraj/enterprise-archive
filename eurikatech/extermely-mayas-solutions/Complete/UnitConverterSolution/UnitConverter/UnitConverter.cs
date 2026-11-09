using System;

namespace Maniyat
{
    public class Unit : IDatabase, IInformation
    {
        //public constructures region
        public Unit()
        {
            id = -1;
            name = description = image = null;
            factor = 1;

            CreateCollections();
        }

        public Unit(DataFieldCollection dataFields, InformationControlCollection informationControls)
        {
            id = -1;
            name = description = image = null;
            factor = 1;

            this.dataFields = dataFields;
            this.informationControls = informationControls;
        }

        public Unit(Int32 unitId, String unitName, String unitDescription, Double multipleFactor, String unitImage)
        {
            id = unitId;
            name = unitName;
            description = unitDescription;
            factor = multipleFactor;
            image = unitImage;

            CreateCollections();
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

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public Double Factor
        {
            get
            {
                return factor;
            }
            set
            {
                factor = value;
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

        public DataFieldCollection DataFields
        {
            get
            {
                return dataFields;
            }
            set
            {
                dataFields = value;
            }
        }

        public InformationControlCollection InformationControls
        {
            get
            {
                return informationControls;
            }
            set
            {
                informationControls = value;
            }
        }

        //public functions region
        public void CreateCollections()
        {
            //DataFileds Collection
            this.dataFields = new DataFieldCollection("units");

            this.dataFields.Add("id", new DataField("id", System.Data.SqlDbType.Int, true, true, this.GetType().GetProperty("Id")));
            this.dataFields.Add("name", new DataField("name", System.Data.SqlDbType.NVarChar, 75, this.GetType().GetProperty("Name")));
            this.dataFields.Add("description", new DataField("description", System.Data.SqlDbType.NVarChar, 300, this.GetType().GetProperty("Description")));
            this.dataFields.Add("factor", new DataField("factor", System.Data.SqlDbType.Float, 0, "1", this.GetType().GetProperty("Factor")));
            this.dataFields.Add("image", new DataField("image", System.Data.SqlDbType.NVarChar, 300, this.GetType().GetProperty("Image")));

            //informationControls Collection
            this.informationControls = new InformationControlCollection();

            this.informationControls.Add("name", new InformationControl("Unit:", "Unit shortcut name", null, ControlType.Text, 0, 75, this.GetType().GetProperty("Name")));
            this.informationControls.Add("description", new InformationControl("description:", "Unit Logo", null, ControlType.Text, 0, 300, this.GetType().GetProperty("Description")));
            this.informationControls.Add("factor", new InformationControl("Factor:", "multiple factor of the unit", ControlType.NumericText, this.GetType().GetProperty("Factor")));
            this.informationControls.Add("image", new InformationControl("Image:", "Unit Logo", null, ControlType.Image, 0, 300, this.GetType().GetProperty("Image")));
        }

        public IDatabase[] CreateNObjects(Int32 count)
        {
            IDatabase[] result = new Unit[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new Unit(this.dataFields, this.informationControls);

            return result;
        }

        //private fields region
        private Int32 id;
        private String name;
        private String description;
        private Double factor;
        private String image;
        private DataFieldCollection dataFields;
        private InformationControlCollection informationControls;      
    }

    public static class UnitConverter
    {
        //static constructre region
        static UnitConverter()
        {
            selectedUnit = null;
            baseUnitFactor = 1;
            baseUnitRoundType = RoundType.ceiling;
        }

        //public properties region
        public static Unit SelectedUnit
        {
            get
            {
                return selectedUnit;
            }
            set
            {
                selectedUnit = value;
            }
        }

        public static Double BaseUnitFactor
        {
            get
            {
                return baseUnitFactor;
            }
            set
            {
                baseUnitFactor = value;
            }
        }

        public static RoundType BaseUnitRoundType
        {
            get
            {
                return baseUnitRoundType;
            }
            set
            {
                baseUnitRoundType = value;
            }
        }

        //public functionsRegion
        public static Double ConvertToBaseUnit(Double value)
        {
            //precondition : none
            if (selectedUnit != null)
                return value * selectedUnit.Factor;
            else
                return value;
            //return value : convert from select unit to base unit that have 1 multiple factor
        }

        public static Double ConvertToSelectedUnit(Double value)
        {
            //precondition : none
            if (selectedUnit != null && selectedUnit.Factor != 0)
                return value / selectedUnit.Factor;
            else
                return value;
            //return value : convert from base unit that have 1 multiple factor to selected unit
        }

        public static Double Convert(Double value, Unit fromUnit, Unit toUnit)
        {
            //precondition : none
            if (fromUnit != null && toUnit != null && toUnit.Factor != 0)
                return value * (fromUnit.Factor / toUnit.Factor);
            else
                return value;
            //return value : convert betweet tow units
        }

        public static Double Round(Double value)
        {
            if (baseUnitFactor != 0)
            {
                Double result;

                switch (baseUnitRoundType)
                {
                    case RoundType.ceiling:
                        result = Math.Ceiling(value / baseUnitFactor);
                        break;
                    case RoundType.floor:
                        result = Math.Floor(value / baseUnitFactor);
                        break;
                    default:
                        result = Math.Round(value / baseUnitFactor);
                        break;
                }

                return result * baseUnitFactor;
            }
            else
                return 0;
        }

        //private fields region
        private static Unit selectedUnit;
        private static Double baseUnitFactor;
        private static RoundType baseUnitRoundType;
    }

    public enum RoundType
    {
        round,
        ceiling,
        floor
    }
}
