// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

namespace Day1
{
    public class Program
    {
        public static void Main(string[] args)
        {
            /*Understanding Data Types */
            // 1.
            static void Q1_1()
            {
                Console.WriteLine("The example displays the following output:\n");
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10}\n ", "types", "memory", "minimum", "maximum");
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "sbyte", sizeof(sbyte), sbyte.MinValue, sbyte.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "byte", sizeof(byte), byte.MinValue, byte.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "short", sizeof(short), short.MinValue, short.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "ushort", sizeof(ushort), ushort.MinValue, ushort.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "int", sizeof(int), int.MinValue, int.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "uint", sizeof(uint), uint.MinValue, uint.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "long", sizeof(long), long.MinValue, long.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "ulong", sizeof(ulong), ulong.MinValue, ulong.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "float", sizeof(float), float.MinValue, float.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "double", sizeof(double), double.MinValue, double.MaxValue);
                Console.WriteLine("{0,-10} {1,-10} {2,-30} {3,-10} ", "decimal", sizeof(decimal), decimal.MinValue, decimal.MaxValue);
            }

            // 2.
            static void Q1_2()
            {
                Console.WriteLine("enter an integer number of centuries");
                long number = 0;
                bool valid = false;
                while (!valid)
                {
                    string input = Console.ReadLine();
                    valid = Int64.TryParse(input, out number);
                    if (valid) { break; }
                    Console.WriteLine("please re-enter an integer number");
                }
                Console.WriteLine($"{number} centuries = {number * 100} years = {number * 36524} days = {number * 876576} hours = {number * 52594560} minutes = { number * 31556736}00 seconds = { number * 31556736}00000 milliseconds = { number * 31556736 }00000000 microseconds = { number * 31556736 }00000000000 nanosecond ");
            }

            /* Controlling Flow and Converting Types*/
            // 1. 
            static void Q2_1()
            {
                for (int i = 1; i <= 100; i++)
                {
                    if (i % 3 == 0 && i % 5 == 0) { Console.WriteLine("fizzbuzz"); }
                    else if (i % 3 == 0) { Console.WriteLine("fizz"); }
                    else if (i % 5 == 0) { Console.WriteLine("buzz"); }
                }
            }

            // 2.
            static void Q2_2()
            {
                Console.WriteLine("enter an height of Pyramid");
                string h = Console.ReadLine();
                int hh;
                Int32.TryParse(h, out hh);
                for (int i = 1; i <= hh; i++)
                {
                    for (int j = i; j <= hh * 2 - j; j++)
                    {
                        Console.Write(" ");
                    }
                    for (int j = 1; j < i * 2; j++)
                    {
                        Console.Write("*");
                    }
                    Console.WriteLine(" ");
                }
            }


            // 3.
            static void Q2_3()
            {
                int correctNumber = new Random().Next(3) + 1;
                Console.WriteLine("guess what the number is between 1-3");
                int guess = 0;
                bool isvalid = false;
                while (true)
                {
                    string input = Console.ReadLine();
                    isvalid = Int32.TryParse(input, out guess);
                    if (isvalid && 1 <= guess && guess <= 3) { break; }
                    Console.WriteLine("please re-enter an integer number between 1-3 ");
                }
                if (guess == correctNumber)
                {
                    Console.WriteLine("correct answe");
                }
                else if (guess < correctNumber)
                {
                    Console.WriteLine("guess low");
                }
                else
                {
                    Console.WriteLine("guess high");
                }
            }

            // 4. 
            static void Q2_4()
            {
                var prevDate = new DateTime(2021, 7, 15); //15 July 2021
                var today = DateTime.Now;
                //get difference of two dates
                var days = (today - prevDate).Days;
                int daysToNextAnniversary = 10000 - (days % 10000);
                Console.WriteLine("Days old: {0}", days);
                Console.WriteLine("daysToNextAnniversary: {0}", daysToNextAnniversary);
            }

            // 5.
            static void Q2_5()
            {
                var currenttime = DateTime.Now.Hour;
                switch (currenttime)
                {
                    case > 7 and <= 10:
                        Console.WriteLine("Good Morning");
                        break;
                    case > 13 and <= 17:
                        Console.WriteLine("Good Afternoon");
                        break;
                    case > 19 and <= 23:
                        Console.WriteLine("Good Evening");
                        break;
                    case <= 2:
                        Console.WriteLine("Good Night");
                        break;
                    default:
                        Console.WriteLine("No Greeting");
                        break;
                }
            }

            //6. 
            static void Q2_6()
            {
                for (int i = 1; i <= 4; i++)
                {
                    for (int j = 0; j <= 24; j += i)
                    {
                        Console.Write(j + ", ");
                    }
                    Console.WriteLine("");
                }
            }

            /*Arrays and Strings */
            // 1. 
            static void Q3_1()
            {
                int[] a = { 1, 2, 3, 4, 5 };
                int[] b = new int[a.Length];
                for (int i = 0; i < a.Length; i++)
                {
                    b[i] = a[i];
                }
                for (int i = 0; i < b.Length; i++)
                {
                    Console.Write(b[i] + " ");
                }
            }

