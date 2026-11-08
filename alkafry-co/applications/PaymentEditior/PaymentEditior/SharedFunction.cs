using System;
using System.IO;

namespace PaymentEditior
{
    public struct Configure
    {
        public Int32 PaymentNum;
        public Int32 CopesNum;
        public Int32 Space;
        public Int32 Width;
        public Int32 Height;
        public System.Drawing.Font Font;
        public System.Drawing.Color Color;
        public Boolean TransBg;
        public String ImagePath;
    } 

    static class SharedFunction
    {
        public static Configure LoadConfigure()
        {
                FileStream fs = new FileStream(System.Windows.Forms.Application.StartupPath + "\\configure.mnf", FileMode.Open, FileAccess.Read);
                StreamReader sr = new StreamReader(fs);
                Configure result = new Configure();

                result.PaymentNum = Convert.ToInt32(sr.ReadLine());
                result.CopesNum = Convert.ToInt32(sr.ReadLine());
                result.Space = Convert.ToInt32(sr.ReadLine());
                result.Width = Convert.ToInt32(sr.ReadLine());
                result.Height = Convert.ToInt32(sr.ReadLine());
                result.Color = System.Drawing.Color.FromArgb(Convert.ToInt32(sr.ReadLine()));
                result.TransBg = Convert.ToBoolean(sr.ReadLine());

                String[] fonts = sr.ReadLine().Split(';');
                System.Drawing.FontStyle fst = System.Drawing.FontStyle.Regular;

                if (Convert.ToBoolean(fonts[2]))
                    fst = fst | System.Drawing.FontStyle.Bold;

                if (Convert.ToBoolean(fonts[3]))
                    fst = fst | System.Drawing.FontStyle.Italic;

                if (Convert.ToBoolean(fonts[4]))
                    fst = fst | System.Drawing.FontStyle.Underline;


                result.Font = new System.Drawing.Font(fonts[0], Convert.ToSingle(fonts[1]), fst);
                result.ImagePath = sr.ReadLine();

                sr.Close();
                fs.Close();

                return result;
        }

        public static void SaveConfigure(Configure configure)
        {
            FileStream fs = new FileStream(System.Windows.Forms.Application.StartupPath + "\\configure.mnf", FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);

            sw.WriteLine(configure.PaymentNum);
            sw.WriteLine(configure.CopesNum);
            sw.WriteLine(configure.Space);
            sw.WriteLine(configure.Width);
            sw.WriteLine(configure.Height);
            sw.WriteLine(configure.Color.ToArgb());
            sw.WriteLine(configure.TransBg);
            sw.WriteLine(configure.Font.FontFamily.Name + ';' + configure.Font.Size.ToString() + ';' + configure.Font.Bold + ';' + configure.Font.Italic + ';' + configure.Font.Underline);
            sw.WriteLine(configure.ImagePath);
            
            sw.Close();
            fs.Close();
        }

        public static void LoadItems(System.Windows.Forms.Control parentControl)
        {
            if (File.Exists(System.Windows.Forms.Application.StartupPath + "\\items.mnf"))
            {
                FileStream fs = new FileStream(System.Windows.Forms.Application.StartupPath + "\\items.mnf", FileMode.Open, FileAccess.Read);
                StreamReader sr = new StreamReader(fs);

                String items = sr.ReadToEnd();

                sr.Close();
                fs.Close();

                String[] itemsArr = items.Split(new String[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);

                foreach (String item in itemsArr)
                {
                    System.Windows.Forms.Label lbl = new System.Windows.Forms.Label();

                    lbl.AutoSize = true;

                    String[] prop = item.Split(';');

                    lbl.Text = prop[0];

                    System.Drawing.FontStyle fst = System.Drawing.FontStyle.Regular;

                    if (Convert.ToBoolean(prop[3]))
                        fst = fst | System.Drawing.FontStyle.Bold;

                    if (Convert.ToBoolean(prop[4]))
                        fst = fst | System.Drawing.FontStyle.Italic;

                    if (Convert.ToBoolean(prop[5]))
                        fst = fst | System.Drawing.FontStyle.Underline;


                    lbl.Font = new System.Drawing.Font(prop[1], Convert.ToSingle(prop[2]), fst);

                    lbl.ForeColor = System.Drawing.Color.FromArgb(Convert.ToInt32(prop[6]));
                    lbl.BackColor = System.Drawing.Color.FromArgb(Convert.ToInt32(prop[7]));

                    lbl.Left = Convert.ToInt32(prop[8]);
                    lbl.Top = Convert.ToInt32(prop[9]);

                    parentControl.Controls.Add(lbl);
                }
            }
        }

        public static void SaveItems(System.Windows.Forms.Control parentControl)
        {
            FileStream fs = new FileStream(System.Windows.Forms.Application.StartupPath + "\\items.mnf", FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);

            foreach (System.Windows.Forms.Control ctrl in parentControl.Controls)
            {
                if (ctrl.GetType() == typeof(System.Windows.Forms.Label))
                {
                    System.Windows.Forms.Label lbl = (System.Windows.Forms.Label)ctrl;

                    sw.WriteLine(lbl.Text + ';' + lbl.Font.FontFamily.Name + ';' + lbl.Font.Size.ToString() + ';' + lbl.Font.Bold + ';' + lbl.Font.Italic + ';' + lbl.Font.Underline + ';' + lbl.ForeColor.ToArgb().ToString() + ';' + lbl.BackColor.ToArgb().ToString() + ';' + lbl.Left.ToString() + ';' + lbl.Top.ToString());
                }
            }

            sw.Close();
            fs.Close();
        }
    }
}
