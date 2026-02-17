namespace AbstractClasses
{
    abstract class Demo
    {
        public abstract void print();

        public void Display()
        {
            Console.WriteLine("This is Normal Method");
        }

        public string Display(string Message)
        {
            return Message;
        }
    }

    class Result : Demo
    {
        public override void print()
        {
            Console.WriteLine("This is an Abstrract Method");
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Demo demo = new Result();
            demo.print();
            demo.Display();
            string Output = demo.Display("Weldone");
            Console.WriteLine(Output.ToString());
            Console.ReadKey();
        }
    }
}
