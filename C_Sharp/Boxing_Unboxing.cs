using System;
using System.Collections;
using System.Collections.Generic;

namespace BoxingUnboxingDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("===== BOXING & UNBOXING DEMO =====\n");
            // 1. Boxing
            int value = 50;
            object boxed = value; // Boxing
            Console.WriteLine("Boxed Value: " + boxed);
            // 2. Unboxing
            int unboxed = (int)boxed; // Unboxing
            Console.WriteLine("Unboxed Value: " + unboxed);
            // 3. Using ArrayList (Boxing Happens)
            ArrayList arrayList = new ArrayList();
            arrayList.Add(100); // Boxing
            arrayList.Add(200); // Boxing
            Console.WriteLine("\nArrayList Elements (Boxing Occurs):");
            foreach (var item in arrayList)
            {
                Console.WriteLine(item);
            }
            // 4. Using Generic List (No Boxing)
            List<int> list = new List<int>();
            list.Add(100);
            list.Add(200);
            Console.WriteLine("\nList<int> Elements (No Boxing):");
            foreach (var item in list)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("\n===== END =====");
            Console.ReadLine();
        }
    }
}
