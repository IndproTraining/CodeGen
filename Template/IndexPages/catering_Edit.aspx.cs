using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.IO;
public partial class Template_IndexPages_catering_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "successMessage", "EditNotification();", true);
    }
    protected void btnDownloadServer_Click(object sender, EventArgs e)
    {
        string image1 = (FileUploadMainImage.FileName);
        if (image1 != "")
            FileUploadMainImage.SaveAs(Server.MapPath("../../Downloads/Images/" + image1));
        else
        {
            image1 = "Hamburger.jpg";
            File.Copy("C:/inetpub/wwwroot/CodeGen/Template/catering_CodeGen/Hamburger.jpg", "C:/inetpub/wwwroot/CodeGen/Downloads/Images/Hamburger.jpg");

        }

        string image2 = (FileUploadSecondImage.FileName);
        if (image2 != "")
            FileUploadSecondImage.SaveAs(Server.MapPath("../../Downloads/Images/" + image2));
        else
        {
            image2 = "tablesetting.jpg";
            File.Copy("C:/inetpub/wwwroot/CodeGen/Template/catering_CodeGen/tablesetting.jpg", "C:/inetpub/wwwroot/CodeGen/Downloads/Images/tablesetting.jpg");
        }

        string image3 = (FileUploadThirdImage.FileName);
        if (image3 != "")
            FileUploadThirdImage.SaveAs(Server.MapPath("../../Downloads/Images/" + image3));
        else
        {
            image3 = "tablesetting2.jpg";
            File.Copy("C:/inetpub/wwwroot/CodeGen/Template/catering_CodeGen/tablesetting2.jpg", "C:/inetpub/wwwroot/CodeGen/Downloads/Images/tablesetting2.jpg");
        }

        string[] indexPage ={"<!DOCTYPE html>",
        "<html>",
        "<head>",
        "<title>Catering(CodeGen)</title>",
        "<meta charset=\"UTF-8\">",
        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">",
        "<link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">",
        "<style>",
        "body {font-family: \"Times New Roman\", Georgia, Serif;}",
        "h1,h2,h3,h4,h5,h6 {",
        "    font-family: \"Playfair Display\";",
        "    letter-spacing: 5px;",
        "}",
        "</style>",
        "</head>",
        "<body>",
        "",
        "<!-- Navbar (sit on top) -->",
        "<div class=\"w3-top\">",
        "  <div class=\"w3-bar w3-white w3-padding w3-card\" style=\"letter-spacing:4px;\">",
        "    <a href=\"#"+hfMenu1.Value+"\" class=\"w3-bar-item w3-button\">"+headerstorage.Value+"</a>",
        "    <!-- Right-sided navbar links. Hide them on small screens -->",
        "    <div class=\"w3-right w3-hide-small\">",
        "	 <a href=\"#"+hfMenu1.Value+"\" class=\"w3-bar-item w3-button\">"+hfMenu1.Value+"</a>",
        "      <a href=\"#"+hfMenu2.Value+"\" class=\"w3-bar-item w3-button\">"+hfMenu2.Value+"</a>",
        "      <a href=\"#"+hfMenu3.Value+"\" class=\"w3-bar-item w3-button\">"+hfMenu3.Value+"</a>",
        "      <a href=\"#"+hfMenu4.Value+"\" class=\"w3-bar-item w3-button\">"+hfMenu4.Value+"</a>",
        "    </div>",
        "  </div>",
        "</div>",
        "",
        "<!-- Header -->",
        "<header class=\"w3-display-container w3-content w3-wide\" style=\"max-width:1600px;min-width:500px\" id=\""+hfMenu1.Value+"\">",
        "  <img class=\"w3-image\" src=\"Images/"+image1+"\" alt=\"Hamburger Catering\" width=\"1600\" height=\"800\">",
        "  <div class=\"w3-display-bottomleft w3-padding-large w3-opacity\">",
        "    <h1 class=\"w3-xxlarge\">"+headerstorage.Value+"</h1>",
        "  </div>",
        "</header>",
        "",
        "<!-- Page content -->",
        "<div class=\"w3-content\" style=\"max-width:1100px\">",
        "",
        "  <!-- About Section -->",
        "  <div class=\"w3-row w3-padding-64\" id=\""+hfMenu2.Value+"\">",
        "    <div class=\"w3-col m6 w3-padding-large w3-hide-small\">",
        "     <img src=\"Images/"+image2+"\" class=\"w3-round w3-image w3-opacity-min\" alt=\"Table Setting\" width=\"600\" height=\"750\">",
        "    </div>",
        "",
        "    <div class=\"w3-col m6 w3-padding-large\">",
        "      <h1 class=\"w3-center\">"+hfContentHeaderMenu2Text.Value+"</h1><br>",
        "      <p class=\"w3-large\">"+hfContentOfMenu2Text.Value+"</p>",
        "    </div>",
        "  </div>",
        "",  
        "  <hr>",
        "",  
        "  <!-- Menu Section -->",
        "  <div class=\"w3-row w3-padding-64\" id=\""+hfMenu3.Value+"\">",
        "    <div class=\"w3-col l6 w3-padding-large\">",
        "      <h1 class=\"w3-center\">"+hfContentHeaderMenu3Text.Value+"</h1><br>",
        "      <h4>"+hfOfMenu3TextFirst.Value+"</h4><br/>",
        "",    
        "      <h4>"+hfOfMenu3TextSecond.Value+"</h4><br/>",
        "",    
        "    <h4>"+hfOfMenu3TextThird.Value+"</h4><br/>",
        "",    
        "     </div>",
        "",    
        "    <div class=\"w3-col l6 w3-padding-large\">",
        "      <img src=\"Images/"+image3+"\" class=\"w3-round w3-image w3-opacity-min\" alt=\"Menu\" style=\"width:100%\">",
        "    </div>",
        "  </div>",
        "",
        "  <hr>",
        "",
        "  <!-- Contact Section -->",
        "  <div class=\"w3-container w3-padding-64\" id=\""+hfMenu4.Value+"\">",
        "    <h1>"+hfMenu4.Value+"</h1><br>",
        "    <p class=\"w3-text-blue-grey w3-large\"><b>"+hfContentHeaderMenu4Text.Value+"</b></p>",
        "    <p>"+hfContentOfMenu4Text.Value+"</p>",
        "    <form>",
        "      <p><input class=\"w3-input w3-padding-16\" type=\"text\" placeholder=\"Name\" required name=\"Name\"></p>",
        "      <p><input class=\"w3-input w3-padding-16\" type=\"number\" placeholder=\"How many people\" required name=\"People\"></p>",
        "      <p><input class=\"w3-input w3-padding-16\" type=\"datetime-local\" placeholder=\"Date and time\" required name=\"date\" value=\"2017-11-16T20:00\"></p>",
        "      <p><input class=\"w3-input w3-padding-16\" type=\"text\" placeholder=\"Message\\Special requirements\" required name=\"Message\"></p>",
        "      <p><button class=\"w3-button w3-light-grey w3-section\" type=\"submit\">SEND MESSAGE</button></p>",
        "    </form>",
        "  </div>",
        "",  
        "<!-- End page content -->",
        "</div>",
        "",
        "<!-- Footer -->",
        "<footer class=\"w3-center w3-light-grey w3-padding-32\">",
        "  <p>Powered by <a href=\"#\" title=\"CodeGen\" target=\"_blank\" class=\"w3-hover-text-green\">CodeGen</a></p>",
        "</footer>",
        "</body>",
        "</html>"};
        File.WriteAllLines(Server.MapPath(@"../../Downloads/IndexPage.html"), indexPage);
        var downloadFileName = string.Format("CodeGen.zip", DateTime.Now.ToString("yyyy-MM-dd-HH_mm_ss"));
        Response.ContentType = "application/zip";
        Response.AddHeader("Content-Disposition", "filename=" + downloadFileName);
        using (var zip = new ZipFile())
        {
            DirectoryInfo dirInfor = new DirectoryInfo(HttpContext.Current.Request.MapPath("~/Downloads"));
            zip.AddDirectory(dirInfor + "/", "CodeGen");
            zip.Save(Response.OutputStream);
        }
        string FileToDelete1 = Server.MapPath("../../Downloads/IndexPage.html");
        File.Delete(FileToDelete1);
        string FileToDelete2 = Server.MapPath("../../Downloads/Images/" + image1);
        File.Delete(FileToDelete2);
        string FileToDelete3 = Server.MapPath("../../Downloads/Images/" + image2);
        File.Delete(FileToDelete3);
        string FileToDelete4 = Server.MapPath("../../Downloads/Images/" + image3);
        File.Delete(FileToDelete4);
    }
}