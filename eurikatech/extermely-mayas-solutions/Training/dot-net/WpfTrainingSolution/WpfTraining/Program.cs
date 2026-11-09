
namespace WpfTraining
{
    class Program
    {
        [System.STAThread()]
        public static void Main()
        {
            System.Windows.Application application = new System.Windows.Application();
            System.Windows.Input.Mouse.OverrideCursor = System.Windows.Input.Cursors.Hand;

            Window2 mw = new Window2();
            application.ShutdownMode = System.Windows.ShutdownMode.OnLastWindowClose;
            application.Run(mw);    
        }
    }

    class Item : System.Windows.DependencyObject
    {
        //public constructure region
        static Item()
        {
            WidthProperty = System.Windows.DependencyProperty.Register("Width", typeof(System.Single), typeof(Item), new System.Windows.PropertyMetadata(0F, Item.valueChanged, Item.valueCoerce), Item.signalValidate);
            MaxWidthProperty = System.Windows.DependencyProperty.Register("MaxWidth", typeof(System.Single), typeof(Item), new System.Windows.PropertyMetadata(1F, null, new System.Windows.CoerceValueCallback(Item.maxCoerce)), Item.signalValidate);
            MinWidthProperty = System.Windows.DependencyProperty.Register("MinWidth", typeof(System.Single), typeof(Item), new System.Windows.PropertyMetadata(0F, new System.Windows.PropertyChangedCallback(Item.minChanged), null), Item.signalValidate);  
        }

        //public properties region
        public System.Single Width
        {
            get
            {
                return (System.Single)this.GetValue(Item.WidthProperty);
            }
            set
            {
                this.SetValue(Item.WidthProperty, value);
            }
        }

        public System.Single MaxWidth
        {
            get
            {
                return (System.Single)this.GetValue(Item.MaxWidthProperty);
            }
            set
            {
                this.SetValue(Item.MaxWidthProperty, value);
            }
        }

        public System.Single MinWidth
        {
            get
            {
                return (System.Single)this.GetValue(Item.MinWidthProperty);
            }
            set
            {
                this.SetValue(Item.MinWidthProperty, value);
            }
        }
       
        //public static fields region region
        public static readonly System.Windows.DependencyProperty WidthProperty;

        public static readonly System.Windows.DependencyProperty MaxWidthProperty;

        public static readonly System.Windows.DependencyProperty MinWidthProperty;


        //private functions region
        private static bool signalValidate(object val)
        {
            if (((System.Single)val >= 0) && (System.Single)val <= 100)
                return true;
            else
                return false;
        }

        private static object maxCoerce(System.Windows.DependencyObject d, object baseValue)
        {
            Item item = (Item)d;
            System.Single value = (System.Single)baseValue;

            if (value < item.MinWidth)
                return item.MinWidth;
            else
                return value;  
        }

        private static void minChanged(System.Windows.DependencyObject d, System.Windows.DependencyPropertyChangedEventArgs e)
        {
            Item item = (Item)d;
            System.Single value = (System.Single)e.NewValue;

            if (value > item.MaxWidth)
                item.MaxWidth = value;
        }

        private static object valueCoerce(System.Windows.DependencyObject d, object baseValue)
        {
            Item item = (Item)d;
            System.Single val = (System.Single)baseValue;

            if (val < item.MinWidth)
                return item.MinWidth;

            if (val > item.MaxWidth)
                return item.MaxWidth;

            return val;
        }

        private static void valueChanged(System.Windows.DependencyObject d, System.Windows.DependencyPropertyChangedEventArgs e)
        {
            
        }
    }

    class Item2 : System.Windows.DependencyObject
    {
        public static readonly System.Windows.DependencyProperty WidthProperty;

        static Item2()
        {
            WidthProperty = Item.WidthProperty.AddOwner(typeof(Item2));
        }
    
    }
}
