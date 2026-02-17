namespace PartialClasses
{
    sealed class Demo
    {
        public void print()
        {
            Console.WriteLine("This is Sealed Class, Not Inheritable");
        }
    }

    class Output : Demo
    {
        public void print()
        {
            Console.WriteLine("Weldone");
        }
    }

    public partial class Employee
    {
        public int ID { get; set; }
        public string? Name { get; set; }
        public double Salary { get; set; }
    }

    public partial class Employee
    {
        public void DisplayDetails()
        {
            Console.WriteLine($"ID : {ID}");
            Console.WriteLine($"Name : {Name}");
            Console.WriteLine($"Salary : {Salary}");
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Employee E = new Employee();
            E.ID = 101;
            E.Name = "Gnanasekaran";
            E.Salary = 120000;
            E.DisplayDetails();
            Console.ReadKey();
        }
    }
}
