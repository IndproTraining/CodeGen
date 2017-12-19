using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContentArea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click1(object sender, EventArgs e)
    {
        string[] navPage1 ={"<!DOCTYPE html>",
        "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
        "<head>",
        "<title></title>",
        "</head>",
        "<body>",
        "<h1> </h1>",
        "<p>",
        ""+Request.Form["txtArea1"].Replace("\r\n", "<br>")+"",
        "</p>",
        "</body>",
        "</html>"};
            File.WriteAllLines(Server.MapPath("" + Convert.ToString(Request.QueryString["nav1"]) + ".html"), navPage1);

            string[] navPage2 ={"<!DOCTYPE html>",
        "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
        "<head>",
        "<title></title>",
        "</head>",
        "<body>",
        "<h1> </h1>",
        "<p>",
        ""+Request.Form["txtArea2"].Replace("\r\n", "<br>")+"",
        "</p>",
        "</body>",
        "</html>"};
            File.WriteAllLines(Server.MapPath("" + Convert.ToString(Request.QueryString["nav2"]) + ".html"), navPage2);

            string[] navPage3 ={"<!DOCTYPE html>",
        "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
        "<head>",
        "<title></title>",
        "</head>",
        "<body>",
        "<h1> </h1>",
        "<p>",
        ""+Request.Form["txtArea3"].Replace("\r\n", "<br>")+"",
        "</p>",
        "</body>",
        "</html>"};
            File.WriteAllLines(Server.MapPath("" + Convert.ToString(Request.QueryString["nav3"]) + ".html"), navPage3);

            string[] navPage4 ={"<!DOCTYPE html>",
        "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
        "<head>",
        "<title></title>",
        "</head>",
        "<body>",
        "<h1> </h1>",
        "<p>",
        ""+Request.Form["txtArea4"].Replace("\r\n", "<br>")+"",
        "</p>",
        "</body>",
        "</html>"};
            File.WriteAllLines(Server.MapPath("" + Convert.ToString(Request.QueryString["nav4"]) + ".html"), navPage4);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "closewindow(); window.parent.navDataLoad();", true);    
        }
        
    }
