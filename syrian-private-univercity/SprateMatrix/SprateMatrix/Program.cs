using System;

namespace SprateMatrix
{
    class Program
    {
        static int dim;

        //
        const float maximum = 100000;
        //


        static void Main(string[] args)
        {
            float[] val;
            int[] colst;

            loadArray(out val, out colst);
            outputArray(val, colst);
            Console.ReadLine();
            
            //
            for (int stage = 1; stage <= dim; stage++)
            {
                processArray(ref val,ref colst, stage);
                outputArray(val, colst);
            }
            //

            Console.ReadLine();
        }

        static void saveArray(float[] val, int[] colst)
        {
            if (val != null && colst != null && val.Length == colst.Length)
            {
                System.IO.StreamWriter sw = new System.IO.StreamWriter("e:\\matrix.csv", false);
                bool first = true;

                sw.WriteLine(dim);

                for (int i = 0; i < val.Length; i++)
                {
                    if (!first)
                        sw.Write(';');
                    else
                        first = false;

                    sw.Write(val[i].ToString());

                }

                sw.WriteLine();
                first = true;

                for (int i = 0; i < colst.Length; i++)
                {
                    if (!first)
                        sw.Write(';');
                    else
                        first = false;

                    sw.Write(colst[i].ToString());

                }

                sw.Close();
            }
            else
                Console.WriteLine("Error while saving file");
        }

        static void loadArray(out float[] val, out int[] colst)
        {
            System.IO.StreamReader sr = new System.IO.StreamReader("e:\\matrix.csv");

            dim = int.Parse(sr.ReadLine());
            string[] strVal = sr.ReadLine().Split(';');
            string[] strColst = sr.ReadLine().Split(';');

            sr.Close();

            val = new float[strVal.Length];
            colst = new int[strColst.Length];

            for (int i = 0; i < val.Length; i++)
                val[i] = float.Parse(strVal[i]);

            for (int i = 0; i < colst.Length; i++)
                colst[i] = int.Parse(strColst[i]);

        }

        static void inputArray(out float[] val, out int[] colst)
        {
            //variables
            float[] tempVal;
            int[] tempColst;
            bool valid = false;
            int num;
            float value;

            Console.WriteLine("Inputing Matrix Values From User:");
            Console.WriteLine("=================================");

            //inputing dimentions
            do
            {
                Console.WriteLine("Matrix [MAT] Dimention ?");
                valid = int.TryParse(Console.ReadLine(), out num);
                dim = num;
            } while (!valid);

            //inputing values
            tempVal = new float[dim * dim];
            tempColst = new int[dim * dim];
            num = 0;

            for (int c = 0; c < dim; c++)
                for (int r = 0; r < dim; r++)
                    do
                    {
                        Console.WriteLine("MAT(" + (c + 1).ToString() + ")(" + (r + 1).ToString() + ")=");
                        valid = float.TryParse(Console.ReadLine(), out value);

                        //
                        //valid = valid && (c != r || value != 0);
                        //

                        if (value != 0)
                        {
                            tempVal[num] = value;
                            tempColst[num] = r + c * dim;
                            num++;
                        }
                    } while (!valid);


            val = new float[num];
            colst = new int[num];

            for (int i = 0; i < num; i++)
            {
                val[i] = tempVal[i];
                colst[i] = tempColst[i];
            }
        }

