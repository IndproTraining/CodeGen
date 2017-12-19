using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Carousel : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Imageshow1.Attributes["src"] = ResolveUrl("Numbers/1.jpg");
        Imageshow2.Attributes["src"] = ResolveUrl("Numbers/2.jpg");
        Imageshow3.Attributes["src"] = ResolveUrl("Numbers/3.jpg");
        Imageshow4.Attributes["src"] = ResolveUrl("Numbers/4.jpg");
        Imageshow5.Attributes["src"] = ResolveUrl("Numbers/5.jpg");

    }

    protected void btnimagesubmit_Click(object sender, EventArgs e)
    {
            string result = "";
            string image1 = (fileupload1.FileName);
            if (image1 != "")
            {
                fileupload1.SaveAs(Server.MapPath(image1));
                result = result + image1 + ',';
            }
            string image2 = (fileupload2.FileName);
            if (image2 != "")
            {
                fileupload2.SaveAs(Server.MapPath(image2));
                result = result + image2 + ',';
            }
            string image3 = (fileupload3.FileName);
            if (image3 != "")
            {
                fileupload3.SaveAs(Server.MapPath(image3));
                result = result + '"' + image3 + '"' + ',';
            }
            string image4 = (fileupload4.FileName);
            if (image4 != "")
            {
                fileupload4.SaveAs(Server.MapPath(image4));
                result = result + '"' + image4 + '"' + ',';
            }
            string image5 = (fileupload5.FileName);
            if (image5 != "")
            {
                fileupload5.SaveAs(Server.MapPath(image5));
                result = result + '"' + image5 + '"' + ',';
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "closewindow();window.parent.ReceiveCarouselImages('" + result + "');", true);
        }
}