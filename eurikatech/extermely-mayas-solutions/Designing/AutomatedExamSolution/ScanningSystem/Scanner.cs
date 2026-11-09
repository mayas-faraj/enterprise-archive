using System;

namespace Maniyat.ScanningSystem
{
    public static class Scanner
    {
        //public fuctions region
        public static void Scan()
        {
            //algorithms here

            
        }

        //public properties region
        public static String InputDirectoryPath
        {
            get
            {
                return inputDirectoryPath;
            }
            set
            {
                inputDirectoryPath=value;
            }
        }

        public static String OutputDirectoryPath
        {
            get
            {
                return outputDirectoryPath;
            }
            set
            {
                outputDirectoryPath = value;
            }
        }

        public static String OutputResultPath
        {
            get
            {
                return outputResultPath;
            }
            set
            {
                outputResultPath = value;
            }
        }

        public static AnswersCollection Answers
        {
            get
            {
                return answers;
            }
            set
            {
                answers = value;
            }
        }

        public static OptionsCollection Options
        {
            get
            {
                return options;
            }
            set
            {
                options = value;
            }
        }

        public static IdLevelsCollection IdLevels
        {
            get
            {
                return idLevels;
            }
            set
            {
                idLevels = value;
            }
        }

        //private functions region

        //private fields region
        private static String inputDirectoryPath;
        private static String outputDirectoryPath;
        private static String outputResultPath;
        private static AnswersCollection answers;
        private static OptionsCollection options;
        private static IdLevelsCollection idLevels;
    }
}
