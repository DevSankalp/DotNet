using System;
using System.IO;
using System.Linq;

class Program
{
    static string filePath = "students.txt";

    static void Main()
    {
        while (true)
        {
            Console.WriteLine("\n==== Student File Manager ====");
            Console.WriteLine("1. Create File");
            Console.WriteLine("2. Add Student");
            Console.WriteLine("3. View Students");
            Console.WriteLine("4. Search Student");
            Console.WriteLine("5. Exit");
            Console.Write("Choose option: ");
            switch (Console.ReadLine())
            {
                case "1":
                    CreateFile();
                    break;
                case "2":
                    AddStudent();
                    break;
                case "3":
                    ViewStudents();
                    break;
                case "4":
                    SearchStudent();
                    break;
                case "5":
                    return;
                default:
                    Console.WriteLine("Invalid choice");
                    break;
            }
        }
    }

    static void CreateFile()
    {
        if (!File.Exists(filePath))
        {
            File.Create(filePath).Close();
            Console.WriteLine("File created.");
        }
        else
            Console.WriteLine("File already exists.");
    }

    static void AddStudent()
    {
        Console.Write("Enter Id: ");
        string id = Console.ReadLine();
        Console.Write("Enter Name: ");
        string name = Console.ReadLine();
        Console.Write("Enter Course: ");
        string course = Console.ReadLine();
        string record = $"{id},{name},{course}";
        File.AppendAllText(filePath, record + Environment.NewLine);
        Console.WriteLine("Student added.");
    }

    static void ViewStudents()
    {
        if (File.Exists(filePath))
        {
            string[] lines = File.ReadAllLines(filePath);
            foreach (var line in lines)
                Console.WriteLine(line);
        }
        else
            Console.WriteLine("File not found.");
    }

    static void SearchStudent()
    {
        Console.Write("Enter student name to search: ");
        string search = Console.ReadLine();
        var results = File.ReadAllLines(filePath)
            .Where(l => l.ToLower().Contains(search.ToLower()));
        foreach (var r in results)
            Console.WriteLine(r);
    }
}
