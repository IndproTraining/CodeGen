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
         string gMapDiv = "";
         string gMapConvertFunction = "";
         if (!string.IsNullOrEmpty(Convert.ToString(hiddenFieldMapFlag.Value)))
         {
             string[] gMapFunction = {" <style type=\"text/css\">",
     "#map {",
     "height: 300px;",
     "width: 50%;",
     "border:2px solid darkgrey;",
     " }",
     "</style>",
     "<script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBqmidBFhrUsLeCeyK6o_8U_rD1BrDnE5E&callback=generateMap\">",
     "</script>",
     "<script type=\"text/javascript\">",
     " function generateMap() {",
     "      document.getElementById('map').style.display = 'block';",
     "      var location = { lat: 22.711447, lng: 88.475216 };",
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
             gMapDiv = "<div id=\"map\" style=\"display:none\">\n</div><br /><br />";
             gMapConvertFunction = String.Join("\n", gMapFunction);
         }

        

         string[] indexPage ={"<!DOCTYPE html>",
"<html xmlns=\"http://www.w3.org/1999/xhtml\">",
"<head>",
"<title></title>",
""+gMapConvertFunction+"",
"</head>",
"<body>",
""+gMapDiv+"",
"</body>",
"</html>"};

         File.WriteAllLines(Server.MapPath("IndexPage.html"), indexPage);
     }
}
