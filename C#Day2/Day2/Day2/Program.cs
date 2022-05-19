// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

namespace Day2
{
    public class Program
    {
         public static void Main(string[] args)
         {
             int[] numbers = GenerateNumbers(10);
             Reverse(numbers);
             PrintNumbers(numbers);
         }

         public static int[] GenerateNumbers(int n)
         {
             int[] arr = new int[n];
             for (int i = 1; i <= n; i++)
                 arr[i] = i;
             return arr;
         }

        public static void Reverse(int[] arr)
        {
            for (int i = 1; i <= arr.Length / 2; i++)
            {
                int temp = arr[i];
                arr[i] = arr[arr.Length-1-i] ;
                arr[arr.Length - 1 - i] = temp; 
            }
        }

        public static void PrintNumbers(int[] arr)
        {
            for (int i = 0; i < arr.Length ; i++)
            {
                Console.Write(arr[i]);
            }
        }


    }
}