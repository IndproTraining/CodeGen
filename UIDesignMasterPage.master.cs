﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.Web.Services;

public partial class UIDesignMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    string sliderLink = "";
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        string headerValue = hiddenFieldHeaderValue.Value;
        string headerDivCode = "";
        string navDivCode = "";
        string navFunction = "";
        string carouselDivCode = "";
        string gMapDiv = "";
        string gMapConvertFunction = "";
        string footerValue = hiddenFieldFooterValue.Value;
        string footerDivCode = "";
        string page1;
        string page2;
        string page3;
        string page4;
            if (string.IsNullOrEmpty(Convert.ToString(headerValue)) && string.IsNullOrEmpty(Convert.ToString(footerValue)) && string.IsNullOrEmpty(Convert.ToString(hiddenFieldNav1Value.Value)) && string.IsNullOrEmpty(Convert.ToString(hiddenFieldImagesSplit.Value)) && string.IsNullOrEmpty(Convert.ToString(hiddenFieldMapLongitude.Value)))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "successMessage", "EmptyNotification();", true);
            }
            else
            {
                string headerDivColor;
                if (hiddenFieldHeaderDivColor.Value == "")
                    headerDivColor = "lightgrey";
                else
                    headerDivColor = hiddenFieldHeaderDivColor.Value;
                if (!string.IsNullOrEmpty(Convert.ToString(headerValue)))
                {
                    string[] headerCode = {"<div class=\"header\" style=\"position:absolute; top:0px; width:100%; left:0px; padding-left:15px ;background-color:"+headerDivColor+"; height: 120px;\">",
                "<h3 style=\"text-align: left; color:"+hiddenFieldHeaderColor.Value+"; font-family:"+hiddenFieldHeaderFamily.Value+";font-size:"+hiddenFieldHeaderSize.Value+"\">"+headerValue+"</h3>",
                "</div>"};
                    headerDivCode = String.Join("\n", headerCode);
                }

                page1 = Convert.ToString(hiddenFieldNav1Value.Value).Replace(" ", String.Empty);
                page2 = Convert.ToString(hiddenFieldNav2Value.Value).Replace(" ", String.Empty);
                page3 = Convert.ToString(hiddenFieldNav3Value.Value).Replace(" ", String.Empty);
                page4 = Convert.ToString(hiddenFieldNav4Value.Value).Replace(" ", String.Empty);

                if (!string.IsNullOrEmpty(page1) && !string.IsNullOrEmpty(page2) && !string.IsNullOrEmpty(page3) && !string.IsNullOrEmpty(page4))
                {
                    string toggleNav = "<div class=\"navbar-header\">\n<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar-collapse-2\">\n<span class=\"sr-only\">Toggle navigation</span>\n<span class=\"icon-bar\"></span>\n<span class=\"icon-bar\"></span>\n<span class=\"icon-bar\"></span>\n</button>\n</div>\n<div class=\"collapse navbar-collapse\" id=\"navbar-collapse-2\">";
                    string[] navCode = {"<nav class=\"navbar navbar-default\" style=\"position:absolute ;left:0px; top:110px;width:100%;z-index:10\">",
                "<div class=\"container-fluid\">"+toggleNav+"",
                "<ul class=\"nav navbar-nav\">",
                "   <li class=\"active\" id=\"li1\"><a id=\"id1\" href=\"#\">"+hiddenFieldNav1Value.Value+"</a></li>",
                "   <li id=\"li2\"><a id=\"id2\" href=\"#\">"+hiddenFieldNav2Value.Value+"</a></li>",
                "   <li id=\"li3\"><a id=\"id3\" href=\"#\">"+hiddenFieldNav3Value.Value+"</a></li>",
                "   <li id=\"li4\"><a id=\"id4\" href=\"#\">"+hiddenFieldNav4Value.Value+"</a></li>",
                "</ul>",
                "</div>",
                "</nav>",
                "<div id=\"displayNavPages\" style=\"position:absolute; left:50px; top:400px; height:265px; width:93% \"></div>"};
                    navDivCode = String.Join("\n", navCode);

                    string[] navPagesFunction = {"<script src=\"jquery-1.11.1.min.js\"></script>",
               "<script type=\"text/javascript\">",
               "   $(document).ready(function () {",
               "       $('#displayNavPages').load(\""+page1+".html\");",
               "       $('#li1').addClass('active');",
               "       $('#id1').click(function ($e) {",
               "       $('#li4').removeClass('active');",
               "       $('#li3').removeClass('active');",
               "       $('#li2').removeClass('active');",
               "       $e.preventDefault();",
               "       $('#li1').addClass('active');",
               "       $('#displayNavPages').load(\""+page1+".html\");",
               "       $e.preventDefault();",
               "        });",
               "        $('#id2').click(function ($e) {",
               "       $('#li4').removeClass('active');",
               "       $('#li3').removeClass('active');",
               "       $('#li1').removeClass('active');",
               "       $e.preventDefault();",
               "       $('#li2').addClass('active');",
               "       $('#displayNavPages').load(\""+page2+".html\");",
               "        });",
               "        $('#id3').click(function ($e) {",
               "        $('#li2').removeClass('active');",
               "        $('#li1').removeClass('active');",
               "        $('#li4').removeClass('active');",
               "        $e.preventDefault();",
               "        $('#li3').addClass('active');",
               "        $('#displayNavPages').load(\""+page3+".html\");",
               "        });",
               "        $('#id4').click(function ($e) {",
               "        $('#li1').removeClass('active');",
               "        $('#li3').removeClass('active');",
               "        $('#li2').removeClass('active');",
               "        $e.preventDefault();",
               "        $('#li4').addClass('active');",
               "        $('#displayNavPages').load(\""+page4+".html\");",
               "        });",
               "    });",
               "</script>" };
                    navFunction = string.Join("\n", navPagesFunction);
                }

                string images = hiddenFieldImagesSplit.Value;
                if (!string.IsNullOrEmpty(images))
                {
                    string[] imageCount = images.Split(',');
                    string listCarousel = "";
                    string divCarousel = "";
                    int i = 0;
                    foreach (string imageName in imageCount)
                    {
                        if (i == 0)
                        {
                            listCarousel = "<li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>\n";
                            divCarousel = "<div class=\"item active\"> \n <img src=\"Images/" + imageName + "\" style=\"width:100%; height: 210px\"> \n </div>\n";
                        }
                        else
                        {
                            listCarousel = listCarousel + "<li data-target=\"#myCarousel\" data-slide-to=\"" + i + "\"></li>\n";
                            divCarousel = divCarousel + "<div class=\"item\"> \n <img src=\"Images/" + imageName + "\" style=\"width: 100%; height: 210px\"> \n </div>\n";
                        }
                        i = i + 1;
                    }
                    string[] carouselCode = {"<div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\" style=\"top:162px; width:110%; left:-16px\">",
                "<ol class=\"carousel-indicators\">",
                ""+listCarousel+"",
                "</ol>",
                "<div class=\"carousel-inner\">",
                ""+divCarousel+"",
                "</div>",
                "<a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">",
                "   <span class=\"glyphicon glyphicon-chevron-left\"></span>",
                "   <span class=\"sr-only\">Previous</span>",
                "</a>",
                "<a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\" style=\"margin-right:90px;\">",
                "   <span class=\"glyphicon glyphicon-chevron-right\"></span>",
                "   <span class=\"sr-only\">Next</span>",
                "</a>",
                "</div>"};

                    carouselDivCode = String.Join("\n", carouselCode);
                }
                string footerDivColor;
                if (hiddenFieldFooterDivColor.Value == "")
                    footerDivColor = "lightgrey";
                else
                    footerDivColor = hiddenFieldFooterDivColor.Value;
                if (!string.IsNullOrEmpty(Convert.ToString(footerValue)))
                {
                    string[] footerCode = {"<div class=\"footer\" style=\"position:absolute; bottom:0px;top:995px; width:100%; left:0px; padding-left:15px; background-color: "+footerDivColor+"; height: 90px;\">",
                "<h3 style=\"text-align: left; color:"+hiddenFieldFooterColor.Value+"; font-family:"+hiddenFieldFooterFamily.Value+";font-size:"+hiddenFieldFooterSize.Value+"\">"+footerValue+"</h3>",
                "</div>"};
                    footerDivCode = String.Join("\n", footerCode);
                }

                if (!string.IsNullOrEmpty(Convert.ToString(hiddenFieldMapLatitude.Value)) && !string.IsNullOrEmpty(Convert.ToString(hiddenFieldMapLongitude.Value)))
                {
                    string[] gMapFunction = { "<script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBqmidBFhrUsLeCeyK6o_8U_rD1BrDnE5E&callback=generateMap\">",
                "</script>",
                "<style type=\"text/css\">",
                "#map {",
                "height: 300px;",
                "width: 50%;",
                "border:2px solid darkgrey;",
                " }",
                "</style>",
                "<script type=\"text/javascript\">",
                "window.onload = function () {",
                "      generateMap();",
                "   }",
                " function generateMap() {",
                "      document.getElementById('map').style.display = 'block';",
                "      var location = { lat: "+hiddenFieldMapLatitude.Value+", lng: "+hiddenFieldMapLongitude.Value+" };",
                "      var noticeBoard = '-: Our Office :-';",
                "      var map = new google.maps.Map(document.getElementById('map'), {",
                "          zoom: 17,",
                "          center: location",
                "      });",
                "      var infowindow = new google.maps.InfoWindow({",
                "          content: noticeBoard",
                "      });",
                "       var marker = new google.maps.Marker({",
                "          position: location,",
                "          map: map,",
                "           title: 'Click Me'",
                "       });",
                "       marker.addListener('click', function () {",
                "           infowindow.open(map, marker);",
                "       });",
                "   }",
                "</script>"};
                    gMapDiv = "<div id=\"map\" style=\"position: absolute; top: 764px; width:100%; left:0px; height:230px;\"></div>";
                    gMapConvertFunction = String.Join("\n", gMapFunction);
                }

                string[] indexPage ={"<!DOCTYPE html>",
            "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
            "<head>",
            "<title></title>",
            "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">",
            "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>",
            "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>",
            ""+sliderLink+"",
            ""+navFunction+"",
            ""+gMapConvertFunction+"",
            "</head>",
            "<body style=\"margin:0px;padding:0px;overflow-x:hidden\">",
            "<div class=\"container-fluid\" style=\"width:100%;\">",
            ""+headerDivCode+"",
            ""+navDivCode+"",
            ""+carouselDivCode+"",
            ""+gMapDiv+"",
            ""+footerDivCode+"",
            " </div>",
            "</body>",
            "</html>"};
                File.WriteAllLines(Server.MapPath(@"~/Downloads/IndexPage.html"), indexPage);
                var downloadFileName = string.Format("CodeGen.zip", DateTime.Now.ToString("yyyy-MM-dd-HH_mm_ss"));
                Response.ContentType = "application/zip";
                Response.AddHeader("Content-Disposition", "filename=" + downloadFileName);
                using (var zip = new ZipFile())
                {
                    DirectoryInfo dirInfor = new DirectoryInfo(HttpContext.Current.Request.MapPath("~/Downloads"));
                    zip.AddFile(dirInfor + "/IndexPage.html", "CodeGen");
                    string[] imageCount1 = images.Split(',');
                    if (!string.IsNullOrEmpty(images))
                    {
                        foreach (string imageName in imageCount1)
                            zip.AddFile(dirInfor + "/Images/" + imageName, "CodeGen/Images");
                    }
                    if (!string.IsNullOrEmpty(page1)&& Request.Cookies["ContentCookies"] != null)
                    {
                        zip.AddFile(dirInfor + "/" + page1 + ".html", "CodeGen");
                        zip.AddFile(dirInfor + "/" + page2 + ".html", "CodeGen");
                        zip.AddFile(dirInfor + "/" + page3 + ".html", "CodeGen");
                        zip.AddFile(dirInfor + "/" + page4 + ".html", "CodeGen");
                    }
                    zip.Save(Response.OutputStream);
                }
            }
    }
    protected void btnDemoDisplay_Click(object sender, EventArgs e)
    {
        string headerValue = hiddenFieldHeaderValue.Value;
        string headerDivCode = "";
        string navDivCode = "";
        string navFunction = "";
        string carouselDivCode = "";
        string gMapDiv = "";
        string gMapConvertFunction = "";
        string footerValue = hiddenFieldFooterValue.Value;
        string footerDivCode = "";

        if (string.IsNullOrEmpty(Convert.ToString(headerValue)) && string.IsNullOrEmpty(Convert.ToString(footerValue)) && string.IsNullOrEmpty(Convert.ToString(hiddenFieldNav1Value.Value)) && string.IsNullOrEmpty(Convert.ToString(hiddenFieldImagesSplit.Value)) && string.IsNullOrEmpty(Convert.ToString(hiddenFieldMapLongitude.Value)))
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "EmptyMessage", "EmptyNotification();", true);
        }
        else
        {
            string headerDivColor;
            if (hiddenFieldHeaderDivColor.Value == "")
                headerDivColor = "lightgrey";
            else
                headerDivColor = hiddenFieldHeaderDivColor.Value;
            if (!string.IsNullOrEmpty(Convert.ToString(headerValue)))
            {
                string[] headerCode = {"<div class=\"header\" style=\"position:absolute; top:0px; width:100%; left:0px; padding-left:15px ;background-color:"+headerDivColor+"; height: 120px;\">",
                "<h3 style=\"text-align: left; color:"+hiddenFieldHeaderColor.Value+"; font-family:"+hiddenFieldHeaderFamily.Value+";font-size:"+hiddenFieldHeaderSize.Value+"\">"+headerValue+"</h3>",
                "</div>"};
                headerDivCode = String.Join("\n", headerCode);
            }

            string page1 = Convert.ToString(hiddenFieldNav1Value.Value).Replace(" ", String.Empty);
            string page2 = Convert.ToString(hiddenFieldNav2Value.Value).Replace(" ", String.Empty);
            string page3 = Convert.ToString(hiddenFieldNav3Value.Value).Replace(" ", String.Empty);
            string page4 = Convert.ToString(hiddenFieldNav4Value.Value).Replace(" ", String.Empty);

            if (!string.IsNullOrEmpty(page1) && !string.IsNullOrEmpty(page2) && !string.IsNullOrEmpty(page3) && !string.IsNullOrEmpty(page4))
            {
                string toggleNav = "<div class=\"navbar-header\">\n<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar-collapse-2\">\n<span class=\"sr-only\">Toggle navigation</span>\n<span class=\"icon-bar\"></span>\n<span class=\"icon-bar\"></span>\n<span class=\"icon-bar\"></span>\n</button>\n</div>\n<div class=\"collapse navbar-collapse\" id=\"navbar-collapse-2\">";
                string[] navCode = {"<nav class=\"navbar navbar-default\" style=\"position:absolute ;left:0px; top:110px;width:100%;z-index:10\">",
                "<div class=\"container-fluid\">"+toggleNav+"",
                "<ul class=\"nav navbar-nav\">",
                "   <li class=\"active\" id=\"li1\"><a id=\"id1\" href=\"#\">"+hiddenFieldNav1Value.Value+"</a></li>",
                "   <li  id=\"li2\"><a id=\"id2\" href=\"#\">"+hiddenFieldNav2Value.Value+"</a></li>",
                "   <li  id=\"li3\"><a id=\"id3\" href=\"#\">"+hiddenFieldNav3Value.Value+"</a></li>",
                "   <li  id=\"li4\"><a id=\"id4\" href=\"#\">"+hiddenFieldNav4Value.Value+"</a></li>",
                "</ul>",
                "</div>",
                "</nav>",
                "<div id=\"displayNavPages\" style=\"position:absolute; left:50px; top:400px; height:265px; width:93% \"></div>"};
                navDivCode = String.Join("\n", navCode);

                string[] navPagesFunction = {"<script src=\"jquery-1.11.1.min.js\"></script>",
                "<script type=\"text/javascript\">",
                "   $(document).ready(function () {",
                "       $('#displayNavPages').load(\""+page1+".html\");",
                "       $('#li1').addClass('active');",
                "       $('#id1').click(function ($e) {",
                "       $('#li4').removeClass('active');",
                "       $('#li3').removeClass('active');",
                "       $('#li2').removeClass('active');",
                "       $e.preventDefault();",
                "       $('#li1').addClass('active');",
                "       $('#displayNavPages').load(\""+page1+".html\");",
                "       $e.preventDefault();",
                "        });",
                "        $('#id2').click(function ($e) {",
                "       $('#li4').removeClass('active');",
                "       $('#li3').removeClass('active');",
                "       $('#li1').removeClass('active');",
                "       $e.preventDefault();",
                "       $('#li2').addClass('active');",
                "       $('#displayNavPages').load(\""+page2+".html\");",
                "        });",
                "        $('#id3').click(function ($e) {",
                "        $('#li2').removeClass('active');",
                "        $('#li1').removeClass('active');",
                "        $('#li4').removeClass('active');",
                "        $e.preventDefault();",
                "        $('#li3').addClass('active');",
                "        $('#displayNavPages').load(\""+page3+".html\");",
                "        });",
                "        $('#id4').click(function ($e) {",
                "        $('#li1').removeClass('active');",
                "        $('#li3').removeClass('active');",
                "        $('#li2').removeClass('active');",
                "        $e.preventDefault();",
                "        $('#li4').addClass('active');",
                "        $('#displayNavPages').load(\""+page4+".html\");",
                "        });",
                "    });",
                "</script>" };
                navFunction = string.Join("\n", navPagesFunction);
            }

            string images = hiddenFieldImagesSplit.Value;
            if (!string.IsNullOrEmpty(images))
            {
                string[] imageCount = images.Split(',');
                string listCarousel = "";
                string divCarousel = "";
                int i = 0;
                foreach (string imageName in imageCount)
                {
                    if (i == 0)
                    {
                        listCarousel = "<li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>\n";
                        divCarousel = "<div class=\"item active\"> \n <img src=\"Images/" + imageName + "\" style=\"width:100%; height: 210px\"> \n </div>\n";
                    }
                    else
                    {
                        listCarousel = listCarousel + "<li data-target=\"#myCarousel\" data-slide-to=\"" + i + "\"></li>\n";
                        divCarousel = divCarousel + "<div class=\"item\"> \n <img src=\"Images/" + imageName + "\" style=\"width: 100%; height: 210px\"> \n </div>\n";
                    }
                    i = i + 1;
                }
                string[] carouselCode = {"<div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\" style=\"top:162px; width:110%; left:-16px\">",
                "<ol class=\"carousel-indicators\">",
                ""+listCarousel+"",
                "</ol>",
                "<div class=\"carousel-inner\">",
                ""+divCarousel+"",
                "</div>",
                "<a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">",
                "   <span class=\"glyphicon glyphicon-chevron-left\"></span>",
                "   <span class=\"sr-only\">Previous</span>",
                "</a>",
                "<a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\" style=\"margin-right:90px;\">",
                "   <span class=\"glyphicon glyphicon-chevron-right\"></span>",
                "   <span class=\"sr-only\">Next</span>",
                "</a>",
                "</div>"};
                carouselDivCode = String.Join("\n", carouselCode);
            }
            string footerDivColor;
            if (hiddenFieldFooterDivColor.Value == "")
                footerDivColor = "lightgrey";
            else
                footerDivColor = hiddenFieldFooterDivColor.Value;
            if (!string.IsNullOrEmpty(Convert.ToString(footerValue)))
            {
                string[] footerCode = {"<div class=\"footer\" style=\"position:absolute; bottom:0px; width:100%; left:0px; padding-left:15px; background-color: "+footerDivColor+"; height: 90px;top:995px;\">",
                "<h3 style=\"text-align: left; color:"+hiddenFieldFooterColor.Value+"; font-family:"+hiddenFieldFooterFamily.Value+";font-size:"+hiddenFieldFooterSize.Value+"\">"+footerValue+"</h3>",
                "</div>"};
                footerDivCode = String.Join("\n", footerCode);
            }

            if (!string.IsNullOrEmpty(Convert.ToString(hiddenFieldMapLatitude.Value)) && !string.IsNullOrEmpty(Convert.ToString(hiddenFieldMapLongitude.Value)))
            {
                string[] gMapFunction = { "<script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBqmidBFhrUsLeCeyK6o_8U_rD1BrDnE5E&callback=generateMap\">",
                 "</script>",
                 "<style type=\"text/css\">",
                 "#map {",
                 "height: 300px;",
                 "width: 50%;",
                 "border:2px solid darkgrey;",
                 " }",
                 "</style>",
                 "<script type=\"text/javascript\">",
                 "window.onload = function () {",
                 "      generateMap();",
                 "   }",
                 " function generateMap() {",
                 "      document.getElementById('map').style.display = 'block';",
                 "      var location = { lat: "+hiddenFieldMapLatitude.Value+", lng: "+hiddenFieldMapLongitude.Value+" };",
                 "      var noticeBoard = '-: Our Office :-';",
                 "      var map = new google.maps.Map(document.getElementById('map'), {",
                 "          zoom: 17,",
                 "          center: location",
                 "      });",
                 "      var infowindow = new google.maps.InfoWindow({",
                 "          content: noticeBoard",
                 "      });",
                 "       var marker = new google.maps.Marker({",
                 "          position: location,",
                 "          map: map,",
                 "           title: 'Click Me'",
                 "       });",
                 "       marker.addListener('click', function () {",
                 "           infowindow.open(map, marker);",
                 "       });",
                 "   }",
                 "</script>"};
                gMapDiv = "<div id=\"map\" style=\"position: absolute; top: 764px; width:100%; left:0px; height:230px;\"></div>";
                gMapConvertFunction = String.Join("\n", gMapFunction);
            }

            string[] indexPage ={"<!DOCTYPE html>",
            "<html xmlns=\"http://www.w3.org/1999/xhtml\">",
            "<head>",
            "<title></title>",
            "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">",
            "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>",
            "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>",
            ""+sliderLink+"",
            ""+navFunction+"",
            ""+gMapConvertFunction+"",
            "</head>",
            "<body style=\"margin:0px;padding:0px;overflow-x:hidden\">",
            "<div class=\"container-fluid\" style=\"width:100%;\">",
            ""+headerDivCode+"",
            ""+navDivCode+"",
            ""+carouselDivCode+"",
            ""+gMapDiv+"",
            ""+footerDivCode+"",
            " </div>",
            "</body>",
            "</html>"};
            File.WriteAllLines(Server.MapPath(@"~/Downloads/IndexPage.html"), indexPage);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "window.parent.newPageLoad();", true);
        }
    }
    protected void btnnavdeletefile_Click(object sender, EventArgs e)
    {
        string recpage1 ="Downloads/"+ Request.Cookies["cookiepage1"].Value;
        string recpage2 = "Downloads/" + Request.Cookies["cookiepage2"].Value;
        string recpage3 = "Downloads/" + Request.Cookies["cookiepage3"].Value;
        string recpage4 = "Downloads/" + Request.Cookies["cookiepage4"].Value;
        string FileToDelete1 = Server.MapPath(HttpUtility.HtmlDecode(recpage1) + ".html");
        File.Delete(FileToDelete1);
        string FileToDelete2 = Server.MapPath(HttpUtility.HtmlDecode(recpage2) + ".html");
        File.Delete(FileToDelete2);
        string FileToDelete3 = Server.MapPath(HttpUtility.HtmlDecode(recpage3) + ".html");
        File.Delete(FileToDelete3);
        string FileToDelete4 = Server.MapPath(HttpUtility.HtmlDecode(recpage4) + ".html");
        File.Delete(FileToDelete4);
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        try
        {
            Response.Cookies["ContentCookies"].Expires = DateTime.Now.AddDays(-1);
            Session.Abandon();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        Response.Redirect("Login.aspx");
    }
}
