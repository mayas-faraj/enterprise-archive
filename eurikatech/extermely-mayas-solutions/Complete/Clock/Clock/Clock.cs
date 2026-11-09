using System.Drawing;
using System;

namespace Maniyat
{
    public partial class Clock : System.Windows.Forms.UserControl
    {
        private String text;
        private Font font;
        private Color textColor;
        private System.Windows.Forms.HorizontalAlignment textAlign;
        private Pointer[] pointers;

        private Graphics gr;
        private Size oldSize;
        private Brush brush;
        private const Int32 BASE_ANGLE = 270;

        public event ErrorHandler ErrorEventHandler;

        public Clock()
        {
            InitializeComponent();

            text = "";
            font = new Font("Arial", 12);
            textColor = Color.Black;
            textAlign = System.Windows.Forms.HorizontalAlignment.Center;
            pointers = null;
            gr = this.CreateGraphics();
            oldSize = this.Size;
            this.Resize += new EventHandler(Clock_Resize);
            this.Paint += new System.Windows.Forms.PaintEventHandler(Clock_Paint);
        }

        void Clock_Paint(object sender, System.Windows.Forms.PaintEventArgs e)
        {
            drawPointers();
        }

        void Clock_Resize(object sender, EventArgs e)
        {
            gr = Graphics.FromHwnd(this.Handle);

            if (pointers != null)
            {
                if (Size.Width != 0 && Size.Height != 0)
                {
                    Single chngWidth = (Single)this.Size.Width / (Single)oldSize.Width;
                    Single chngHeight = (Single)this.Size.Height / (Single)oldSize.Height;

                    foreach (Pointer p in this.pointers)
                    {
                        try
                        {
                            p.Size = new Size(Convert.ToInt32(p.OldSize.Width * chngWidth), Convert.ToInt32(p.OldSize.Height * chngHeight));
                            p.Location = new Point(Convert.ToInt32(p.OldLocation.X * chngWidth), Convert.ToInt32(p.OldLocation.Y * chngHeight));
                        }
                        catch (Exception ex)
                        {
                            ErrorEventHandler(this, new ErrorEventArgs(ex));
                        }
                    }
                    this.oldSize = this.Size;
                }
            }
            else
                this.oldSize = this.Size;
        }

        public override String Text
        {
            get
            {
                return text;
            }

            set
            {
                text = value;
                Update();
            }
        }

        public override Font Font
        {
            get
            {
                return font;
            }

            set
            {
                font = value;
                Update();
            }
        }

        public Color TextColor
        {
            get
            {
                return textColor;
            }

            set
            {
                textColor = value;
                brush = new SolidBrush(textColor);
                Update();
            }
        }


        public System.Windows.Forms.HorizontalAlignment TextAlign
        {
            get
            {
                return textAlign;
            }

            set
            {
                textAlign = value;
                Update();
            }
        }

        public Pointer[] Pointers
        {
            get
            {
                return pointers;
            }

            set
            {
                if (value != null)
                {
                    pointers = value;

                    foreach (Pointer pntr in pointers)
                        pntr.Parent = this;
                }
            }
        }

        public new void Update()
        {
            this.Refresh();
            this.drawPointers();
        }

