using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected void btnSIgnUp_Click(object sender, EventArgs e)
    //{
    //    RegisterUser obj = new RegisterUser();
    //    string name = txtname.Text.Trim();
    //    string email = txtmail.Text.Trim();
    //    string password = txtpassword.Text.Trim();
    //    int var = obj.UserRegister(name, email, password);
    //    if (var > 0)
    //    {
    //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "successMessage", "RegistrationSuccessNotification();", true);
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "successMessage", "RegistrationErrorNotification();", true);
    //    }
    //}

    protected void btnSIgnUp_Click(object sender, EventArgs e)
    {
        RegisterUser objUser = new RegisterUser();
        string name = txtname.Text.Trim();
        string email = txtmail.Text.Trim();
        string password = txtpassword.Text.Trim();
        int var = objUser.UserRegister(name, email, password);
        if (var > 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ErrorMessage", "RegistrationSuccessNotification();", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ErrorMessage", "RegistrationErrorNotification();", true);
        }
    }

    //protected void btnLogIn_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Login.aspx");
    //}
}