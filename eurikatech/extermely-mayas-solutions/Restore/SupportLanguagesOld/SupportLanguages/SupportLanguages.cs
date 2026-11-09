using System;
using System.Data;

namespace Maniyat
{
    public struct DatabaseSchema
    {
        /*
        CREATE TABLE Languages
        (
        id INT PRIMARY KEY IDENTITY (1, 1),
        name NVARCHAR(100) UNIQUE NOT NULL,
        logo NVARCHAR(200),
        prefix CHAR(2),
        comment NVARCHAR(600),
        helpFileName NVARCHAR(200), 
        rightToLeft BIT DEFAULT 0
        );

        CREATE TABLE words
        (
        id INT NOT NULL,
        languageId INT FOREIGN KEY REFERENCES Languages(Id),
        word NVARCHAR (400) unique
        );
        */

        public const Int32 MAX_LENGTH_NAME = 50;
        public const Int32 MAX_LENGTH_DESC = 300;
        public const Int32 MAX_LENGTH_HELPFILENAME = 100;
        public const Int32 MAX_LENGTH_WORD = 200;
        public const Int32 MAX_LENGTH_LOGO = 100;
        public const Int32 MAX_LENGTH_PREFIX = 2;

        public const String WORDS_TABLE_NAME = "words";
        public const String WORDS_ID_FIELD_NAME = "id";
        public const String WORDS_LANGUAGEID_FIELD_NAME = "languageId";
        public const String WORDS_WORD_FIELD_NAME = "word";

        public const String LANGUAGES_TABLE_NAME = "languages";
        public const String LANGUAGES_ID_FIELD_NAME = "id";
        public const String LANGUAGES_NAME_FIELD_NAME = "name";
        public const String LANGUAGES_LOGO_FIELD_NAME = "logo";
        public const String LANGUAGES_PREFIX_FIELD_NAME = "prefix";
        public const String LANGUAGES_DESC_FIELD_NAME = "comment";
        public const String LANGUAGES_HELPFILENAME_FIELD_NAME = "helpFileName";
        public const String LANGUAGES_RIGHTTOLEFT_FIELD_NAME = "rightToLeft";     
    }

    public class Language
    {
        //constructurs of class
        public Language(Int32 id, String name)
        {
            this.id = id;
            this.name = name;
            desc = helpFileName = "";
            rightToLeft = false;
        }

        public Language(Int32 id, String name, String prefix, String description, String helpFileName, Boolean rightToLeft)
        {
            this.id = id;
            this.name = name;
            this.prefix = prefix;
            this.desc = description;
            this.helpFileName = helpFileName;
            this.rightToLeft = rightToLeft;
        }

        //properties of class
        public Int32 Id
        {
            get
            {
                return id;
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
                if (value.Length <= DatabaseSchema.MAX_LENGTH_NAME)
                    name = value;
                else
                    name = value.Substring(0, DatabaseSchema.MAX_LENGTH_NAME);
            }
        }

        public String Logo
        {
            get
            {
                return logo;
            }
            set
            {
                if (value.Length <= DatabaseSchema.MAX_LENGTH_LOGO)
                    helpFileName = value;
                else
                    helpFileName = value.Substring(0, DatabaseSchema.MAX_LENGTH_LOGO);
            }
        }

        public String Prefix
        {
            get
            {
                return prefix;
            }
            set
            {
                if (value.Length <= DatabaseSchema.MAX_LENGTH_PREFIX)
                    prefix = value;
                else
                    prefix = value.Substring(0, DatabaseSchema.MAX_LENGTH_PREFIX);
            }
        }

        public String Desc
        {
            get
            {
                return desc;
            }
            set
            {
                if (value.Length <= DatabaseSchema.MAX_LENGTH_DESC)
                    desc = value;
                else
                    desc = value.Substring(0, DatabaseSchema.MAX_LENGTH_DESC);
            }
        }

