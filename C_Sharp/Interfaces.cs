using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace Demo
{
    class Student
    {
        int StudentID;

        string StudentName;

        public int StudentNo
        {
            get
            {

                return StudentID;
            }
            set
            {

                StudentID = value;
            }
        }

        public string SName
        {
            get
            {

                return StudentName;
            }
            set
            {

                StudentName = value;
            }
        }
    }
}

namespace Interfaces
{
    interface IGreeting
    {
        string Greet(string Name);
    }

    interface ICalculate
    {
        int Add(int x, int y);

        int Subtract(int x, int y);
    }

    class Output : IGreeting, ICalculate
    {
        public string Greet(string Name)
        {
            return "Hello " + Name;
        }

        public int Add(int x, int y)
        {
            return (x + y);
        }

        public int Subtract(int x, int y)
        {
            return (x - y);
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Output MyResult = new Output();

            string Input;

            Input = Console.ReadLine();

            string MyOutPut = MyResult.Greet(Input);

            Console.WriteLine(MyOutPut);

            int Calculator = MyResult.Add(50, 50);

            Console.WriteLine(Calculator.ToString());

            int Result = MyResult.Subtract(60, 50);

            Console.WriteLine(Result.ToString());

            Console.ReadKey();
        }
    }
}
