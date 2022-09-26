using System.Data.SqlClient;
using System.Data;

namespace WebAPICar.Data
{
    public class Connection
    {
        private SqlConnection Conexion = new SqlConnection("Data Source=MELVINJAY;Initial Catalog=cars;Integrated Security=True;Persist Security Info=False;Pooling=False;MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False");

        public SqlConnection OpenConnection()
        {
            if (Conexion.State == ConnectionState.Closed)
                Conexion.Open();
            return Conexion;
        }
        public SqlConnection CloseConnection()
        {
            if (Conexion.State == ConnectionState.Open)
                Conexion.Close();
            return Conexion;
        }
    }
}