            //2.
            static void Q3_2()
            {
                List<string> food = new List<string> { "Bacon", "Cheese", "Patty", "Crabs" };
                Console.WriteLine("Enter command (+ item, - item, or -- to clear)):");
                string foodInput = Console.ReadLine();
                string operations = foodInput.Split(' ')[0];
                if (operations == "+")
                {
                    food.Add(foodInput.Split(' ')[1]);
                }
                else if (operations == "-")
                {
                    food.Remove(foodInput.Split(' ')[1]);
                }
                else if (operations == "--")
                {
                    food.Clear();
                }

            }

            // 3. 
            static int[] FindPrimesInRange(int startNum, int endNum)
            {
                List<int> prime_list = new List<int>();
                for (int i = startNum; i <= endNum; i++)
                {
                    bool isprime = true;
                    for (int j = 0; j <= i / 2; j++)
                    {
                        if (i % j == 0)
                        {
                            isprime = false;
                            break;
                        }
                    }
                    if (isprime)
                        prime_list.Add(i);
                }
                return prime_list.ToArray();
            }

            //4.  
            Console.WriteLine("Enter array");
            string[] myarray = Console.ReadLine().Split(" ");
            int[] arr = Array.ConvertAll(myarray, Int32.Parse);
            Console.WriteLine("Enter rotation ");
            int rotation = int.Parse(Console.ReadLine());
            int[] res = new int[arr.Length];
            int cumulative = rotation / arr.Length * arr.Sum();
            rotation = rotation % arr.Length;
            for (int i = 1; i <= rotation; i++)
            {
                res[0] += arr[arr.Length - i];
            }
            for (int i = 1; i < arr.Length; i++)
            {
                res[i] = cumulative + res[i - 1] + arr[i - 1] - arr[(arr.Length - rotation - 1 + i) % arr.Length];
            }
            for (int i = 0; i < res.Length; i++)
            {
                Console.Write(res[i] + " ");
            }

            //5 .
            Console.WriteLine("\nEnter array");
            myarray = Console.ReadLine().Split(" ");
            arr = Array.ConvertAll(myarray, Int32.Parse);
            int max_c = 1;
            int max_n = arr[0];
            int count = 1;
            for (int i = 1; i < arr.Length; i++)
            {
                if (arr[i] == arr[i - 1])
                {
                    count += 1;
                    if (count > max_c) max_c = count; max_n = arr[i];
                }
                else
                {
                    count = 1;
                }
            }
            for (int i = 0; i < max_c; i++)
            {
                Console.Write(max_n + " ");
            }

            //7.
            Console.WriteLine("\nEnter array");
            myarray = Console.ReadLine().Split(" ");
            arr = Array.ConvertAll(myarray, Int32.Parse);
            Dictionary<int, int> freq = new Dictionary<int, int>();
            foreach (int i in arr)
            {
                freq[i] += 1;
            }
            List<int> maxNumbers = new List<int>();
            foreach (KeyValuePair<int, int> i in freq)
            {
                if (i.Value == freq.Values.Max())
                {
                    maxNumbers.Add(i.Key);
                }
            }
            foreach (int i in arr)
            {
                if (maxNumbers.Contains(i)) Console.WriteLine($"The number {i} is the most frequent");
            }

            /* Practice Strings */
            // 1.
            Console.WriteLine("\nEnter string to reserve");
            string reserveString = Console.ReadLine();
            static string reverse1(string reserveString)
            {
                char[] charArr = reserveString.ToCharArray();
                Array.Reverse(charArr);
                return string.Join("", charArr);
            }

            static void reverse2(string reserveString)
            {
                for (int i = reserveString.Length - 1; i >= 0; i--)
                    Console.Write(reserveString[i]);
            }
            Console.WriteLine(reverse1(reserveString));
            reverse2(reserveString);

            // 2.
            Console.WriteLine("\nEnter sentence to reserve");
            string reserveSentence = Console.ReadLine();
            string[] sentence = reserveSentence.Split(" ");
            Array.Reverse(sentence);
            Console.WriteLine(string.Join(" ", sentence));

            // 3. 
            Console.WriteLine("\nEnter  sentence to find palindromes");
            string palindromesSentence = Console.ReadLine();
            string[] words = palindromesSentence.Split(" ");
            List<string> palindromes = new List<string>();
            foreach (string word in words)
                if (word == reverse1(word)) palindromes.Add(word);
            palindromes = palindromes.Distinct().ToList();
            palindromes.Sort();
            foreach (string p in palindromes)
                Console.Write(p + " ");

            // 4. 
            Console.WriteLine("\nEnter url");
            string url = Console.ReadLine();
            string[] terms = url.Split("://");
            if (terms.Length > 1)
            {
                Console.WriteLine(" [protocol] = \"" + terms[0] + "\"");
                terms = terms[1].Split("/");
                Console.WriteLine(" [server] = \"" + terms[0] + "\"");
                if (terms.Length > 1)
                    Console.WriteLine(" [resource] = \"" + terms[1] + "\"");
                else
                    Console.WriteLine(" [resource] = \"\"");
            }
            else
                Console.WriteLine(" [protocol] = \"\"");
            terms = terms[0].Split("/");
            Console.WriteLine(" [server] = \"" + terms[0] + "\"");
            if (terms.Length > 1)
                Console.WriteLine(" [resource] = \"" + terms[1] + "\"");
            else
                Console.WriteLine(" [resource] = \"\"");
             
        }
    } 
}