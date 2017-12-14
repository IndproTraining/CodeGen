<%@ Page Title="" Language="C#" MasterPageFile="~/UIDesignMasterPage.master" AutoEventWireup="true" CodeFile="UIDesignTest.aspx.cs" Inherits="UIDesignTest" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container" style="width: inherit; border: 1px solid gray; height: 620px;">
        <%--Header--%>
        <div id="header">
                <asp:Label ID="lblheader" runat="server" Text="Header" Style="position:absolute;top:80px;z-index:10;" contenteditable="true" ClientIDMode="Static"></asp:Label>
                <span class="label label-success" style="position:absolute;top:65px;z-index:10;" id="apply">Apply</span><span class="label label-danger" Style="position:absolute;top:65px;left:75px; z-index:10;" id="remove">Remove</span>
        </div>
        <%--  NavBar--%>
        <div id="navbarContain" style="position:absolute; top:151px;"></div>
        <%--Carousel--%>
        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 820px; position: absolute; top: 200px; left: 16px">
            <!-- Indicators -->
            <ol class="carousel-indicators">
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
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
    
    <%--Map--%>
    <div id="map" style="display: none; position: absolute; top: 480px; left: 16.5px"></div>
    <%--Footer--%>
    <div id="Footer">
    </div>
    </div>
</asp:Content>



