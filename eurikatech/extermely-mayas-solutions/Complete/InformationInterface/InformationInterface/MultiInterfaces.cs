using System;
using System.Text;
using System.Windows;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using System.Windows.Media.Animation;

namespace Maniyat
{
    public class Card : ContentControl
    {
        //public constructures region
        public Card(IInformation informationItem, ItemStyle cardStyle)
        {
            item = informationItem;

            //default properties
            trueWord = "True!";
            falseWord = "False!!";

            //draw card schematic
            if (CheckSystem.CheckValidity(informationItem))
            {
                //InformationControl in value is valid

                //building empty card
                Border cardBorder = new Border();
                ColumnDefinition columnTitles = new ColumnDefinition();
                ColumnDefinition columnValues = new ColumnDefinition();
                ColumnDefinition columnImage = new ColumnDefinition();
                Grid cardGrid = new Grid();

                //common properties
                this.Content = cardBorder;
                cardBorder.Child = cardGrid;

                //content control properties
                this.IsTabStop = true;

                //border control properties
                cardBorder.BorderBrush = cardStyle.BorderBrush;
                cardBorder.BorderThickness = cardStyle.BorderThikness;
                cardBorder.CornerRadius = cardStyle.CornerRadius;

                //grid control define columns and properties
                columnTitles.Width = new GridLength(TITLES_REGION_WIDTH, GridUnitType.Star);
                columnValues.Width = new GridLength(VALUES_REGION_WIDTH, GridUnitType.Star);
                columnImage.Width = new GridLength(IMAGE_REGION_WIDTH, GridUnitType.Star);

                cardGrid.Background = cardStyle.Background;
                cardGrid.ColumnDefinitions.Add(columnTitles);
                cardGrid.ColumnDefinitions.Add(columnValues);
                cardGrid.ColumnDefinitions.Add(columnImage);
                cardGrid.Margin = this.Padding;

                //show values
                Int32 rowIndex = 0;

                for (Int32 i = 0; i < informationItem.InformationControls.Count; i++)
                    if (CheckSystem.CheckValidity(informationItem.InformationControls[i]))
                    {
                        //add new grid row
                        RowDefinition row = new RowDefinition();
                        row.Height = new GridLength(1, GridUnitType.Auto);
                        cardGrid.RowDefinitions.Add(new RowDefinition());

                        //add title element
                        TextBlock txTitle = new TextBlock();
                        txTitle.Text = informationItem.InformationControls[i].Name;
                        txTitle.Foreground = cardStyle.TitlesForeground;
                        txTitle.Margin = this.Padding;
                        txTitle.HorizontalAlignment = this.HorizontalContentAlignment;
                        txTitle.VerticalAlignment = this.VerticalContentAlignment;
                        AddToGrid(cardGrid, txTitle, 0, rowIndex);

                        //add valuable element
                        switch (informationItem.InformationControls[i].Type)
                        {
                            case ControlType.DateTime:
                            case ControlType.FilePath:
                            case ControlType.FolderPath:
                            case ControlType.NumericSlider:
                            case ControlType.NumericText:
                            case ControlType.Text:
                                {
                                    TextBlock txValue = new TextBlock();
                                    txValue.Text = Convert.ToString(informationItem.InformationControls[i].GetValue(informationItem)) + ' ' + informationItem.InformationControls[i].ValueUnit;
                                    txValue.Foreground = cardStyle.ValuesForeground;
                                    txValue.TextWrapping = TextWrapping.WrapWithOverflow;
                                    txValue.Margin = this.Padding;
                                    txValue.HorizontalAlignment = this.HorizontalContentAlignment;
                                    txValue.VerticalAlignment = this.VerticalContentAlignment;
                                    AddToGrid(cardGrid, txValue, 1, rowIndex);
                                    break;
                                }
                            case ControlType.Boolean:
                                {
                                    TextBlock txValue = new TextBlock();
                                    txValue.Text = Convert.ToBoolean(informationItem.InformationControls[i].GetValue(informationItem)) ? trueWord : falseWord;
                                    txValue.Foreground = cardStyle.ValuesForeground;
                                    txValue.Margin = this.Padding;
                                    txValue.HorizontalAlignment = this.HorizontalContentAlignment;
                                    txValue.VerticalAlignment = this.VerticalContentAlignment;
                                    AddToGrid(cardGrid, txValue, 1, rowIndex);
                                    break;
                                }
                            case ControlType.Color:
                                {
                                    Rectangle rect = new Rectangle();
                                    rect.Fill = new SolidColorBrush((Color)informationItem.InformationControls[i].GetValue(informationItem));
                                    rect.Margin = this.Padding;
                                    AddToGrid(cardGrid, rect, 1, rowIndex);
                                    break;
                                }
                        }

                        //add card to WrapPanel
                        rowIndex++;
                    }

                //find first image and represent it 
                for (Int32 i = 0; i < informationItem.InformationControls.Count; i++)
                    if (CheckSystem.CheckValidity(informationItem.InformationControls[i]))
                        if (informationItem.InformationControls[i].Type == ControlType.Image)
                        {
                            Image image = new Image();
                            Grid.SetColumn(image, 2);

                            if (ImageLineNumbers == 0)
                            {
                                Grid.SetRowSpan(image, rowIndex);
                                image.Height = this.Height;
                            }
                            else
                                Grid.SetRowSpan(image, imageLinesNumbers);

                            try
                            {
                                image.Source = new BitmapImage(new Uri(informationItem.InformationControls[i].GetValue(informationItem).ToString()));
                            }
                            catch
                            {
                                image.Source = null;
                            }

                            image.Margin = this.Padding;
                            image.Stretch = Stretch.Fill;
                            cardGrid.Children.Add(image);
                            break;
                        }
            }
        }

