<%@ Page Language="C#" AutoEventWireup="true" CodeFile="catering_Edit.aspx.cs" Inherits="Template_IndexPages_catering_Edit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Catering(CodeGen)</title>
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#save').click(function () {
                var newbtn = document.getElementById('btnDownloadServer');
                if (newbtn != null) {
                    var userEditedHeader = document.getElementById('heading').innerText;
                    var userEditedMenu1 = document.getElementById('menu1Text').innerText;
                    var userEditedMenu2 = document.getElementById('menu2Text').innerText;
                    var userEditedMenu3 = document.getElementById('menu3Text').innerText;
                    var userEditedMenu4 = document.getElementById('menu4Text').innerText;
                    var userEditedFirstImageText = document.getElementById('firstImageText').innerText;
                    var userEditedcontentHeaderMenu2Text = document.getElementById('contentHeaderMenu2Text').innerText;
                    var userEditedcontentOfMenu2Text = document.getElementById('contentOfMenu2Text').innerText;
                    var userEditedcontentHeaderMenu3Text = document.getElementById('contentHeaderMenu3Text').innerText;
                    var userEditedcontentOfMenu3TextFirst = document.getElementById('contentOfMenu3TextFirst').innerText;
                    var userEditedcontentOfMenu3TextSecond = document.getElementById('contentOfMenu3TextSecond').innerText;
                    var userEditedcontentOfMenu3TextThird = document.getElementById('contentOfMenu3TextThird').innerText;
                    var userEditedcontentHeaderMenu4Text = document.getElementById('contentHeaderMenu4Text').innerText;
                    var userEditedcontentOfMenu4Text = document.getElementById('contentOfMenu4Text').innerText;
                    $('#headerstorage').val(userEditedHeader);
                    $('#hfMenu1').val(userEditedMenu1);
                    $('#hfMenu2').val(userEditedMenu2);
                    $('#hfMenu3').val(userEditedMenu3);
                    $('#hfMenu4').val(userEditedMenu4);
                    $('#hfFirstImageText').val(userEditedFirstImageText);
                    $('#hfContentHeaderMenu2Text').val(userEditedcontentHeaderMenu2Text);
                    $('#hfContentOfMenu2Text').val(userEditedcontentOfMenu2Text);
                    $('#hfContentHeaderMenu3Text').val(userEditedcontentHeaderMenu3Text);
                    $('#hfOfMenu3TextFirst').val(userEditedcontentOfMenu3TextFirst);
                    $('#hfOfMenu3TextSecond').val(userEditedcontentOfMenu3TextSecond);
                    $('#hfOfMenu3TextThird').val(userEditedcontentOfMenu3TextThird);
                    $('#hfContentHeaderMenu4Text').val(userEditedcontentHeaderMenu4Text);
                    $('#hfContentOfMenu4Text').val(userEditedcontentOfMenu4Text);
                    newbtn.click();
                }
                return false;
            });
           
        });
        function showDownloadNotification() {
            var x = document.getElementById("snackbar")
            if (document.documentElement.scrollTop < 1790) {
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
            }
        }
        function headerEdit() {
            var editedHeader = document.getElementById('heading');
            usereditedHeader = editedHeader.innerText;
            document.getElementById('firstImageText').textContent = usereditedHeader
            document.getElementById('heading').text = usereditedHeader;
        }
        function EditContactmenu() {
            var editedContactMenu = document.getElementById('menu4Text');
            usereditedContactMenu = editedContactMenu.innerText;
            document.getElementById('contactHeader').textContent = usereditedContactMenu
        }
        function openFileUploaderFirstImage() {
            $('#FileUploadMainImage').click();
        }
        function openFileUploaderSecondImage() {
            $('#FileUploadSecondImage').click();
        }
        function openFileUploaderThirdImage() {
            $('#FileUploadThirdImage').click();
        }
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#firstImage').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function ShowFiles(args) {
            readURL(args);
        }
        function readURL1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#secondImage').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function ShowFiles1(args) {
            readURL1(args);
        }
        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#thirdImage').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function ShowFiles2(args) {
            readURL2(args);
        }

        function EditNotification() {
            $("#jqxNotificationEdit").jqxNotification("open");
            $("#jqxNotificationEdit").jqxNotification({
                width: "40%", position: "top-right", opacity: 0.9,
                autoOpen: true, animationOpenDelay: 800, animationCloseDelay: 800, autoClose: true, template: "info"
            });
        }

    </script>
    <style type="text/css">
        body {
            font-family: "Times New Roman", Georgia, Serif;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: "Playfair Display";
            letter-spacing: 5px;
        }

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
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            text-align: center;
        }

        .text {
            color: blue;
            font-size: 17px;
            padding-left: 20px;
        }

        #snackbar {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #787272;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
        }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

        @-webkit-keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }
    </style>
