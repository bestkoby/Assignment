using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3
{
    public class MyList<T>  
    {
        List<T> myList;

        public MyList()
        {
            myList = new List<T>();
        }

        public void Add(T element)
        {
            myList.Add(element);
        }

        public T Remove(int index)
        {
            T result = myList[index];
            myList.RemoveAt(index);
            return result;
        }

        public bool Contains(T element)
        {
            return myList.Contains(element);
        }
        public void Clear()
        {
            myList.Clear();
        }

        public void InsertAt(T element, int index)
        {
            myList.Insert(index, element);

            void DeleteAt(int index)
            {
                myList.RemoveAt(index);
            }

            T Find(int index)
            {
                return myList[index];
            }
        }

        public void print() {
            Console.WriteLine("MyList contains ");
            foreach (T element in myList) { Console.Write(element); }
            Console.WriteLine( "");
        }
    }
}


 