using System;

namespace CountryProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Country coutryObject = new Country("Syria");

            coutryObject.Area = 1700000;
            coutryObject.Capital = "Damascus";
            coutryObject.Population = 22000000;

            coutryObject.SetBorders(new String[] { "Jordan", "Iraq", "Palastine", "Turkey", "Lebanon" });
            coutryObject.SetMainCities(new String[] { "Aleepo", "Swidaa", "Daraa", "Homes", "Latakia", "Tartous", "Idlib", "Hama", "Der alzor", "Alhasakeh", "Raqqa" });

            Console.WriteLine("Country: {0}.", coutryObject.Name);
            Console.WriteLine("=================");
            Console.WriteLine("Capital: {0}.", coutryObject.Capital);
            Console.WriteLine("Population: {0}.", coutryObject.Population);
            Console.WriteLine("=================");
            Console.WriteLine("Checking if the Iraq is its border country");
            Console.WriteLine("Result: {0}.", coutryObject.isBorder("Iraq"));
            Console.WriteLine("=================");
            Console.WriteLine("Checking if the Egypt is its border country");
            Console.WriteLine("Result: {0}.", coutryObject.isBorder("Egypt"));
            Console.WriteLine("=================");
            Console.WriteLine("Checking if the Swidaa is its main city");
            Console.WriteLine("Result: {0}.", coutryObject.isMainCity("Swidaa"));
            Console.WriteLine("=================");
            Console.WriteLine("Checking if the Cairo is its main city");
            Console.WriteLine("Result: {0}.", coutryObject.isMainCity("Cairo"));
            Console.WriteLine("=================");
            Console.ReadKey();
        }
    }

    class Country
    {
        private String name;
        private Double area;
        private String capital;
        private Int64 population;
        private String[] mainCities;
        private String[] borders;

        public String Name
        {
            get
            {
                return name;
            }
        }

        public Double Area
        {
            get
            {
                return area;
            }
            set
            {
                if (value >= 0)
                    area = value;
                else
                    area = -1;
            }
        }

        public Int64 Population
        {
            get
            {
                return population;
            }
            set
            {
                if (value >= 0)
                    population = value;
                else
                    population = -1;
            }
        }

        public String Capital
        {
            get
            {
                return capital;
            }
            set
            {
                capital = value;
            }
        }

        public Country(String countryName)
        {
            name = countryName;
        }

        public String[] GetBorders()
        {
            return borders;
        }

        public String[] GetMainCities()
        {
            return mainCities;
        }

        public void SetBorders(String[] inpBorders)
        {
            borders = inpBorders;
        }

        public void SetMainCities(String[] inpCities)
        {
            mainCities = inpCities;
        }

        public Boolean isMainCity(String cityName)
        {
            if (mainCities != null)
                for (Int32 i = 0; i < mainCities.Length; i++)
                    if (mainCities[i] == cityName)
                        return true;

            return false;
        }

        public Boolean isBorder(String cityName)
        {
            if (borders != null)
                for (Int32 i = 0; i < borders.Length; i++)
                    if (borders[i] == cityName)
                        return true;

            return false;
        }
    }
}