        public Card(IInformation informationItem, ItemStyle cardStyle, ref Int32 tabOrder)
            : this(informationItem, cardStyle)
        {
            this.TabIndex = tabOrder++;
        }

        //public property region
        public IInformation Item
        {
            get
            {
                return item;
            }
        }

        public Int32 ImageLineNumbers
        {
            get
            {
                return imageLinesNumbers;
            }
            set
            {
                imageLinesNumbers = value;
            }
        }

        public String TrueWord
        {
            get
            {
                return trueWord;
            }
            set
            {
                trueWord = value;
            }
        }

        public String FalseWord
        {
            get
            {
                return falseWord;
            }
            set
            {
                falseWord = value;
            }
        }

        //private functions region
        private void AddToGrid(Grid grid, UIElement element, Int32 columnIndex, Int32 rowIndex)
        {
            Grid.SetColumn(element, columnIndex);
            Grid.SetRow(element, rowIndex);

            grid.Children.Add(element);
        }

        //private fields region
        private IInformation item;
        private Int32 imageLinesNumbers;
        private String trueWord;
        private String falseWord;

        //private constant region
        private const Int32 TITLES_REGION_WIDTH = 1;
        private const Int32 VALUES_REGION_WIDTH = 2;
        private const Int32 IMAGE_REGION_WIDTH = 2;
    }

    public abstract class MultiInformations : ContentControl
    {
        //public constructures region
        public MultiInformations()
        {
            itemsMargin = new Thickness(0);
            this.IsTabStop = false;
        }

        //public properties region 
        public abstract IInformation SelectedValue
        {
            get;
            set;
        }

        public abstract Int32 Count
        {
            get;
        }

        public Thickness ItemsMargin
        {
            get
            {
                return itemsMargin;
            }
            set
            {
                itemsMargin = value;
            }
        }

        public IInformationCollection Items
        {
            get
            {
                return items;
            }
            set
            {
                items = value;
            }
        }

        //public functions region
        public abstract void DrawSetItem(IInformation item);

        public abstract void DrawRemoveItem(IInformation item);

        //private fields region
        private Thickness itemsMargin;
        private IInformationCollection items;
    }

    public class MultiInformationsCard : MultiInformations
    {
        //public constructures region
        public MultiInformationsCard()
        {
            Items = new IInformationCollection(this);
            mainPanel = new WrapPanel();
            this.Content = mainPanel;
            mainPanel.Orientation = Orientation.Horizontal;
            tabOrder = 0;
            transientTime = 1;
            cardActiveOpacity = cardOpacity = 1;
            cardPadding = new Thickness(0);
            cardWidth = cardHeight = 100;
            cardStyle = new ItemStyle();
        }

        public MultiInformationsCard(ref Int32 startTabOrder)
            : this()
        {
            tabOrder = startTabOrder;
        }

