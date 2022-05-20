// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

namespace Day3
{ 
    public class Program {
        public static void Main(string[] args)
        {
            MyList<int> a = new MyList<int>();
            a.Add(1);
            a.Add(2);
            a.InsertAt(3,1);
            a.Remove(0);
            a.print();
            MyStack<string> b = new MyStack<string>();
            b.Push("a");
            b.Push("b");
            b.Push("c");
            b.Pop();
            b.print();
            GenericRepository<string> repository = new GenericRepository<string>();
            repository.Add("a");
            repository.print();
        }
    }

}
