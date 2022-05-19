using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day2
{
    public class Ball 
    {
        public Ball(int size, Color color) {
            Size = size;
            Color = color;
        
        }
        public int Size { get; set; }
        public Color Color { get; set; }
        private int throwCount { get; set; } = 0;

        public void pop() {
            Size = 0; 
        }

        public void throwing() {
            if (Size != 0) throwCount++;
        }

        public int getThrowCount()
        {
            return throwCount;
        }
    }
}