        //public properties region
        public WrapPanel MainPanel
        {
            get
            {
                return mainPanel;
            }
            set
            {
                mainPanel = value;
            }
        }

        public Int32 CardWidth
        {
            get
            {
                return cardWidth;
            }
            set
            {
                cardWidth = value;
            }
        }

        public Int32 CardHeight
        {
            get
            {
                return cardHeight;
            }
            set
            {
                cardHeight = value;
            }
        }

        public override Int32 Count
        {
            get
            {
                return Items.Count;
            }
        }

        public Double TransientTime
        {
            get
            {
                return transientTime;
            }
            set
            {
                transientTime = value;
            }
        }

        public Double CardOpacity
        {
            get
            {
                return cardOpacity;
            }
            set
            {
                cardOpacity = value;
            }
        }

        public Double CardActiveOpacity
        {
            get
            {
                return cardActiveOpacity;
            }
            set
            {
                cardActiveOpacity = value;
            }
        }

        public Thickness CardPadding
        {
            get
            {
                return cardPadding;
            }
            set
            {
                cardPadding = value;
            }
        }

        public ItemStyle CardStyle
        {
            get
            {
                return cardStyle;
            }
            set
            {
                cardStyle = value;
            }
        }

        public ActivateMode MouseMoveActivate
        {
            get
            {
                return mouseMoveActivate;
            }
            set
            {
                mouseMoveActivate = value;
            }
        }

        public ActivateMode MouseClickActivate
        {
            get
            {
                return mouseClickActivate;
            }
            set
            {
                mouseClickActivate = value;
            }
        }

        public override IInformation SelectedValue
        {
            get
            {
                return selectedValue;
            }
            set
            {
                Card found = findCard(value);

                if (found != null)
                {
                    found.Focus();

                    if (SelectedItemChanged != null)
                        if (found != this.SelectedValue)
                            SelectedItemChanged(found, new RoutedEventArgs());

                    cardActivate(findCard(this.SelectedValue), found, mouseClickActivate);
                    selectedValue = value;
                }
            }
        }

        //public events region
        public event RoutedEventHandler SelectedItemChanged;
        public event RoutedEventHandler ItemMouseCLick;

        //public functions region
        public override void DrawSetItem(IInformation item)
        {
            //precondition : mainPanel is not null

            //create new card
            Card card = new Card(item, cardStyle, ref tabOrder);
            card.Width = cardWidth;
            card.Height = cardHeight;
            card.Opacity = cardOpacity;
            card.Padding = cardPadding;
            card.Margin = cardPadding;
            card.HorizontalContentAlignment = this.HorizontalContentAlignment;
            card.VerticalContentAlignment = this.VerticalContentAlignment;
            card.MouseUp += new System.Windows.Input.MouseButtonEventHandler(card_MouseUp);
            card.GotFocus += new RoutedEventHandler(card_GotFocus);

            mainPanel.Children.Add(card);

            //postcondition : value will draw in mainPanel as card
        }

        public override void DrawRemoveItem(IInformation item)
        {
            //precondition : mainPanel is not null
            if (CheckSystem.CheckValidity(item))
            {
                //InformationControl in value is valid

                //find card related with value
                for (Int32 i = 0; i < mainPanel.Children.Count; i++)
                    if (mainPanel.Children[i] != null && mainPanel.Children[i].GetType() == typeof(Card))
                        if (((Card)mainPanel.Children[i]).Item == item)
                            mainPanel.Children.RemoveAt(i);
            }
            //postcondition : card related with value will removed
        }

        //public strucutres and enumeration region
        public enum ActivateMode
        {
            none,
            transparency,
            fadingTransparency,
        }

        //private functions region

        private void cardActivate(Card oldCard, Card newCard, ActivateMode mode)
        {
            switch (mode)
            {
                case ActivateMode.transparency:
                    {
                        //set opacity to old card to cardOpacity
                        if (oldCard != null)
                            oldCard.Opacity = cardOpacity;

                        //set opacity to sender to cardActiveOpacity
                        if (newCard != null)
                            newCard.Opacity = cardActiveOpacity;
                        break;
                    }
                case ActivateMode.fadingTransparency:
                    {
                        //set opacity to old card to cardOpacity
                        DoubleAnimation animation = new DoubleAnimation();

                        if (oldCard != null)
                        {
                            animation.From = oldCard.Opacity;
                            animation.To = cardOpacity;
                            animation.Duration = TimeSpan.FromSeconds(transientTime);
                            oldCard.BeginAnimation(Border.OpacityProperty, animation);
                        }

                        //set opacity to sender to cardActiveOpacity
                        if (newCard != null)
                        {
                            animation.From = newCard.Opacity;
                            animation.To = cardActiveOpacity;
                            animation.Duration = TimeSpan.FromSeconds(transientTime);
                            newCard.BeginAnimation(Border.OpacityProperty, animation);
                        }
                        break;
                    }
            }
        }

