using System;
using System.Drawing;
using System.Data;
using System.Windows.Forms;

namespace Card
{
    public abstract partial class Card : UserControl
    {
        //contructure members
        public Card()
        {
            InitializeComponent();
        }

        //public properties region
        /// <summary>
        /// gets or sets all controls that the card consist of and have absolute position.
        /// </summary>
        public Control[] CardControls
        {
            get
            {
                return cardControls;
            }
            set
            {
                cardControls = value;
            }
        }

        /// <summary>
        /// gets or sets all controls that the card consist of and have ralative tabled position.
        /// </summary>
        public Control[] CardTabledControls
        {
            get
            {
                return cardTabledControls;
            }
            set
            {
                cardTabledControls = value;
            }
        }

        /// <summary>
        /// gets of sets controls array indicate data that taken from CardData with the same type and order.
        /// </summary>
        public Control[] CardSchemaControls
        {
            get
            {
                return cardSchemaControls;
            }
            set
            {
                cardSchemaControls = value;
            }
        }

        /// <summary>
        /// gets or sets the flow layout panel control that maybe contain tabled controls.
        /// </summary>
        public FlowLayoutPanel CardFlpMain
        {
            get
            {
                return cardFlpMain;
            }
            set
            {
                cardFlpMain = value;
            }
        }

        /// <summary>
        /// gets or sets string array contain names of controls that must appear and get values from card data.
        /// </summary>
        public String[] CardSchema
        {
            get
            {
                return cardSchema;
            }
            set
            {
                //precondition : nothing
                cardSchema = value;

                if (CardSchemaChanged != null)
                    CardSchemaChanged(this, new EventArgs());

                if (cardSchema != null)
                {
                    cardSchemaControls = new Control[cardSchema.Length];

                    //searching for control in cardControls with have the name of cardSchema
                    for (Int32 i = 0; i < cardSchema.Length; i++)
                    {
                        for (Int32 j = 0; j < cardControls.Length; j++)
                            if (cardSchema[i] == cardControls[j].Name)
                            {
                                //control found ,store in cardUsedControls at the same cardSchema index and add to parent control
                                cardSchemaControls[i] = cardControls[j];
                                this.Controls.Add(cardSchemaControls[i]);
                                break;
                            }
                    }

                    if (cardTabledControls.Length > 0 && cardFlpMain != null)
                    {
                        this.Controls.Add(cardFlpMain);

                        //searching for control in cardTabledControls with have the name of cardSchema
                        for (Int32 i = 0; i < cardSchema.Length; i++)
                        {
                            for (Int32 j = 0; j < cardTabledControls.Length; j++)
                                if (cardSchema[i] == cardTabledControls[j].Name)
                                {
                                    //control found ,store in cardUsedControls at the same cardSchema index and add to flowLayoutPanel
                                    cardSchemaControls[i] = cardTabledControls[j];
                                    cardFlpMain.Controls.Add(cardSchemaControls[i]);
                                    break;
                                }
                        }
                    }
                }
                //post condition : cardUsedControls array filled with controls witch have the same name in cardSchema
            }
        }

        /// <summary>
        /// gets or sets string array contain datas for controls that appeared in card schema.
        /// </summary>
        public String[] CardData
        {
            get
            {
                return cardData;
            }
            set
            {
                cardData = value;

                if (CardDataChanged != null)
                    CardDataChanged(this, new EventArgs());

                if (cardData != null)
                {
                    if (cardData.Length != cardSchemaControls.Length)
                        throw (new Exception("out of range array , CardSchema and CardData array length must equal\nCardSchema Length :" + cardSchemaControls.Length + "\nCardData Length :" + cardData.Length));
                    else
                        //processing every control in cardUsedControls[]
                        for (Int32 i = 0; i < cardData.Length; i++)
                        {
                            //if control in schema is not empty , -if empty do nothing
                            if (cardSchemaControls[i] != null)
                                //control in schema is pictureBox
                                if (cardSchemaControls[i].GetType() == typeof(PictureBox))
                                    cardSchemaControls[i].BackgroundImage = Image.FromFile(cardData[i]);
                                else
                                    //control in schema is checkBox
                                    if (cardSchemaControls[i].GetType() == typeof(CheckBox))
                                        ((CheckBox)cardSchemaControls[i]).Checked = (cardData[i] == "1" || cardData[i].ToLower() == "true");
                                    //control in schema is output text control
                                    else
                                        cardSchemaControls[i].Text = cardData[i];

                        }
                }
            }
        }

        //private datamember region
        private Control[] cardControls;
        private Control[] cardTabledControls;
        private Control[] cardSchemaControls;
        private String[] cardSchema;
        private String[] cardData;
        private FlowLayoutPanel cardFlpMain;

        //event
        public event EventHandler CardSchemaChanged;
        public event EventHandler CardDataChanged;
    }
}
