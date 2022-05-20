using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3
{
    public class MyStack<T>
    {
        Stack<T> mystack = new Stack<T>();
        public MyStack()
        {
            mystack = new Stack<T>();
        }
        public int Count() {
            return mystack.Count;
        }
        public T Pop() {
            return mystack.Pop();
        }

        public void Push(T item) { 
            mystack.Push(item);
        }

        public void print()
        {
            Console.WriteLine("Mystack contains ");
            foreach (T element in mystack) { Console.Write(element); }
            Console.WriteLine(" ");
        }
    }
}