        private Card findCard(IInformation item)
        {
            //precondition : none
            for (Int32 i = 0; i < mainPanel.Children.Count; i++)
                if (mainPanel.Children[i] != null && mainPanel.Children[i].GetType() == typeof(Card))
                    if (((Card)mainPanel.Children[i]).Item == item)
                        return (Card)mainPanel.Children[i];

            return null;
            //return : suitable card with item in mainPanet is exist , null if not exist
        }

        //private events region
        private void card_MouseUp(Object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            //selectedCard changed raise event
            if (SelectedItemChanged != null)
                if (((Card)sender).Item != this.SelectedValue)
                    SelectedItemChanged(sender, new RoutedEventArgs());

            //cardclick raise event
            if (ItemMouseCLick != null)
                ItemMouseCLick(sender, new RoutedEventArgs());

            cardActivate(findCard(this.SelectedValue), (Card)sender, mouseClickActivate);
            this.SelectedValue = ((Card)sender).Item;
            ((Card)sender).Focus();
        }

        private void card_GotFocus(Object sender, RoutedEventArgs e)
        {
            cardActivate(findCard(this.SelectedValue), (Card)sender, mouseClickActivate);
            this.SelectedValue = ((Card)sender).Item;
        }

        //private fields region
        private WrapPanel mainPanel;
        private Int32 cardWidth;
        private Int32 cardHeight;
        private Int32 tabOrder;
        private Double transientTime;
        private Double cardOpacity;
        private Double cardActiveOpacity;
        private Thickness cardPadding;
        private ItemStyle cardStyle;
        private ActivateMode mouseMoveActivate;
        private ActivateMode mouseClickActivate;
        private IInformation selectedValue;

        //private constant region
        private const Int32 TITLES_REGION_WIDTH = 1;
        private const Int32 VALUES_REGION_WIDTH = 2;
        private const Int32 IMAGE_REGION_WIDTH = 2;
    }

    public class MultiInformationsList : MultiInformations
    {
        //public constructures region
        public MultiInformationsList()
        {
            innerListBox = new ListBox();
            Items = new IInformationCollection(this);

            this.Content = innerListBox;
            innerListBox.HorizontalContentAlignment = this.HorizontalContentAlignment;
            innerListBox.VerticalContentAlignment = this.VerticalContentAlignment;
            innerListBox.SelectionChanged += new SelectionChangedEventHandler(innerListBox_SelectionChanged);
            innerListBox.HorizontalContentAlignment = System.Windows.HorizontalAlignment.Center;
            itemStyle = new Maniyat.ItemStyle();

            this.Width = ITEM_WIDTH;
            itemHeight = ITEM_HEIGHT;
        }

        //public properties region
        public override int Count
        {
            get
            {
                return innerListBox.Items.Count;
            }
        }

        public Int32 ItemHeight
        {
            get
            {
                return itemHeight;
            }
            set
            {
                itemHeight = value;
            }
        }

        public new Double Width
        {
            get
            {
                return innerListBox.Width;
            }
            set
            {
                innerListBox.Width = value;
            }
        }

        public new Double Height
        {
            get
            {
                return innerListBox.Height;
            }
            set
            {
                innerListBox.Height = value;
            }
        }

        public ItemStyle ItemStyle
        {
            get
            {
                return itemStyle;
            }
            set
            {
                itemStyle = value;
            }
        }

        public override IInformation SelectedValue
        {
            get
            {
                if (innerListBox.SelectedItem != null)
                    return ((Card)innerListBox.SelectedItem).Item;
                else
                    return null;
            }
            set
            {
                Card found = findCard(SelectedValue);

                if (found != null)
                {
                    innerListBox.SelectedItem = found;
                }
            }
        }

