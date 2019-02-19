/*using System.Collections.Generic;
using System.IO;
using Microsoft.Data.Sqlite;

namespace BarcodeScanner
{
    public class DatabaseFailedScans
    {
        private const string ConnectionString = "DataSource=fails.db";


        public static void CreateDatabase()
        {
            if (File.Exists("fails.db"))
                return;

            using (var connection = new SqliteConnection(ConnectionString))
            {
                connection.Open();

                using (var command = new SqliteCommand("CREATE TABLE Fails (Barcode PRIMARY KEY, Count)", connection))
                {
                    command.ExecuteNonQuery();
                }
            }
        }

        public void SaveProducts(IEnumerable<Product> products)
        {
            using (var connection = new SqliteConnection(ConnectionString))
            {
                connection.Open();

                foreach (var product in products)
                {
                    using (var command = new SqliteCommand("DELETE FROM Products", connection))
                        command.ExecuteNonQuery();

                    using (var command = new SqliteCommand("INSERT INTO Products(Barcode, Name, Price) VALUES(@barcode, @name, @price)", connection))
                    {
                        command.Parameters.AddWithValue("@barcode", product.Barcode);
                        command.Parameters.AddWithValue("@name", product.Name);
                        command.Parameters.AddWithValue("@price", product.Price);
                        command.ExecuteNonQuery();
                    }
                }
            }
        }

        public void UpdateByBarcode(string barcode)
        {
            using (var connection = new SqliteConnection(ConnectionString))
            {
                bool found = ExistsInFails(barcode);
                if (!found)
                {
                    using (var command = new SqliteCommand("INSERT INTO Fails(Barcode, Count) VALUES(@barcode, @count)", connection))
                    {
                        command.Parameters.AddWithValue("@barcode", barcode);
                        command.Parameters.AddWithValue("@count", 1);
                        command.ExecuteNonQuery();
                    }
                }
                else
                {
                    using (var command = new SqliteCommand("UPDATE Fails SET Count = Count + 1 WHERE Barcode = '" + barcode + "';", connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }
            }
        }

        public bool ExistsInFails(string barcode)
        {
            using (var connection = new SqliteConnection(ConnectionString))
            {
                connection.Open();
                using (var command = new SqliteCommand("SELECT Barcode FROM Fails WHERE Barcode = @barcode", connection))
                {
                    command.Parameters.AddWithValue("@barcode", barcode);
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return true;
                        }

                        return false;
                    }
                }
            }
        }
    }
}*/