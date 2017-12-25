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

    public int UserRegister(string name, string email,string password)
    {
        int rowinserted = 0;
        String ConString = System.Configuration.ConfigurationManager.ConnectionStrings["CodeGenDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(ConString);
        SqlCommand cmd = new SqlCommand("usp_user_InsertUserDetails", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", name);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.Parameters.AddWithValue("@Password", password);
        try
        {
            conn.Open();
            rowinserted = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            string excp = ex.Message.ToString();
        }
        finally
        {
            conn.Close();
        }
        return rowinserted;
    }

    public DataTable GetLoggedInUserDetails(string Email, string Password)
    {
        string conString = System.Configuration.ConfigurationManager.ConnectionStrings["CodeGenDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(conString);
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("usp_CheckLogin", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Email", Email);
        cmd.Parameters.AddWithValue("@Password", Password);
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
        return dt;
    }

    public DataTable GetNameUnameEmail(string Email)
    {
        string conString = System.Configuration.ConfigurationManager.ConnectionStrings["CodeGenDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(conString);
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("usp_SendPasswordViaEmail", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Email", Email);
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
        return dt;
    }
}