        public IInformation[] SelectedValues
        {
            get
            {
                IInformation[] resutl = new IInformation[innerListBox.SelectedItems.Count];

                for (Int32 i = 0; i < innerListBox.SelectedItems.Count; i++)
                    if (innerListBox.SelectedItems[i] != null && innerListBox.SelectedItems[i].GetType() == typeof(Card))
                        resutl[i] = ((Card)innerListBox.SelectedItems[i]).Item;

                return resutl;
            }
        }

        public SelectionMode SelectionMode
        {
            get
            {
                return innerListBox.SelectionMode;
            }
            set
            {
                innerListBox.SelectionMode = value;
            }
        }

        //public events region
        public event RoutedEventHandler SelectedItemChanged;

        public void innerListBox_SelectionChanged(Object sender, SelectionChangedEventArgs e)
        {
            if (SelectedItemChanged != null)
                SelectedItemChanged(sender, e);
        }

        //public functions region
        public override void DrawSetItem(IInformation item)
        {
            //precondition : innerListBox is not null

            //create new card        
            Card card = new Card(item, itemStyle);
            card.Width = this.Width - (this.Width / 20);
            card.Margin = ItemsMargin;
            innerListBox.Items.Add(card);
            //postcondition : value will draw in mainPanel as card
        }

        public override void DrawRemoveItem(IInformation item)
        {
            //precondition : innerListBox is not null

            //find suitable card        
            for (Int32 i = 0; i < innerListBox.Items.Count; i++)
                if (innerListBox.Items[i] != null && innerListBox.Items[i].GetType() == typeof(Card))
                    if (((Card)innerListBox.Items[i]).Item == item)
                        innerListBox.Items.RemoveAt(i);
            //postcondition : suitable card for item value will removed in mainPanel
        }

        //private functions region
        private Card findCard(IInformation item)
        {
            //precondition : none
            for (Int32 i = 0; i < innerListBox.Items.Count; i++)
                if (innerListBox.Items[i] != null && innerListBox.Items[i].GetType() == typeof(Card))
                    if (((Card)innerListBox.Items[i]).Item == item)
                        return (Card)innerListBox.Items[i];

            return null;
            //return : suitable card with item in mainPanet is exist , null if not exist
        }

        //private fields region
        private ListBox innerListBox;
        private Int32 itemHeight;
        private ItemStyle itemStyle;

        //private constant region
        private const Int32 ITEM_WIDTH = 250;
        private const Int32 ITEM_HEIGHT = 200;
    }

    public class MultiInformationsComboBox : MultiInformations
    {
        //public constructures region
        public MultiInformationsComboBox()
        {
            innerComboBox = new ComboBox();
            Items = new IInformationCollection(this);

            this.Content = innerComboBox;
            innerComboBox.HorizontalContentAlignment = this.HorizontalContentAlignment;
            innerComboBox.VerticalContentAlignment = this.VerticalContentAlignment;
            innerComboBox.SelectionChanged += new SelectionChangedEventHandler(innerListBox_SelectionChanged);
            innerComboBox.HorizontalContentAlignment = System.Windows.HorizontalAlignment.Center;
            itemStyle = new Maniyat.ItemStyle();

            this.Width = ITEM_WIDTH;
            itemHeight = ITEM_HEIGHT;
        }

        //public properties region
        public override int Count
        {
            get
            {
                return innerComboBox.Items.Count;
            }
        }

        public Int32 ItemHeight
        {
            get
            {
                return itemHeight;
            }
            set
            {
                itemHeight = value;
            }
        }

        public new Double Width
        {
            get
            {
                return innerComboBox.Width;
            }
            set
            {
                innerComboBox.Width = value;
            }
        }

        public new Double Height
        {
            get
            {
                return innerComboBox.Height;
            }
            set
            {
                innerComboBox.Height = value;
            }
        }

        public ItemStyle ItemStyle
        {
            get
            {
                return itemStyle;
            }
            set
            {
                itemStyle = value;
            }
        }

        public override IInformation SelectedValue
        {
            get
            {
                return ((Card)innerComboBox.SelectedItem).Item;
            }
            set
            {
                Card found = findCard(SelectedValue);

                if (found != null)
                {
                    innerComboBox.SelectedItem = found;
                }
            }
        }

