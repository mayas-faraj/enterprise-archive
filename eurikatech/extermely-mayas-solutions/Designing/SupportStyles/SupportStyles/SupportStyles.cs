using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace Maniyat
{
    public class DatabaseSchema
    {
        /*
        CREATE TABLE Styles
        (
        id INT PRIMARY KEY IDENTITY (1, 1),
        name NVARCHAR(300) DEFAULT 'no name',
        textFontName VARCHAR(150) DEFAULT '',
        textFontForecolor INT DEFAULT - 16777216,
        textFontBackcolor INT DEFAULT - 1,
        textFontSize FLOAT DEFAULT 11,
        textFontBold BIT DEFAULT 'false', 
        textFontItalic BIT DEFAULT 'false',
        textFontUnderline BIT DEFAULT 'false',
        textFontStrikeout BIT DEFAULT 'false',
        headerFontName VARCHAR(150) DEFAULT '', 
        headerFontForecolor INT DEFAULT - 16777216,
        headerFontBackcolor INT DEFAULT - 1,
        headerFontSize FLOAT DEFAULT 11,
        headerFontBold BIT DEFAULT 'false', 
        headerFontItalic BIT DEFAULT 'false',
        headerFontUnderline BIT DEFAULT 'false',
        headerFontStrikeout BIT DEFAULT 'false',
        subHeaderFontName VARCHAR(150) DEFAULT '', 
        subHeaderFontForecolor INT DEFAULT - 16777216,
        subHeaderFontBackcolor INT DEFAULT - 1,
        subHeaderFontSize FLOAT DEFAULT 11,
        subHeaderFontBold BIT DEFAULT 'false',
        subHeaderFontItalic BIT DEFAULT 'false',
        subHeaderFontUnderline BIT DEFAULT 'false',
        subHeaderFontStrikeout BIT DEFAULT 'false',
        cmdFontName VARCHAR(150) DEFAULT '',
        cmdFontForecolor INT DEFAULT - 16777216,
        cmdFontBackcolor INT DEFAULT - 1,
        cmdFontSize FLOAT DEFAULT 11,
        cmdFontBold BIT DEFAULT 'false', 
        cmdFontItalic BIT DEFAULT 'false',
        cmdFontUnderline BIT DEFAULT 'false',
        cmdFontStrikeout BIT DEFAULT 'false',
        FormWidth INT DEFAULT -1,
        FormHeight INT DEFAULT -1, 
        );

        CREATE TABLE StyleColors
        (
        id INT PRIMARY KEY IDENTITY(1,1),
        styleId INT FOREIGN KEY REFERENCES Styles(id),
        color INT DEFAULT -16777216
        );

        CREATE TABLE StyleImages
        (
        id INT PRIMARY KEY IDENTITY(1,1),
        styleId INT FOREIGN KEY REFERENCES Styles(id),
        image NVARCHAR(400)
        );
        
        CREATE TABLE StyleSounds
        (
        id INT PRIMARY KEY IDENTITY(1,1),
        styleId INT FOREIGN KEY REFERENCES Styles(id),
        sound NVARCHAR(400)
        ); 

        CREATE TABLE StyleTexts
        (
        id INT PRIMARY KEY IDENTITY(1,1),
        styleId INT FOREIGN KEY REFERENCES Styles(id),
        text NVARCHAR(600)
        );
        */

        public const Int32 MAX_LENGTH_FONTNAME = 150;
        public const Int32 MAX_LENGTH_NAME = 150;
        public const Int32 MAX_LENGTH_IMAGE = 200;
        public const Int32 MAX_LENGTH_TEXT = 300;
        public const Int32 MAX_LENGTH_SOUND = 200;

        public const String STYLES_TABLE = "styles";
        public const String STYLES_FIELD_ID = "id";
        public const String STYLES_FIELD_TEXTFONTNAME = "textFontName";
        public const String STYLES_FIELD_TEXTFORECOLOR = "textFontColor";
        public const String STYLES_FIELD_TEXTBACKCOLOR = "textBackColor";
        public const String STYLES_FIELD_TEXTFONTSIZE = "textFontSize";
        public const String STYLES_FIELD_TEXTFONTBOLD = "textFontBold";
        public const String STYLES_FIELD_TEXTFONTITALIC = "textFontItalic";
        public const String STYLES_FIELD_TEXTFONTUNDERLINE = "textFontUnderline";
        public const String STYLES_FIELD_TEXTFONTSTRIKEOUT = "textFontStrikeout";
        public const String STYLES_FIELD_HEADERFONTNAME = "headerFontName";
        public const String STYLES_FIELD_HEADERFORECOLOR = "headerFontColor";
        public const String STYLES_FIELD_HEADERBACKCOLOR = "headerBackColor";
        public const String STYLES_FIELD_HEADERFONTSIZE = "headerFontSize";
        public const String STYLES_FIELD_HEADERFONTBOLD = "headerFontBold";
        public const String STYLES_FIELD_HEADERFONTITALIC = "headerFontItalic";
        public const String STYLES_FIELD_HEADERFONTUNDERLINE = "headerFontUnderline";
        public const String STYLES_FIELD_HEADERFONTSTRIKEOUT = "headerFontStrikeout";
        public const String STYLES_FIELD_SUBHEADERFONTNAME = "subHeaderFontName";
        public const String STYLES_FIELD_SUBHEADERFORECOLOR = "subHeaderFontColor";
        public const String STYLES_FIELD_SUBHEADERBACKCOLOR = "subHeaderBackColor";
        public const String STYLES_FIELD_SUBHEADERFONTSIZE = "subHeaderFontSize";
        public const String STYLES_FIELD_SUBHEADERFONTBOLD = "subHeaderFontBold";
        public const String STYLES_FIELD_SUBHEADERFONTITALIC = "subHeaderFontItalic";
        public const String STYLES_FIELD_SUBHEADERFONTUNDERLINE = "subHeaderFontUnderline";
        public const String STYLES_FIELD_SUBHEADERFONTSTRIKEOUT = "subHeaderFontStrikeout";
        public const String STYLES_FIELD_CMDFONTNAME = "cmdFontName";
        public const String STYLES_FIELD_CMDFORECOLOR = "cmdFontColor";
        public const String STYLES_FIELD_CMDBACKCOLOR = "cmdBackColor";
        public const String STYLES_FIELD_CMDFONTSIZE = "cmdFontSize";
        public const String STYLES_FIELD_CMDFONTBOLD = "cmdFontBold";
        public const String STYLES_FIELD_CMDFONTITALIC = "cmdFontItalic";
        public const String STYLES_FIELD_CMDFONTUNDERLINE = "cmdFontUnderline";
        public const String STYLES_FIELD_CMDFONTSTRIKEOUT = "cmdFontStrikeout";
        public const String STYLES_FIELD_FORMWIDTH = "formWidth";
        public const String STYLES_FIELD_FORMHEIGHT = "formHeight";
        public const String STYLES_FIELD_LANGUAGENAME = "languageName";

        public const String STYLECOLORS_TABLE = "StyleColors";
        public const String STYLECOLORS_FIELD_ID = "id";
        public const String STYLECOLORS_FIELD_STYLEID = "styleId";
        public const String STYLECOLORS_FIELD_COLOR = "color";

        public const String STYLEIMAGES_TABLE = "StyleImages";
        public const String STYLEIMAGES_FIELD_ID = "id";
        public const String STYLEIMAGES_FIELD_STYLEID = "styleId";
        public const String STYLEIMAGES_FIELD_COLOR = "image";

        public const String STYLETEXTS_TABLE = "StyleTexts";
        public const String STYLETEXTS_FIELD_ID = "id";
        public const String STYLETEXTS_FIELD_STYLEID = "styleId";
        public const String STYLETEXTS_FIELD_COLOR = "text";

        public const String STYLESOUNDS_TABLE = "StyleSounds";
        public const String STYLESOUNDS_FIELD_ID = "id";
        public const String STYLESOUNDS_FIELD_STYLEID = "styleId";
        public const String STYLESOUNDS_FIELD_COLOR = "sound";
    }

    public class Style
    {
        //public
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
                name = value;
            }
        }

        public Font TextFont
        {
            get
            {
                return textFont;
            }

            set
            {
                textFont = value;
            }
        }

        public Color TextBackColor
        {
            get
            {
                return textBackColor;
            }

            set
            {
                textBackColor = value;
            }
        }

        public Color TextForeColor
        {
            get
            {
                return textForeColor;
            }

            set
            {
                textForeColor = value;
            }
        }

        public Font HeaderFont
        {
            get
            {
                return headerFont;
            }

            set
            {
                headerFont = value;
            }
        }

        public Color HeaderBackColor
        {
            get
            {
                return headerBackColor;
            }

            set
            {
                headerBackColor = value;
            }
        }

        public Color HeaderForeColor
        {
            get
            {
                return headerForeColor;
            }

            set
            {
                headerForeColor = value;
            }
        }

        public Font SubHeaderFont
        {
            get
            {
                return subHeaderFont;
            }

            set
            {
                subHeaderFont = value;
            }
        }

        public Color SubHeaderBackColor
        {
            get
            {
                return subHeaderBackColor;
            }

            set
            {
                subHeaderBackColor = value;
            }
        }

        public Color SubHeaderForeColor
        {
            get
            {
                return subHeaderForeColor;
            }

            set
            {
                subHeaderForeColor = value;
            }
        }

        public Font CmdFont
        {
            get
            {
                return cmdFont;
            }

            set
            {
                cmdFont = value;
            }
        }

        public Color CmdBackColor
        {
            get
            {
                return cmdBackColor;
            }

            set
            {
                cmdBackColor = value;
            }
        }

        public Color CmdForeColor
        {
            get
            {
                return cmdForeColor;
            }

            set
            {
                cmdForeColor = value;
            }
        }

        public Size FormSize
        {
            get
            {
                return formSize;
            }
            set
            {
                formSize = value;
            }
        }

        public String[] Texts
        {
            get
            {
                return texts;
            }
            set
            {
                texts = value;
            }
        }

        public String[] Sounds
        {
            get
            {
                return sounds;
            }
            set
            {
                sounds = value;
            }
        }

        public Image[] Images
        {
            get
            {
                return images;
            }
            set
            {
                images = value;
            }
        }

        public Color[] Colors
        {
            get
            {
                return colors;
            }
            set
            {
                colors = value;
            }
        }

        //public : member functions
        public void ApplyTextStyle(Control ctrl)
        {
            ctrl.Font = this.textFont;
            ctrl.BackColor = this.textBackColor;
            ctrl.ForeColor = this.textForeColor;
        }

        public void ApplyHeaderStyle(Control ctrl)
        {
            ctrl.Font = this.textFont;
            ctrl.BackColor = this.textBackColor;
            ctrl.ForeColor = this.textForeColor;
        }

        public void ApplySubHeaderStyle(Control ctrl)
        {
            ctrl.Font = this.headerFont;
            ctrl.BackColor = this.headerBackColor;
            ctrl.ForeColor = this.headerForeColor;
        }

        public void ApplyCmdStyle(Control ctrl)
        {
            ctrl.Font = this.cmdFont;
            ctrl.BackColor = this.cmdBackColor;
            ctrl.ForeColor = this.cmdForeColor;
        }

        public void ApplyFromStyle(Form frm)
        {
            frm.Size = this.formSize;
        }

        public Style[] DbLoadStyles()
        {
            return null;
        }

        public Boolean DbAddStyle()
        {
            return false;
        }

        public Boolean DbDeleteStyle()
        {
            return false;
        }

        //private : datamember
        private Int32 id;
        private String name;
        private Font textFont;
        private Color textBackColor;
        private Color textForeColor;
        private Font headerFont;
        private Color headerBackColor;
        private Color headerForeColor;
        private Font subHeaderFont;
        private Color subHeaderBackColor;
        private Color subHeaderForeColor;
        private Font cmdFont;
        private Color cmdBackColor;
        private Color cmdForeColor;
        private Size formSize;
        private String[] texts;
        private String[] sounds;
        private Image[] images;
        private Color[] colors;

        private IDbConnection connection;
        private IDbCommand command;
    }
}
