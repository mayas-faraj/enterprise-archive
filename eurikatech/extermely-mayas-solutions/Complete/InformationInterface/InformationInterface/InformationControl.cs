using System;
using System.Reflection;
using System.Windows;
using System.Windows.Media;
using System.Windows.Markup;
using System.Windows.Controls;

namespace Maniyat
{
    public class InformationControl
    {
        //public constructures region
        public InformationControl(PropertyInfo relatedProperty)
        {
            name = description = valueUnit = null;
            type = ControlType.Text;
            startValue = lengthValue = 0;
            isUsed = haveValidation = true;
            property = relatedProperty;
        }

        public InformationControl(String controlName, String toolTipDescription, ControlType dataType, PropertyInfo relatedProperty)
        {
            name = controlName;
            description = toolTipDescription;
            valueUnit = null;
            type = dataType;
            startValue = lengthValue = 0;
            isUsed = haveValidation = true;
            property = relatedProperty;
        }

        public InformationControl(String controlName, String toolTipDescription, String extentionValueUnit, ControlType dataType, Int32 limitationStart, Int32 limitationLength, PropertyInfo relatedProperty)
        {
            name = controlName;
            description = toolTipDescription;
            valueUnit = extentionValueUnit;
            type = dataType;
            startValue = limitationStart;
            lengthValue = limitationLength;
            isUsed = haveValidation = true;
            property = relatedProperty;
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

        public String ValueUnit
        {
            get
            {
                return valueUnit;
            }
            set
            {
                valueUnit = value;
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

        //public events region
        public event ExceptionEventHandler ExceptionEvent;

        //public functions region
        public Object GetValue(IInformation item)
        {
            if (property != null && CheckSystem.CheckValidity(item))
                return property.GetValue(item, null);
            else
                return null;
        }

        public void SetValue(IInformation item, Object value)
        {
            if (property != null && CheckSystem.CheckValidity(item))
                property.SetValue(item, value, null);
            else
                ExceptionEvent(this, new ExceptionEventArgs(new Exception(CheckSystem.ERROR_CHECK_SYSTEM + "0001")));
        }
  
        //private fields region
        private String name;
        private String description;
        private String valueUnit;
        private ControlType type;
        private Int32 startValue;
        private Int32 lengthValue;
        private Boolean haveValidation;
        private PropertyInfo property;
        private Boolean isUsed;
    }

    public class ControlRelation
    {
        //public constructures region
        public ControlRelation()
        {
            titleElement = valuableElement = commandElement = null;
        }

        public ControlRelation(InformationControl informationControl, FrameworkElement relatedTitleElement, FrameworkElement relatedValuableElement)
        {
            control = informationControl;
            titleElement = relatedTitleElement;
            valuableElement = relatedValuableElement;
        }

        public ControlRelation(InformationControl informationControl, FrameworkElement relatedTitleElement, FrameworkElement relatedValuableElement, FrameworkElement relatedCommandElement)
            : this(informationControl, relatedTitleElement, relatedValuableElement)
        {
            commandElement = relatedCommandElement;
        }

        //public properties region
        public InformationControl Control
        {
            get
            {
                return control;
            }
            set
            {
                control = value;
            }
        }

        public FrameworkElement TitleElement
        {
            get
            {
                return titleElement;
            }
            set
            {
                titleElement = value;
            }
        }

        public FrameworkElement ValuableElement
        {
            get
            {
                return valuableElement;
            }
            set
            {
                valuableElement = value;
            }
        }

        public FrameworkElement CommandElement
        {
            get
            {
                return commandElement;
            }
            set
            {
                commandElement = value;
            }
        }
        
        //private fields region
        private InformationControl control;
        private FrameworkElement titleElement;
        private FrameworkElement valuableElement;
        private FrameworkElement commandElement;
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
        Color,
        DateTime,
        Image
    }
}