</head>
<body onscroll="showDownloadNotification();">
    <!-- Navbar (sit on top) -->
    <div class="w3-top">
        <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing: 4px;">
            <a href="#home" id="heading" class="w3-bar-item w3-button" contenteditable="true" runat="server" oninput="headerEdit();">CodeGen Catering</a>
            <!-- Right-sided navbar links. Hide them on small screens -->
            <div class="w3-right w3-hide-small">
                <a href="#home" class="w3-bar-item w3-button" contenteditable="true" id="menu1Text">Home</a>
                <a href="#about" class="w3-bar-item w3-button" contenteditable="true" id="menu2Text">About</a>
                <a href="#menu" class="w3-bar-item w3-button" contenteditable="true" id="menu3Text">Menu</a>
                <a href="#contact" class="w3-bar-item w3-button" contenteditable="true" oninput="EditContactmenu();" id="menu4Text">Contact</a>
            </div>
        </div>
    </div>
    <!-- Header -->
    <header class="w3-display-container w3-content w3-wide container" style="max-width: 1600px; min-width: 500px" id="home">
        <img class="image" src="../catering_CodeGen/Hamburger.jpg" alt="Hamburger Catering" width="1600" height="800" id="firstImage" />
        <div class="middle">
            <a href="#" style="text-decoration:none"><span class="text" id="sp1" onclick="openFileUploaderFirstImage();" runat="server"><b>Change Image</b></span></a>
        </div>
        <div class="w3-display-bottomleft w3-padding-large w3-opacity">
            <h1 class="w3-xxlarge" id="firstImageText">CodeGen Catering</h1>
        </div>
    </header>
    <!-- Page content -->
    <div class="w3-content" style="max-width: 1100px">
        <!-- About Section -->
        <div class="w3-row w3-padding-64" id="about">
            <div class="w3-col m6 w3-padding-large w3-hide-small container">
                <img src="../catering_CodeGen/tablesetting.jpg" class="image" alt="Table Setting" width="600" height="750" id="secondImage" />
                <div class="middle">
                   <a href="#" style="text-decoration:none"><span class="text" id="Span1" onclick="openFileUploaderSecondImage();" runat="server"><b>Change Image</b></span></a>
                </div>
            </div>
            <div class="w3-col m6 w3-padding-large">
                <h1 class="w3-center" contenteditable="true" id="contentHeaderMenu2Text">About Catering</h1>
                <br />
                <p class="w3-large" contenteditable="true" id="contentOfMenu2Text">The Catering was founded in blabla by Mr. Smith in lorem ipsum dolor sit amet, consectetur adipiscing elit consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute iruredolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
            </div>
        </div>
        <hr />
        <!-- Menu Section -->
        <div class="w3-row w3-padding-64" id="menu">
            <div class="w3-col l6 w3-padding-large">
                <h1 class="w3-center" contenteditable="true" id="contentHeaderMenu3Text">Our Menu</h1>
                <br />
                <h4 contenteditable="true" id="contentOfMenu3TextFirst">Breakfast</h4>
                <br />

                <h4 contenteditable="true" id="contentOfMenu3TextSecond">Lunch</h4>
                <br />

                <h4 contenteditable="true" id="contentOfMenu3TextThird">Dinner</h4>
                <br />
            </div>
            <div class="w3-col l6 w3-padding-large container">
                <img src="../catering_CodeGen/tablesetting2.jpg" class="image" alt="Menu" style="width: 100%" id="thirdImage" />
                <div class="middle">
                    <a href="#" style="text-decoration:none"><span class="text" id="Span2" onclick="openFileUploaderThirdImage();" runat="server"><b>Change Image</b></span></a>
                </div>
            </div>
        </div>
        <hr />
        <!-- Contact Section -->
        <div class="w3-container w3-padding-64" id="contact">
            <h1 id="contactHeader">Contact</h1>
            <br />
            <p class="w3-text-blue-grey w3-large" contenteditable="true" id="contentHeaderMenu4Text"><b>Catering Service, Street, Pincode Country</b></p>
            <p contenteditable="true" id="contentOfMenu4Text">You can also contact us by phone 0123456789-0000 or email catering@catering.com, or you can send us a message here:</p>
            <form>
                <p>
                    <input class="w3-input w3-padding-16" type="text" placeholder="Name" required name="Name" /></p>
                <p>
                    <input class="w3-input w3-padding-16" type="number" placeholder="How many people" required name="People" /></p>
                <p>
                    <input class="w3-input w3-padding-16" type="datetime-local" placeholder="Date and time" required name="date" value="2017-11-16T20:00" /></p>
                <p>
                    <input class="w3-input w3-padding-16" type="text" placeholder="Message \ Special requirements" required name="Message" /></p>
                <p>
                    <button class="w3-button w3-light-grey w3-section" type="submit">SEND MESSAGE</button></p>
            </form>
        </div>
        <!-- End page content -->
    </div>
    <!-- Footer -->
    <footer class="w3-center w3-light-grey w3-padding-32">
        <p>Powered by <a href="#" title="CodeGen" target="_blank" class="w3-hover-text-green">CodeGen</a></p>
    </footer>
    <form runat="server">
        <asp:FileUpload ID="FileUploadMainImage" runat="server" Style="display: none" onchange="ShowFiles(this);" ClientIDMode="Static" />
        <asp:FileUpload ID="FileUploadSecondImage" runat="server" Style="display: none" onchange="ShowFiles1(this);" ClientIDMode="Static" />
        <asp:FileUpload ID="FileUploadThirdImage" runat="server" Style="display: none" onchange="ShowFiles2(this);" ClientIDMode="Static" />
        <asp:HiddenField ID="headerstorage" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfMenu1" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfMenu2" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfMenu3" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfMenu4" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfFirstImageText" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfContentHeaderMenu2Text" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfContentOfMenu2Text" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfContentHeaderMenu3Text" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfOfMenu3TextFirst" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfOfMenu3TextSecond" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfOfMenu3TextThird" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfContentHeaderMenu4Text" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfContentOfMenu4Text" runat="server" ClientIDMode="Static" />
        <br />
        <asp:Button ID="btnDownloadServer" runat="server" Text="Button" Style="display: none" OnClick="btnDownloadServer_Click" />
        <div id="snackbar">Download <span class="glyphicon glyphicon-arrow-down"></span></div>
        <asp:LinkButton ID="save" runat="server" CssClass="btn btn-default btn-lg btn-info" Style="margin-left: 550px; width: 250px;">
        <span class="glyphicon glyphicon-download-alt"></span> <b>Download</b>
        </asp:LinkButton>
        <div class="container">
        <div id="jqxNotificationEdit" style="display:none; position: absolute; left: 400px;margin-top:50px">
                <h5 style="font-family: Verdana">Please Click On The Item To Edit.</h5>
            </div>
            </div>
    </form>
    <br />
</body>
</html>

