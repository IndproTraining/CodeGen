<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Template.aspx.cs" Inherits="Template" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function openTemplate(id) {
            window.open("ShowTemplate.aspx?check=" + id);
        }

        function closewindow() {
            window.parent.$('#jqxwindowTemplate').jqxWindow('close');
        }
    </script>
    <style type="text/css">
        .container {
            position: relative;
            width: 50%;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div id="FirstDiv" class="container" style="height:250px;width:250px;position:absolute; left:70px;top:8px"">
         <a href="#">
         <img src="Template/Fitness.JPG" class="image" style="height:250px;width:250px;" title="view this template"/>
            <div class="middle">
              <span class="text" id="sp1" onclick="openTemplate(id);" runat="server"><b>Click to view</b></span>
            </div>
         </a>
         </div>
         <div id="SecondDiv" class="container" style="height:250px;width:250px;position:absolute; left:425px;top:8px">
         <a href="#">
             <img src="Template/displayCompany.JPG" class="image" style="height:250px;width:250px;" title="view this template"/>
         <div class="middle">
              <span class="text" id="sp2" onclick="openTemplate(id);" runat="server">Click to view</span>
         </div>
         </a>
         </div>
         <div id="ThirdDiv" class="container" style="height:250px;width:250px;position:absolute;left:780px;top:8px">
         <a href="#">
            <img src="Template/catering.JPG" class="image" style="height:250px;width:250px;"  title="view this template"/>
            <div class="middle">
              <span class="text" id="sp3" onclick="openTemplate(id);" runat="server">Click to view</span>
            </div>
         </a>
         </div>
    </div>
    <div style="position:absolute;top:300px">
        <div id="FourthDiv" class="container" style="height:250px;width:250px;position:absolute; left:70px;top:8px"">
        <a href="#">
            <img src="Template/dance.JPG" class="image" style="height:250px;width:250px;"  title="view this template"/>
         <div class="middle">
              <span class="text" id="sp4" onclick="openTemplate(id);" runat="server">Click to view</span>
         </div>
        </a>
        </div>
        <div id="FifthDiv" class="container" style="height:250px;width:250px;position:absolute; left:425px;top:8px">
        <a href="#">
            <img src="Template/business.JPG" class="image" style="height:250px;width:250px;"  title="view this template"/>
         <div class="middle">
              <span class="text" id="sp5" onclick="openTemplate(id);" runat="server">Click to view</span>
         </div>
         </a>
         </div>
         <div id="SixthDiv" class="container" style="height:250px;width:250px;position:absolute;left:780px;top:8px">
         <a href="#">
             <img src="Template/medical.JPG" class="image" style="height:250px;width:250px;"  title="view this template"/>
         <div class="middle">
              <span class="text" id="sp6" onclick="openTemplate(id);" runat="server">Click to view</span>
         </div>
         </a>
         </div>
    </div>
         <button type="button" id="btncancle" class="btn btn-info" onclick="closewindow();" style="margin-left: 500px; margin-top: 580px; width:100px">Cancel</button>
    </form>
</body>
</html>
