using Microsoft.Data.SqlClient; // Ensure this namespace is included

namespace SqlServerConnectionExample
{
    class Program
    {
        static void Main(string[] args)
        {
            // 1. Define the connection string
            // Use '@' before the string to handle backslashes in the server name.
            // For SQL Server Authentication -
            // string connectionString =
            //     @"Data Source=LP-TZD-0X140653;Initial Catalog=demo;User ID=<your_username>;Password=<your_password>;Encrypt=False;";

            // For Windows Authentication -
            string connectionString =
                @"Data Source=LP-TZD-0X140653;Initial Catalog=demo;Integrated Security=SSPI;Encrypt=False;";

            // 2. Establish and manage the connection within a using block
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Open the connection
                    connection.Open();
                    Console.WriteLine("Connection Open Successfully!");

                    // Perform database operations (e.g., execute queries) here
                    string sql =
                        @"INSERT INTO Users (FirstName, LastName, Email) VALUES (@fname, @lname, @email)';";
                    using SqlCommand cmd = new SqlCommand(sql, connection);
                    // Adding parameters protects against hackers
                    cmd.Parameters.AddWithValue("@fname", "John");
                    cmd.Parameters.AddWithValue("@lname", "Doe");
                    cmd.Parameters.AddWithValue("@email", "john.doe@example.com");

                    int rowsAffected = cmd.ExecuteNonQuery();
                    Console.WriteLine($"{rowsAffected} row(s) inserted.");
                }
                catch (SqlException ex)
                {
                    // Handle any connection errors
                    Console.WriteLine($"Error: {ex.Message}");
                }
            } // The connection is automatically closed when exiting the using block
            Console.WriteLine("Connection Closed.");
        }
    }
}