        private void drawPointers()
        {
            try
            {

                if (pointers != null)
                {
                    if (text != "")
                    {
                        gr.DrawString(text, font, brush, new PointF((this.Width - gr.MeasureString(text, font).Width) / 2, 0.75f * this.Height));
                    }

                    foreach (Pointer pntr in Pointers)
                    {
                        Byte fullRotation;
                        Single angle;

                        if (pntr.RangeAngle == 360)
                            fullRotation = 0;
                        else
                            fullRotation = 1;

                        if (pntr.Rotate == Rotation.ClockWise)
                            angle = pntr.MinAngle + ((pntr.RangeAngle / (pntr.RangeValue - fullRotation) * pntr.Value));
                        else
                            angle = pntr.MinAngle + pntr.RangeAngle - ((pntr.RangeAngle / (pntr.RangeValue - fullRotation) * pntr.Value));

                        gr.TranslateTransform(pntr.Location.X + (pntr.Size.Width / 2), pntr.Location.Y);
                        gr.RotateTransform(angle + BASE_ANGLE);
                        gr.DrawImage(pntr.Image, -(pntr.Size.Width / 2), 0, pntr.Size.Width, pntr.Size.Height);
                        gr.RotateTransform(-angle - BASE_ANGLE);
                        gr.TranslateTransform(-pntr.Location.X - (pntr.Size.Width / 2), -pntr.Location.Y);
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorEventHandler(this, new ErrorEventArgs(ex));
            }
        }
    }

    public class ErrorEventArgs : EventArgs
    {
        private Exception sourceException;

        public ErrorEventArgs(Exception ex)
        {
            sourceException = ex;
        }

        public Exception SourceException
        {
            get
            {
                return sourceException;
            }

            set
            {
                sourceException = value;
            }
        }
    }
    
    public delegate void ErrorHandler(Object sender,EventArgs e);

    public delegate void AlarmHandler(Object sender,EventArgs e);

    public enum Rotation
    {
        ClockWise,
        CounterClockWise
    }

    public class Pointer
    {
        private SizeF size;
        private PointF location;
        private Image image;
        private Boolean visible;
        private Single minAngle;
        private Int32 minValue;
        private Single rangeAngle;
        private Int32 rangeValue;
        private Single val;
        private Rotation rotate;
        private Clock parent;

        public SizeF OldSize;
        public PointF OldLocation;

        public Pointer()
        {
            size = new Size(0, 0);
            location = new Point(0, 0);
            image = null;
            visible = true;
            minAngle = minValue = 0;
            rangeAngle = rangeValue = 0;
            rotate = Rotation.ClockWise;
        }

        public SizeF Size
        {
            get
            {
                return size;
            }
            set
            {
                size = value;
                OldSize = size;
                refresh();
            }
        }

        public PointF Location
        {
            get
            {
                return location;
            }
            set
            {
                location = value;
                OldLocation = location;
                refresh();
            }
        }

        public Boolean Visible
        {
            get
            {
                return visible;
            }
            set
            {
                visible = value;
                refresh();
            }
        }

        public Image Image
        {
            get
            {
                return image;
            }
            set
            {
                image = value;
                refresh();
            }
        }

        public Rotation Rotate
        {
            get
            {
                return rotate;
            }
            set
            {
                rotate = value;
                refresh();
            }
        }

        public Clock Parent
        {
            get
            {
                return parent;
            }
            set
            {
                parent = value;
                refresh();
            }
        }

        public Single MinAngle
        {
            get
            {
                return minAngle;
            }
            set
            {
                minAngle = value;
                refresh();
            }
        }

        public Int32 MinValue
        {
            get
            {
                return minValue;
            }
            set
            {
                minValue = value;
                refresh();
            }
        }

        public Single RangeAngle
        {
            get
            {
                return rangeAngle;
            }
            set
            {
                rangeAngle = value;
                refresh();
            }
        }

        public Int32 RangeValue
        {
            get
            {
                return rangeValue;
            }
            set
            {
                rangeValue = value;
                refresh();
            }
        }

        public Single Value
        {
            get
            {
                return val;
            }

            set
            {
                if (val != value)
                {
                    val = value;
                    refresh();
                }
            }
        }

        private void refresh()
        {
            if (parent != null)
                parent.Update();
        }

    }

    public class Alarm
    {
        private Boolean active;
        private DateTime alarmStart, alarmNext;
        private Boolean[] alarmType;
        private String name, description;

        public event AlarmHandler AlarmEventHandler;
        public event ErrorHandler ErrorEventHandler;

        public Alarm()
        {
            active = false;
            alarmType = new Boolean[8] { false, false, false, false, false, false, false, true };
        }

        public Boolean Active
        {
            get
            {
                return active;
            }
            set
            {
                if (active ^ value)
                {
                    active = value;
                    alarmNext = alarmStart;
                }
            }
        }

        public DateTime AlarmStart
        {
            get
            {
                return alarmStart;
            }
            set
            {
                alarmStart = value;
                alarmNext = alarmStart;
            }
        }

        public DateTime AlarmNext
        {
            get
            {
                return alarmNext;
            }
            set
            {
                alarmNext = value;
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

        public Boolean[] AlarmType
        {
            get
            {
                return alarmType;
            }
            set
            {
                if (value.Length != 8)
                    ErrorEventHandler(this, new ErrorEventArgs(new Exception("boolean array must have length 8 elements\nindex 0 for sunday , 6 for saturday , 7 for specfic date")));
                else
                    alarmType = value;
            }
        }

        public DateTime AddPeriod(Double minute)
        {
            alarmNext = alarmStart.AddMinutes(minute);
            return alarmNext;
        }

        public Boolean Check()
        {
            if (active && (DateTime.Now.Second == 0) && (alarmNext.Minute == DateTime.Now.Minute && alarmNext.Hour == DateTime.Now.Hour))
            {
                if (alarmType[7])
                {
                    if (alarmNext.Day == DateTime.Now.Day && alarmNext.Month == DateTime.Now.Month && alarmNext.Year == DateTime.Now.Year)
                    {
                        AlarmEventHandler(this, new EventArgs());
                        return true;
                    }
                }
                else
                {
                    if (AlarmType[(Int32)DateTime.Now.DayOfWeek])
                    {
                        AlarmEventHandler(this, new EventArgs());
                        return true;
                    }
                }
            }
            return false;
        }
    }
}

