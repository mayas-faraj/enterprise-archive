using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminCurrency : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Maniyat.Unit unit = new Maniyat.Unit();

        Maniyat.IDatabase[] result = Maniyat.Database.Select(unit, new Maniyat.DataCondition(unit.DataFields["description"], Maniyat.SqlOperator.Equal, "ليرة سورية"));
        if (result != null && result.Length > 0 && result[0] != null)
            txSP.Text = ((Maniyat.Unit)result[0]).Factor.ToString();

        result = Maniyat.Database.Select(unit, new Maniyat.DataCondition(unit.DataFields["description"], Maniyat.SqlOperator.Equal, "Europe Euro"));
        if (result != null && result.Length > 0 && result[0] != null)
            txEU.Text = ((Maniyat.Unit)result[0]).Factor.ToString();

        result = Maniyat.Database.Select(unit, new Maniyat.DataCondition(unit.DataFields["description"], Maniyat.SqlOperator.Equal, "US Dollar"));
        if (result != null && result.Length > 0 && result[0] != null)
            txUD.Text = ((Maniyat.Unit)result[0]).Factor.ToString();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Maniyat.Unit unit = new Maniyat.Unit();

        for (Int32 i = 0; i < unit.DataFields.Count; i++)
            unit.DataFields[i].IsUsed = false;

        unit.DataFields["factor"].IsUsed = true;
        unit.DataFields["id"].IsUsed = true;

        unit.Factor = Double.Parse(txSP.Text);
        Maniyat.Database.Update(unit, new Maniyat.DataCondition(unit.DataFields["description"], Maniyat.SqlOperator.Equal, "ليرة سورية"));

        unit.Factor = Double.Parse(txEU.Text);
        Maniyat.Database.Update(unit, new Maniyat.DataCondition(unit.DataFields["description"], Maniyat.SqlOperator.Equal, "Europe Euro"));

        unit.Factor = Double.Parse(txUD.Text);
        Maniyat.Database.Update(unit, new Maniyat.DataCondition(unit.DataFields["description"], Maniyat.SqlOperator.Equal, "US Dollar")); 
    }
}