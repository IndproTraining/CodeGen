<%@ Page Title="" Language="C#" MasterPageFile="~/UIDesignMasterPage.master" AutoEventWireup="true" CodeFile="UIDesignTest.aspx.cs" Inherits="UIDesignTest" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container" id="mycontainer">        <%--Header--%>
        <div id="header">
                <asp:Label ID="lblheader" runat="server" Text="Header" Style="position:absolute;top:80px;z-index:10;" contenteditable="true" ClientIDMode="Static"></asp:Label>
                <a href="#"<span class="label label-success" Style="position:absolute;top:65px;z-index:10;" id="apply">Change</span></a><a href="#"<span class="label label-danger" Style="position:absolute;top:65px;left:85px; z-index:10;" id="remove">Cancle</span></a>
        </div>
        <%--  NavBar--%>
        <div id="navbarContain"></div>
         <%--Carousel--%>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
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
    <%--Footer--%>
    <div id="Footer" style="position:absolute;top:888px;left:16px; height:50px;width:96.3%">
         <asp:Label ID="lblfooter" runat="server" Text="Footer" Style="position:absolute;top:20px;left:10px;z-index:10;" contenteditable="true" ClientIDMode="Static"></asp:Label>
                <a href="#"<span class="label label-success" Style="position:absolute;z-index:10;" id="apply1">Change</span></a><a href="#"<span class="label label-danger" Style="position:absolute;left:52px; z-index:10;" id="remove1">Cancle</span></a>
    </div>
    </div>
</asp:Content>



   
    




