using System;
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
       
    }

    protected void btnSave_Click1(object sender, EventArgs e)
    {
        contentfirst =Request.Form["txtArea1"].Replace("\r\n", "<br>");
        contentsecond = Request.Form["txtArea2"].Replace("\r\n", "<br>");
        contentthird = Request.Form["txtArea3"].Replace("\r\n", "<br>");
        contentfourth = Request.Form["txtArea4"].Replace("\r\n", "<br>");
        ViewState.Add("VStxtarea1value", contentfirst);
        string page1 = HiddenFieldtxtArea1.Value.Replace(" ", String.Empty);
        string page2 = HiddenFieldtxtArea2.Value.Replace(" ", String.Empty);
        string page3 = HiddenFieldtxtArea3.Value.Replace(" ", String.Empty);
        string page4 = HiddenFieldtxtArea4.Value.Replace(" ", String.Empty);


        //function GetParameterValues(param) {  
        //    var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');  
        //    for (var i = 0; i < url.length; i++) {  
        //        var urlparam = url[i].split('=');  
        //        if (urlparam[0] == param) {  
        //            return urlparam[1];  
        //        }  
        //    }
        
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