        public String HelpFileName
        {
            get
            {
                return helpFileName;
            }
            set
            {
                if (value.Length <= DatabaseSchema.MAX_LENGTH_HELPFILENAME)
                    helpFileName = value;
                else
                    helpFileName = value.Substring(0, DatabaseSchema.MAX_LENGTH_HELPFILENAME);
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

        public IDbCommand Command
        {
            get
            {
                return command;
            }
            set
            {
                command = value;
            }
        }

        public IDataReader DataReader
        {
            get
            {
                return dataReader;
            }
            set
            {
                dataReader = value;
            }
        }

        //functions of class
        public String[][] DbGetWords()
        {
            //precondition: command object available
            String[][] result;
            Int32 n, i = 0;

            if (command == null)
                return null;
            else
            {
                command.CommandText = "SELECT COUNT(" + DatabaseSchema.WORDS_ID_FIELD_NAME + ") FROM " + DatabaseSchema.WORDS_TABLE_NAME + " WHERE " + DatabaseSchema.WORDS_LANGUAGEID_FIELD_NAME + " = " + this.id.ToString();
                //detect number of elements
                n = Convert.ToInt32(command.ExecuteScalar());

                result = new String[2][];
                result[0] = new String[n];
                result[1] = new String[n];

                command.CommandText = "SELECT " + DatabaseSchema.WORDS_ID_FIELD_NAME + "," + DatabaseSchema.WORDS_WORD_FIELD_NAME + " FROM " + DatabaseSchema.WORDS_TABLE_NAME + " WHERE " + DatabaseSchema.WORDS_LANGUAGEID_FIELD_NAME + " = " + this.id.ToString();
                //critical operation
                dataReader = command.ExecuteReader();

                //language selected value to array
                while (dataReader.Read())
                {
                    result[0][i] = dataReader[DatabaseSchema.WORDS_ID_FIELD_NAME].ToString();
                    result[1][i] = dataReader[DatabaseSchema.WORDS_WORD_FIELD_NAME].ToString();
                    i++;
                }

                return result;
                //postcondition : result is the state of language table
            }
        }

        public Boolean DbAddWord(Int32 wordId, String word)
        {
            //precondition:wordId must unique in database table,command object available
            if (command == null)
                return false;
            else
            {
                //check paramerter words if length of stirng is valid
                if (word.Length > DatabaseSchema.MAX_LENGTH_WORD)
                    word = word.Substring(0, DatabaseSchema.MAX_LENGTH_WORD);

                command.CommandText = "INSERT INTO " + DatabaseSchema.WORDS_TABLE_NAME + " (" + DatabaseSchema.WORDS_ID_FIELD_NAME + "," + DatabaseSchema.WORDS_LANGUAGEID_FIELD_NAME + "," + DatabaseSchema.WORDS_WORD_FIELD_NAME + ") VALUES (" + wordId.ToString() + "," + this.id + ",N'" + word + "');";
                //critical operation
                command.ExecuteNonQuery();
                return true;
            }
            //postcondition:database table words field word=field word+word
        }

        public Boolean DbRemoveWord(Int32 wordId)
        {
            //precondition:command object available
            if (command == null)
                return false;
            else
            {
                command.CommandText = "DELETE FROM " + DatabaseSchema.WORDS_TABLE_NAME + " WHERE " + DatabaseSchema.WORDS_LANGUAGEID_FIELD_NAME + " = " + this.id.ToString() + " AND " + DatabaseSchema.WORDS_ID_FIELD_NAME + " = " + wordId.ToString();
                //critical operation
                command.ExecuteNonQuery();
                return true;
            }
            //postcondition:if wordId not exist nothing and if wordId exist then database table words field word=field word-word(id)
        }

        public Boolean DbRemoveWord(String word)
        {
            //precondition:command object available
            if (command == null)
                return false;
            else
            {
                command.CommandText = "DELETE FROM " + DatabaseSchema.WORDS_TABLE_NAME + " WHERE " + DatabaseSchema.WORDS_WORD_FIELD_NAME + " = N'" + word + "'";
                //critical operation
                command.ExecuteNonQuery();
                return true;
            }
            //postcondition:if wordId not exist nothing and if wordId exist then database table words field word=field word-word
        }

        public override string ToString()
        {
            return Name;
        }

        //private datamember
        private Int32 id;
        private String name;
        private String logo;
        private String prefix;
        private String desc;
        private String helpFileName;
        private Boolean rightToLeft;
        private System.Data.IDbCommand command;
        private System.Data.IDataReader dataReader;
    }

    public class Languages
    {
        //constructor of class
        public Languages()
        {
            selectedLanguage = defaultLanguage = null;
            languages = null;
        }

        //properies of class
        public Language SelectedLanguage
        {
            get
            {
                return selectedLanguage;
            }

            set
            {
                selectedLanguage = value;
            }
        }

        public Language DefaultLanguage
        {
            get
            {
                return defaultLanguage;
            }
            set
            {
                defaultLanguage = value;
            }
        }

        /// <summary>
        /// Get count of languages contained in this object
        /// </summary>
        public Int32 Count
        {
            get
            {
                return this.languages.Length;
            }
        }

        /// <summary>
        /// get or set language item contained in this object by its index
        /// </summary>
        /// <param name="index">zero-based value determine index of language in languages array</param>
        /// <returns>return language item of index in languages array , if index out of range , return null for get , do nothing for set</returns>
        public Language this[Int32 index]
        {
            get
            {
                //return language item for valid index
                if (index < languages.Length)
                    return languages[index];
                else
                    //index out of range
                    return null;
            }
            set
            {
                if (index < languages.Length)
                    languages[index] = value;
                //index out of range - do nothing
            }
        }

        /// <summary>
        /// get or set language item contained in this object by language name
        /// </summary>
        /// <param name="languageName">string value determine selected language</param>
        /// <returns>return languag item with havel name of (param)languageName , if suitable language after searching is not found , return null for get , do nothing for set</returns>
        public Language this[String languageName]
        {
            get
            {
                //searching for language witch have name (param)languageName
                for (Int32 i = 0; i < languages.Length; i++)
                    if (languages[i].Name == languageName)
                        return languages[i];

                //searching not found
                return null;
            }
            set
            {
                //searching for language witch have name (param)languageName
                for (Int32 i = 0; i < languages.Length; i++)
                    if (languages[i].Name == languageName)
                    {
                        languages[i] = value;
                        break;
                    }
                //searching not found - do nothing
            }
        }

        public IDbCommand Command
        {
            get
            {
                return command;
            }
            set
            {
                command = value;
            }
        }

        public IDataReader DataReader
        {
            get
            {
                return dataReader;
            }
            set
            {
                dataReader = value;
            }
        }

        //functions fo class
        public Boolean DbAddLanguage(Language language)
        {
            //precondition : language is not null , db command available
            if (command == null || language == null)
                return false;
            else
            {
                command.CommandText = "INSERT INTO " + DatabaseSchema.LANGUAGES_TABLE_NAME + " (" + DatabaseSchema.LANGUAGES_NAME_FIELD_NAME + "," + DatabaseSchema.LANGUAGES_PREFIX_FIELD_NAME + "," + DatabaseSchema.LANGUAGES_DESC_FIELD_NAME + "," + DatabaseSchema.LANGUAGES_HELPFILENAME_FIELD_NAME + "," + DatabaseSchema.LANGUAGES_RIGHTTOLEFT_FIELD_NAME + ") VALUES (N'" + language.Name + "','" + language.Prefix + "',N'" + language.Desc + "',N'" + language.HelpFileName + "','" + language.RightToLeft + "');";
                //critical operation
                command.ExecuteNonQuery();
                return true;
            }
            //postcondition : languages table =languages table+language
        }

        public Boolean DbRemoveLanguage(Language language)
        {
            //precondition : language is not null ,db command available
            if (command == null || language == null)
                return false;
            else
            {
                command.CommandText = "DELETE FROM " + DatabaseSchema.WORDS_TABLE_NAME + " WHERE " + DatabaseSchema.WORDS_LANGUAGEID_FIELD_NAME + " = " + language.Id;
                //delete related fields
                command.ExecuteNonQuery();

                command.CommandText = "DELETE FROM " + DatabaseSchema.LANGUAGES_TABLE_NAME + " WHERE " + DatabaseSchema.LANGUAGES_ID_FIELD_NAME + " = " + language.Id;
                //critical operation
                command.ExecuteNonQuery();
                return true;
            }
            //postcondition : languages table =languages table+language
        }

        public Boolean DbLoadLanguages()
        {
            //precondition : db command object available
            if (command == null)
                return false;
            else
            {
                Int32 n, i = 0;

                command.CommandText = "SELECT COUNT(*) FROM " + DatabaseSchema.LANGUAGES_TABLE_NAME;
                //number of languages in database
                n = Convert.ToInt32(command.ExecuteScalar());

                languages = new Language[n];
               
                command.CommandText = "SELECT * FROM " + DatabaseSchema.LANGUAGES_TABLE_NAME;
                //get languages data
                dataReader = command.ExecuteReader();


                while (dataReader.Read())
                    //critical operation
                    languages[i++] = new Language(Convert.ToInt32(dataReader[DatabaseSchema.LANGUAGES_ID_FIELD_NAME]), dataReader[DatabaseSchema.LANGUAGES_NAME_FIELD_NAME].ToString(), dataReader[DatabaseSchema.LANGUAGES_PREFIX_FIELD_NAME].ToString(), dataReader[DatabaseSchema.LANGUAGES_DESC_FIELD_NAME].ToString(), dataReader[DatabaseSchema.LANGUAGES_HELPFILENAME_FIELD_NAME].ToString(), Convert.ToBoolean(dataReader[DatabaseSchema.LANGUAGES_RIGHTTOLEFT_FIELD_NAME]));

                return true;
                //postcondition : languages array filled with item from database
            }
        }

        /// <summary>
        /// get sutiable word from database with wordId depend of selected language
        /// </summary>
        /// <param name="wordId">identity number for word in selected language</param>
        /// <returns>if word found , return suitable word , else return empty string
        /// ,if command object is null , return null
        /// </returns>
        public String DbReadWord(Int32 wordId)
        {
            //precondition : db command is available
            if (command == null)
                return null;
            else
            {
                command.CommandText = "SELECT " + DatabaseSchema.WORDS_WORD_FIELD_NAME + " FROM " + DatabaseSchema.WORDS_TABLE_NAME + " WHERE " + DatabaseSchema.WORDS_LANGUAGEID_FIELD_NAME + " = " + this.selectedLanguage.Id.ToString() + " AND " + DatabaseSchema.WORDS_ID_FIELD_NAME + " = " + wordId.ToString();
                //critical operation
                return command.ExecuteScalar().ToString();
            }
            //postcondition : if wordId is exitst return suitable word , or return empty string
        }

        /// <summary>
        /// get suitable word in language : SelectedLanguage by defaultword in language : DefaultLanguage properties
        /// </summary>
        /// <param name="defaultWord">string value detect word in language : DefaultLanguage proretey</param>
        /// <returns>if defaultWord found in database and suitable word in selected language found , return word in selected language
        /// , or return (param)defautWord , also (param)defaultWord returned if command object is null
        /// </returns>
        public String DbReadWord(String defaultWord)
        {
            //precondition : db command is available
            if (command == null || this.selectedLanguage == this.defaultLanguage)
                return defaultWord;
            else
            {
                String id;
                command.CommandText = "SELECT " + DatabaseSchema.WORDS_ID_FIELD_NAME + " FROM " + DatabaseSchema.WORDS_TABLE_NAME + " WHERE " + DatabaseSchema.WORDS_WORD_FIELD_NAME + " = N'" + defaultWord + "'";
                //get suitable id with parameter defaultword
                id = Convert.ToString(command.ExecuteScalar());

                //word not exist
                if (id == "")
                    return defaultWord;

                command.CommandText = "SELECT " + DatabaseSchema.WORDS_WORD_FIELD_NAME + " FROM " + DatabaseSchema.WORDS_TABLE_NAME + " WHERE " + DatabaseSchema.WORDS_LANGUAGEID_FIELD_NAME + " = " + this.selectedLanguage.Id + " AND " + DatabaseSchema.WORDS_ID_FIELD_NAME + " = " + id;
                //critical operation
                return Convert.ToString(command.ExecuteScalar());
            }
            //postcondition : if selected language is default ,return default word is return suitable word
        }

        public String GetImageName(String imageName)
        {
            //return string value detect image numer combine with language prefix
            return System.IO.Path.Combine(System.IO.Path.GetDirectoryName(imageName), System.IO.Path.GetFileNameWithoutExtension(imageName) + "_" + DatabaseSchema.LANGUAGES_PREFIX_FIELD_NAME + System.IO.Path.GetExtension(imageName));
        }

        //private datamember
        private Language[] languages;

        private Language selectedLanguage;
        private Language defaultLanguage;
        private System.Data.IDbCommand command;
        private System.Data.IDataReader dataReader;
    }
}
