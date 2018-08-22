using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPL
{
    class Program
    {
        static int QuickSort(int[] arr, int wall, int pivot)
        {
            // temp is used for position swaps, left stores the position to the left of the partition, right store the position to the right of the partition (temp wall)
            // pivot starts at the end of the array and shifts left by one through each iteration until pivot is equal to the walls starting position, 0
            int temp = 0;
            int left = -1;
            int right = 0;

            while (wall < pivot)   // when the pivot position is less than right position, we need to move the temporary wall (right) one to the right and retest
            {
                //Console.WriteLine("working");   //debugging
                if (arr[pivot] <= arr[right])
                {
                    right++;
                    //foreach (int i in arr)
                    //{
                    //    Console.Write(i + " ");    //debugging
                    //}
                    //Console.WriteLine();
                }

                if (arr[pivot] >= arr[right])       // when the pivot position is greater than the right position, we swap the smaller number to the walls starting 
                {                                   // position and move wall one space to the right. The temporary wall (right) always starts in the same position
                    temp = arr[right];              // as wall. Additionally, left moves one to the right to accomodate the new number added to the left side
                    arr[right] = arr[wall];         // of the partition
                    arr[wall] = temp;
                    left++;
                    wall++;
                    right = wall;
                    //foreach (int i in arr)
                    //{
                    //    Console.Write(i + " ");     //debugging
                    //}
                    //Console.WriteLine();
                }
                if (right == pivot)
                {                                   // when the temporary wall (right) makes it all the way to the pivot, we know that were no number in the array 
                    temp = arr[right];              // that were greater than pivot. In this case, the pivot number needs to be moved to the left side of the wall
                    arr[right] = arr[wall];
                    arr[wall] = temp;
                    left++;
                    wall++;
                    right = wall;
                    //foreach (int i in arr)
                    //{
                    //    Console.Write(i + " ");      //debugging
                    //}
                    //Console.WriteLine();
                }
            }
            return pivot;
        }

        static void RecursiveQuickSort(int[] arr, int wall, int pivot)
        {
            // temp is used for position swaps, left stores the position to the left of the partition, right store the position to the right of the partition (temp wall)
            // pivot starts at the end of the array and shifts left by one through each iteration until pivot is equal to the walls starting position, 0
            int temp = 0;
            int left = -1;
            int right = 0;

            while (wall < pivot)   // when the pivot position is less than right position, we need to move the temporary wall (right) one to the right and retest
            {
                //Console.WriteLine("working");   //debugging
                if (arr[pivot] <= arr[right])
                {
                    right++;
                    //foreach (int i in arr)
                    //{
                    //    Console.Write(i + " ");    //debugging
                    //}
                    //Console.WriteLine();
                }

                if (arr[pivot] >= arr[right])       // when the pivot position is greater than the right position, we swap the smaller number to the walls starting 
                {                                   // position and move wall one space to the right. The temporary wall (right) always starts in the same position
                    temp = arr[right];              // as wall. Additionally, left moves one to the right to accomodate the new number added to the left side
                    arr[right] = arr[wall];         // of the partition
                    arr[wall] = temp;
                    left++;
                    wall++;
                    right = wall;
                    //foreach (int i in arr)
                    //{
                    //    Console.Write(i + " ");     //debugging
                    //}
                    //Console.WriteLine();
                }
                if (right == pivot)
                {                                   // when the temporary wall (right) makes it all the way to the pivot, we know that were no number in the array 
                    temp = arr[right];              // that were greater than pivot. In this case, the pivot number needs to be moved to the left side of the wall
                    arr[right] = arr[wall];
                    arr[wall] = temp;
                    left++;
                    wall++;
                    right = wall;
                    //foreach (int i in arr)
                    //{
                    //    Console.Write(i + " ");      //debugging
                    //}
                    //Console.WriteLine();
                }
            }
            if (pivot != 0) { RecursiveQuickSort(arr, 0, (pivot - 1)); }
            else { return; }
        }


        static void Main(string[] args)
        {
            // pi seemed like a great number to use to test this. Console.WriteLine makes this take too long. Use a smaller number to see what's going on. 
            int[] arr = { 3,1,4,1,5,9,2,6,5,3,5,8,9,7,9,3,2,3,8,4,6,2,6,4,3,3,8,3,2,7,9,5,0,2,8,8,4,1,9,7,1,6,9,3,9,9,3,7,5,1,0,5,8,2,0,9,7,4,9,4,4,5,9,2,3,0,
                7,8,1,6,4,0,6,2,8,6,2,0,8,9,9,8,6,2,8,0,3,4,8,2,5,3,4,2,1,1,7,0,6,7,9,8,2,1,4,8,0,8,6,5,1,3,2,8,2,3,0,6,6,4,7,0,9,3,8,4,4,6,0,9,5,5,0,5,8,2,2,
                3,1,7,2,5,3,5,9,4,0,8,1,2,8,4,8,1,1,1,7,4,5,0,2,8,4,1,0,2,7,0};
            int[] arr2 = { 3,1,4,1,5,9,2,6,5,3,5,8,9,7,9,3,2,3,8,4,6,2,6,4,3,3,8,3,2,7,9,5,0,2,8,8,4,1,9,7,1,6,9,3,9,9,3,7,5,1,0,5,8,2,0,9,7,4,9,4,4,5,9,2,3,0,
                7,8,1,6,4,0,6,2,8,6,2,0,8,9,9,8,6,2,8,0,3,4,8,2,5,3,4,2,1,1,7,0,6,7,9,8,2,1,4,8,0,8,6,5,1,3,2,8,2,3,0,6,6,4,7,0,9,3,8,4,4,6,0,9,5,5,0,5,8,2,2,
                3,1,7,2,5,3,5,9,4,0,8,1,2,8,4,8,1,1,1,7,4,5,0,2,8,4,1,0,2,7,0};

            int pivot = arr.Length - 1;
            int wall = 0;

            while (pivot > 0)
            {
                QuickSort(arr, wall, pivot);
                pivot--;
            }

            pivot = arr2.Length - 1;                 // setting pivot for RecursiveQuickSort and arr2 (assuming it's different and both are being run)
            RecursiveQuickSort(arr2, wall, pivot);   // I wrote the iterative quicksort first. I feel like the recusion of this function doesn't add anything
                                                     // because I started at one end. However, if I had started with the median value or a random index around 
                                                     // the middle of the array, it would have made a big difference. As it is, this is just a recursion of an 
                                                     // iterative function.
            foreach (int i in arr)
            {
                Console.Write(i + " ");
            }

            Console.WriteLine("\n");

            foreach (int i in arr2)
            {
                Console.Write(i + " ");
            }

            Console.WriteLine("\nComplete");

            int a = 3;
            bool tf = false;


        }

    }
}