        public IInformation SelectedValues
        {
            get
            {
                if (innerComboBox.SelectedItem != null && innerComboBox.SelectedItem.GetType() == typeof(Card))
                    return ((Card)innerComboBox.SelectedItem).Item;
                else
                    return null;
            }
        }

        //public events region
        public event RoutedEventHandler SelectedItemChanged;

        public void innerListBox_SelectionChanged(Object sender, SelectionChangedEventArgs e)
        {
            if (SelectedItemChanged != null)
                SelectedItemChanged(sender, e);
        }

        //public functions region
        public override void DrawSetItem(IInformation item)
        {
            //precondition : innerListBox is not null

            //create new card        
            Card card = new Card(item, itemStyle);
            card.Width = this.Width - (this.Width / 20);
            card.Margin = ItemsMargin;
            innerComboBox.Items.Add(card);
            //postcondition : value will draw in mainPanel as card
        }

        public override void DrawRemoveItem(IInformation item)
        {
            //precondition : innerListBox is not null

            //find suitable card        
            for (Int32 i = 0; i < innerComboBox.Items.Count; i++)
                if (innerComboBox.Items[i] != null && innerComboBox.Items[i].GetType() == typeof(Card))
                    if (((Card)innerComboBox.Items[i]).Item == item)
                        innerComboBox.Items.RemoveAt(i);
            //postcondition : suitable card for item value will removed in mainPanel
        }

        //private functions region
        private Card findCard(IInformation item)
        {
            //precondition : none
            for (Int32 i = 0; i < innerComboBox.Items.Count; i++)
                if (innerComboBox.Items[i] != null && innerComboBox.Items[i].GetType() == typeof(Card))
                    if (((Card)innerComboBox.Items[i]).Item == item)
                        return (Card)innerComboBox.Items[i];

            return null;
            //return : suitable card with item in mainPanet is exist , null if not exist
        }

        //private fields region
        private ComboBox innerComboBox;
        private Int32 itemHeight;
        private ItemStyle itemStyle;

        //private constant region
        private const Int32 ITEM_WIDTH = 250;
        private const Int32 ITEM_HEIGHT = 200;
    }

    public class MultiInformationsEdit : MultiInformations
    {
        //public constructures region
        public MultiInformationsEdit(IInformation itemStructure, ref Int32 startTabOrder, ref StringBuilder invalidShorcutsLitters)
            : base()
        {
            //defaut properties
            ScrollViewer listScroll = new ScrollViewer();

            itemsList = new MultiInformationsList();
            itemInput = new InformationInput(itemStructure, ref startTabOrder, ref invalidShorcutsLitters);

            listScroll.Content = itemsList;
            listScroll.VerticalScrollBarVisibility = ScrollBarVisibility.Auto;
            listScroll.HorizontalScrollBarVisibility = ScrollBarVisibility.Hidden;
            itemsList.SelectedItemChanged += new RoutedEventHandler(itemsList_SelectedItemChanged);
            itemsList.Width = LIST_WIDTH;

            //generate main grid
            Grid mainGrid = new Grid();
            ColumnDefinition listColumn = new ColumnDefinition();
            ColumnDefinition informationColumn = new ColumnDefinition();

            listColumn.Width = new GridLength(1, GridUnitType.Auto);
            informationColumn.Width = new GridLength(1, GridUnitType.Star);

            mainGrid.ColumnDefinitions.Add(listColumn);
            mainGrid.ColumnDefinitions.Add(informationColumn);

            Grid.SetColumn(listScroll, 0);
            Grid.SetColumn(itemInput, 1);

            mainGrid.Children.Add(listScroll);
            mainGrid.Children.Add(itemInput);
            
            this.Content = mainGrid;

            Items = new IInformationCollection(this);
        }

        //public properties region
        public MultiInformationsList ItemsList
        {
            get
            {
                return itemsList;
            }
            set
            {
                itemsList = value;
            }
        }

        public InformationInput ItemInput
        {
            get
            {
                return itemInput;
            }
            set
            {
                itemInput = value;
            }
        }

        public override int Count
        {
            get
            {
                return itemsList.Items.Count;
            }
        }

        public override IInformation SelectedValue
        {
            get
            {
                return itemInput.Values;
            }
            set
            {
                itemInput.Values = value;
            }
        }

        //public functions region
        public override void DrawSetItem(IInformation item)
        {
            itemsList.Items.Add(item);
        }

