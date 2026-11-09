using System;
using System.Collections.Generic;
using System.Text;

namespace System.Windows.Shapes
{
    public class Pointer : Shape
    {
        //public constructures region
        public Pointer()
        {
            //defining lines
            stream = new Media.StreamGeometry();          
        }

        //public dependicy properties
        public static readonly DependencyProperty X1Property = DependencyProperty.Register("X1", typeof(Double), typeof(Pointer), new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure));

        public static readonly DependencyProperty Y1Property = DependencyProperty.Register("Y1", typeof(Double), typeof(Pointer), new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure));

        public static readonly DependencyProperty X2Property = DependencyProperty.Register("X2", typeof(Double), typeof(Pointer), new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure));

        public static readonly DependencyProperty Y2Property = DependencyProperty.Register("Y2", typeof(Double), typeof(Pointer), new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure));

        public static readonly DependencyProperty HeadHeightProperty = DependencyProperty.Register("HeadHeight", typeof(Double), typeof(Pointer), new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure));

        public static readonly DependencyProperty HeadWidthProperty = DependencyProperty.Register("HeadWidth", typeof(Double), typeof(Pointer), new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure));

        public static readonly DependencyProperty LineWidthProperty = DependencyProperty.Register("LineWidth", typeof(Double), typeof(Pointer), new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure));
         
        //public properties region
        public Double X1
        {
            get 
            {
                return (Double)GetValue(X1Property); 
            }
            set 
            {
                SetValue(X1Property, value); 
            }  
        }

        public Double Y1
        {
            get
            {
                return (Double)GetValue(Y1Property);
            }
            set
            {
                SetValue(Y1Property, value);
            } 
        }

        public Double X2
        {
            get
            {
                return (Double)GetValue(X2Property);
            }
            set
            {
                SetValue(X2Property, value);
            } 
        }

        public Double Y2
        {
            get
            {
                return (Double)GetValue(Y2Property);
            }
            set
            {
                SetValue(Y2Property, value);
            } 
        }

        public Double HeadHeight
        {
            get
            {
                return (Double)GetValue(HeadHeightProperty);
            }
            set
            {
                SetValue(HeadHeightProperty, value);
            }
        }

        public Double HeadWidth
        {
            get
            {
                return (Double)GetValue(HeadWidthProperty);
            }
            set
            {
                SetValue(HeadWidthProperty, value);
            }
        }

        public Double LineWidth
        {
            get
            {
                return (Double)GetValue(LineWidthProperty);
            }
            set
            {
                SetValue(LineWidthProperty, value);
            }
        }
        
        //protected properties region
        protected override Media.Geometry DefiningGeometry
        {
            get
            {
                //defining rectangle points
                Point r1 = new Point();
                Point r2 = new Point();
                Point r3 = new Point();
                Point r4 = new Point();

                //defining triangle points
                Point p1 = new Point();
                Point p2 = new Point();
                Point p3 = new Point();
                Double xStart = X1;
                Double yStart = Y1;
                Double xEnd = X2;
                Double yEnd = Y2;

                //calculating points coordinates
                if (X1 == Y2)
                {
                    //on y ray
                    p1.X = xEnd - HeadWidth;
                    p2.X = xEnd + HeadWidth;
                    p3.X = xEnd;
                    p1.Y = p2.Y = yEnd;

                    r1.X = r2.X = xEnd - (LineWidth / 2);
                    r3.X = r4.X = xEnd + (LineWidth / 2);

                    r1.Y = r4.Y = yStart;
                    r2.Y = r3.Y = yEnd;

                    if (Y1 > Y2)
                        p3.Y = yEnd - HeadHeight;
                    else
                        p3.Y = yEnd + HeadHeight;
                }
                else
                {
                    if (Y1 == Y2)
                    {
                        //on x ray
                        p1.X = p2.X = xEnd;
                        p1.Y = yEnd + HeadWidth;
                        p2.Y = yEnd - HeadWidth;
                        p3.Y = yEnd;

                        r1.X = r2.X = xStart;
                        r3.X = r4.X = xEnd;

                        r1.Y = r4.Y = yEnd - (LineWidth / 2);
                        r2.Y = r3.Y = yEnd + (LineWidth / 2);

                        if (X1 > X2)
                            p3.X = xEnd - HeadHeight;
                        else
                            p3.X = xEnd + HeadHeight;
                    }
                    else
                    {
                        //main situation
                        Double angle = Math.Atan(Math.Abs((Y2 - Y1) / (X2 - X1)));
                        Double pi = Math.PI;
                        Double pi2 = Math.PI / 2;

                        
                        if (X1 > X2)
                        {
                            //qurtar 1 and 4 (left half)
                            p1.X = xEnd - HeadWidth * Math.Cos(-angle - pi2);
                            p2.X = xEnd + HeadWidth * Math.Cos(-angle - pi2);
                            p3.X = xEnd + HeadHeight * Math.Cos(pi + angle);

                            r1.X = xStart + (LineWidth / 2) * Math.Cos(-angle - pi2);
                            r2.X = xStart - (LineWidth / 2) * Math.Cos(-angle - pi2);
                            r3.X = xEnd - (LineWidth / 2) * Math.Cos(-angle - pi2);
                            r4.X = xEnd + (LineWidth / 2) * Math.Cos(-angle - pi2);

                            if (Y1 > Y2)
                            {
                                //qurtar 1 (upper)
                                p1.Y = yEnd + HeadWidth * Math.Sin(-angle - pi2);
                                p2.Y = yEnd - HeadWidth * Math.Sin(-angle - pi2);
                                p3.Y = yEnd + HeadHeight * Math.Sin(pi + angle);

                                r1.Y = yStart - (LineWidth / 2) * Math.Sin(-angle - pi2);
                                r2.Y = yStart + (LineWidth / 2) * Math.Sin(-angle - pi2);
                                r3.Y = yEnd + (LineWidth / 2) * Math.Sin(-angle - pi2);
                                r4.Y = yEnd - (LineWidth / 2) * Math.Sin(-angle - pi2);
                            }
                            else
                            {
                                //quartar 4(downer)
                                p1.Y = yEnd - HeadWidth * Math.Sin(-angle - pi2);
                                p2.Y = yEnd + HeadWidth * Math.Sin(-angle - pi2);
                                p3.Y = yEnd - HeadHeight * Math.Sin(pi + angle);

                                r1.Y = yStart + (LineWidth / 2) * Math.Sin(-angle - pi2);
                                r2.Y = yStart - (LineWidth / 2) * Math.Sin(-angle - pi2);
                                r3.Y = yEnd - (LineWidth / 2) * Math.Sin(-angle - pi2);
                                r4.Y = yEnd + (LineWidth / 2) * Math.Sin(-angle - pi2);
                            }
                        }
                        else
                        {
                            //qurtar 2 and 3 (right half)
                            p1.X = xEnd - HeadWidth * Math.Cos(pi2 - angle);
                            p2.X = xEnd + HeadWidth * Math.Cos(pi2 - angle);
                            p3.X = xEnd + HeadHeight * Math.Cos(angle);

                            r1.X = xStart - (LineWidth / 2) * Math.Cos(pi2 - angle);
                            r2.X = xStart + (LineWidth / 2) * Math.Cos(pi2 - angle);
                            r3.X = xEnd + (LineWidth / 2) * Math.Cos(pi2 - angle);
                            r4.X = xEnd - (LineWidth / 2) * Math.Cos(pi2 - angle);

                            if (Y1 > Y2)
                            {
                                //qurtar 2 (upper)
                                p1.Y = yEnd - HeadWidth * Math.Sin(pi2 - angle);
                                p2.Y = yEnd + HeadWidth * Math.Sin(pi2 - angle);
                                p3.Y = yEnd - HeadHeight * Math.Sin(angle);

                                r1.Y = yStart - (LineWidth / 2) * Math.Sin(pi2 - angle);
                                r2.Y = yStart + (LineWidth / 2) * Math.Sin(pi2 - angle);
                                r3.Y = yEnd + (LineWidth / 2) * Math.Sin(pi2 - angle);
                                r4.Y = yEnd - (LineWidth / 2) * Math.Sin(pi2 - angle);
                            }
                            else
                            {
                                //qurtar 3 (upper)
                                p1.Y = yEnd + HeadWidth * Math.Sin(pi2 - angle);
                                p2.Y = yEnd - HeadWidth * Math.Sin(pi2 - angle);
                                p3.Y = yEnd + HeadHeight * Math.Sin(angle);

                                r1.Y = yStart + (LineWidth / 2) * Math.Sin(pi2 - angle);
                                r2.Y = yStart - (LineWidth / 2) * Math.Sin(pi2 - angle);
                                r3.Y = yEnd - (LineWidth / 2) * Math.Sin(pi2 - angle);
                                r4.Y = yEnd + (LineWidth / 2) * Math.Sin(pi2 - angle);
                            }
                        }
                    }
                }

                //draw triangle
                using (Media.StreamGeometryContext streamContext = stream.Open())
                {
                    streamContext.BeginFigure(p1, true, true);
                    streamContext.LineTo(p2, true, false);
                    streamContext.LineTo(p3, true, false);

                    streamContext.BeginFigure(r1, true, true);
                    streamContext.LineTo(r2, true, false);
                    streamContext.LineTo(r3, true, false);
                    streamContext.LineTo(r4, true, false);
                }
                return stream;
            }
        }

        //private fields region
        private Media.StreamGeometry stream;
    }
}
