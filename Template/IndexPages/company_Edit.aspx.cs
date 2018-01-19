using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Ionic.Zip;

public partial class Template_IndexPages_company_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "successMessage", "EditNotification();", true);
    }
    protected void btnDownloadServer_Click(object sender, EventArgs e)
    {
        string image1 = (fileUploadmainImage.FileName);
        if (image1 != "")
            fileUploadmainImage.SaveAs(Server.MapPath("../../Downloads/Images/" + image1));
        else
        {
            image1 = "s1.jpg";
            File.Copy("C:/inetpub/wwwroot/CodeGeneration/Template/company_CodeGen/images/s1.jpg", "C:/inetpub/wwwroot/CodeGeneration/Downloads/Images/s1.jpg");

        }
        string[] indexPage ={"<!DOCTYPE HTML>",
"<html>",
"<head>",
"<title>Company CodeGen</title>",
"<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />",
"</head>",
"<body>",
"    <div class=\"header\">",
"        <div class=\"wrap\">",
"            <div class=\"logo\"><a href=\"#\">"+hfCompanyLogo.Value+"</a></div>",
"            <div class=\"phone\">",
"                <ul>",
"                    <li><span class=\"icon mob\"></span>"+hfCompanyContact.Value+"</li>",
"                    <li><span class=\"icon mail\"></span>"+hfCompanyEmail.Value+"</li>",
"                </ul>",
"            </div>",
"            <div class=\"clear\"></div>",
"            <div class=\"nav\">",
"                <ul>",
"                    <li><a href=\"#\">"+hfMenu1.Value+"</a></li>",
"                    <li><a href=\"#\">"+hfMenu2.Value+"</a></li>",
"                    <li><a href=\"#\">"+hfMenu3.Value+"</a></li>",
"                    <li><a href=\"#\">"+hfMenu4.Value+"</a></li>",
"                </ul>",
"                <div class=\"clear\"></div>",
"            </div>",
"        </div>",
"    </div>",
"    <div class=\"wrap\">",
"    <div class=\"content\">",
"            <img src=\"Images/"+image1+"\" style=\"width:100%\"><br/><br/>",                
"            <div class=\"b-box\">",
"            <h1>"+hfCompanyAbout.Value+"</h1>",
"			<p>"+hfCompanyAboutContent.Value+"</p>",
"            </div>",
"        </div>",
"    </div>",
"    <div class=\"footer\">",
"        <div class=\"wrap\">",
"            <div class=\"f-menu\">",                
"                 <div class=\"copy\">© 2017 CodeGen. All rights reserved. Designed by CodeGen </div>",
"            </div>",
"        </div>",
"    </div>",
"    </body>",
"    </html>"};
        File.WriteAllLines(Server.MapPath(@"../../Downloads/IndexPage.html"), indexPage);
        var downloadFileName = string.Format("CodeGen.zip", DateTime.Now.ToString("yyyy-MM-dd-HH_mm_ss"));
        Response.ContentType = "application/zip";
        Response.AddHeader("Content-Disposition", "filename=" + downloadFileName);
        using (var zip = new ZipFile())
        {
            DirectoryInfo dirInforMain = new DirectoryInfo(HttpContext.Current.Request.MapPath("~/Downloads"));
            zip.AddDirectory(dirInforMain + "/", "CodeGen");
            DirectoryInfo dirInfor = new DirectoryInfo(HttpContext.Current.Request.MapPath("~/Template/company_CodeGen/css"));
            DirectoryInfo dirInfor1 = new DirectoryInfo(HttpContext.Current.Request.MapPath("~/Template/company_CodeGen/fonts"));
            zip.AddDirectory(dirInfor + "/", "CodeGen/css");
            zip.AddDirectory(dirInfor1 + "/", "CodeGen/fonts");
            zip.Save(Response.OutputStream);
        }
        string FileToDelete1 = Server.MapPath("../../Downloads/IndexPage.html");
        File.Delete(FileToDelete1);
        string FileToDelete2 = Server.MapPath("../../Downloads/Images/" + image1);
        File.Delete(FileToDelete2);
    }
}