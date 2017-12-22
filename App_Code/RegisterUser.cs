using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

/// <summary>
/// Summary description for RegisterUser
/// </summary>
public class RegisterUser
{
	public RegisterUser()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #region Insert Method

    public int UserRegister(string name, string email,string password)
    {
        int rowinserted = 0;
        String ConString = System.Configuration.ConfigurationManager.ConnectionStrings["CodeGeneration"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConString);
        SqlCommand cmd = new SqlCommand("usp_user_InsertUserDetails", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@username", name);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.Parameters.AddWithValue("@password", password);

        try
        {
            conn.Open();
            rowinserted = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            //throw ex;
            string excp = ex.Message.ToString();
        }
        finally
        {
            conn.Close();
        }
        return rowinserted;
    }
    #endregion
}