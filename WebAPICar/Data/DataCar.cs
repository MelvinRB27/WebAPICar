using System.Data;
using System.Data.SqlClient;
using WebAPICar.Models;

namespace WebAPICar.Data
{
    public class DataCar
    {
        //Connection with database
        //private Connection connection = new Connection();

        //SqlDataReader read;
        //DataTable table = new DataTable();

        ///constants to return in the different functions
        const string Created = "Successfully added";
        const string Updated = "Successfully updated";
        const string Deleted = "Successfully deleted";
        const string OK = "OK";

        const string not_Created = "Could not add";
        const string not_Deleted = "Could not delete";
        const string not_Updated = "Could not update";
        const string notFound = "This data was not found";

        public static string CreateCar( Cars car)
        {
            Connection connection = new Connection();
            SqlCommand command = new SqlCommand();

            command.CommandText = "InsertCars";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@Brand", car.Brand);
            command.Parameters.AddWithValue("@Model", car.Model);
            command.Parameters.AddWithValue("@YearCar", car.Year);
            command.Parameters.AddWithValue("@Color", car.Color);
            command.Parameters.AddWithValue("@Img", car.Img);

            try
            {
                command.Connection = connection.OpenConnection();
                command.ExecuteNonQuery();
                command.Parameters.Clear();
                connection.CloseConnection();
                return Created;
            }
            catch (Exception ex)
            {
                return not_Created;
            }
        }

        public static List<Cars> GetAll()
        {
            List<Cars> lisCars = new List<Cars>();

            Connection connection = new Connection();
            SqlCommand command = new SqlCommand();

            command.CommandText = "ShowCars";
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                command.Connection = connection.OpenConnection();
                
                using (SqlDataReader rd = command.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        lisCars.Add(new Cars()
                        {
                            IdCar = Convert.ToInt32(rd["Id"].ToString()),
                            Brand = rd["Brand"].ToString(),
                            Model = rd["Model"].ToString(),
                            Year = rd["YearCar"].ToString(),
                            Color = rd["Color"].ToString(),
                            Img = rd["Img"].ToString(),

                        });
                    }
                }
                connection.CloseConnection();
                return lisCars;
            }
            catch
            {
                return lisCars;
            }
        }

        public static List<Cars> GetByID(string brand)
        {
            List<Cars> lisCars = new List<Cars>();

            Connection connection = new Connection();
            SqlCommand command = new SqlCommand();

            command.CommandText = "ShowACar";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@Brand", brand);

            try
            {
                command.Connection = connection.OpenConnection();
                command.ExecuteNonQuery();

                using (SqlDataReader rd = command.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        lisCars.Add(new Cars()
                        {
                            IdCar = Convert.ToInt32(rd["Id"].ToString()),
                            Brand = rd["Brand"].ToString(),
                            Model = rd["Model"].ToString(),
                            Year = rd["YearCar"].ToString(),
                            Color = rd["Color"].ToString(),
                            Img = rd["Img"].ToString(),


                        });
                    }
                }
                return lisCars;
            }
            catch
            {
                return lisCars;
            }

        }

        public static string Update(Cars car)
        {
            Connection connection = new Connection();
            SqlCommand command = new SqlCommand();

            command.CommandText = "UpdateCars";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@Brand", car.Brand);
            command.Parameters.AddWithValue("@Model", car.Model);
            command.Parameters.AddWithValue("@YearCar", car.Year);
            command.Parameters.AddWithValue("@Color", car.Color);
            command.Parameters.AddWithValue("@Img", car.Img);
            command.Parameters.AddWithValue("@Id", car.IdCar);


            try
            {
                command.Connection = connection.OpenConnection();
                command.ExecuteNonQuery();
                command.Parameters.Clear();
                connection.CloseConnection();
                return Updated;
            }
            catch (Exception ex)
            {
                return not_Updated;
            }

        }

        public static string Delete(int id)
        {

            Connection connection = new Connection();
            SqlCommand command = new SqlCommand();

            command.CommandText = "DeleteCars";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@Id", id);

            try
            {
                command.Connection = connection.OpenConnection();
                command.ExecuteNonQuery();
                command.Parameters.Clear();
                connection.CloseConnection();
                return Deleted;
            }
            catch
            {
                return not_Deleted;
            }
        }
    }
}
