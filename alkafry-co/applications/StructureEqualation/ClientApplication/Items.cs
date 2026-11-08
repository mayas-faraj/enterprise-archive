using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClientApplication
{
    public class Info
    {
        public System.String I1CementLot
        { get; set; }

        public System.String I1IronLot
        { get; set; }

        public System.String I1RockLot
        { get; set; }

        public System.String I1SandLot
        { get; set; }

        public System.String I1CementCost
        { get; set; }

        public System.String I1IronCost
        { get; set; }

        public System.String I1RockCost
        { get; set; }

        public System.String I1SandCost
        { get; set; }

        public System.String I1Misc
        { get; set; }

        public System.String I1Total
        { get; set; }

        public System.String I2CementLot
        { get; set; }

        public System.String I2IronLot
        { get; set; }

        public System.String I2RockLot
        { get; set; }

        public System.String I2SandLot
        { get; set; }

        public System.String I2CementCost
        { get; set; }

        public System.String I2IronCost
        { get; set; }

        public System.String I2RockCost
        { get; set; }

        public System.String I2SandCost
        { get; set; }

        public System.String I2Misc
        { get; set; }

        public System.String I2Total
        { get; set; }

        public System.String I3CementLot
        { get; set; }

        public System.String I3IronLot
        { get; set; }

        public System.String I3CementCost
        { get; set; }

        public System.String I3IronCost
        { get; set; }

        public System.String I3Misc
        { get; set; }

        public System.String I3Total
        { get; set; }

        public System.String ITotal
        { get; set; }
    }

    public class ApplicationData
    {
        public System.String Tall1
        { set; get; }

        public System.String Width1
        { set; get; }

        public System.String Height1
        { set; get; }

        public System.String TallIndex1
        { set; get; }

        public System.String WidthIndex1
        { set; get; }

        public System.String HeightIndex1
        { set; get; }

        public System.String CostCement1
        { set; get; }

        public System.String CostIron1
        { set; get; }

        public System.String CostRock1
        { set; get; }

        public System.String CostSand1
        { set; get; }

        public System.String CostMisc1
        { set; get; }

        public System.String Tall2
        { set; get; }

        public System.String Width2
        { set; get; }

        public System.String Height2
        { set; get; }

        public System.String Number2
        { set; get; }

        public System.String TallIndex2
        { set; get; }

        public System.String WidthIndex2
        { set; get; }

        public System.String HeightIndex2
        { set; get; }

        public System.String CostCement2
        { set; get; }

        public System.String CostIron2
        { set; get; }

        public System.String CostRock2
        { set; get; }

        public System.String CostSand2
        { set; get; }

        public System.String CostMisc2
        { set; get; }

        public System.String Cube3
        { set; get; }

        public System.String CostIron3
        { set; get; }

        public System.String CostCement3
        { set; get; }

        public System.String Cement3
        { set; get; }

        public System.String Iron3
        { set; get; }

        public System.String CementIndex3
        { set; get; }

        public System.String IronIndex3
        { set; get; }

        public System.String CostMisc3
        { set; get; }

        public System.Boolean Save(System.String path)
        {
            try
            {
                System.Xml.XmlTextWriter xmlTextWriter = new System.Xml.XmlTextWriter(path, System.Text.Encoding.Unicode);
                xmlTextWriter.WriteStartDocument(true);
                xmlTextWriter.WriteStartElement("configure");

                xmlTextWriter.WriteStartElement("configure1");

                xmlTextWriter.WriteStartElement("tall1");
                xmlTextWriter.WriteString(this.Tall1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("width1");
                xmlTextWriter.WriteString(this.Width1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("height1");
                xmlTextWriter.WriteString(this.Height1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("tallIndex1");
                xmlTextWriter.WriteString(this.TallIndex1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("widthIndex1");
                xmlTextWriter.WriteString(this.WidthIndex1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("heightIndex1");
                xmlTextWriter.WriteString(this.HeightIndex1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("ironCost1");
                xmlTextWriter.WriteString(this.CostIron1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("cementCost1");
                xmlTextWriter.WriteString(this.CostCement1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("rockCost1");
                xmlTextWriter.WriteString(this.CostRock1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("sandCost1");
                xmlTextWriter.WriteString(this.CostSand1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("miscCost1");
                xmlTextWriter.WriteString(this.CostMisc1);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("configure2");

                xmlTextWriter.WriteStartElement("tall2");
                xmlTextWriter.WriteString(this.Tall2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("width2");
                xmlTextWriter.WriteString(this.Width2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("height2");
                xmlTextWriter.WriteString(this.Height2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("number2");
                xmlTextWriter.WriteString(this.Number2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("tallIndex2");
                xmlTextWriter.WriteString(this.TallIndex2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("widthIndex2");
                xmlTextWriter.WriteString(this.WidthIndex2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("heightIndex2");
                xmlTextWriter.WriteString(this.HeightIndex2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("ironCost2");
                xmlTextWriter.WriteString(this.CostIron2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("cementCost2");
                xmlTextWriter.WriteString(this.CostCement2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("rockCost2");
                xmlTextWriter.WriteString(this.CostRock2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("sandCost2");
                xmlTextWriter.WriteString(this.CostSand2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("miscCost2");
                xmlTextWriter.WriteString(this.CostMisc2);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("configure3");

                xmlTextWriter.WriteStartElement("cube3");
                xmlTextWriter.WriteString(this.Cube3);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("cement3");
                xmlTextWriter.WriteString(this.Cement3);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("iron3");
                xmlTextWriter.WriteString(this.Iron3);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("cementIndex3");
                xmlTextWriter.WriteString(this.CementIndex3);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("ironIndex3");
                xmlTextWriter.WriteString(this.IronIndex3);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("ironCost3");
                xmlTextWriter.WriteString(this.CostIron3);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("cementCost3");
                xmlTextWriter.WriteString(this.CostCement3);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteStartElement("miscCost3");
                xmlTextWriter.WriteString(this.CostMisc3);
                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteEndElement();

                xmlTextWriter.WriteEndElement();
                xmlTextWriter.WriteEndDocument();
                xmlTextWriter.Close();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public System.Boolean Load(System.String path)
        {
            try
            {
                System.Xml.XmlTextReader xmlTextReader = new System.Xml.XmlTextReader(path);

                while (xmlTextReader.Read())
                {
                    if (xmlTextReader.NodeType == System.Xml.XmlNodeType.Element)
                    {
                        switch (xmlTextReader.Name)
                        {
                            //configure 1 states
                            case "tall1":
                                this.Tall1 = xmlTextReader.ReadString();
                                break;
                            case "width1":
                                this.Width1 = xmlTextReader.ReadString();
                                break;
                            case "height1":
                                this.Height1 = xmlTextReader.ReadString();
                                break;
                            case "tallIndex1":
                                this.TallIndex1 = xmlTextReader.ReadString();
                                break;
                            case "widthIndex1":
                                this.WidthIndex1 = xmlTextReader.ReadString();
                                break;
                            case "heightIndex1":
                                this.HeightIndex1 = xmlTextReader.ReadString();
                                break;
                            case "ironCost1":
                                this.CostIron1 = xmlTextReader.ReadString();
                                break;
                            case "cementCost1":
                                this.CostCement1 = xmlTextReader.ReadString();
                                break;
                            case "rockCost1":
                                this.CostRock1 = xmlTextReader.ReadString();
                                break;
                            case "sandCost1":
                                this.CostSand1 = xmlTextReader.ReadString();
                                break;
                            case "miscCost1":
                                this.CostMisc1 = xmlTextReader.ReadString();
                                break;

                            //configure2 states
                            case "tall2":
                                this.Tall2 = xmlTextReader.ReadString();
                                break;
                            case "width2":
                                this.Width2 = xmlTextReader.ReadString();
                                break;
                            case "height2":
                                this.Height2 = xmlTextReader.ReadString();
                                break;
                            case "number2":
                                this.Number2 = xmlTextReader.ReadString();
                                break;
                            case "tallIndex2":
                                this.TallIndex2 = xmlTextReader.ReadString();
                                break;
                            case "widthIndex2":
                                this.WidthIndex2 = xmlTextReader.ReadString();
                                break;
                            case "heightIndex2":
                                this.HeightIndex2 = xmlTextReader.ReadString();
                                break;
                            case "ironCost2":
                                this.CostIron2 = xmlTextReader.ReadString();
                                break;
                            case "cementCost2":
                                this.CostCement2 = xmlTextReader.ReadString();
                                break;
                            case "rockCost2":
                                this.CostRock2 = xmlTextReader.ReadString();
                                break;
                            case "sandCost2":
                                this.CostSand2 = xmlTextReader.ReadString();
                                break;
                            case "miscCost2":
                                this.CostMisc2 = xmlTextReader.ReadString();
                                break;

                            //configure3 states
                            case "cube3":
                                this.Cube3 = xmlTextReader.ReadString();
                                break;
                            case "cement3":
                                this.Cement3 = xmlTextReader.ReadString();
                                break;
                            case "iron3":
                                this.Iron3 = xmlTextReader.ReadString();
                                break;
                            case "cementIndex3":
                                this.CementIndex3 = xmlTextReader.ReadString();
                                break;
                            case "ironIndex3":
                                this.IronIndex3 = xmlTextReader.ReadString();
                                break;
                            case "cementCost3":
                                this.CostCement3 = xmlTextReader.ReadString();
                                break;
                            case "ironCost3":
                                this.CostIron3 = xmlTextReader.ReadString();
                                break;
                            case "miscCost3":
                                this.CostMisc3 = xmlTextReader.ReadString();
                                break;
                        }
                    }
                }

                return true;
            }

            catch
            {
                return false;
            }
        }
    }

    internal class Unit
    {
        private const Int32 round = 1000;

        public Unit(System.String unitName, System.Double unitMultiply, System.Windows.Media.Color backColor, System.Windows.Media.Color foreColor)
        {
            Name = unitName;
            Multiply = unitMultiply;
            Background = backColor;
            Foreground = foreColor;
        }

        public System.String Name
        { get; set; }

        public System.Double Multiply
        { get; set; }

        public System.Windows.Media.Color Background
        { get; set; }

        public System.Windows.Media.Color Foreground
        { get; set; }

        public override string ToString()
        {
            return this.Name;
        }

        public static Double MathMisc(Double number)
        {
            return System.Math.Ceiling(number / round) * round - number;
        }
    }
}
