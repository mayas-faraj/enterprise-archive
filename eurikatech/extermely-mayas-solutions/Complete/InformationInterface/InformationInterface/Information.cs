using System;
using System.Text;
using System.Windows;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace Maniyat
{
    public interface IInformation
    {
        InformationControlCollection InformationControls
        {
            get;
            set;
        }

        void CreateCollections();
    }

    public abstract class Information : ContentControl
    {
        //public constructures regoin
        public Information(IInformation itemStructure, ref Int32 startTabOrder, ref StringBuilder invalidShorcutsLitters)
        {
            //precondition : none
            this.IsTabStop = false;
            defaultImageSource = null;

            if (CheckSystem.CheckValidity(itemStructure))
            {
                //build main grid
                Grid mainGrid = new Grid();
                this.Content = mainGrid;

                //define columns
                ColumnDefinition columnTitles = new ColumnDefinition();
                ColumnDefinition columnTexts = new ColumnDefinition();
                ColumnDefinition columnCommands = new ColumnDefinition();

                columnTitles.Width = new GridLength(TITLES_REGION_WIDTH, GridUnitType.Star);
                columnTexts.Width = new GridLength(TEXTS_REGION_WIDTH, GridUnitType.Star);
                columnCommands.Width = new GridLength(COMMANDS_REGION_WIDTH, GridUnitType.Star);

                mainGrid.ColumnDefinitions.Add(columnTitles);
                mainGrid.ColumnDefinitions.Add(columnTexts);
                mainGrid.ColumnDefinitions.Add(columnCommands);

                //controlRelationArray
                controlRelations = new ControlRelation[AvailableControlsCount(itemStructure)];

                //define rows and control creation
                Int32 rowNumber = 0;

                for (Int32 i = 0; i < itemStructure.InformationControls.Count; i++)
                    if (CheckSystem.CheckValidity(itemStructure.InformationControls[i]))
                    {
                        RowDefinition row = new RowDefinition();
                        row.Height = new GridLength(1, GridUnitType.Auto);
                        mainGrid.RowDefinitions.Add(row);

                        //creating WPF controls
                        //textBlock creating for title
                        FrameworkElement valuableElement = null;
                        FrameworkElement commandElement = null;
                        Label labelElement = new Label();

                        labelElement.Content = GetShorcutsTitle(itemStructure.InformationControls[i].Name, ref invalidShorcutsLitters);

                        //valuable control creating for value
                        ProcessInformationControl(itemStructure.InformationControls[i], ref startTabOrder, labelElement, ref valuableElement, ref commandElement, false, false);

                        controlRelations[rowNumber] = new ControlRelation(itemStructure.InformationControls[i], labelElement, valuableElement, commandElement);
                        AddToGrid(mainGrid, controlRelations[rowNumber], rowNumber++);
                    }
                Clear();
            }
            //postcondition : building subcontrols depinding on input parameter informationControls
        }

        //public properties regoin
        public IInformation Values
        {
            get
            {
                //set properties to values
                //edit values
                if (controlRelations != null)
                    //control relation not null
                    for (Int32 i = 0; i < controlRelations.Length; i++)
                        //controlrelation is valid
                        if (CheckSystem.CheckValidity(controlRelations[i]))
                            if (controlRelations[i].ValuableElement != null)
                            {
                                Int32 notUsedVariable = 0;
                                FrameworkElement vElement = controlRelations[i].ValuableElement;
                                FrameworkElement cElement = controlRelations[i].CommandElement;
                                ProcessInformationControl(controlRelations[i].Control, ref notUsedVariable, null, ref vElement, ref cElement, false, true);
                            }

                return values;
            }
            set
            {
                values = value;

                //edit values
                if (controlRelations != null)
                    //loop invariant : i=0..Length of ControlRelation
                    for (Int32 i = 0; i < controlRelations.Length; i++)
                        if (CheckSystem.CheckValidity(controlRelations[i]))
                            if (controlRelations[i].ValuableElement != null)
                            {
                                Int32 notUsedVariable = 0;
                                FrameworkElement vElement = controlRelations[i].ValuableElement;
                                FrameworkElement cElement = controlRelations[i].CommandElement;
                                ProcessInformationControl(controlRelations[i].Control, ref notUsedVariable, null, ref vElement, ref cElement, true, false);
                            }
            }
        }

        public String FileExtensions
        {
            get
            {
                return fileExtensions;
            }
            set
            {
                fileExtensions = value;
            }
        }

        public String DefaultImageSource
        {
            get
            {
                return defaultImageSource;
            }
            set
            {
                defaultImageSource = value;
            }
        }

        public Brush WarningBackground
        {
            get
            {
                return warningBackground;
            }
            set
            {
                warningBackground = value;
            }
        }

        public Brush WarningForeground
        {
            get
            {
                return warningForeground;
            }
            set
            {
                warningForeground = value;
            }
        }

        public new Brush Background
        {
            get
            {
                return background;
            }
            set
            {
                background = value;

                for (Int32 i = 0; i < controlRelations.Length; i++)
                    if (CheckSystem.CheckValidity(controlRelations[i]))
                    {
                        if (controlRelations[i].ValuableElement != null && (
                            controlRelations[i].ValuableElement.GetType() == typeof(TextBox) ||
                            controlRelations[i].ValuableElement.GetType() == typeof(PasswordBox) ||
                            controlRelations[i].ValuableElement.GetType() == typeof(DatePicker)))
                            ((Control)controlRelations[i].ValuableElement).Background = background;

                        if (controlRelations[i].CommandElement != null &&
                            controlRelations[i].CommandElement.GetType() == typeof(Button))
                            ((Control)controlRelations[i].CommandElement).Background = background;
                    }
            }
        }

        public new Brush Foreground
        {
            get
            {
                return foreground;
            }
            set
            {
                foreground = value;

                for (Int32 i = 0; i < controlRelations.Length; i++)
                    if (CheckSystem.CheckValidity(controlRelations[i]))
                    {
                        if (controlRelations[i].TitleElement != null && controlRelations[i].TitleElement.GetType() == typeof(Label))
                            ((Label)controlRelations[i].TitleElement).Foreground = foreground;

                        if (controlRelations[i].ValuableElement != null && (
                            controlRelations[i].ValuableElement.GetType() == typeof(TextBox) ||
                            controlRelations[i].ValuableElement.GetType() == typeof(PasswordBox) ||
                            controlRelations[i].ValuableElement.GetType() == typeof(Slider) ||
                            controlRelations[i].ValuableElement.GetType() == typeof(DatePicker)))
                            ((Control)controlRelations[i].ValuableElement).Foreground = foreground;

                        if (controlRelations[i].CommandElement != null)
                        {
                            if (controlRelations[i].CommandElement.GetType() == typeof(Button))
                                ((Button)controlRelations[i].CommandElement).Foreground = foreground;
                            else
                                if (controlRelations[i].CommandElement.GetType() == typeof(TextBlock))
                                    ((TextBlock)controlRelations[i].CommandElement).Foreground = foreground;
                        }
                    }
            }
        }

        public new Thickness Padding
        {
            get
            {
                return padding;
            }
            set
            {
                padding = value;

                for (Int32 i = 0; i < controlRelations.Length; i++)
                    if (CheckSystem.CheckValidity(controlRelations[i]))
                    {
                        if (controlRelations[i].TitleElement != null)
                            controlRelations[i].TitleElement.Margin = padding;
                        if (controlRelations[i].ValuableElement != null)
                            controlRelations[i].ValuableElement.Margin = padding;
                        if (controlRelations[i].CommandElement != null)
                            controlRelations[i].CommandElement.Margin = padding;
                    }
            }
        }

        public new HorizontalAlignment HorizontalContentAlignment
        {
            get
            {
                return horizontalContentAlignment;
            }
            set
            {
                horizontalContentAlignment = value;

                for (Int32 i = 0; i < controlRelations.Length; i++)
                    if (CheckSystem.CheckValidity(controlRelations[i]))
                    {
                        if (controlRelations[i].ValuableElement != null && (
                             controlRelations[i].ValuableElement.GetType() == typeof(TextBox) ||
                             controlRelations[i].ValuableElement.GetType() == typeof(PasswordBox)))
                            ((Control)controlRelations[i].ValuableElement).HorizontalContentAlignment = horizontalContentAlignment;
                    }
            }
        }

        public new VerticalAlignment VerticalContentAlignment
        {
            get
            {
                return verticalContentAlignment;
            }
            set
            {
                verticalContentAlignment = value;

                for (Int32 i = 0; i < controlRelations.Length; i++)
                    if (CheckSystem.CheckValidity(controlRelations[i]))
                    {
                        if (controlRelations[i].ValuableElement != null && (
                             controlRelations[i].ValuableElement.GetType() == typeof(TextBox) ||
                             controlRelations[i].ValuableElement.GetType() == typeof(PasswordBox)))
                            ((Control)controlRelations[i].ValuableElement).VerticalContentAlignment = verticalContentAlignment;
                    }
            }
        }

        //public functions region
        public void Clear()
        {
            //precondition : none
            if (controlRelations != null)
                for (Int32 i = 0; i < controlRelations.Length; i++)
                    if (CheckSystem.CheckValidity(controlRelations[i]))
                    {
                        Int32 notUsedVariable = 0;
                        FrameworkElement vElement = controlRelations[i].ValuableElement;
                        FrameworkElement cElement = controlRelations[i].CommandElement;
                        ProcessInformationControl(controlRelations[i].Control, ref notUsedVariable, null, ref vElement, ref cElement, false, false);
                    }

            //postcondition : clear controls value in information control
        }

        public FrameworkElement GetValuableControlElements(InformationControl control)
        {
            //precondition : none
            for (Int32 i = 0; i < controlRelations.Length; i++)
                if (controlRelations[i].Control == control)
                    return controlRelations[i].ValuableElement;

            return null;
            //return : if control related with informationControl return this control , else return null
        }

        public FrameworkElement GetCommandControlElements(InformationControl control)
        {
            //precondition : none
            for (Int32 i = 0; i < controlRelations.Length; i++)
                if (controlRelations[i].Control == control)
                    return controlRelations[i].CommandElement;

            return null;
            //return : if control related with informationControl return this control , else return null
        }

        public TextBlock GetTitleControlElements(InformationControl control)
        {
            //precondition : none
            for (Int32 i = 0; i < controlRelations.Length; i++)
                if (controlRelations[i].Control == control)
                    return (TextBlock)controlRelations[i].TitleElement;

            return null;
            //return : if control related with informationControl return this control , else return null
        }

        public String GetShorcutsTitle(String name, ref StringBuilder shortcutLitters)
        {
            //precondition : none
            if (shortcutLitters != null && name != null)
                for (Int32 i = 0; i < name.Length; i++)
                {
                    //char index
                    Int32 idx = shortcutLitters.ToString().ToLower().IndexOf(name.ToLower()[i]);
                    //char not exist in shortcutLitters chars
                    if (idx < 0)
                    {
                        shortcutLitters.Append(name[i]);
                        return name.Substring(0, i) + UNDERSCORE + name.Substring(i);
                    }
                }

            return name;
            //postcondition : if shortcut litter added , add new shortcut litter to (param)shortcutLitters
            //return : if shortcut litter added , return name with & before shortcut litter , else return the same input
        }

        //private functions region
        private Int32 AvailableControlsCount(IInformation item)
        {
            //precondition : none
            Int32 count = 0;

            if (CheckSystem.CheckValidity(item))
                for (Int32 i = 0; i < item.InformationControls.Count; i++)
                    if (CheckSystem.CheckValidity(item.InformationControls[i]))
                        count++;

            return count;
            //return : count of avaliable informationControl in item.InformaitonControlCollection
        }

        private void AddToGrid(Grid grid, ControlRelation controlRelation, Int32 rowNumber)
        {
            //precondition : grid have 3 columns , rowNumber is positive number
            if (CheckSystem.CheckValidity(controlRelation))
            {
                //add title control
                if (controlRelation.TitleElement != null)
                {
                    Grid.SetColumn(controlRelation.TitleElement, 0);
                    Grid.SetRow(controlRelation.TitleElement, rowNumber);
                    grid.Children.Add(controlRelation.TitleElement);
                }

                //add valuable and command control
                if (controlRelation.ValuableElement != null && controlRelation.CommandElement == null)
                    Grid.SetColumnSpan(controlRelation.ValuableElement, 2);

                if (controlRelation.ValuableElement == null && controlRelation.CommandElement != null)
                    Grid.SetColumnSpan(controlRelation.CommandElement, 2);

                if (controlRelation.ValuableElement != null)
                {
                    Grid.SetColumn(controlRelation.ValuableElement, 1);
                    Grid.SetRow(controlRelation.ValuableElement, rowNumber);
                    grid.Children.Add(controlRelation.ValuableElement);
                }

                if (controlRelation.CommandElement != null)
                {
                    Grid.SetColumn(controlRelation.CommandElement, 2);
                    Grid.SetRow(controlRelation.CommandElement, rowNumber);
                    grid.Children.Add(controlRelation.CommandElement);
                }
            }
            //postcondition : add element to grid
        }

        private Boolean GetNumericVlaue(String inputNumber, ref Object outputNumber)
        {
            //precondition : none
            if (outputNumber != null)
            {
                //Byte type for outputNumber processing
                if (outputNumber.GetType() == typeof(Byte))
                {
                    Byte value;
                    if (Byte.TryParse(inputNumber, out value))
                    {
                        outputNumber = value;
                        return true;
                    }
                }

                //Int16 type for outputNumber processing
                if (outputNumber.GetType() == typeof(Int16))
                {
                    Int16 value;
                    if (Int16.TryParse(inputNumber, out value))
                    {
                        outputNumber = value;
                        return true;
                    }
                }

                //Int32 type for outputNumber processing
                if (outputNumber.GetType() == typeof(Int32))
                {
                    Int32 value;
                    if (Int32.TryParse(inputNumber, out value))
                    {
                        outputNumber = value;
                        return true;
                    }
                }

                //Int64 type for outputNumber processing
                if (outputNumber.GetType() == typeof(Int64))
                {
                    Int64 value;
                    if (Int64.TryParse(inputNumber, out value))
                    {
                        outputNumber = value;
                        return true;
                    }
                }

                //Single type for outputNumber processing
                if (outputNumber.GetType() == typeof(Single))
                {
                    Single value;
                    if (Single.TryParse(inputNumber, out value))
                    {
                        outputNumber = value;
                        return true;
                    }
                }

                //Double type for outputNumber processing
                if (outputNumber.GetType() == typeof(Double))
                {
                    Double value;
                    if (Double.TryParse(inputNumber, out value))
                    {
                        outputNumber = value;
                        return true;
                    }
                }

                //Decimal type for outputNumber processing
                if (outputNumber.GetType() == typeof(Decimal))
                {
                    Decimal value;
                    if (Decimal.TryParse(inputNumber, out value))
                    {
                        outputNumber = value;
                        return true;
                    }
                }
            }
            return false;
            //postcondition : if inputNumber is valid number , set suitable number type to outputNumber ,else do nothing
            //return : true if operation done , else return false
        }

        private void ProcessControl(Control control, Label relatedLabel, String toolTip, ref Int32 tabIndex)
        {
            //precondition : none
            if (control != null)
            {

                control.TabIndex = tabIndex++;
                control.ToolTip = toolTip;

                if (relatedLabel != null)
                    relatedLabel.Target = control;
            }
            //postcondition : set common values to properties to an element
        }

        private void ProcessInformationControl(InformationControl control, ref Int32 startTabOrder, Label relatedLabel, ref FrameworkElement valuableElement, ref FrameworkElement commandElement, Boolean setInputValue, Boolean getOutputValue)
        {
            //precondition : control is valid by CheckSystem
            switch (control.Type)
            {
                case ControlType.Boolean:
                    {
                        if (valuableElement == null)
                        {
                            valuableElement = new CheckBox();
                            ProcessControl((CheckBox)valuableElement, relatedLabel, control.Description, ref startTabOrder);
                            ((CheckBox)valuableElement).Content = CHECKBOXS_TEXT;
                        }

                        if (valuableElement.GetType() == typeof(CheckBox))
                        {
                            if (!setInputValue && !getOutputValue)
                                //clear value
                                ((CheckBox)valuableElement).IsChecked = false;

                            if (values != null)
                            {
                                if (setInputValue)
                                    //set input value to valuable control
                                    ((CheckBox)valuableElement).IsChecked = (control.GetValue(values) == null) ? false : Convert.ToBoolean(control.GetValue(values));

                                if (getOutputValue)
                                    //get output value to valuable control
                                    control.SetValue(values, ((CheckBox)valuableElement).IsChecked);
                            }
                        }

                        break;
                    }
                case ControlType.Color:
                    {
                        if (valuableElement == null)
                        {
                            //rectangle element processing
                            valuableElement = new Rectangle();
                            ((Rectangle)valuableElement).Fill = new SolidColorBrush(Colors.Black);

                            //button control processing to controlling color
                            if (commandElement == null)
                            {
                                commandElement = new Button();
                                ProcessControl((Button)commandElement, relatedLabel, control.Description, ref startTabOrder);
                                ((Button)commandElement).Content = BROWSE_TEXT;
                                ((Button)commandElement).Tag = valuableElement;
                                ((Button)commandElement).Click += new RoutedEventHandler(color_Click);
                            }
                        }

                        if (valuableElement.GetType() == typeof(Rectangle))
                        {
                            if (!setInputValue && !getOutputValue)
                                //clear value
                                ((Rectangle)valuableElement).Fill = new SolidColorBrush(Colors.Black);


                            if (values != null)
                            {
                                if (setInputValue)
                                    //set input value to valuable control
                                    ((Rectangle)valuableElement).Fill = new SolidColorBrush((Color)control.GetValue(values));

                                if (getOutputValue)
                                    //get output value to valuable control
                                    if (((Rectangle)valuableElement).Fill != null)
                                        control.SetValue(values, ((SolidColorBrush)((Rectangle)valuableElement).Fill).Color);
                            }
                        }
                        break;
                    }
                case ControlType.DateTime:
                    {
                        //DatePicker Control processing
                        if (valuableElement == null)
                        {
                            valuableElement = new DatePicker();
                            ProcessControl((DatePicker)valuableElement, relatedLabel, control.Description, ref startTabOrder);

                            if (control.StartValue != 0)
                                ((DatePicker)valuableElement).DisplayDateStart = new DateTime(control.StartValue, 1, 1);
                        }

                        if (valuableElement.GetType() == typeof(DatePicker))
                        {
                            if (!setInputValue && !getOutputValue)
                                //clear value
                                ((DatePicker)valuableElement).SelectedDate = DateTime.Now;


                            if (values != null)
                            {
                                if (setInputValue)
                                    //set input value to valuable control
                                    ((DatePicker)valuableElement).SelectedDate = (control.GetValue(values) == null) ? DateTime.Now : Convert.ToDateTime(control.GetValue(values));

                                if (getOutputValue)
                                    //get output value to valuable control
                                    control.SetValue(values, ((DatePicker)valuableElement).SelectedDate);
                            }
                        }
                        break;
                    }
                case ControlType.FilePath:
                case ControlType.FolderPath:
                    {
                        if (valuableElement == null)
                        {
                            //textbox control processing to exhibt pathes
                            valuableElement = new TextBox();

                            if (commandElement == null)
                            {
                                //button control processing to controlling path
                                commandElement = new Button();
                                ProcessControl((Button)commandElement, relatedLabel, control.Description, ref startTabOrder);
                                ((Button)commandElement).Content = BROWSE_TEXT;
                                ((Button)commandElement).Tag = valuableElement;

                                if (control.Type == ControlType.FilePath)
                                    ((Button)commandElement).Click += new RoutedEventHandler(filePath_Click);
                                else
                                    ((Button)commandElement).Click += new RoutedEventHandler(folderPath_Click);
                            }

                            ((TextBox)valuableElement).TabIndex = startTabOrder++;
                        }

                        if (valuableElement.GetType() == typeof(TextBox))
                        {
                            if (!setInputValue && !getOutputValue)
                                //clear value
                                ((TextBox)valuableElement).Text = "";

                            if (values != null)
                            {
                                if (setInputValue)
                                    //set input value to valuable control
                                    ((TextBox)valuableElement).Text = (control.GetValue(values) == null) ? "" : control.GetValue(values).ToString();

                                if (getOutputValue)
                                    //get output value to valuable control
                                    control.SetValue(values, ((TextBox)valuableElement).Text);
                            }
                        }
                        break;
                    }
                case ControlType.Image:
                    {
                        if (valuableElement == null)
                        {
                            //image element processing
                            valuableElement = new Image();

                            if (commandElement == null)
                            {
                                //button control processing to controlling image path
                                commandElement = new Button();
                                ProcessControl((Button)commandElement, relatedLabel, control.Description, ref startTabOrder);
                                ((Button)commandElement).Content = BROWSE_TEXT;
                                ((Button)commandElement).Tag = valuableElement;
                                ((Button)commandElement).Click += new RoutedEventHandler(image_Click);
                            }
                        }

                        if (valuableElement.GetType() == typeof(Image))
                        {
                            if (!setInputValue && !getOutputValue)
                            {
                                //clear value
                                ((Image)valuableElement).Source = null;
                                ((Image)valuableElement).Tag = null;
                            }

                            if (values != null)
                            {
                                if (setInputValue)
                                {
                                    //set input value to valuable control
                                    ((Image)valuableElement).Tag = Convert.ToString(control.GetValue(values));

                                    if (control.GetValue(values) != null)
                                    {
                                        try
                                        {
                                            ((Image)valuableElement).Source = new BitmapImage(new Uri(Convert.ToString(control.GetValue(values))));
                                        }
                                        catch
                                        {
                                            ((Image)valuableElement).Source = null;
                                            
                                        }
                                    }
                                    else
                                        if (defaultImageSource == null || defaultImageSource == "")
                                            ((Image)valuableElement).Source = null;
                                        else
                                        {
                                            ((Image)valuableElement).Source = new BitmapImage(new Uri(defaultImageSource));
                                            ((Image)valuableElement).Tag = defaultImageSource;
                                        }
                                }

                                if (getOutputValue)
                                    //get output value to valuable control
                                    control.SetValue(values, ((Image)valuableElement).Tag);
                            }
                        }
                        break;
                    }
                case ControlType.MaskText:
                    {
                        if (valuableElement == null)
                        {
                            //textbox control creation
                            valuableElement = new PasswordBox();
                            ProcessControl((PasswordBox)valuableElement, relatedLabel, control.Description, ref startTabOrder);
                            if (control.HaveValidation)
                                ((PasswordBox)valuableElement).MaxLength = control.LengthValue;
                        }

                        if (valuableElement.GetType() == typeof(PasswordBox))
                        {
                            if (!setInputValue && !getOutputValue)
                                //clear value
                                ((PasswordBox)valuableElement).Password = "";


                            if (values != null)
                            {
                                if (setInputValue)
                                    //set input value to valuable control
                                    ((PasswordBox)valuableElement).Password = (control.GetValue(values) == null) ? "" : control.GetValue(values).ToString();

                                if (getOutputValue)
                                    //get output value to valuable control
                                    control.SetValue(values, ((PasswordBox)valuableElement).Password);
                            }
                        }
                        break;
                    }
                case ControlType.NumericSlider:
                    {
                        if (valuableElement == null)
                        {
                            //textblock element processing
                            if (commandElement == null)
                            {
                                commandElement = new TextBlock();
                                ((TextBlock)commandElement).Text = control.StartValue.ToString();
                            }

                            //slider control processing
                            valuableElement = new Slider();
                            ProcessControl((Slider)valuableElement, relatedLabel, control.Description, ref startTabOrder);
                            ((Slider)valuableElement).Minimum = control.StartValue;

                            if (control.LengthValue != 0)
                                ((Slider)valuableElement).Maximum = control.LengthValue;

                            if (commandElement.GetType() == typeof(TextBlock))
                            {
                                ((Slider)valuableElement).Tag = commandElement;
                                ((Slider)valuableElement).ValueChanged += new RoutedPropertyChangedEventHandler<double>(slider_ValueChanged);
                            }
                        }

                        if (valuableElement.GetType() == typeof(Slider))
                        {
                            if (!setInputValue && !getOutputValue)
                                //clear value
                                ((Slider)valuableElement).Value = control.StartValue;

                            if (values != null)
                            {
                                if (setInputValue)
                                    //set input value to valuable control
                                    ((Slider)valuableElement).Value = (control.GetValue(values) == null) ? 0 : Convert.ToDouble(control.GetValue(values));

                                if (getOutputValue)
                                {
                                    //get output value to valuable control
                                    Object value = control.GetValue(values);
                                    GetNumericVlaue(((Slider)valuableElement).Value.ToString(), ref value);
                                    control.SetValue(values, value);
                                }
                            }
                        }
                        break;
                    }
                case ControlType.NumericText:
                    {
                        if (valuableElement == null)
                        {
                            //textbox control creation
                            valuableElement = new TextBox();
                            ProcessControl((TextBox)valuableElement, relatedLabel, control.Description, ref startTabOrder);
                            if (control.HaveValidation)
                            {
                                ((TextBox)valuableElement).Tag = control;
                                ((TextBox)valuableElement).TextChanged += new TextChangedEventHandler(numericText_TextChanged);
                            }
                        }

                        if (valuableElement.GetType() == typeof(TextBox))
                        {
                            if (!setInputValue && !getOutputValue)
                                //clear value
                                ((TextBox)valuableElement).Text = "0";

                            if (values != null)
                            {
                                if (setInputValue)
                                    //set input value to valuable control
                                    ((TextBox)valuableElement).Text = (control.GetValue(values) == null) ? "0" : control.GetValue(values).ToString();

                                if (getOutputValue)
                                {
                                    //get output value to valuable control
                                    Object value = control.GetValue(values);
                                    GetNumericVlaue(((TextBox)valuableElement).Text, ref value);
                                    control.SetValue(values, value);
                                }
                            }
                        }
                        break;
                    }
                case ControlType.Text:
                    {
                        if (valuableElement == null)
                        {
                            //textbox control creation
                            valuableElement = new TextBox();
                            ProcessControl((TextBox)valuableElement, relatedLabel, control.Description, ref startTabOrder);
                            if (control.HaveValidation)
                                ((TextBox)valuableElement).MaxLength = control.LengthValue;
                        }

                        if (valuableElement.GetType() == typeof(TextBox))
                        {
                            if (!setInputValue && !getOutputValue)
                                //clear value
                                ((TextBox)valuableElement).Text = "";

                            if (values != null)
                            {
                                if (setInputValue)
                                    //set input value to valuable control
                                    ((TextBox)valuableElement).Text = (control.GetValue(values) == null) ? "" : control.GetValue(values).ToString();

                                if (getOutputValue)
                                    //get output value to valuable control
                                    control.SetValue(values, ((TextBox)valuableElement).Text);
                            }
                        }
                        break;
                    }
            }
            //postcondition : if element is null , create new element , and if input value not null , set to element value , and output value not null , exhite element value to output value
            //return : if control is valid , return element , else return null
        }

        //private events
        private void filePath_Click(Object sender, RoutedEventArgs e)
        {
            //precondition : sender is button and have textbox element in tag member
            System.Windows.Forms.OpenFileDialog ofd = new System.Windows.Forms.OpenFileDialog();
            ofd.Filter = fileExtensions;

            if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                ((TextBox)((Button)sender).Tag).Text = ofd.FileName;
            //postcondition : valuable element have file path from dialog
        }

        private void folderPath_Click(Object sender, RoutedEventArgs e)
        {
            //precondition : sender is button and have textbox element in tag member
            System.Windows.Forms.FolderBrowserDialog fbd = new System.Windows.Forms.FolderBrowserDialog();

            if (fbd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                ((TextBox)((Button)sender).Tag).Text = fbd.SelectedPath;
            //postcondition : valuable element have directory path from dialog

        }

        private void color_Click(Object sender, RoutedEventArgs e)
        {
            //precondition : sender is button and have rectangle element in tag member
            System.Windows.Forms.ColorDialog cd = new System.Windows.Forms.ColorDialog();

            if (cd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                ((Rectangle)((Button)sender).Tag).Fill = new SolidColorBrush(Color.FromRgb(cd.Color.R, cd.Color.G, cd.Color.B));
            //postcondition : valuable element have the color of selected from dialog
        }

        private void image_Click(Object sender, RoutedEventArgs e)
        {
            //precondition : sender is button and have image element in tag member
            System.Windows.Forms.OpenFileDialog ofd = new System.Windows.Forms.OpenFileDialog();
            ofd.Filter = IMAGE_FILE_EXTENSIONS;

            if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                ((Image)((Button)sender).Tag).Source = new BitmapImage(new Uri(ofd.FileName));
                ((Image)((Button)sender).Tag).Tag = ofd.FileName;
            }
            //postcondition : valuable element have file path from dialog
        }

        private void numericText_TextChanged(Object sender, TextChangedEventArgs e)
        {
            //precondition : sender type is TextBox control and have informationControl value in Tag member
            Object result = null;

            if (((TextBox)sender).Tag != null)
                if (GetNumericVlaue(((TextBox)sender).Text, ref result))
                {
                    ((TextBox)sender).Foreground = foreground;
                    ((TextBox)sender).Background = background;
                }
                else
                {
                    ((TextBox)sender).Foreground = warningForeground;
                    ((TextBox)sender).Background = warningBackground;
                }
            //postcondition : if value of textbox is numeric , set property to value ,and controlling of color to sender textbox
        }

        private void slider_ValueChanged(Object sender, RoutedPropertyChangedEventArgs<Double> e)
        {
            //precondition : sender type is slider control and have textBlock in tag property
            ((TextBlock)((Slider)sender).Tag).Text = Convert.ToString(e.NewValue);
            //postcondition : textBlock have the value of slider
        }

        //private fields region
        private IInformation values;
        private String fileExtensions;
        private String defaultImageSource;
        private Brush warningBackground;
        private Brush warningForeground;
        private Brush background;
        private Brush foreground;
        private Thickness padding;
        private HorizontalAlignment horizontalContentAlignment;
        private VerticalAlignment verticalContentAlignment;
        private ControlRelation[] controlRelations;

        //private constants
        private const Int32 TITLES_REGION_WIDTH = 1;
        private const Int32 TEXTS_REGION_WIDTH = 3;
        private const Int32 COMMANDS_REGION_WIDTH = 1;
        private const Char UNDERSCORE = '_';
        private const String CHECKBOXS_TEXT = "Select";
        private const String BROWSE_TEXT = "...";
        private const String IMAGE_FILE_EXTENSIONS = "(*.jpg),(*.gif),(*.png),(*.bmp)|*.jpg;*.gif;*.png;*.bmp";
        private const String DELETE_TEXT = "Delete";
        private const String UPDATE_TEXT = "Update";
        private const String EDIT_TEXT = "Edit";
        private const String DELETE_TOOLTIP = "delete from database";
        private const String EDIT_TOOLTIP = "update in database";
    }

    public class InformationInput : Information
    {
        public InformationInput(IInformation itemStructure, ref Int32 startTabOrder, ref StringBuilder invalidShorcutsLitters)
            : base(itemStructure, ref startTabOrder, ref invalidShorcutsLitters)
        {
            //buttons defention
            button1 = new Button();
            button1.Content = GetShorcutsTitle(BUTTON1_TEXT, ref invalidShorcutsLitters);
            button1.ToolTip = BUTTON1_TOOLTIP;
            button1.TabIndex = startTabOrder++;

            button2 = new Button();
            button2.Content = GetShorcutsTitle(BUTTON2_TEXT, ref invalidShorcutsLitters);
            button2.ToolTip = BUTTON2_TOOLTIP;
            button2.TabIndex = startTabOrder++;

            button1.Visibility = button2.Visibility = System.Windows.Visibility.Collapsed;

            //add button to grid
            Grid commandGrid = new Grid();
            commandGrid.ColumnDefinitions.Add(new ColumnDefinition());
            commandGrid.ColumnDefinitions.Add(new ColumnDefinition());

            Grid.SetColumn(button1, 0);
            commandGrid.Children.Add(button1);

            Grid.SetColumn(button2, 1);
            commandGrid.Children.Add(button2);

            RowDefinition row = new RowDefinition();
            row.Height = new GridLength(1, GridUnitType.Auto);

            ((Grid)this.Content).RowDefinitions.Add(row);

            Grid.SetRow(commandGrid, ((Grid)this.Content).RowDefinitions.Count - 1);
            Grid.SetColumnSpan(commandGrid, 3);
            ((Grid)this.Content).Children.Add(commandGrid);
        }

        //public properties regoin
        public Button Button1
        {
            get
            {
                return button1;
            }
            set
            {
                button1 = value;
            }
        }

        public Button Button2
        {
            get
            {
                return button2;
            }
            set
            {
                button2 = value;
            }
        }

        //private fields region
        private Button button1;
        private Button button2;

        //private constants
        private String BUTTON1_TEXT = "button1";
        private String BUTTON1_TOOLTIP = "button 1 toolTip";
        private String BUTTON2_TEXT = "button2";
        private String BUTTON2_TOOLTIP = "button 2 toolTip";
    }

    public class InformationOutput : Information
    {
        public InformationOutput(IInformation itemStructure, ref Int32 startTabOrder, ref StringBuilder invalidShorcutsLitters)
            : base(itemStructure, ref startTabOrder, ref invalidShorcutsLitters)
        {
            //button defentions
            buttonUpdate = new Button();
            buttonUpdate.Content = GetShorcutsTitle(UPDATE_TEXT, ref invalidShorcutsLitters);
            buttonUpdate.ToolTip = UPDATE_TOOLTIP;
            buttonUpdate.TabIndex = startTabOrder++;

            //add button to grid
            RowDefinition row = new RowDefinition();
            row.Height = new GridLength(1, GridUnitType.Auto);

            ((Grid)this.Content).RowDefinitions.Add(row);

            Grid.SetRow(buttonUpdate, ((Grid)this.Content).RowDefinitions.Count - 1);
            Grid.SetColumnSpan(buttonUpdate, 3);
            ((Grid)this.Content).Children.Add(buttonUpdate);

            //make controls readonly
            for (Int32 i = 0; i < itemStructure.InformationControls.Count; i++)
            {
                if (CheckSystem.CheckValidity(itemStructure.InformationControls[i]))
                {
                    if (GetValuableControlElements(itemStructure.InformationControls[i]).GetType() == typeof(TextBox))
                        ((TextBox)GetValuableControlElements(itemStructure.InformationControls[i])).IsReadOnly = true;
                    else
                        if (GetValuableControlElements(itemStructure.InformationControls[i]) is Control)
                            ((Control)GetValuableControlElements(itemStructure.InformationControls[i])).IsEnabled = false;

                    if (GetCommandControlElements(itemStructure.InformationControls[i]) is Control)
                        ((Control)GetCommandControlElements(itemStructure.InformationControls[i])).IsEnabled = false;
                }
            }
        }

        //public properties regoin
        public Button ButtonUpdate
        {
            get
            {
                return buttonUpdate;
            }
            set
            {
                buttonUpdate = value;
            }
        }

        //private fields region
        private Button buttonUpdate;

        //private constants
        private const String UPDATE_TEXT = "Update";
        private const String UPDATE_TOOLTIP = "update information";
    }
}
