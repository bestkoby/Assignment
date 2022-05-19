using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day2
{
    public class Color
    {
        public Color(int red,int green, int blue, double alpha)
        {
            Red = red;
            Green = green;
            Blue = blue;
            Alpha = alpha;
        }

        public Color(int red, int green, int blue )
        {
            Red = red;
            Green = green;
            Blue = blue;
            Alpha = 255;
        }

        public int Red { get; set; }
        public int Green { get; set; }
        public int Blue { get; set; }
        public double Alpha { get; set; }

        public double grayscale() {
            return (Red + Green + Blue) / 3; 
        }
    }
}
