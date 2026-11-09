namespace myProgram
{
    class Program
    {
        static void Main(string[] args)
        {
            //program variables
            System.Int32[] notSortList = new System.Int32[15];
            System.Int32 counter;
            System.Int32 counter1, counter2;

            //main program
            System.Console.WriteLine("inputing list value within 15 inputs\n");

            //program variables
            counter = 0;

            //inputing list
            while (counter < 15)
            {
                System.Int32 input;
                System.Console.WriteLine("item number " + (counter + 1).ToString());
                
                //input string in integer number
                if (System.Int32.TryParse(System.Console.ReadLine(), out input))
                {
                    notSortList[counter] = input;
                    counter++;
                }
                else
                    System.Console.WriteLine("error input , try again");
            }
            

            //output values
            System.Console.WriteLine("output list values\n");
            counter = 0;
            for (counter = 0; counter < 15; ++counter)
                System.Console.WriteLine("item number " + (counter + 1).ToString() + " = " + notSortList[counter].ToString());

            
            System.Int32[] sortedList = new System.Int32[15];

            //algorithm for sort
            for (counter1 = 0; counter1 < 15; counter1++)
            {
                System.Int32 smallindex = 0;
                
                //get smallindex value
                for (counter2 = 0; counter2 < 15; counter2++)
                    if (notSortList[counter2] != -1)
                        smallindex = counter2;
                //sorting
                for (counter2 = 0; counter2 < 15; counter2++)
                    if (notSortList[counter2] != -1 && notSortList[counter2] < notSortList[smallindex])
                        smallindex = counter2;

                sortedList[counter1] = notSortList[smallindex];
                notSortList[smallindex] = -1;
            }

            //outputing after sort
            System.Console.WriteLine("output list values\n");

            counter = 0;
            for (counter = 0; counter < 15; ++counter)
            {
                System.Console.WriteLine("sorted item number " + (counter + 1).ToString() + " = " + sortedList[counter].ToString());
            }

            System.Console.Read();
        }
    }
}
