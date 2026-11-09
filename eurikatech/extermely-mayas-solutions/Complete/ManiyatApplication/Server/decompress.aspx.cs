using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Server
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String dir = Request["dir"];
            String alias = Request["alias"];
            String max = Request["max"];

            if (dir != null && dir != "")
            {
                String dirName = MapPath(dir);

                System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(dirName);
                
                if (di.Exists)
                {
                    if (alias != null && alias != "")
                        dirName = MapPath(alias);

                    
                    String dt = DateTime.Now.ToString("_d-M-yyyy");
                    String log = dirName + "_log" + dt + ".txt";
                    String zip = dirName + dt + ".zip";

                    System.IO.Packaging.Package pakage = null;
                    System.IO.Packaging.PackagePart part = null;
                    System.IO.StreamWriter sw = null;

                    try
                    {
                        pakage = System.IO.Packaging.ZipPackage.Open(zip, System.IO.FileMode.Create, System.IO.FileAccess.ReadWrite);
                        
                        sw = new StreamWriter(log, false);

                        Int32 i = 0;
                        sw.WriteLine("starting...<br/>");

                        foreach (System.IO.FileInfo file in di.GetFiles())
                        {
                            if (max != null && max != "")
                                if (i >= Int32.Parse(max))
                                    break;

                            i++;

                            try
                            {
                                part = pakage.CreatePart(new Uri("/" + i.ToString() + "." + System.IO.Path.GetExtension(file.Name), UriKind.Relative), System.Net.Mime.MediaTypeNames.Application.Zip, System.IO.Packaging.CompressionOption.Maximum);
                                sw.WriteLine(file.Name + " ; " + i.ToString());
                                CopyStream(file.OpenText().BaseStream, part.GetStream());
                            }
                            catch (Exception ex)
                            {
                                Response.Write(ex.Message + "<br/>");
                            }
                            catch
                            {
                                Response.Write("unexcepted error in file part" + "<br/>");
                            }
                        }

                        Response.Write("Sir, " + i.ToString() + " file compressed...<br/>");
                        Response.Write("the compressed files path is<br/>" + zip + "<br/> and the log file path is<br/>" + log);
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message + "<br/>");
                    }
                    catch
                    {
                        Response.Write("Unknown Error!<br/>");
                    }
                    finally
                    {
                        if (sw != null)
                            sw.Close();

                        if (pakage != null)
                            pakage.Close();
                    }
                }
                else
                    Response.Write("Directory not found!<br/>");
            }
            else
                Response.Write("dir parameter is requiered, alias, max are opitional!");     
        }

        private void CopyStream(Stream source, Stream target)
        {
            const int bufSize = 0x1000;
            byte[] buf = new byte[bufSize];
            int bytesRead = 0;

            try
            {
                while ((bytesRead = source.Read(buf, 0, bufSize)) > 0)
                    target.Write(buf, 0, bytesRead);

                source.Close();
                target.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + "<br/>");
            }
            catch
            {
                Response.Write("Unknown Error!<br/>");
            }
            finally
            {
                if (source != null)
                    source.Close();

                if (target != null)
                    target.Close();
            } 
        }
    }
}