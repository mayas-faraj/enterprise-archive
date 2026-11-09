using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Int32 idx;

        if (Int32.TryParse(Request["report"], out idx))
        {
            switch (idx)
            {
                case 0:
                    lblResult.Text = Maniyat.Consts.ERROR_APPLICATIONERROR;
                    break;
                case 1:
                    lblResult.Text = Maniyat.Consts.MESSAGE_SENTMESSAGE;
                    break;
                case 2:
                    lblResult.Text = Maniyat.Consts.TEXT_MUSTLOGIN;
                    break;
                case 3:
                    lblResult.Text = Maniyat.Consts.TEXT_USERADDED;
                    break;
                case 4:
                    lblResult.Text = Maniyat.Consts.MESSAGE_SENTADMINMESSAGE;
                    break;
            }
        }
    }
}