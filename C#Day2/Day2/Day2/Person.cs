using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day2
{
    public abstract class Person
    {
        internal int Id { get; set; }
        internal string Name { get; set; } 
        public abstract string GetName();
        public abstract int GetId();
        public virtual int SalaryCalculator()
        {
            return 0;
        }
    }

    public class Student : Person
    {
        public override int GetId()
        {
            Console.WriteLine("Get student id");
            return Id;
        }

        public override string GetName()
        {
            Console.WriteLine("Get student name");
            return Name;
        }

         
    }

    public class Instructor : Person
    {
        private int salaryperhour { get; set; } = 35;
        private int hour { get; set; } 
        public override int GetId()
        {
            Console.WriteLine("Get instructor id");
            return Id;
        }

        public override string GetName()
        {
            Console.WriteLine("Get instructor name");
            return Name;
        }

        public override int SalaryCalculator()
        {
            return salaryperhour * hour;
        }
    }
}
