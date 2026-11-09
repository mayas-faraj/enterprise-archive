using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newThread : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void postThread(object sender, EventArgs e)
    {
        if (txEmail.Text.IndexOf('.') == -1 || txEmail.Text.IndexOf('@') == -1)
        {
            rfvUnique.ErrorMessage = "please write valid email address";
            rfvUnique.Visible = true;
            rfvUnique.IsValid = false;
        }
        else
        {
            if (txName.Text.Trim() == "")
            {
                rfvUnique.ErrorMessage = "Thread Name Mustn't Empty";
                rfvUnique.Visible = true;
                rfvUnique.IsValid = false;
            }
            else
                if (txSubject.Text.Trim() == "")
                {
                    rfvUnique.ErrorMessage = "Subject Mustn't Empty";
                    rfvUnique.Visible = true;
                    rfvUnique.IsValid = false;
                }
                else
                {
                    if (txMessage.Text.Split(' ').Length < 5)
                    {
                        rfvUnique.ErrorMessage = "Message must have at least five words";
                        rfvUnique.Visible = true;
                        rfvUnique.IsValid = false;
                    }
                    else
                    {
                        String[] array = txName.Text.Split(' ');
                        Boolean valid = false;

                        for (Int32 i = 0; i < array.Length; i++)
                            if (txSubject.Text.ToLower().IndexOf(array[i].ToLower()) >= 0)
                            {
                                valid = true;
                                break;
                            }

                        if (!valid)
                        {
                            rfvUnique.ErrorMessage = "subject must have at least one common words with thread name";
                            rfvUnique.Visible = true;
                            rfvUnique.IsValid = false;
                        }

                        else
                        {
                            valid = false;

                            for (Int32 i = 0; i < array.Length; i++)
                                if (txMessage.Text.ToLower().IndexOf(array[i].ToLower()) >= 0)
                                {
                                    valid = true;
                                    break;
                                }

                            if (!valid)
                            {
                                rfvUnique.ErrorMessage = "message must have at least one common words with thread name";
                                rfvUnique.Visible = true;
                                rfvUnique.IsValid = false;
                            }
                            else
                            {
                                System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\Discussion.mdf") + ";Integrated Security=True;Connect Timeout=30;user instance=true;");
                                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("", connect);
                                Object old = null;

                                connect.Open();

                                cmd.CommandText = "select name from threads where name='" + txName.Text + "'";
                                old = cmd.ExecuteScalar();

                                if (old == null)
                                {
                                    String qStr = Request.QueryString["selectTopic"];
                                    cmd.CommandText = "insert into threads (name,topicId) values ('" + txName.Text + "'," + qStr + ") select @@identity;";
                                    String thrId = cmd.ExecuteScalar().ToString();


                                    cmd.CommandText = "insert into messages (threadId,subject,message,email) values ('" + thrId + "','" + txSubject.Text + "','" + txMessage.Text + "','" + txEmail.Text + "');";
                                    cmd.ExecuteNonQuery();

                                    Response.Redirect("messages.aspx?selectThread=" + thrId);
                                }
                                else
                                {
                                    rfvUnique.ErrorMessage = "please inter unique name of thread ...";
                                    rfvUnique.Visible = true;
                                    rfvUnique.IsValid = false;
                                }

                                connect.Close();
                            }
                        }
                    }
                }
        }
    }
}
   

