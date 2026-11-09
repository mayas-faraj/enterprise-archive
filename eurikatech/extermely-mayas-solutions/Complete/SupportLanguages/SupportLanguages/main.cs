using System;

namespace Maniyat
{

    public class Language
    {
        //public constructures region
        public Language()
        {
            name = internationalName = code = logoPath = description = "";
            rightToLeft = false;
        }

        public Language(String path)
        {
            name = internationalName = code = logoPath = description = "";
            this.path = path;
        }

        //public properties region
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

        public String InternationalName
        {
            get
            {
                return internationalName;
            }
            set
            {
                internationalName = value;
            }
        }

        public String Code
        {
            get
            {
                return code;
            }
            set
            {
                code = value;
            }
        }

        public String LogoPath
        {
            get
            {
                return logoPath;
            }
            set
            {
                logoPath = value;
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

        public Boolean IsDefaultLanguage
        {
            get
            {
                return (path.IndexOf('.') == -1);
            }
        }

        public Boolean RightToLeft
        {
            get
            {
                return rightToLeft;
            }
            set
            {
                rightToLeft = value;
            }
        }

        public static Language FromLanguage
        {
            get
            {
                return fromLanguage;
            }
            set
            {
                fromLanguage = value;
            }
        }

        public static Language ToLanguage
        {
            get
            {
                return toLanguage;
            }
            set
            {
                toLanguage = value;
            }
        }

        //public functions region
        public String Translate(String statement)
        {
            //precondition:none

            //set to,from languages value
            if ((toLanguage != this && toLanguage != null) || (toLanguage == null && !this.IsDefaultLanguage))
            {
                if (toLanguage == null || toLanguage.IsDefaultLanguage)
                    fromLanguage = null;
                else
                    fromLanguage = toLanguage;

                if (this.IsDefaultLanguage)
                    toLanguage = null;
                else
                    toLanguage = this;
            }

            //remove translate from lang0 to lang0
            if (!((fromLanguage == null && this.IsDefaultLanguage) || fromLanguage == this))
                if (fromLanguage == null)
                {
                    //default to lang0
                    if (listWords == null)
                        loadWords();

                    return search(statement);
                }
                else
                {
                    if (toLanguage == null)
                        //lang0 to default
                        return fromLanguage.ReverseTranslate(statement);
                    else
                    {
                        //lang0 to lang1
                        String result = fromLanguage.ReverseTranslate(statement);
                        return search(result);
                    }
                }

            //return value
            return statement;

            //postcondition: none
            //return value: translation value if the word exists, else return the same statement
        }

        public String ReverseTranslate(String statement)
        {
            //precondtion: none
            if (!IsDefaultLanguage)
            {
                //default language not have reverse translate
                if (listWords == null)
                    loadWords();

                //reverse search
                return reverseSearch(statement);
            }

            return statement;
        }

        public String ImageName(String name)
        {
            //precondition:none
            if (!this.IsDefaultLanguage)
            {
                String path = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(this.path), name);

                if (System.IO.File.Exists(path))
                    return path;
            }

            return name;
            //return value: return the same name of image in the langs folder, if it exists, return it, else return the same name
        }

        public override String ToString()
        {
            return Name;
        }

        //private functions region
        private String search(String value)
        {
            //precondition: listwords in file is sorted
            value = value.ToLower();

            if (listWords == null)
                loadWords();

            Int32 start = 0;
            Int32 mid = 0;
            Int32 end = listWords.Length - 1;

            //binary search
            while (start <= end)
            {
                mid = Convert.ToInt32((start + end) / 2);

                if (listWords[mid][0].CompareTo(value) == 0)
                    return listWords[mid][1];
                else
                    if (listWords[mid][0].CompareTo(value) < 0)
                        start = mid + 1;
                    else
                        end = mid - 1;
            }

            return value;
            //return value: if the default word found, return it, else return parameter value
        }

        private String reverseSearch(String value)
        {
            //precondition: none
            value = value.ToLower();

            if (listWords == null)
                loadWords();

            //linear search, find default language from alternative language
            for (Int32 i = 0; i <= listWords.GetUpperBound(0); i++)
                if (listWords[i][1] == value)
                    return listWords[i][0];

            return value;
            //return value: if the default word found, return it, else return parameter value
        }

        private void loadWords()
        {
            //precondition: file is exist in path, file content is encypted in sa11 system
  
            String file = null;
            String[] values = null;

            //load words from translator file
            using (System.IO.StreamReader sr = new System.IO.StreamReader(path))
            {
                file = sr.ReadToEnd();
            }

            //encrypty and splite file content
            if (file != null || file != "")
            {
                file = Toning.SA11Reverce(file);
                values = file.Split(new String[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);

                //get words
                if (values != null && values.Length > 0)
                {
                    listWords = new String[values.Length][];

                    for (Int32 i = 0; i <= listWords.GetUpperBound(0); i++)
                        listWords[i] = new String[2];

                    for (Int32 i = 0; i <= listWords.GetUpperBound(0); i++)
                    {
                        if (values[i].IndexOf(';') >= 0)
                        {
                            listWords[i][0] = values[i].Substring(0, values[i].IndexOf(';'));
                            listWords[i][1] = values[i].Substring(values[i].IndexOf(';') + 1);
                        }
                    }
                }
                else
                    listWords = new String[0][];
            }
        }

        //private fields region
        private String name;
        private String internationalName;
        private String code;
        private String logoPath;
        private String description;
        private String path;
        private Boolean rightToLeft;
        private String[][] listWords;
        private static Language fromLanguage;
        private static Language toLanguage;
    }

    public class LanguagesCollection : System.Collections.CollectionBase
    {
        //public properites region
        public Language this[Int32 index]
        {
            get
            {
                return (Language)List[index];
            }
            set
            {
                List[index] = value;
            }
        }

        //public functions region
        public void Add(Language language)
        {
            List.Add(language);
        }

        public void Remove(Language language)
        {
            List.Remove(language);
        }

        /// <summary>
        /// Load Languages in the languages folder and fill the list with valid languages
        /// </summary>
        /// <returns>
        /// if one language at least loaded succefully, return true, else return false
        /// </returns>
        public Boolean LoadLanguages()
        {
            //precondition: none
            Boolean result = false;

            foreach (String dir in System.IO.Directory.GetDirectories(LANGUAGE_DIRECTORY_NAME))
            {
                if (System.IO.File.Exists(System.IO.Path.Combine(dir, INFO_FILE_NAME))
                    && System.IO.File.Exists(System.IO.Path.Combine(dir, LOGO_FILE_NAME)))
                {
                    Language language;

                    if (System.IO.File.Exists(System.IO.Path.Combine(dir, TRANSLATOR_FILE_NAME)))
                        language = new Language(System.IO.Path.Combine(dir, TRANSLATOR_FILE_NAME));
                    else
                        language = new Language(dir);

                    loadValues(language, dir);
                    this.Add(language);
                    result = true;
                }
            }

            //postcondition: fill the List with current languages in folder
            return result; ;
        }

        //public consts region
        public const String TRANSLATOR_FILE_NAME = "translator.mln";

        //private functions region
        private void loadValues(Language language, String path)
        {
            String file = null;
            String[] values = null;

            //load info from infofile
            using (System.IO.StreamReader sr = new System.IO.StreamReader(System.IO.Path.Combine(path, INFO_FILE_NAME)))
            {
                file = Toning.SA11Reverce(sr.ReadToEnd());
                sr.Close();
            }

            values = file.Split(new String[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);

            if (values != null)
            {
                for (Int32 i = 0; i < values.Length; i++)
                {
                    if (values[i] != null && values[i] != "" && values[i][0] != '#' && values[i].IndexOf('=') >= 0 && values[i].IndexOf('=') < values[i].Length - 1)
                    {
                        String value = values[i].Substring(values[i].IndexOf('=') + 1);

                        switch (values[i].Substring(0, values[i].IndexOf('=')).ToLower())
                        {
                            case KW_CODE:
                                language.Code = value;
                                break;
                            case KW_DESCRIPTION:
                                language.Description = value;
                                break;
                            case KW_ENGLISH_NAME:
                                language.InternationalName = value;
                                break;
                            case KW_NAME:
                                language.Name = value;
                                break;
                            case KW_RIGHTTOLEFT:
                                language.RightToLeft = Boolean.Parse(value);
                                break;
                        }
                    }
                }
            }

            
            //save logo
            if (System.IO.File.Exists(System.IO.Path.Combine(path, LOGO_FILE_NAME)))
                language.LogoPath = System.IO.Path.Combine(path, LOGO_FILE_NAME);
        }
       
        //private consts region
        private const String INFO_FILE_NAME = "info.mln";
        private const String LOGO_FILE_NAME = "logo.mln";
        private const String LANGUAGE_DIRECTORY_NAME = "langs";

        private const String KW_NAME = "name";
        private const String KW_ENGLISH_NAME = "internationalname";
        private const String KW_CODE = "code";
        private const String KW_DESCRIPTION = "description";
        private const String KW_RIGHTTOLEFT = "righttoleft";
    }

    public static class Toning
    {
        static Toning()
        {
            coding = new StringEncoder.Coding();
            coding.BitsNumber = 16;

            partialFilpKey = new Boolean[] { false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true };
            shiftRangeLocation = 20;
        }

        public static String SA11Reverce(String statement)
        {
            return coding.ShiftRange(coding.ParitalFlip(statement, partialFilpKey), -shiftRangeLocation);
        }

        private static StringEncoder.Coding coding;
        private static Boolean[] partialFilpKey;
        private static Int32 shiftRangeLocation;

    }
}
