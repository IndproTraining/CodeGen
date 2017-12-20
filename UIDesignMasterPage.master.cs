using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UIDesignMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnPageGenerate_Click(object sender, EventArgs e)
    {
       //ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.parent.notification();", true);

        string headerValue = hiddenFieldHeaderValue.Value;
        string headerDivCode = "";
        string navDivCode = "";
        string navFunction = "";
        string carouselDivCode = "";
        string gMapDiv = "";
        string gMapConvertFunction = "";
        string footerValue = hiddenFieldFooterValue.Value;
        string footerDivCode = "";
        
        if (!string.IsNullOrEmpty(Convert.ToString(headerValue)))
        {
            string[] headerCode = {"<div class=\"header\" style=\"position:absolute; top:0px; width:100%; left:0px; padding-left:15px ;background-color:lightgrey; height: 80px;\">",
      "<h3 style=\"text-align: left\">"+headerValue+"</h3>",
      "</div>"};
            headerDivCode = String.Join("\n", headerCode);
        }

        string page1 = Convert.ToString(hiddenFieldNav1Value.Value).Replace(" ", String.Empty);
        string page2 = Convert.ToString(hiddenFieldNav2Value.Value).Replace(" ", String.Empty);
        string page3 = Convert.ToString(hiddenFieldNav3Value.Value).Replace(" ", String.Empty);
        string page4 = Convert.ToString(hiddenFieldNav4Value.Value).Replace(" ", String.Empty);
       

        if (!string.IsNullOrEmpty(page1) && !string.IsNullOrEmpty(page2) && !string.IsNullOrEmpty(page3) && !string.IsNullOrEmpty(page4))
        {
            string[] navCode = {"<nav class=\"navbar navbar-default\" style=\"position:absolute ;left:0px; top:80px;width:100%\">",
            "<div class=\"container-fluid\">",
            "<ul class=\"nav navbar-nav\">",
            "   <li class=\"active\"><a id=\"id1\" href=\"#\">"+hiddenFieldNav1Value.Value+"</a></li>",
            "   <li><a id=\"id2\" href=\"#\">"+hiddenFieldNav2Value.Value+"</a></li>",
            "   <li><a id=\"id3\" href=\"#\">"+hiddenFieldNav3Value.Value+"</a></li>",
            "   <li><a id=\"id4\" href=\"#\">"+hiddenFieldNav4Value.Value+"</a></li>",
            "</ul>",
            "</div>",
        "</nav>",
        "<div id=\"displayNavPages\" style=\"position:absolute; left:150px; top:320px; height:100px; width:800px \"></div>"};
            navDivCode = String.Join("\n", navCode);

            string[] navPagesFunction = {"<script src=\"jquery-1.11.1.min.js\"></script>",       
   "<script type=\"text/javascript\">",
   "   $(document).ready(function () {",
   "       $('#displayNavPages').load(\""+page1+".html\");",
   "       $('#id1').click(function () {",
   "            $('#displayNavPages').load(\""+page1+".html\");",
   "        });",
   "        $('#id2').click(function () {",
   "            $('#displayNavPages').load(\""+page2+".html\");",
   "        });",
   "        $('#id3').click(function () {",
   "            $('#displayNavPages').load(\""+page3+".html\");",
   "        });",
   "        $('#id4').click(function () {",
   "            $('#displayNavPages').load(\""+page4+".html\");",
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
                    divCarousel = "<div class=\"item active\"> \n <img src=\"" + imageName + "\" style=\"width:100%; height: 210px\"> \n </div>\n";
                }
                else
                {
                    listCarousel = listCarousel + "<li data-target=\"#myCarousel\" data-slide-to=\"" + i + "\"></li>\n";
                    divCarousel = divCarousel + "<div class=\"item\"> \n <img src=\"" + imageName + "\" style=\"width: 100%; height: 210px\"> \n </div>\n";
                }
                i = i + 1;
        }
            string[] carouselCode = {"<div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\" style=\"top:130px; width:102%; left:-16px\">",
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
                       "<a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\">",
                       "   <span class=\"glyphicon glyphicon-chevron-right\"></span>",
                       "   <span class=\"sr-only\">Next</span>",
                       "</a>",
                       "</div>"};

            carouselDivCode = String.Join("\n", carouselCode);
        }

            if (!string.IsNullOrEmpty(Convert.ToString(footerValue)))
            {
                string[] footerCode = {"<div class=\"footer\" style=\"position:absolute; bottom:0px; width:100%; left:0px; padding-left:15px; background-color: lightgrey; height: 80px;\">",
       "<h3 style=\"text-align: left\">"+footerValue+"</h3>",
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
            gMapDiv = "<div id=\"map\" style=\"position: absolute; top: 462px; width:100%; left:0px; height:120px;\"></div>";
            gMapConvertFunction = String.Join("\n", gMapFunction);
        }


        string[] indexPage ={"<!DOCTYPE html>",
"<html xmlns=\"http://www.w3.org/1999/xhtml\">",
"<head>",
"<title></title>",
"<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">",
"<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>",
"<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>",
""+navFunction+"",
""+gMapConvertFunction+"",
"</head>",
"<body>",
"<div class=\"container-fluid\" style=\"width:100%;\">",
""+headerDivCode+"",
""+navDivCode+"",
""+carouselDivCode+"",
""+gMapDiv+"",
""+footerDivCode+"",
" </div>",
"</body>",
"</html>"};
        File.WriteAllLines(Server.MapPath("IndexPage.html"), indexPage);
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "successMessage", "SuccessMsg();", true);
     
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

        if (!string.IsNullOrEmpty(Convert.ToString(headerValue)))
        {
            string[] headerCode = {"<div class=\"header\" style=\"position:absolute; top:0px; width:100%; left:0px; padding-left:15px ;background-color:lightgrey; height: 80px;\">",
      "<h3 style=\"text-align: left\">"+headerValue+"</h3>",
      "</div>"};
            headerDivCode = String.Join("\n", headerCode);
        }

        string page1 = Convert.ToString(hiddenFieldNav1Value.Value).Replace(" ", String.Empty);
        string page2 = Convert.ToString(hiddenFieldNav2Value.Value).Replace(" ", String.Empty);
        string page3 = Convert.ToString(hiddenFieldNav3Value.Value).Replace(" ", String.Empty);
        string page4 = Convert.ToString(hiddenFieldNav4Value.Value).Replace(" ", String.Empty);


        if (!string.IsNullOrEmpty(page1) && !string.IsNullOrEmpty(page2) && !string.IsNullOrEmpty(page3) && !string.IsNullOrEmpty(page4))
        {
            string[] navCode = {"<nav class=\"navbar navbar-default\" style=\"position:absolute ;left:0px; top:80px;width:100%\">",
            "<div class=\"container-fluid\">",
            "<ul class=\"nav navbar-nav\">",
            "   <li class=\"active\"><a id=\"id1\" href=\"#\">"+hiddenFieldNav1Value.Value+"</a></li>",
            "   <li><a id=\"id2\" href=\"#\">"+hiddenFieldNav2Value.Value+"</a></li>",
            "   <li><a id=\"id3\" href=\"#\">"+hiddenFieldNav3Value.Value+"</a></li>",
            "   <li><a id=\"id4\" href=\"#\">"+hiddenFieldNav4Value.Value+"</a></li>",
            "</ul>",
            "</div>",
        "</nav>",
        "<div id=\"displayNavPages\" style=\"position:absolute; left:150px; top:320px; height:100px; width:800px \"></div>"};
            navDivCode = String.Join("\n", navCode);

            string[] navPagesFunction = {"<script src=\"jquery-1.11.1.min.js\"></script>",       
   "<script type=\"text/javascript\">",
   "   $(document).ready(function () {",
   "       $('#displayNavPages').load(\""+page1+".html\");",
   "       $('#id1').click(function () {",
   "            $('#displayNavPages').load(\""+page1+".html\");",
   "        });",
   "        $('#id2').click(function () {",
   "            $('#displayNavPages').load(\""+page2+".html\");",
   "        });",
   "        $('#id3').click(function () {",
   "            $('#displayNavPages').load(\""+page3+".html\");",
   "        });",
   "        $('#id4').click(function () {",
   "            $('#displayNavPages').load(\""+page4+".html\");",
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
                    divCarousel = "<div class=\"item active\"> \n <img src=\"" + imageName + "\" style=\"width:100%; height: 210px\"> \n </div>\n";
                }
                else
                {
                    listCarousel = listCarousel + "<li data-target=\"#myCarousel\" data-slide-to=\"" + i + "\"></li>\n";
                    divCarousel = divCarousel + "<div class=\"item\"> \n <img src=\"" + imageName + "\" style=\"width: 100%; height: 210px\"> \n </div>\n";
                }
                i = i + 1;
        }
            string[] carouselCode = {"<div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\" style=\"top:130px; width:102%; left:-16px\">",
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
                       "<a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\">",
                       "   <span class=\"glyphicon glyphicon-chevron-right\"></span>",
                       "   <span class=\"sr-only\">Next</span>",
                       "</a>",
                       "</div>"};

            carouselDivCode = String.Join("\n", carouselCode);
        }
        
        if (!string.IsNullOrEmpty(Convert.ToString(footerValue)))
        {
            string[] footerCode = {"<div class=\"footer\" style=\"position:absolute; bottom:0px; width:100%; left:0px; padding-left:15px; background-color: lightgrey; height: 80px;\">",
       "<h3 style=\"text-align: left\">"+footerValue+"</h3>",
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
            gMapDiv = "<div id=\"map\" style=\"position: absolute; top: 462px; width:100%; left:0px; height:120px;\"></div>";
            gMapConvertFunction = String.Join("\n", gMapFunction);
        }


        string[] indexPage ={"<!DOCTYPE html>",
"<html xmlns=\"http://www.w3.org/1999/xhtml\">",
"<head>",
"<title></title>",
"<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">",
"<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>",
"<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>",
""+navFunction+"",
""+gMapConvertFunction+"",
"</head>",
"<body>",
"<div class=\"container-fluid\" style=\"width:100%;\">",
""+headerDivCode+"",
""+navDivCode+"",
""+carouselDivCode+"",
""+gMapDiv+"",
""+footerDivCode+"",
" </div>",
"</body>",
"</html>"};
        File.WriteAllLines(Server.MapPath("IndexPage.html"), indexPage);
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "window.parent.newPageLoad();", true);
        //Delete the file //
        //string FileToDelete = Server.MapPath("m2.html");
        //File.Delete(FileToDelete);       
    }
}
