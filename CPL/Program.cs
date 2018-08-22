using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPL
{
    class Program
    {
        static int count = 1;
        static int Partition(ref int[] arr, int start, int end)
        {
            Console.WriteLine("Start Partition\n");
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
            Console.WriteLine("Count: {0}", count);
            count++;
            return pIndex;

        }
         
        static void Swap(ref int a, ref int b)
        {
            Console.WriteLine("Start Swap\n");
            int temp = 0;
            temp = a;
            a = b;
            b = temp;
            Console.WriteLine(a + " " + b);
        }

        static void QuickSort(ref int[] arr, int start, int end)
        {
            Console.WriteLine("Start QuickSort\n");

            int pIndex = Partition(ref arr, start, end);
            Console.WriteLine("pIndex = " + pIndex);
            Console.WriteLine("After {0} partition", count);
            foreach (int n in arr)
            {
                Console.Write(n + " ");
            }
            Console.WriteLine();

            if (start < end)
            {
                Console.WriteLine("First recursive call start: {0}, end: {1}, pIndex: {2}", start, end, pIndex);
                Partition(ref arr, start, pIndex - 1);
                Console.WriteLine("Second recursive call start: {0}, end: {1}. pIndex: {2}", start, end, pIndex);
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

/*
 * Start QuickSort

Start Partition

Start of partition: start = 0, end = 5, pIndex = 0, pivot = 9
Inside the for loop, swap call, i = 0, pIndex = 0
Start Swap

3 3
3 1 4 1 5 9
Inside the for loop, swap call, i = 1, pIndex = 1
Start Swap

1 1
3 1 4 1 5 9
Inside the for loop, swap call, i = 2, pIndex = 2
Start Swap

4 4
3 1 4 1 5 9
Inside the for loop, swap call, i = 3, pIndex = 3
Start Swap

1 1
3 1 4 1 5 9
Inside the for loop, swap call, i = 4, pIndex = 4
Start Swap

5 5
3 1 4 1 5 9
Values before Swap Call: end = 5, pIndex = 5
Start Swap

9 9
Count: 1
pIndex = 5
After 2 partition
3 1 4 1 5 9
First recursive call start: 0, end: 5, pIndex: 5
Start Partition

Start of partition: start = 0, end = 4, pIndex = 0, pivot = 5
Inside the for loop, swap call, i = 0, pIndex = 0
Start Swap

3 3
3 1 4 1 5
Inside the for loop, swap call, i = 1, pIndex = 1
Start Swap

1 1
3 1 4 1 5
Inside the for loop, swap call, i = 2, pIndex = 2
Start Swap

4 4
3 1 4 1 5
Inside the for loop, swap call, i = 3, pIndex = 3
Start Swap

1 1
3 1 4 1 5
Values before Swap Call: end = 4, pIndex = 4
Start Swap

5 5
Count: 2
Second recursive call start: 0, end: 5. pIndex: 5
Start Partition

Start of partition: start = 6, end = 5, pIndex = 6, pivot = 9
Values before Swap Call: end = 5, pIndex = 6

Unhandled Exception: System.IndexOutOfRangeException: Index was outside the bounds of the array.
   at CPL.Program.Partition(Int32[]& arr, Int32 start, Int32 end) in C:\Users\fortyseven05\source\repos\CPL\CPL\Program.cs:line 35
   at CPL.Program.QuickSort(Int32[]& arr, Int32 start, Int32 end) in C:\Users\fortyseven05\source\repos\CPL\CPL\Program.cs:line 70
   at CPL.Program.Main(String[] args) in C:\Users\fortyseven05\source\repos\CPL\CPL\Program.cs:line 79
Press any key to continue . . .
*/