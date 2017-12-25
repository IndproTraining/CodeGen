using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        RegisterUser objUser = new RegisterUser();
        string Email = txtmail.Text.Trim();
        string Password = txtpassword.Text.Trim();
        DataTable dt = objUser.GetLoggedInUserDetails(Email,Password);
        if (dt.Rows.Count > 0)
        {
            Session["sesnuserid"] = dt.Rows[0]["UserID"].ToString();
            Session["sesnusername"] = dt.Rows[0]["UserName"].ToString();
            Session["sesnemail"] = dt.Rows[0]["Email"].ToString();
            Response.Redirect("UIDesignTest.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ErrorMessage", "LoginErrorNotification();", true);
        }
    }
}