using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    class Demo
    {
        public void Greet()
        {
            Console.WriteLine("Weldone");
        }
    }
}

namespace GetDataType
{
    class Demo
    {
        public void print()
        {
            Console.WriteLine("Welcome");
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Demo D = new Demo();
            Test.Demo D1 = new Test.Demo();
            D.print();
            object x;
            x = 100;
            Console.WriteLine("Data Type of X is : " + x.GetType().ToString());
            x = "Shekhar";
            Console.WriteLine("Data Type of X is : " + x.GetType().ToString());
            Console.ReadKey();
        }
    }
}
