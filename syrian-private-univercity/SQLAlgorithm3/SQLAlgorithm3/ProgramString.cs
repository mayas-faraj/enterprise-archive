namespace myProgram
{
    class ProgramString
    {
        static void Main(string[] args)
        {
            //program variables
            System.String[] notSortList = new System.String[15];
            System.Int32 counter;
            System.Int32 counter1, counter2;

            //main program
            System.Console.WriteLine("inputing list value within 15 inputs\n");

            //program variables
            counter = 0;

            //inputing list
            while (counter < 15)
            {
                System.Console.WriteLine("item number " + (counter + 1).ToString());
                notSortList[counter] = System.Console.ReadLine();
                counter++;
            }


            //output values
            System.Console.WriteLine("output list values\n");
            counter = 0;
            for (counter = 0; counter < 15; ++counter)
                System.Console.WriteLine("item number " + (counter + 1).ToString() + " = " + notSortList[counter]);


            System.String[] sortedList = new System.String[15];

            //algorithm for sort
            for (counter1 = 0; counter1 < 15; counter1++)
            {
                System.Int32 smallindex = 0;

                //get smallindex value
                for (counter2 = 0; counter2 < 15; counter2++)
                    if (notSortList[counter2] != null)
                        smallindex = counter2;
                //sorting
                for (counter2 = 0; counter2 < 15; counter2++)
                    if (notSortList[counter2] != null && notSortList[counter2].CompareTo(notSortList[smallindex]) < 0)
                        smallindex = counter2;

                sortedList[counter1] = notSortList[smallindex];
                notSortList[smallindex] = null;
            }

            //outputing after sort
            System.Console.WriteLine("output list values\n");

            counter = 0;
            for (counter = 0; counter < 15; ++counter)
            {
                System.Console.WriteLine("sorted item number " + (counter + 1).ToString() + " = " + sortedList[counter]);
            }

            System.Console.Read();
        }
    }
}