        static void outputArray(float[] val, int[] colst)
        {
            Console.WriteLine("Outputing Matrix Values:");
            Console.WriteLine("========================");
            int factor = 1;
            int indicator = 0;

            for (int i = 0; i < dim * dim; i++)
            {
                if (i >= factor * dim)
                {
                    factor++;
                    Console.WriteLine();
                }

                if (indicator >= colst.Length || i != colst[indicator])
                    Console.Write("0\t");
                else
                {
                    Console.Write(val[indicator].ToString() + "\t");
                    indicator++;
                }
            }

            Console.WriteLine();
            Console.WriteLine("========================");
        }
        //
        static void processArray(ref float[] val, ref int[] colst, int stageNumber)
        {
            float[] tmpVal = new float[dim * dim];
            int[] tmpColst = new int[dim * dim];
            //int counter = stageNumber + (stageNumber - 1) * dim;
            int counterTmp = 0;

            //sortArray(val, colst, stageNumber);

            //first line the same
            for (int i = 0; i < colst.Length; i++)
                if (colst[i] >= 0)
                    if (colst[i] < dim * stageNumber)
                    {
                        tmpColst[counterTmp] = colst[i];
                        tmpVal[counterTmp] = val[i];
                        counterTmp++;
                    }


            //process smallest array
            for (int c = stageNumber; c < dim; c++)
            {
                float colVal = findElementValue(stageNumber - 1, stageNumber, val, colst);
                for (int r = stageNumber; r < dim; r++)
                {
                    if (colVal != 0)
                    {
                        float temp = findElementValue(r, c, val, colst) - findElementValue(r, stageNumber, val, colst) * findElementValue(stageNumber, stageNumber, val, colst) / findElementValue(stageNumber, c, val, colst);

                        if (temp != 0)
                        {
                            tmpVal[counterTmp] = temp;
                            tmpColst[counterTmp] = r * dim + c;
                            counterTmp++;
                        }
                    }
                    else
                    {
                        tmpVal[counterTmp] = findElementValue(r, c, val, colst);
                        tmpColst[counterTmp] = r * dim + c;
                        counterTmp++;
                    }
                }
            }

            val = new float[tmpVal.Length];
            colst = new int[tmpColst.Length];

            for (int i = 0; i < tmpColst.Length; i++)
            {
                val[i] = tmpVal[i];
                colst[i] = tmpColst[i];
            }
        }

        static float findElementValue(int row, int col, float[] val, int[] colst)
        {
            int colArray = row * dim + col;
            for (int i = 0; i < colst.Length; i++)
                if (colst[i] == colArray)
                    return val[i];
                else
                    if (colst[i] > colArray)
                        return 0;

            return 0;
        }

        static void sortArray(float[] inVal, int[] inColst, int stageNumber)
        {
            if (stageNumber >= 1)
            {
                int indicator = 0;
                int maxZeros = 0;
                int lineNumber = 0;

                //largest number of zeros in all rows
                for (int r = stageNumber - 1; r < dim; r++)
                {
                    int zeros = 0;

                    for (int c = stageNumber - 1; c < dim; c++)
                    {
                        if (indicator >= inColst.Length || (r * dim + c) != inColst[indicator])
                            if (stageNumber == r * dim + c)
                                continue;
                            else
                                zeros++;
                        else
                            if (c == stageNumber && System.Math.Abs(inVal[indicator]) >= maximum)
                                continue;
                            else
                                indicator++;
                    }

                    if (zeros > maxZeros)
                    {
                        maxZeros = zeros;
                        lineNumber = r;
                    }
                }

                //changing place from top to down
                for (int i = 0; i < inColst.Length; i++)
                    if (inColst[i] >= (stageNumber - 1) * dim && inColst[i] <= (stageNumber * dim) - 1)
                        inColst[i] += (lineNumber - stageNumber + 1) * dim;
                    else
                        if (inColst[i] > (stageNumber * dim) - 1)
                            break;

                //changing place from down to top
                for (int i = stageNumber * dim; i < inColst.Length; i++)
                    if (inColst[i] >= (lineNumber) * dim && inColst[i] <= (lineNumber + 1) * dim - 1)
                        inColst[i] -= (lineNumber - stageNumber + 1) * dim;
                    else
                        if (inColst[i] > (lineNumber + 1) * dim - 1)
                            break;

                //buble sort for val and colst
                for (int i = 0; i < inColst.Length; i++)
                    for (int j = i + 1; j < inColst.Length; j++)
                        if (inColst[i] > inColst[j])
                        {
                            int tmpColst = inColst[i];
                            inColst[i] = inColst[j];
                            inColst[j] = tmpColst;

                            float tmpVal = inVal[i];
                            inVal[i] = inVal[j];
                            inVal[j] = tmpVal;
                        }
            }
        }
        //
    }
}
