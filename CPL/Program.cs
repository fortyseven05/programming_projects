using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPL
{
    class Program
    {
        static int Partition(ref int[] arr, int start, int end)
        {
            int pIndex = start;
            int pivot = arr[end];

            for (int i = start; i < end; i++)
            {
                if (pivot >= arr[i] & arr[i] != arr[pIndex])
                {

                    Swap(ref arr[i], ref arr[pIndex]);
                    pIndex++;
                }
            }


            Swap(ref arr[end], ref arr[pIndex]);
            return pIndex;

        }

        static void Swap(ref int a, ref int b)
        {
            int temp = 0;
            temp = a;
            a = b;
            b = temp;
            Console.WriteLine(a + " " + b);
        }

        static void QuickSort(ref int[] arr, int start, int end)
        {
            if (start < end)
            {
                int pIndex = Partition(ref arr, start, end);

                foreach (int n in arr)
                {
                    Console.Write(n + " ");
                }
                Console.WriteLine();

                QuickSort(ref arr, start, pIndex - 1);
                QuickSort(ref arr, pIndex + 1, end);
            }
            else return;

        }


        static void Main(string[] args)
        {
            int[] arr = { 3, 1, 4, 1, 4, 3, 1, 2, 4, 1, 2, 3, 1, 4, 1, 3, 1, 2, 4, 3, 4, 4, 1, 2, 3, 6, 4, 8, 5, 3, 7, 9,
                6, 3, 2, 9, 7, 3, 0, 7, 0, 5, 1, 4, 3, 7, 5, 8, 0, 6, 3, 4, 6, 5, 5, 3, 7, 7, 8, 3, 8, 0, 9, 9, 0, 6, 5, 3, 3, 5, 8, 9, 7, 4, 5, 7,9 , 5, 3, 5, 8,0, 8, 7, 3, 2, 5, 7, 2};



            QuickSort(ref arr, 0, arr.Length - 1);


            foreach (int i in arr)
            {
                Console.Write(i + " ");
            }

            Console.WriteLine("\nComplete");

        }

    }
}

