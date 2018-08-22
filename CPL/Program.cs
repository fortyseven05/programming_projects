using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPL
{
    class Program
    {
        static int count = 0;
        static int Partition(ref int[] arr, int start, int end)
        {
            int pIndex = start;
            int pivot = arr[end];
            Console.WriteLine("Start of partition: start = {0}, end = {1}, pIndex = {2}, pivot = {3}", start, end, pIndex, pivot);

            for (int i = start; i < end; i++)
            {
                if (pivot >= arr[i])
                {
                    Console.WriteLine("Inside the for loop, swap call, i = {0}, pIndex = {1}", i, pIndex);
                    Swap(ref arr[i], ref arr[pIndex]);
                    pIndex++;
                }
                for (int p = 0; p <= end; p++)
                {
                    Console.Write(arr[p] + " ");
                }
                Console.WriteLine("");
            }
            Console.WriteLine("Values before Swap Call: end = {0}, pIndex = {1}", end, pIndex);
            Swap(ref arr[end], ref arr[pIndex]);
            count++;
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

            int pIndex = Partition(ref arr, start, end);
            Console.WriteLine("After {0} partition", count);
            foreach (int n in arr)
            {
                Console.Write(n + " ");
            }
            Console.WriteLine();

            if (start < end)
            {
                Console.WriteLine("start: {0}, end: {1}", start, end);
                Partition(ref arr, start, pIndex - 1);
                Partition(ref arr, pIndex + 1, end);
            }

        }

        static void Main(string[] args)
        {
            int[] arr = { 3, 1, 4, 1, 5, 9 };

            QuickSort(ref arr, 0, arr.Length - 1);

            foreach (int i in arr)
            {
                Console.Write(i + " ");
            }

            Console.WriteLine("\nComplete");

        }

    }
}
