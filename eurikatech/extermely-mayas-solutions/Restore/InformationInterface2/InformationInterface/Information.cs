using Microsoft.Win32;
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
    }

    public class Information
    {
        //constructure
        static Information()
        {
            rowHeight = 50;
            margin = new Thickness(2);
            warningForeground = new SolidColorBrush(Colors.Red);
        }

        //basic functions region
        public static void ToInput(IInformation item, out Button addButtonReference, out Button clearButtonReference)
        {
   
            //precondition : none
            ToInterface(item, false, false);

            Button addButton = new Button();
            Button clearButton = new Button();

            addButton.IsEnabled = clearButton.IsEnabled = false;
            FrameworkElement[] elements = new FrameworkElement[ControlLines(item)];

            processElement(addButton, ADD_TEXT, ADD_TOOLTIP);
            processElement(clearButton, CLEAR_TEXT, CLEAR_TOOLTIP);

            Grid commandGrid = new Grid();
            AddCommandGrid(new Button[] { addButton, clearButton }, ControlLines(item));

            addButtonReference = addButton;
            clearButtonReference = clearButton;
            //postcondition : build interface controls to selected item
        }

        public static void ToOutput(IInformation item)
        {
            //precondition : none
            ToInterface(item, true, true);

            Button updateButton = new Button();
            updateButton.IsEnabled = false;

            processElement(updateButton, UPDATE_TEXT, UPDATE_TOOLTIP);

            Grid commandGrid = new Grid();
            AddCommandGrid(new Button[] { updateButton }, ControlLines(item));
            //postcondition : build interface controls to selected item and show values
        }

        public static void ToList(IInformation[] items)
        {
            //show list depinding on ToList general function
            ToList(items, false, 0, 0);
        }

        public static void ToList(IInformation[] items, Boolean showImages,Double width,Double height)
        {
            //precondition : none
            ListBox listBox = new ListBox();
            parentControl.Content = listBox;

            if (items != null && listBox != null)
            {
                Boolean imageIndexFound = false;
                Int32 imageIndex = -1;

                for (Int32 i = 0; i < items.Length; i++)
                    if (InformationControlCollection.CheckValidity(items[i]))
                    {
                        //find image control index
                        if (showImages && !imageIndexFound)
                            for (Int32 j = 0; j < items[i].InformationControls.Count; j++)
                                if (items[i].InformationControls[j].Type == ControlType.Image)
                                {
                                    imageIndexFound = true;
                                    imageIndex = j;
                                    break;
                                }

                        if (showImages && imageIndexFound)
                        {
                            StackPanel stackPanel = new StackPanel();
                            TextBlock text = new TextBlock();
                            Image img = new Image();

                            stackPanel.Orientation = Orientation.Horizontal;

                            text.Text = items[i].ToString();
                            text.VerticalAlignment = VerticalAlignment.Center;
                            img.Width = width;
                            img.Height = height;
                            img.VerticalAlignment = VerticalAlignment.Center;
                            img.Margin = margin;

                            if (items[i].InformationControls[imageIndex].Value != null)
                                img.Source = new BitmapImage(new Uri(items[i].InformationControls[imageIndex].Value.ToString()));

                            stackPanel.Children.Add(img);
                            stackPanel.Children.Add(text);
                            listBox.Items.Add(stackPanel);
                        }
                        else
                            listBox.Items.Add(items[i]);
                    }
            }
            //postcondition : listBox filled with the list of items
        }

        public static void ToGrid(IInformation[] items, DataGrid dataGrid)
        {
            //precondition : none
            if (items != null && dataGrid != null)
            {
                Boolean haveColumns = false;

                for (Int32 i = 0; i < items.Length; i++)
                    if (InformationControlCollection.CheckValidity(items[i]))
                    {
                        if (!haveColumns)
                        {
                            for (Int32 j = 0; j < items[i].InformationControls.Count; j++)
                            {
                                DataGridColumn column = new DataGridTextColumn();
                                ((DataGridTextColumn)column).Header = items[i].InformationControls[j].Name;

                                dataGrid.Columns.Add(column);
                            }
                            haveColumns = true;
                        }
                    }
            }
            //postcondition : listBox filled with the list of items
        }

        public static void ToCards(IInformation[] items)
        {
        }

        public static void ToEdit()
        {
        }

        //public properties region
        public static ContentControl ParentControl
        {
            get
            {
                return parentControl;
            }
            set
            {
                parentControl = value;
            }
        }

        public static Thickness Margin
        {
            get
            {
                return margin;
            }
            set
            {
                margin = value;
            }
        }

        public static String FileExtentions
        {
            get
            {
                return fileExtentions;
            }
            set
            {
                fileExtentions = value;
            }
        }

        public static Brush Background
        {
            get
            {
                return background;
            }
            set
            {
                background = value;
            }
        }

        public static Brush Foreground
        {
            get
            {
                return foreground;
            }
            set
            {
                foreground = value;
            }
        }

        public static Double RowHeight
        {
            get
            {
                return rowHeight;
            }
            set
            {
                rowHeight = value;
            }
        }

        public static Grid MainGrid
        {
            get
            {
                return mainGrid;
            }
            set
            {
                mainGrid = value;
            }
        }

        //private function region
        private static void processElement(Button button, String text, String tooptip)
        {
            button.Content = text;
            button.ToolTip = tooptip;
            button.IsEnabled = true;
            button.Margin = margin;

            button.Background = background;
            button.Foreground = foreground;
        }

        private static void processElement(TextBlock textBlock, InformationControl control)
        {
            //precondition : none
            if (textBlock != null && InformationControl.CheckValidity(control))
            {
                textBlock.ToolTip = control.Description;
                textBlock.Margin = margin;
                textBlock.Text = control.Name;
                textBlock.Tag = control;
                textBlock.Foreground = foreground;
            }
            //post condition : textBlock have the required properties from control object
        }

        private static void processElement(TextBox textBox, InformationControl control, Boolean showValues, Boolean readOnly)
        {
            //precondition : none
            if (textBox != null && InformationControl.CheckValidity(control))
            {
                textBox.ToolTip = control.Description;
                textBox.Margin = margin;
                textBox.IsReadOnly = readOnly;

                //show values in textBox
                if (showValues)
                    //output control
                    textBox.Text = Convert.ToString(control.Value);
                else
                    textBox.Clear();

                //validation type : numeric input checker of string length limitation
                if (control.HaveValidation)
                    if (control.Type == ControlType.NumericText && !readOnly)
                    {
                        textBox.Tag = control;
                        textBox.TextChanged += new TextChangedEventHandler(numericText_TextChanged);
                    }
                    else
                        textBox.MaxLength = control.LengthValue;

                //coloring background and foreground
                textBox.Foreground = foreground;
                textBox.Background = background;

                //control for write , add event
                if (!readOnly)
                {
                    //input control
                    textBox.Tag = control;
                    textBox.TextChanged += new TextChangedEventHandler(textBox_TextChanged);
                }

            }
            //post condition : textBox have the required properties from control object
        }

        private static void processElement(PasswordBox pwdBox, InformationControl control, Boolean showValues, Boolean readOnly)
        {
            //precondition : none
            if (pwdBox != null && InformationControl.CheckValidity(control))
            {
                pwdBox.ToolTip = control.Description;
                pwdBox.Margin = margin;
                pwdBox.IsEnabled = !readOnly;

                if (control.HaveValidation)
                    pwdBox.MaxLength = control.LengthValue;

                //coloring background and foreground
                pwdBox.Foreground = foreground;
                pwdBox.Background = background;


                //show values in passwordBox
                if (showValues)
                    //output control
                    pwdBox.Password = Convert.ToString(control.Value);
                else
                    pwdBox.Clear();

                //control for write , add event
                if (!readOnly)
                {
                    pwdBox.Tag = control;
                    pwdBox.PasswordChanged += new RoutedEventHandler(PasswordBox_PasswordChanged);
                }

            }
            //post condition : passwordbox have the required properties from control object
        }

        private static void processElement(Button button, InformationControl control, Boolean showValues, Boolean readOnly, FrameworkElement relatedControl)
        {
            //precondition : related control have information control in tag member
            if (button != null && InformationControl.CheckValidity(control))
            {
                button.ToolTip = control.Description;
                button.Margin = margin;
                button.Content = BROWSE_TEXT;
                button.IsEnabled = !readOnly;

                //coloring background and foreground
                button.Foreground = foreground;
                button.Background = background;

                //control for write , add event
                if (!readOnly)
                {
                    button.Tag = relatedControl;
                    button.Click += new RoutedEventHandler(button_Click);
                }
            }
            //post condition : button have the required properties from control object
        }

        private static void processElement(Image image, InformationControl control, Boolean showValues)
        {
            //precondition : item must be valid
            if (image != null && InformationControl.CheckValidity(control))
            {
                image.ToolTip = control.Description;
                image.Stretch = Stretch.Fill;
                image.Height = image.Width; ;
                image.Margin = margin;
                image.Tag = control;

                if (showValues)
                    if (control.Value != null)
                        image.Source = new BitmapImage(new Uri(control.Value.ToString()));
            }
            //post condition : image have the required properties from control object
        }

        private static void processElement(CheckBox chkBox, InformationControl control, Boolean showValues, Boolean readOnly)
        {
            //precondition : item must be valid
            if (chkBox != null && InformationControl.CheckValidity(control))
            {
                chkBox.ToolTip = control.Description;
                chkBox.Content = CHECKBOXS_TEXT;
                chkBox.Margin = margin;
                chkBox.IsEnabled = !readOnly;

                //coloring foreground
                chkBox.Foreground = foreground;

                //show value in checkBox
                if (showValues)
                    chkBox.IsChecked = Convert.ToBoolean(control.Value);
                else
                    chkBox.IsChecked = null;

                //control for write , add event
                if (!readOnly)
                {
                    chkBox.Tag = control;
                    chkBox.Click += new RoutedEventHandler(checkBox_Click);
                }
            }
            //post condition : checkbox have the required properties from control object
        }

        private static void processElement(Slider slider, InformationControl control, Boolean showValues, Boolean readOnly, FrameworkElement relatedControl)
        {
            //precondition : none
            if (slider != null && InformationControl.CheckValidity(control))
            {
                slider.ToolTip = control.Description;
                slider.Minimum = control.StartValue;
                slider.IsEnabled = !readOnly;

                if (control.LengthValue != 0)
                    slider.Maximum = control.LengthValue;

                slider.Margin = margin;

                //show value in slider
                if (showValues)
                    slider.Value = Convert.ToDouble(control.Value);
                else
                    slider.Value = slider.Minimum;

                //control for write , add event
                if (!readOnly)
                {
                    slider.Tag = relatedControl;
                    slider.ValueChanged += new RoutedPropertyChangedEventHandler<double>(slider_ValueChanged);
                }

            }
            //post condition : slider have the required properties from control object
        }

        private static void processElement(DatePicker datePicker, InformationControl control, Boolean showValues, Boolean readOnly)
        {
            //precondition : none
            if (datePicker != null && InformationControl.CheckValidity(control))
            {
                datePicker.ToolTip = control.Description;
                datePicker.Margin = margin;
                datePicker.IsEnabled = !readOnly;

                //datetime limitation
                if (control.StartValue != 0)
                    datePicker.DisplayDateStart = new DateTime(control.StartValue, 1, 1);

                if (control.LengthValue != 0)
                    datePicker.DisplayDateEnd = new DateTime(control.LengthValue, 1, 1);

                //show value in slider
                if (showValues)
                    datePicker.SelectedDate = Convert.ToDateTime(control.Value);
                else
                    datePicker.SelectedDate = System.DateTime.Now;

                //control for write , add event
                if (!readOnly)
                {
                    datePicker.Tag = control;
                    datePicker.SelectedDateChanged += new EventHandler<SelectionChangedEventArgs>(datePicker_SelectedDateChanged);
                }
            }
            //post condition : slider have the required properties from control object
        }

        private static void AddCommandGrid(Button[] buttons, Int32 numberOfRows)
        {
            //precondition : mainGrid is not null
            Grid commandGrid = new Grid();

            commandGrid.RowDefinitions.Add(new RowDefinition());

            AddToGrid(commandGrid, 0, numberOfRows, 3);

            for (Int32 i = 0; i < buttons.Length; i++)
            {
                commandGrid.ColumnDefinitions.Add(new ColumnDefinition());
                Grid.SetColumn(buttons[i], i);
                Grid.SetRow(buttons[i], 0);
                commandGrid.Children.Add(buttons[i]);
            }
            //postcondition : mainGrid have new row is command buttons
        }

        private static void AddToGrid(UIElement control, Int32 column, Int32 row)
        {
            if (mainGrid != null)
            {
                Grid.SetColumn(control, column);
                Grid.SetRow(control, row);
                mainGrid.Children.Add(control);
            }
        }

        private static void AddToGrid(UIElement control, Int32 column, Int32 row, Int32 columnSpan)
        {
            if (mainGrid != null)
            {
                Grid.SetColumnSpan(control, columnSpan);
                AddToGrid(control, column, row);
            }
        }

        private static Int32 ControlLines(IInformation item)
        {
            //precondition : none
            if (InformationControlCollection.CheckValidity(item))
            {
                Int32 result = 0;
                for (Int32 i = 0; i < item.InformationControls.Count; i++)
                    if (InformationControl.CheckValidity(item.InformationControls[i]))
                        result++;

                return ++result;
            }
            else
                return 0;
            //return : number of line to the control to build rows grid
        }

        private static void ToInterface(IInformation item, Boolean showValues, Boolean readOnly)
        {
            //precondition : parent control have valid value
            if (InformationControlCollection.CheckValidity(item))
            {
                //build main grid
                mainGrid = new Grid();
                //define columns
                ColumnDefinition columnTitles = new ColumnDefinition();
                ColumnDefinition columnTexts = new ColumnDefinition();
                ColumnDefinition columnCommands = new ColumnDefinition();
                columnTitles.Width = new GridLength(TITLES_REGION_WIDTH, GridUnitType.Star);
                columnTexts.Width = new GridLength(TEXTS_REGION_WIDTH, GridUnitType.Star);
                columnCommands.Width = new GridLength(COMMANDS_REGION_WIDTH, GridUnitType.Star);

                //define rows
                mainGrid.ColumnDefinitions.Add(columnTitles);
                mainGrid.ColumnDefinitions.Add(columnTexts);
                mainGrid.ColumnDefinitions.Add(columnCommands);

                //valuable control reference
                FrameworkElement[] elements = new FrameworkElement[ControlLines(item)];

                for (Int32 i = 0; i < ControlLines(item); i++)
                {
                    RowDefinition row = new RowDefinition();
                    row.Height = new GridLength(1, GridUnitType.Auto);
                    mainGrid.RowDefinitions.Add(row);
                }

                //define controls
                for (Int32 i = 0; i < item.InformationControls.Count; i++)
                    if (InformationControl.CheckValidity(item.InformationControls[i]))
                    {
                        //add control depending on type of interfaceControl

                        //add text title to first column
                        TextBlock txTitle = new TextBlock();
                        processElement(txTitle, item.InformationControls[i]);
                        AddToGrid(txTitle, 0, i);

                        switch (item.InformationControls[i].Type)
                        {
                            case ControlType.Text:
                            case ControlType.NumericText:
                                {
                                    //string control processing
                                    TextBox txInfo = new TextBox();
                                    processElement(txInfo, item.InformationControls[i], showValues, readOnly);
                                    AddToGrid(txInfo, 1, i, 2);
                                    elements[i] = txInfo;
                                }
                                break;
                            case ControlType.MaskText:
                                {
                                    //mask string control processing
                                    PasswordBox pbText = new PasswordBox();
                                    processElement(pbText, item.InformationControls[i], showValues, readOnly);
                                    AddToGrid(pbText, 1, i, 2);
                                    elements[i] = pbText;
                                }
                                break;
                            case ControlType.NumericSlider:
                                {
                                    //textblock processing
                                    TextBlock txValue = new TextBlock();
                                    processElement(txValue, item.InformationControls[i]);
                                    AddToGrid(txValue, 2, i);

                                    //color control processing
                                    Slider slider = new Slider();
                                    processElement(slider, item.InformationControls[i], showValues, readOnly, txValue);
                                    AddToGrid(slider, 1, i);
                                    elements[i] = slider;
                                }
                                break;
                            case ControlType.Boolean:
                                {
                                    //boolean control processing
                                    CheckBox chk = new CheckBox();
                                    processElement(chk, item.InformationControls[i], showValues, readOnly);
                                    AddToGrid(chk, 1, i, 2);
                                    elements[i] = chk;
                                }
                                break;
                            case ControlType.FilePath:
                            case ControlType.FolderPath:
                                {
                                    //filePath control processing
                                    TextBox txPath = new TextBox();
                                    processElement(txPath, item.InformationControls[i], showValues, readOnly);
                                    AddToGrid(txPath, 1, i);
                                    elements[i] = txPath;

                                    Button btnBrowse = new Button();
                                    processElement(btnBrowse, item.InformationControls[i], showValues, readOnly, txPath);
                                    AddToGrid(btnBrowse, 2, i);
                                }
                                break;
                            case ControlType.Image:
                                {
                                    //image control processing
                                    Image img = new Image();
                                    AddToGrid(img, 1, i);
                                    processElement(img, item.InformationControls[i], showValues);
                                    elements[i] = img;

                                    Button btnBrowse = new Button();
                                    processElement(btnBrowse, item.InformationControls[i], showValues, readOnly, img);
                                    AddToGrid(btnBrowse, 2, i);
                                }
                                break;
                            case ControlType.DateTime:
                                {
                                    //DatePicker Control processing
                                    DatePicker datePicker = new DatePicker();
                                    processElement(datePicker, item.InformationControls[i], showValues, readOnly);
                                    AddToGrid(datePicker, 1, i, 2);
                                }
                                break;
                        }
                    }
                parentControl.Content = mainGrid;
            }
            //post condition : build interface to the item class
            //return value : operation done and no error , return true else return false
        }

        //private events for controls
        private static void numericText_TextChanged(Object sender, TextChangedEventArgs e)
        {
            //precondition : sender type is TextBox control and have informationControl value in Tag member
            if (((InformationControl)(((TextBox)sender).Tag)).Value != null)
            {
                //byte type processing
                if (((InformationControl)(((TextBox)sender).Tag)).Value.GetType() == typeof(Byte))
                {
                    Byte result;
                    if (Byte.TryParse(((TextBox)sender).Text, out result))
                    {
                        ((InformationControl)(((TextBox)sender).Tag)).Value = result;
                        ((TextBox)sender).Foreground = foreground;
                        return;
                    }
                }

                //Int16 type processing
                if (((InformationControl)(((TextBox)sender).Tag)).Value.GetType() == typeof(Int16))
                {
                    Int16 result;
                    if (Int16.TryParse(((TextBox)sender).Text, out result))
                    {
                        ((InformationControl)(((TextBox)sender).Tag)).Value = result;
                        ((TextBox)sender).Foreground = foreground;
                        return;
                    }
                }

                //Int32 type processing
                if (((InformationControl)(((TextBox)sender).Tag)).Value.GetType() == typeof(Int32))
                {
                    Int32 result;
                    if (Int32.TryParse(((TextBox)sender).Text, out result))
                    {
                        ((InformationControl)(((TextBox)sender).Tag)).Value = result;
                        ((TextBox)sender).Foreground = foreground;
                        return;
                    }
                }

                //Int64 type processing
                if (((InformationControl)(((TextBox)sender).Tag)).Value.GetType() == typeof(Int64))
                {
                    Int64 result;
                    if (Int64.TryParse(((TextBox)sender).Text, out result))
                    {
                        ((InformationControl)(((TextBox)sender).Tag)).Value = result;
                        ((TextBox)sender).Foreground = foreground;
                        return;
                    }
                }

                //Single type processing
                if (((InformationControl)(((TextBox)sender).Tag)).Value.GetType() == typeof(Single))
                {
                    Single result;
                    if (Single.TryParse(((TextBox)sender).Text, out result))
                    {
                        ((InformationControl)(((TextBox)sender).Tag)).Value = result;
                        ((TextBox)sender).Foreground = foreground;
                        return;
                    }
                }

                //Double type processing
                if (((InformationControl)(((TextBox)sender).Tag)).Value.GetType() == typeof(Double))
                {
                    Double result;
                    if (Double.TryParse(((TextBox)sender).Text, out result))
                    {
                        ((InformationControl)(((TextBox)sender).Tag)).Value = result;
                        ((TextBox)sender).Foreground = foreground;
                        return;
                    }
                }

                //Decimal type processing
                if (((InformationControl)(((TextBox)sender).Tag)).Value.GetType() == typeof(Decimal))
                {
                    Decimal result;
                    if (Decimal.TryParse(((TextBox)sender).Text, out result))
                    {
                        ((InformationControl)(((TextBox)sender).Tag)).Value = result;
                        ((TextBox)sender).Foreground = foreground;
                        return;
                    }
                }

                ((InformationControl)(((TextBox)sender).Tag)).Value = 0;
            }


            ((TextBox)sender).Foreground = warningForeground;
            //postcondition : if value of textbox is numeric , set property to value ,and controlling of color to sender textbox
        }

        private static void textBox_TextChanged(Object sender, TextChangedEventArgs e)
        {
            //precondition : sender type is TextBox control and have informationControl value in Tag member

            //numberic input was validation it numericText
            if (((InformationControl)(((TextBox)sender).Tag)).Type != ControlType.NumericText)
                ((InformationControl)(((TextBox)sender).Tag)).Value = ((TextBox)sender).Text;

            //postcondition : value of sender textbox store in related property
        }

        private static void PasswordBox_PasswordChanged(Object sender, RoutedEventArgs e)
        {
            //precondition : sender type is PasswordBox control and have informationControl value in Tag member
            //numberic input was validation it numericText
            ((InformationControl)(((PasswordBox)sender).Tag)).Value = ((PasswordBox)sender).Password;

            //postcondition : value of sender PasswordBox store in related property
        }

        private static void button_Click(Object sender, RoutedEventArgs e)
        {
            //precondition : sender type is button and have UIElement value in Tag member
            if (((Button)sender).Tag != null)
            {
                FrameworkElement relatedControl = (FrameworkElement)((Button)sender).Tag;
                if (relatedControl.Tag != null)
                {
                    InformationControl ctrl = (InformationControl)relatedControl.Tag;

                    switch (ctrl.Type)
                    {
                        case ControlType.FilePath:
                            {
                                OpenFileDialog ofd = new OpenFileDialog();
                                ofd.Multiselect = false;
                                ofd.Filter = fileExtentions;
                                ofd.CheckFileExists = ctrl.HaveValidation;

                                if (ofd.ShowDialog() == true)
                                    if (relatedControl.GetType() == typeof(TextBox))
                                        ((TextBox)relatedControl).Text = ofd.FileName;
                                break;
                            }
                        case ControlType.FolderPath:
                            {
                                OpenFileDialog ofd = new OpenFileDialog();
                                ofd.Multiselect = false;
                                ofd.Filter = "";
                                ofd.CheckPathExists = ctrl.HaveValidation;

                                if (ofd.ShowDialog() == true)
                                    if (relatedControl.GetType() == typeof(TextBox))
                                        ((TextBox)relatedControl).Text = ofd.FileName;
                                break;
                            }
                        case ControlType.Image:
                            {
                                OpenFileDialog ofd = new OpenFileDialog();
                                ofd.Multiselect = false;
                                ofd.Filter = "All image file (*.png,*.jpg,*.bmp,*.gif)|*.png;*.jpg;*.bmp;*.gif";
                                ofd.CheckFileExists = ctrl.HaveValidation;

                                if (ofd.ShowDialog() == true)
                                    if (relatedControl.GetType() == typeof(Image))
                                    {
                                        ((Image)relatedControl).Source = new BitmapImage(new Uri(ofd.FileName));
                                        ((InformationControl)((Image)relatedControl).Tag).Value = ofd.FileName;
                                    }
                                break;
                            }
                    }
                }
            }
            //postcondition : button effect in related control by the type of informationControl
        }

        private static void checkBox_Click(Object sender, RoutedEventArgs e)
        {
            //precondition : sender type is checkBox and have control value in Tag member
            ((InformationControl)(((CheckBox)sender).Tag)).Value = Convert.ToBoolean(((CheckBox)sender).IsChecked);
            //postcondition : value of sender checkBox store in related property
        }

        private static void slider_ValueChanged(Object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            //precondition : sender type is Slider and have relatedControl value in Tag member
            Int32 value = Convert.ToInt32(e.NewValue);

            if (((Slider)sender).Tag != null)
            {
                FrameworkElement relatedControl = (FrameworkElement)((Slider)sender).Tag;
                if (relatedControl.Tag != null)
                {
                    InformationControl ctrl = (InformationControl)relatedControl.Tag;
                    ((TextBlock)relatedControl).Text = Convert.ToInt32(e.NewValue).ToString();

                    if (ctrl.Value != null)
                    {
                        //Byte value testing
                        if (ctrl.Value.GetType() == typeof(Byte))
                        {
                            Byte result;
                            if (Byte.TryParse(value.ToString(), out result))
                            {
                                ctrl.Value = result;
                                ((Slider)sender).Background = null;
                                return;
                            }
                        }

                        //Int16 value testing
                        if (ctrl.Value.GetType() == typeof(Int16))
                        {
                            Int16 result;
                            if (Int16.TryParse(value.ToString(), out result))
                            {
                                ctrl.Value = result;
                                ((Slider)sender).Background = null;
                                return;
                            }
                        }

                        //Int32 value testing
                        if (ctrl.Value.GetType() == typeof(Int32))
                        {
                            Int32 result;
                            if (Int32.TryParse(value.ToString(), out result))
                            {
                                ctrl.Value = result;
                                ((Slider)sender).Background = null;
                                return;
                            }
                        }

                        //other values testing
                        if (ctrl.Value.GetType() == typeof(Int64) || ctrl.Value.GetType() == typeof(Single) || ctrl.Value.GetType() == typeof(Double) || ctrl.Value.GetType() == typeof(Decimal))
                        {
                            ctrl.Value = value;
                            ((Slider)sender).Background = null;
                            return;
                        }
                    }
                }
            }
            ((Slider)sender).Background = warningForeground;
            //postcondition : value of sender checkBox store in related property
        }

        private static void datePicker_SelectedDateChanged(Object sender, SelectionChangedEventArgs e)
        {
            //precondition : sender type is DatePicker and have control value in Tag member
            ((InformationControl)(((DatePicker)sender).Tag)).Value = ((DatePicker)sender).SelectedDate;
            //postcondition : value of sender checkBox store in related property
        }

        /*
        private static void clearButton_Click(Object sender, RoutedEventArgs e)
        {
            //precondition : none
            
            if (elements != null)
                for (Int32 i = 0; i < elements.Length; i++)
                    if (elements[i] != null)
                    {
                        if (elements[i].GetType() == typeof(TextBox))
                            ((TextBox)elements[i]).Clear();
                        else
                            if (elements[i].GetType() == typeof(PasswordBox))
                                ((PasswordBox)elements[i]).Clear();
                            else
                                if (elements[i].GetType() == typeof(Image))
                                    ((Image)elements[i]).Source = null;
                                else
                                    if (elements[i].GetType() == typeof(Slider))
                                        ((Slider)elements[i]).Value = ((Slider)elements[i]).Minimum;
                                    else
                                        if (elements[i].GetType() == typeof(DatePicker))
                                            ((DatePicker)elements[i]).SelectedDate = null;
                                        else
                                            if (elements[i].GetType() == typeof(CheckBox))
                                                ((CheckBox)elements[i]).IsChecked = null;
                    }
            //postcondition : all valuable controls have empty value
        }
        */

        //private property region
        private static ContentControl parentControl;
        private static Thickness margin;
        private static String fileExtentions;
        private static Brush background;
        private static Brush foreground;
        private static Brush warningForeground;
        private static Double rowHeight;
        private static Grid mainGrid;

        //private constants
        private const Int32 TITLES_REGION_WIDTH = 1;
        private const Int32 TEXTS_REGION_WIDTH = 3;
        private const Int32 COMMANDS_REGION_WIDTH = 1;
        private const String CHECKBOXS_TEXT = "Select";
        private const String BROWSE_TEXT = "...";
        private const String ADD_TEXT = "Add";
        private const String DELETE_TEXT = "Delete";
        private const String UPDATE_TEXT = "Update";
        private const String CLEAR_TEXT = "Clear";
        private const String EDIT_TEXT = "Edit";
        private const String ADD_TOOLTIP = "add this class to database";
        private const String DELETE_TOOLTIP = "delete from database";
        private const String UPDATE_TOOLTIP = "update information";
        private const String CLEAR_TOOLTIP = "clear all froms";
        private const String EDIT_TOOLTIP = "update in database";
    }
}
