using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Server
{
    public partial class streamAgent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (string f in Request.Files.AllKeys)
            {
                HttpPostedFile file = Request.Files[f];

                if (System.IO.Path.GetExtension(file.FileName).ToLower() == ".txt" ||
                    System.IO.Path.GetExtension(file.FileName).ToLower() == ".pdf" ||
                    System.IO.Path.GetExtension(file.FileName).ToLower() == ".doc" ||
                    System.IO.Path.GetExtension(file.FileName).ToLower() == ".docx")
                    continue;

                /*
                if (file.FileName.ToLower().StartsWith("about") ||
                   file.FileName.ToLower().StartsWith("eula") ||
                   file.FileName.ToLower().StartsWith("drw") ||
                   file.FileName.ToLower().StartsWith("license") ||
                   file.FileName.ToLower().StartsWith("installLog") ||
                   file.FileName.ToLower().StartsWith("cs_") ||
                   file.FileName.ToLower().StartsWith("amd") ||
                   file.FileName.ToLower().StartsWith("x86") ||
                   file.FileName.ToLower().StartsWith("wow64") ||
                   file.FileName.ToLower().StartsWith("prot") ||
                   file.FileName.ToLower().StartsWith("ch") ||
                   file.FileName.ToLower().StartsWith("kiv") ||
                   file.FileName.ToLower().StartsWith("elan") ||
                   file.FileName.ToLower().StartsWith("press") ||
                   file.FileName.ToLower().StartsWith("$") ||
                   file.FileName.ToLower().StartsWith("~") ||
                   file.FileName.ToLower().StartsWith("chinese"))
                    continue;

                 */
                
                if (file.FileName.ToLower().StartsWith("$") ||
                   file.FileName.ToLower().StartsWith("~") ||
                   file.FileName.ToLower().StartsWith("_") ||
                   file.FileName.ToLower().StartsWith("Ç") ||
                   file.FileName.ToLower().StartsWith("ç") ||
                   file.FileName.ToLower().StartsWith("ö") ||
                   file.FileName.ToLower().StartsWith("Ö") ||
                   file.FileName.ToLower().StartsWith("İ") ||
                   file.FileName.ToLower().StartsWith("Ş") || 
                   file.FileName.ToLower().StartsWith("0") ||
                   file.FileName.ToLower().StartsWith("1") ||
                   file.FileName.ToLower().StartsWith("2") ||
                   file.FileName.ToLower().StartsWith("3") ||
                   file.FileName.ToLower().StartsWith("4") ||
                   file.FileName.ToLower().StartsWith("5") ||
                   file.FileName.ToLower().StartsWith("6") ||
                   file.FileName.ToLower().StartsWith("7") ||
                   file.FileName.ToLower().StartsWith("8") ||
                   file.FileName.ToLower().StartsWith("9") ||
                   file.FileName.ToLower().StartsWith("a") ||
                   file.FileName.ToLower().StartsWith("b") ||
                   file.FileName.ToLower().StartsWith("c") ||
                   file.FileName.ToLower().StartsWith("d") ||
                   file.FileName.ToLower().StartsWith("e") ||
                   file.FileName.ToLower().StartsWith("f") ||
                   file.FileName.ToLower().StartsWith("g") ||
                   file.FileName.ToLower().StartsWith("h") ||
                   file.FileName.ToLower().StartsWith("i") ||
                   file.FileName.ToLower().StartsWith("j") ||
                   file.FileName.ToLower().StartsWith("k") ||
                   file.FileName.ToLower().StartsWith("l") ||
                   file.FileName.ToLower().StartsWith("m") ||
                   file.FileName.ToLower().StartsWith("n") ||
                   file.FileName.ToLower().StartsWith("o") ||
                   file.FileName.ToLower().StartsWith("p") ||
                   file.FileName.ToLower().StartsWith("q") ||
                   file.FileName.ToLower().StartsWith("r") ||
                   file.FileName.ToLower().StartsWith("s") ||
                   file.FileName.ToLower().StartsWith("t") ||
                   file.FileName.ToLower().StartsWith("u") ||
                   file.FileName.ToLower().StartsWith("v") ||
                   file.FileName.ToLower().StartsWith("w") ||
                   file.FileName.ToLower().StartsWith("y") ||
                   file.FileName.ToLower().StartsWith("z") ||
                   file.FileName.ToLower().StartsWith("."))
                    continue;
                      
                /*
                if (file.FileName.ToLower().Contains("الصف") ||
                    file.FileName.ToLower().Contains("طالب") ||
                    file.FileName.ToLower().Contains("الجزء") ||
                    file.FileName.ToLower().Contains("الفصل") |
                    file.FileName.ToLower().Contains("كتاب") |
                    file.FileName.ToLower().Contains("قرآن") ||
                    file.FileName.ToLower().Contains("مجلة") ||
                    file.FileName.ToLower().Contains("أسئلة") ||
                    file.FileName.ToLower().Contains("أخلاق") ||
                    file.FileName.ToLower().Contains("آية"))
                    continue;
                 */

                String fileName = MapPath("\\stream\\" + System.IO.Path.GetFileName(file.FileName));

                if (System.IO.File.Exists(fileName))
                    continue;

                file.SaveAs(fileName);
            }
        }
    }
}