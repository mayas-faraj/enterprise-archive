using System;
using System.Net;

namespace WebSearcher
{
    public class Value
    {
        //public constructure region
        public Value()
        {
            PageName = Result = null;
        }

        public Value(String pageName, String result)
        {
            PageName = pageName;
            Result = result;
        }

        //public properties region
        public String PageName
        {
            get;
            set;
        }

        public String Result
        {
            get;
            set;
        }
    }

    public class ValuesCollection : System.Collections.CollectionBase
    {
        //public fuctions region
        public void Add(Value value)
        {
            List.Add(value);
        }

        public void Remove(Value value)
        {
            List.Remove(value);
        }

        public new void RemoveAt(Int32 index)
        {
            List.RemoveAt(index);
        }

        public Value this[Int32 index]
        {
            get
            {
                return (Value)this[index];
            }
            set
            {
                this[index] = value;
            }
        }
    }

    public static class Operations
    {
        //public functions region
        public static void AddValuesToCSV(ValuesCollection values)
        {
            System.IO.StreamWriter sr = new System.IO.StreamWriter(Options.CSVFileAddress, true);

            for (Int32 i = 0; i < values.Count; i++)
            {
                if (values[i] != null)
                    sr.WriteLine(values[i].PageName + speated + values[i].Result);
            }

            sr.Close();
        }

        public static void AddValueToCSV(Value value)
        {
            System.IO.StreamWriter sr = new System.IO.StreamWriter(Options.CSVFileAddress, true);

            if (value != null)
                sr.WriteLine(value.PageName + speated + value.Result);

            sr.Close();
        }

        public static String GetHTMLString(String uri)
        {
            WebClient webClient = new WebClient();
            String HTMLString = null;

            try
            {
                HTMLString = webClient.DownloadString("http://" + uri);
                HTMLString = HTMLString.Replace(Environment.NewLine, "");
                HTMLString = HTMLString.Replace("<b>", "");
                HTMLString = HTMLString.Replace("<i>", "");
                HTMLString = HTMLString.Replace("<u>", "");
                HTMLString = HTMLString.Replace("<br>", "");
                HTMLString = HTMLString.Replace("\n", "");
                HTMLString = HTMLString.Replace("</b>", "");
                HTMLString = HTMLString.Replace("</i>", "");
                HTMLString = HTMLString.Replace("</u>", "");
                HTMLString = HTMLString.Replace("<center>", "");
                HTMLString = HTMLString.Replace("</center>", "");
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.Message, ex.Source, System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
            }

            return HTMLString;
        }

        public static String GetSearcherUri(String searchWords)
        {
            searchWords = searchWords.Trim().Replace(' ', '+');
            return "www.ask.com/web?qsrc=1&o=0&l=dir&q=" + searchWords;
        }

        public static String GetEmails(String HTMLCode)
        {
            if (HTMLCode != null && HTMLCode != "")
            {
                Int32 startIndex = 0, endIndex = -1;
                String invalidCharacters = " !#$%^&*()+=\\|\'\":;,*?`/~<>[]{}";
                Char emailSperator = ',';
                String emails = null;

                HTMLCode = HTMLCode.ToLower();
                HTMLCode = HTMLCode.Replace("[at]", "@");
                HTMLCode = HTMLCode.Replace("(at)", "@");

                while (true)
                {
                    endIndex = HTMLCode.Substring(startIndex).IndexOf('@');

                    if (endIndex == -1)
                        break;

                    endIndex += startIndex;
                    startIndex = endIndex - 1;

                    while (startIndex >= 0 && invalidCharacters.IndexOf(HTMLCode[startIndex]) == -1)
                        startIndex--;

                    endIndex++;

                    while (endIndex < HTMLCode.Length && invalidCharacters.IndexOf(HTMLCode[endIndex]) == -1)
                        endIndex++;

                    String email = HTMLCode.Substring(startIndex + 1, endIndex - startIndex - 1) + emailSperator;

                    if (Operations.CheckValidEmail(email))
                        if (emails == null || emails.IndexOf(email) == -1)
                            emails += email;

                    startIndex = endIndex + 1;
                }

                if (emails != null)
                    return emails.Substring(0, emails.Length - 1);
            }

            return "";
        }

        public static String GetHREF(String HTMLCode)
        {
            if (HTMLCode != null && HTMLCode != "")
            {
                Int32 startIndex = 0, endIndex = -1;
                String invalidCharacters = " !#$%^&*()+=\\|\'\":;,*?`~<>[]{}";
                String webs = null;

                HTMLCode = HTMLCode.ToLower();
                HTMLCode = HTMLCode.Replace("w3", "www.");

                while (true)
                {
                    endIndex = HTMLCode.IndexOf("www.", startIndex);

                    if (endIndex == -1)
                        break;

                    startIndex = endIndex;

                    while (endIndex < HTMLCode.Length && invalidCharacters.IndexOf(HTMLCode[endIndex]) == -1)
                        endIndex++;

                    String webUri = HTMLCode.Substring(startIndex, endIndex - startIndex) + speated;

                    if (Operations.CheckValidWeb(webUri))
                        if (webs == null || webs.IndexOf(webUri) == -1)
                            webs += webUri;

                    startIndex = endIndex + 1;
                }

                if (webs != null)
                    return webs.Substring(0, webs.Length - 1);
            }
            return "";
        }

        public static Boolean CheckValidEmail(String emailAddress)
        {
            if (emailAddress.IndexOf('@') < emailAddress.LastIndexOf('.'))
                return true;
            else
                return false;
        }

        public static Boolean CheckValidWeb(String UriAddress)
        {
            if (UriAddress.IndexOf('.') != -1 && UriAddress.IndexOf('.') != UriAddress.LastIndexOf('.'))
            {
                foreach (String uri in Options.NotValidURIs)
                {
                    if (UriAddress.Length >= uri.Length && UriAddress.Substring(0, uri.Length) == uri)
                        return false;
                }

                return true;
            }
            else
                return false;
        }

        public static void WebSearcher(String uri, Int32 stoppingCondition, ref String result)
        {
            if (Options.Pause)
            {
                result += "Paused!" + Environment.NewLine;
                return;
            }

            stoppingCondition++;
            result += uri + Environment.NewLine;

            if (stoppingCondition >= Options.StoppingPagesNumber)
                return;

            String HTML = Operations.GetHTMLString(uri);

            if (HTML == null || HTML == "")
                return;

            String[] webs = Operations.GetHREF(HTML).Split(speated);
            String emails = Operations.GetEmails(HTML);

            if (emails != null && emails != "")
                Operations.AddValueToCSV(new Value(uri, emails));

            if (webs == null || webs.Length == 0)
                return;
            else
                foreach (String web in webs)
                    WebSearcher(web, stoppingCondition, ref result);
        }

        //private fields value
        private const Char speated = ';';
    }

    public static class Options
    {
        //public properties region
        public static Int32 StoppingPagesNumber
        {
            get;
            set;
        }

        public static String CSVFileAddress
        {
            get;
            set;
        }

        public static Boolean Pause
        {
            get;
            set;
        }

        public static String[] NotValidURIs
        {
            get;
            set;
        }
    }
}
