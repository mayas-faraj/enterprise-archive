using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Controls;
using System.Reflection;

namespace Maniyat
{
    public class InformationControl
    {
        //public constructure region
        public InformationControl(IInformation parentItem, PropertyInfo relatedProperty)
        {
            parent = parentItem;
            name = description = null;
            type = ControlType.Text;
            startValue = lengthValue = 0;
            haveValidation = true;
            property = relatedProperty;
            isUsed = true;
        }

        public InformationControl(IInformation parentItem, String controlName, ControlType dataType, Int32 limitationLength, PropertyInfo relatedProperty)
        {
            parent = parentItem;
            name = controlName;
            description = null;
            type = dataType;
            startValue = 0;
            lengthValue = limitationLength;
            haveValidation = true;
            property = relatedProperty;
            isUsed = true;
        }

        public InformationControl(IInformation parentItem, String controlName, String toolTipDescription, ControlType dataType, Int32 limitationLength, PropertyInfo relatedProperty)
        {
            parent = parentItem;
            name = controlName;
            description = toolTipDescription;
            type = dataType;
            startValue = 0;
            lengthValue = limitationLength;
            haveValidation = true;
            property = relatedProperty;
            isUsed = true;
        }

        //public properties region
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

        public ControlType Type
        {
            get
            {
                return type;
            }
            set
            {
                type = value;
            }
        }

        public Int32 StartValue
        {
            get
            {
                return startValue;
            }
            set
            {
                startValue = value;
            }
        }

        public Int32 LengthValue
        {
            get
            {
                return lengthValue;
            }
            set
            {
                lengthValue = value;
            }
        }

        public Boolean HaveValidation
        {
            get
            {
                return haveValidation;
            }
            set
            {
                haveValidation = value;
            }
        }

        public HorizontalAlignment ContentHorizontalAlignment
        {
            get
            {
                return contentHorizontalAlignment;
            }
            set
            {
                contentHorizontalAlignment = value;
            }
        }

        public VerticalAlignment ContentVerticalAlignment
        {
            get
            {
                return contentVerticalAlignment;
            }
            set
            {
                contentVerticalAlignment = value;
            }
        }

        public PropertyInfo Property
        {
            get
            {
                return property;
            }
            set
            {
                property = value;
            }
        }

        public Object Value
        {
            get
            {
                if (property != null && parent != null)
                    return property.GetValue(parent, null);
                else
                    return null;
            }
            set
            {
                if (property != null && parent != null)
                    property.SetValue(parent, value, null);
                else
                    ;//alarm error
            }
        }

        public Boolean IsUsed
        {
            get
            {
                return isUsed;
            }
            set
            {
                isUsed = value;
            }
        }

        public IInformation Parent
        {
            get
            {
                return parent;
            }
            set
            {
                parent = value;
            }
        }

        //public static functions region
        public static Boolean CheckValidity(InformationControl control)
        {
            //precondition : none
            if (control.name != null && control.name != "" && control.isUsed)
                return true;
            else
                return false;
            //return value : true if control have name and type , else return false
        }

        //private properties region
        private String name;
        private String description;
        private ControlType type;
        private Int32 startValue;
        private Int32 lengthValue;
        private Boolean haveValidation;
        private HorizontalAlignment contentHorizontalAlignment;
        private VerticalAlignment contentVerticalAlignment;
        private PropertyInfo property;
        private Boolean isUsed;
        private IInformation parent;
    }

    public enum ControlType
    {
        Text,
        MaskText,
        NumericText,
        NumericSlider,
        FilePath,
        FolderPath,
        Boolean,
        Image,
        DateTime
    }
}
