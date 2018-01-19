<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowTemplate.aspx.cs" Inherits="ShowTemplate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head runat="server">
    <title></title>
    <style type="text/css">
        #btnLogout {
            position: absolute;
            right: 20px;
            top: 20px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var templateDirName;
            var source = decodeURIComponent(location.search.match(new RegExp('check' + "=(.*?)($|;)", "i"))[1]);
            if (source == 'sp3') {
                $('#btnTempEdit').attr('disabled', true);
                $('#showTemplateInFrame').attr('src', 'Template/fitness_CodeGen/index.html');
                $('#showTemplateInFrame').css('height', '1880px');
                templateDirName = "fitness_CodeGen";
            }
            if (source == 'sp2') {
                $('#btnTempEdit').attr('disabled',false);
                $('#showTemplateInFrame').attr('src', 'Template/IndexPages/company_Display.aspx');
                templateDirName = "company_CodeGen";
            }            
            if (source == 'sp1') {
                $('#showTemplateInFrame').attr('src', 'Template/IndexPages/catering_Display.html');
                $('#showTemplateInFrame').css('height', '2576px');
                templateDirName = "catering_CodeGen";
            }
            if (source == 'sp4') {
                $('#btnTempEdit').attr('disabled', true);
                $('#showTemplateInFrame').attr('src', 'Template/dance_CodeGen/index.html');
                $('#showTemplateInFrame').css('height', '2575px');
                templateDirName = "dance_CodeGen";
            }
            if (source == 'sp5') {
                $('#btnTempEdit').attr('disabled', true);
                $('#showTemplateInFrame').attr('src', 'Template/business_CodeGen/index.html');
                $('#showTemplateInFrame').css('height', '2622px');
                templateDirName = "business_CodeGen";
            }
            if (source == 'sp6') {
                $('#btnTempEdit').attr('disabled', true);
                $('#showTemplateInFrame').attr('src', 'Template/medical_CodeGen/index.html');
                $('#showTemplateInFrame').css('height', '4065px');
                templateDirName = "medical_CodeGen";
            }
            
            $('#hfTemplateDirNameStored').val(templateDirName);
            $('#btnTempEdit').click(function () {
                if (source == 'sp1')
                    window.open("Template/IndexPages/catering_Edit.aspx");
                if (source == 'sp2')
                    window.open("Template/IndexPages/company_Edit.aspx");
            });
        });
    </script>
</head>
<body>
    <form runat="server">
        <div class="header" style="margin-top: 0px; height: 100px; background-color: #787272;">
            <div class="col-lg-5 col-md-4 col-sm-12 col-xs-12">
                <h2 style="font-family: Verdana;"><b style="color: #5bc0de">Code</b><b style="color: aliceblue">Gen</b></h2>
                <a style="color: #FFFF33; font-family: Verdana; font-size: 12px; position: absolute; top: 58px; margin-left: 12px;">Empowers your web</a>
            </div>
            <br />
            <asp:LinkButton ID="btnTempEdit" runat="server" CssClass="btn btn-default btn-sm  btn btn-info" Style="margin-left: 1115px; margin-top: -45px; width: 100px">
    <span class="glyphicon glyphicon-edit"></span> <b>Edit</b>
            </asp:LinkButton>
            <asp:LinkButton ID="btnTempDownload" runat="server" OnClick="btnTempDownload_Click" CssClass="btn btn-default btn-sm  btn btn-info" Style="margin-left: 1230px; margin-top: -87px">
    <span class="glyphicon glyphicon-download-alt"></span> <b>Download</b>
            </asp:LinkButton>
            <asp:HiddenField ID="hfTemplateDirNameStored" runat="server" />
        </div>
        <iframe id="showTemplateInFrame" style="height: 1000px; width: 100%;"></iframe>
    </form>
</body>
</html>
