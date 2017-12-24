﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContentArea : System.Web.UI.Page
{
    string contentfirst;
    string contentsecond;
    string contentthird;
    string contentfourth;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sesnContent1"] != null)
        {
            txtArea1.Value = Session["sesnContent1"].ToString();
        }
        else
        {
            txtArea1.Value = string.Empty;
        }
        if (Session["sesnContent2"] != null)
        {
            txtArea2.Value = Session["sesnContent2"].ToString();
        }
        else
        {
            txtArea2.Value = string.Empty;
        }
        if (Session["sesnContent3"] != null)
        {
            txtArea3.Value = Session["sesnContent3"].ToString();
        }
        else
        {
            txtArea3.Value = string.Empty;
        }
        if (Session["sesnContent4"] != null)
        {
            txtArea4.Value = Session["sesnContent4"].ToString();
        }
        else
        {
            txtArea4.Value = string.Empty;
        }
    }

    protected void btnSave_Click1(object sender, EventArgs e)
    {
        contentfirst = Request.Form["txtArea1"].Replace("\r\n", "<br>");
        contentsecond = Request.Form["txtArea2"].Replace("\r\n", "<br>");
        contentthird = Request.Form["txtArea3"].Replace("\r\n", "<br>");
        contentfourth = Request.Form["txtArea4"].Replace("\r\n", "<br>");

        string page1 = HiddenFieldtxtArea1.Value.Replace(" ", String.Empty);
        string page2 = HiddenFieldtxtArea2.Value.Replace(" ", String.Empty);
        string page3 = HiddenFieldtxtArea3.Value.Replace(" ", String.Empty);
        string page4 = HiddenFieldtxtArea4.Value.Replace(" ", String.Empty);

        Session["sesnContent1"] = contentfirst;
        Session["sesnContent2"] = contentsecond;
        Session["sesnContent3"] = contentthird;
        Session["sesnContent4"] = contentfourth;

        string[] navPage1 ={"<!DOCTYPE html>",
        "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
        "<head>",
        "<title></title>",
        "</head>",
        "<body>",
        "<h1> </h1>",
        "<p>",
        ""+contentfirst+"",
        "</p>",
        "</body>",
        "</html>"};
        File.WriteAllLines(Server.MapPath("Downloads/" + page1 + ".html"), navPage1);

            string[] navPage2 ={"<!DOCTYPE html>",
        "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
        "<head>",
        "<title></title>",
        "</head>",
        "<body>",
        "<h1> </h1>",
        "<p>",
        ""+contentsecond+"",
        "</p>",
        "</body>",
        "</html>"};
            File.WriteAllLines(Server.MapPath("Downloads/" + page2 + ".html"), navPage2);

            string[] navPage3 ={"<!DOCTYPE html>",
        "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
        "<head>",
        "<title></title>",
        "</head>",
        "<body>",
        "<h1> </h1>",
        "<p>",
        ""+contentthird+"",
        "</p>",
        "</body>",
        "</html>"};
            File.WriteAllLines(Server.MapPath("Downloads/" + page3 + ".html"), navPage3);

            string[] navPage4 ={"<!DOCTYPE html>",
        "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
        "<head>",
        "<title></title>",
        "</head>",
        "<body>",
        "<h1> </h1>",
        "<p>",
        ""+contentfourth+"",
        "</p>",
        "</body>",
        "</html>"};
            File.WriteAllLines(Server.MapPath("Downloads/" + page4 + ".html"), navPage4);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "closewindow(); window.parent.navDataLoad('" + page1 + "','" + page2 + "','" + page3 + "','" + page4 + "');", true);
    }
}
