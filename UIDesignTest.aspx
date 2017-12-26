<%@ Page Title="" Language="C#" MasterPageFile="~/UIDesignMasterPage.master" AutoEventWireup="true" CodeFile="UIDesignTest.aspx.cs" Inherits="UIDesignTest" %>


<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container" id="mycontainer">       
         <%--Header--%>
        <div id="header">
                <asp:Label ID="lblheader" runat="server" Text="Header" style="position:absolute;top:80px;z-index:10;font-family:Calibri; font-size:14px; color:black;" contenteditable="true" ClientIDMode="Static"></asp:Label>
                <a href="#"><span class="label label-success" style="position:absolute;top:60px;z-index:10; left:15px;" id="apply">Change</span></a><a href="#"><span class="label label-danger" style="position:absolute;top:60px;left:68px; z-index:10;" id="remove">Cancel</span></a>
        <a href="#"><span class="label label-danger" id="destroyHeader">X</span></a>
            <a href="#"><span class="label label-warning" id="divColorHeader">Header-color</span></a>
               <a href="#"><span class="label label-warning" style="position:absolute;top:135px;left:15px; z-index:10;" id="fontSizeHeader">fontsize</span></a>
            <a href="#"><span class="label label-warning" style="position:absolute;top:135px;left:70px; z-index:10;" id="fontColorHeader">font-color</span></a>
            <a href="#"><span class="label label-warning" style="position:absolute;top:135px;left:134px; z-index:10;" id="fontFamilyHeader">font-family</span></a>
        <input id="btnHeaderColorTool" type="button" class="jscolor" onchange="newHeaderColor()"/>     
            <a href="#"><span class="label label-success" id="applycolor">Change</span></a><a href="#"><span class="label label-danger" style="" id="removecolor">Cancel</span></a>
        </div>
        <%--  NavBar--%>
        <div id="navbarContain"></div>
         <a href="#"><span class="label label-danger" id="destroynav">X</span></a>
      
                <%--Carousel--%>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
 <a href="#"><span class="label label-danger" id="destroycar">X</span></a>
            <!-- Indicators -->
            <ol class="carousel-indicators">
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" runat="server">
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="display: none" id="pre">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next" style="display: none" id="nxt">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
  <%--  Content Area--%>
         <div id="ContentArea" class="container">
             <div style="width: auto; border-bottom: 1px solid black;">
            <h4 style="text-align:center">Content Area</h4>
                 </div>
        </div>
    <%--Map--%>
    <div id="map" style="display: none; position: absolute; top: 731px; left: 16.5px"></div>
<a href="#"<span class="label label-danger" id="destroymap">X</span></a>
    <%--Footer--%>
    <div id="Footer" style="position:absolute;top:888px;left:16px; height:50px;width:96.3%">
         <asp:Label ID="lblfooter" runat="server" Text="Footer" style="position:absolute;top:20px;left:10px;z-index:10;font-family:Calibri; font-size:14px; color:black;" contenteditable="true" ClientIDMode="Static"></asp:Label>
                <a href="#"><span class="label label-success" style="position:absolute;z-index:10;" id="apply1">Change</span></a><a href="#"><span class="label label-danger" style="position:absolute;left:53px; z-index:10;" id="remove1">Cancel</span></a>
   <a href="#"><span class="label label-danger" id="destroyFooter">X</span></a>
        <a href="#"><span class="label label-warning" id="divColorFooter">Footer-color</span></a>
        <a href="#"><span class="label label-warning" style="position:absolute;bottom:-20px; z-index:10;" id="fontSizeFooter">fontsize</span></a>
            <a href="#"><span class="label label-warning" style="position:absolute;bottom:-20px;left:55px; z-index:10;" id="fontColorFooter">font-color</span></a>
            <a href="#"><span class="label label-warning" style="position:absolute;bottom:-20px;left:119px; z-index:10;" id="fontFamilyFooter">font-family</span></a>
         <input id="btnFooterColorTool" type="button" class="jscolor" onchange="newFooterColor()"/>
         <a href="#"><span class="label label-success" id="applycolorfooter">Change</span></a><a href="#"><span class="label label-danger" id="removecolorfooter">Cancel</span></a>
    </div>  
        <div style="position:absolute;top:150px;z-index:10; left:16px;">
         <select id="fontSize1ListHeader" onchange="headerSize(this);" size="3" style="display: none">
  <option>small</option>
  <option>large</option>
  <option>x-large</option>
  <option>xx-large</option>
</select>
            </div>
        <div style="position:absolute;top:150px;z-index:10; left:70px;">
<select id="fontcolorListHeader" onchange="headerColor(this);" size="3" style="display: none">
  <option>blue</option>
  <option>red</option>
  <option>green</option>
</select>
            </div>
        <div style="position:absolute;top:150px;z-index:10; left:135px;">
<select id="fontfamilyListHeader" onchange="headerFamily(this);" size="3" style="display: none">
  <option>Algerian</option>
  <option>Bell MT</option>
  <option>Calibri</option>
</select>
            </div>   
        
        <div style="position:absolute;top:958px;z-index:10; left:15px;">
         <select id="fontSize1ListFooter" onchange="footerSize(this);" size="3" style="display: none">
  <option>small</option>
  <option>large</option>
  <option>x-large</option>
  <option>xx-large</option>
</select>
            </div>
        <div style="position:absolute;top:958px;z-index:10; left:72px;">
<select id="fontcolorListFooter" onchange="footerColor(this);" size="3" style="display: none">
  <option>blue</option>
  <option>red</option>
  <option>green</option>
</select>
            </div>
        <div style="position:absolute;top:958px;z-index:10; left:136px;">
<select id="fontfamilyListFooter" onchange="footerFamily(this);" size="3" style="display: none">
  <option>Algerian</option>
  <option>Bell MT</option>
  <option>Calibri</option>
</select>
            </div>
         </div>
</asp:content>









