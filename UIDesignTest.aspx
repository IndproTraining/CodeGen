<%@ Page Title="" Language="C#" MasterPageFile="~/UIDesignMasterPage.master" AutoEventWireup="true" CodeFile="UIDesignTest.aspx.cs" Inherits="UIDesignTest" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="container" style="width:inherit; border:1px solid gray; height:620px;">
        <%--Header--%>
        <div id="header" style="height: 70px; width: 819px; background-color: lightgrey;position:absolute;left:16px">
                <asp:Label ID="lbllogo" runat="server" Text="Insert Company Logo" Style="font-family: Verdana; font-size: larger"></asp:Label>
            </div>     
        <%--  NavBar--%>
            <nav class="navbar navbar-inverse" id="navigation" style="position:absolute;top:130px;left:16px;width:819px;">
  <div class="container-fluid" >
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
      <li><a href="#">Page 3</a></li> 
    </ul>
  </div>
</nav>
        <%--Carousel--%>
            <div class="container" style="width: 820px; height: 150px;position:absolute;top:185px;left:16px" id="carosoulholder">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="1.jpg" alt="Los Angeles" style="width: 820px; height: 150px">
                        </div>

                        <div class="item">
                            <img src="2.jpg" alt="Chicago" style="width: 820px; height: 150px">
                        </div>

                        <div class="item">
                            <img src="3.jpg" alt="New york" style="width: 820px; height: 150px">
                        </div>
                    </div>
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
           <div id="map" style="display:none; position:absolute; top:495px;left:17px"></div>
            <%--Footer--%>
            <div id="Footer" style="height: 70px; width: 819px; background-color: lightgrey; padding: 5px;position:absolute;top:608px;left:16px">
                <asp:Label ID="Label1" runat="server" Text="Footer Values" Style="font-family: Verdana; font-size: larger"></asp:Label>
            </div>
   </div>
</asp:Content>