        public override void DrawRemoveItem(IInformation item)
        {
            itemsList.Items.Remove(item);
        }

        //private events region
        private void itemsList_SelectedItemChanged(Object sender, RoutedEventArgs e)
        {
            if (((ListBox)sender).SelectedValue != null)
                itemInput.Values = ((Card)((ListBox)sender).SelectedValue).Item;
        }

        //private fields region
        private MultiInformationsList itemsList;
        private InformationInput itemInput;

        //private constant region
        private const Int32 LIST_WIDTH = 100;
    }

    public class MultiInformationsGrid : MultiInformations
    {
        //public constructures region
        public MultiInformationsGrid(IInformation structure)
        {
            innerDataGrid = new DataGrid();
            Items = new IInformationCollection(this);
          
            this.Content = innerDataGrid;
            innerDataGrid.IsReadOnly = true;

            //define columns
            if (CheckSystem.CheckValidity(structure))
            {
                for (Int32 i = 0; i < structure.InformationControls.Count; i++)
                    if (CheckSystem.CheckValidity(structure.InformationControls[i]))
                    {
                        DataGridColumn column = null;

                        switch (structure.InformationControls[i].Type)
                        {
                            case ControlType.DateTime:
                            case ControlType.FilePath:
                            case ControlType.FolderPath:
                            case ControlType.NumericSlider:
                            case ControlType.NumericText:
                            case ControlType.Text:
                            case ControlType.Image:
                                {
                                    column = new DataGridTextColumn();
                                    column.Header = structure.InformationControls[i].Name + ' ' + structure.InformationControls[i].ValueUnit;
                                    ((DataGridTextColumn)column).Binding = new System.Windows.Data.Binding(structure.InformationControls[i].Property.Name);
                                    break;
                                }
                            case ControlType.Color:
                                {
                                    column = new DataGridTextColumn();
                                    column.Header = structure.InformationControls[i].Name + ' ' + structure.InformationControls[i].ValueUnit;
                                    column.CanUserSort = false;
                                    ((DataGridTextColumn)column).Binding = new System.Windows.Data.Binding(structure.InformationControls[i].Property.Name);
                                    break;
                                }
                            case ControlType.Boolean:
                                {
                                    column = new DataGridCheckBoxColumn();
                                    column.Header = structure.InformationControls[i].Name + ' ' + structure.InformationControls[i].ValueUnit;
                                    ((DataGridCheckBoxColumn)column).Binding = new System.Windows.Data.Binding(structure.InformationControls[i].Property.Name);
                                    break;
                                }
                        }

                        if (column != null)
                        {
                            innerDataGrid.Columns.Add(column);
                        }
                    }
            }
        }

        //public properties region
        public DataGrid InnerDataGrid
        {
            get
            {
                return innerDataGrid;
            }
            set
            {
                innerDataGrid = value;
            }
        }

        public override IInformation SelectedValue
        {
            get
            {
                return (IInformation)innerDataGrid.SelectedItem;
            }
            set
            {
                innerDataGrid.SelectedItem = value;
            }
        }

        public new HorizontalAlignment HorizontalContentAlignment
        {
            get
            {
                return innerDataGrid.HorizontalContentAlignment;
            }
            set
            {
                innerDataGrid.HorizontalContentAlignment = value;
            }
        }

        public new VerticalAlignment VerticalContentAlignment
        {
            get
            {
                return innerDataGrid.VerticalContentAlignment;
            }
            set
            {
                innerDataGrid.VerticalContentAlignment = value; 
            }
        }

        public Brush RowBackground
        {
            get
            {
                return innerDataGrid.RowBackground;
            }
            set
            {
                innerDataGrid.RowBackground = value;
            }
        }

        public Brush AlternatingRowBackground
        {
            get
            {
                return innerDataGrid.AlternatingRowBackground;
            }
            set
            {
                innerDataGrid.AlternatingRowBackground = value;
            }
        }

        //public functions region
        public override int Count
        {
            get
            {
                return innerDataGrid.Items.Count;
            }
        }

        public override void DrawSetItem(IInformation item)
        {
            innerDataGrid.Items.Add(item);
        }

        public override void DrawRemoveItem(IInformation item)
        {
            innerDataGrid.Items.Remove(item);
        }

        //private fields region
        private DataGrid innerDataGrid;
    }
}
