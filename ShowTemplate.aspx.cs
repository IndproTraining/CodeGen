using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.IO;

public partial class ShowTemplate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btnTempDownload_Click(object sender, EventArgs e)
    {
        string checkValue=Request.QueryString["check"].ToString();
        var downloadFileName = string.Format("CodeGen.zip", DateTime.Now.ToString("yyyy-MM-dd-HH_mm_ss"));
        Response.ContentType = "application/zip";
        Response.AddHeader("Content-Disposition", "filename=" + downloadFileName);
        using (var zip= new ZipFile()) 
        {
            string getTemplateDirName = hfTemplateDirNameStored.Value;
            DirectoryInfo dirInfor = new DirectoryInfo(HttpContext.Current.Request.MapPath("~/Template"));
           
               zip.AddDirectory(dirInfor+"/"+getTemplateDirName,"CodeGen");
               zip.Save(Response.OutputStream);
        }
    }
}