<%@ Page Language="C#" AutoEventWireup="true" CodeFile="company_Edit.aspx.cs" Inherits="Template_IndexPages_company_Edit" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Company CodeGen</title>
<link href="../company_CodeGen/css/style.css" rel="stylesheet" type="text/css" media="all" />
     <link rel="stylesheet" href="../../jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="../../scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../../jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="../../jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="../../jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="../../jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="../../jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="../../jqwidgets/jqxtabs.js"></script>
    <script type="text/javascript" src="../../jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="../../jqwidgets/jqxnotification.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#save').click(function () {
                debugger;
                var newbtn = document.getElementById('btnDownloadServer');
                if (newbtn != null) {
                    var userEditedCompanyLogo = document.getElementById('companyLogo').innerText;
                    var userEditedCompanyContact = document.getElementById('companyContact').innerText;
                    var userEditedCompanyEmail = document.getElementById('companyEmail').innerText;
                    var userEditedMenu1 = document.getElementById('menu1').innerText;
                    var userEditedMenu2 = document.getElementById('menu2').innerText;
                    var userEditedMenu3 = document.getElementById('menu3').innerText;
                    var userEditedMenu4 = document.getElementById('menu4').innerText;
                    var userEditedCompanyAbout = document.getElementById('companyAbout').innerText;
                    var userEditedCompanyAboutContent = document.getElementById('companyAboutContent').innerText;
                    $('#hfCompanyLogo').val(userEditedCompanyLogo);
                    $('#hfCompanyContact').val(userEditedCompanyContact);
                    $('#hfCompanyEmail').val(userEditedCompanyEmail);
                    $('#hfMenu1').val(userEditedMenu1);
                    $('#hfMenu2').val(userEditedMenu2);
                    $('#hfMenu3').val(userEditedMenu3);
                    $('#hfMenu4').val(userEditedMenu4);
                    $('#hfCompanyAbout').val(userEditedCompanyAbout);
                    $('#hfCompanyAboutContent').val(userEditedCompanyAboutContent);
                    newbtn.click();
                }
                return false;
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#mainImage').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function ShowFiles(args) {
            readURL(args);
        }

        function openFileUploader() {
            $('#fileUploadmainImage').click();
        }

        function EditNotification() {
            $("#jqxNotificationEdit").jqxNotification("open");
            $("#jqxNotificationEdit").jqxNotification({
                width: "40%", position: "top-right", opacity: 0.9,
                autoOpen: true, animationOpenDelay: 800, animationCloseDelay: 800, autoClose: true, template: "info"
            });
        }
    </script>
    <style>
        .container {
            position: relative;
            width: 100%;
        }

        .image {
            opacity: 1;
            display: block;
            width: 100%;
            height: auto;
            transition: .5s ease;
            backface-visibility: hidden;
        }

        .container:hover .image {
            opacity: 0.3;
        }

        .container:hover .middle {
            opacity: 1;
        }

        .middle {
            transition: .5s ease;
            opacity: 0;
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            text-align: center;
        }

        .text {
            color: blue;
            font-size: 20px;
            padding-left: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="wrap">
            <div class="logo" ><a href="#" id="companyLogo" contenteditable="true">Company Name</a></div>
            <div class="phone">
                <ul>
                    <li contenteditable="true" id="companyContact"><span class="icon mob" ></span>Contact : +91 000-000000</li>
                    <li contenteditable="true" id="companyEmail"><span class="icon mail" ></span>Email : <a href="mailto:@example.com">contact@companyname.com</a></li>
                </ul>
            </div>
            <div class="clear"></div>
            <div class="nav">
                <ul>
                    <li id="menu1" contenteditable="true"><a href="#">Home</a></li>
                    <li id="menu2" contenteditable="true"><a href="#">About</a></li>
                    <li id="menu3" contenteditable="true"><a href="#">Services</a></li>
                    <li id="menu4" contenteditable="true"><a href="#">Contact</a></li>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="wrap">
    <div class="content container">
            <img src="../company_CodeGen/images/s1.jpg" style="width:100%" class="image" id="mainImage">
         <div class="middle">
               <a href="#"  style="text-decoration:none"><span class="text" id="sp1" onclick="openFileUploader();" runat="server"><b>Change Image</b></span></a>
            </div><br/><br/>                
            <div class="b-box">
            <h1 contenteditable="true" id="companyAbout">About</h1>
			<p contenteditable="true" id="companyAboutContent">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat.</p>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <div class="f-menu">                
                 <div class="copy">© 2017 CodeGen. All rights reserved. Designed by CodeGen </div>
            </div>
        </div>
    </div>
     <div id="jqxNotificationEdit" style="display:none; position: absolute; left: 400px;margin-top:50px">
                <h5 style="font-family: Verdana">Please Click On The Item To Edit.</h5>
            </div>
    <form runat="server">
        <asp:FileUpload ID="fileUploadmainImage" runat="server" onchange="ShowFiles(this)" style="display:none" />
        <asp:HiddenField ID="hfCompanyLogo" runat="server" />
        <asp:HiddenField ID="hfCompanyContact" runat="server" />
        <asp:HiddenField ID="hfCompanyEmail" runat="server" />
        <asp:HiddenField ID="hfMenu1" runat="server" />
        <asp:HiddenField ID="hfMenu2" runat="server" />
        <asp:HiddenField ID="hfMenu3" runat="server" />
        <asp:HiddenField ID="hfMenu4" runat="server" />
        <asp:HiddenField ID="hfCompanyAbout" runat="server" />
        <asp:HiddenField ID="hfCompanyAboutContent" runat="server" />
         <asp:Button ID="btnDownloadServer" runat="server" Text="Button" Style="display:none"  OnClick="btnDownloadServer_Click" />
        <div style="background-color:#39C7EE;height:12px;width:100px;border-radius:6px 6px;position:absolute;left:600px">
        <asp:LinkButton ID="save" runat="server" Style="margin-left: 15px; width: 250px;">
        <b style="color:white;font-family:Verdana;font-size:15px">Download</b>
        </asp:LinkButton>
            </div>
    </form>
    </body>
    </html>
