using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day2
{
    public interface ICourseService
    {
        public int[] studentList { get; set; }
    }

    public interface IPersonService
    {
        public int calAge(DateTime born)
        {
            return DateTime.Now.Year - born.Year;
        }
        public int calSalary(int hour, int salaryperhour)
        {
            return hour * salaryperhour;
        }
        public string[] address { get; set; } 
    }

    public interface IStudentService: IPersonService
    {
        public Dictionary<string,char> course { get; set; }

        public float calGPA() {
            int c = 0;
            float p = 0;
            foreach(KeyValuePair<string, char> i in course)
            {
                switch(i.Value)
                {
                    case 'A':
                        p += 4;
                        c++;
                        break;
                    case 'B':
                        p += 3;
                        c++;
                        break;
                    case 'C':
                        p += 2;
                        c++;
                        break;
                    case 'D':
                        p += 1;
                        c++;
                        break;
                    default: 
                        break;
                     
                } 
            }
            return p / c;
        } 
    }

    public interface IInstructorService : IPersonService
    {
        public string department { get; set; }
        public int experience(DateTime join) { 
            return DateTime.Now.Year - join.Year; 
        }
        public int calSalary(int hour, int salaryperhour)
        {
            return hour * salaryperhour+5* experience(new DateTime(2019,5,31));
        }
    }

    public interface IDepartmentService
    {
        public string headInstructor { get; set; }
        public int budget { get; set; }

        public string[] offerCourses { get; set; }
    }
}
