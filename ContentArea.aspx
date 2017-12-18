﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContentArea.aspx.cs" Inherits="ContentArea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    </title>
     <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtabs.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcombobox.js"></script>
    <script type="text/javascript" src="scripts/demos.js"></script>	
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var nav1 =decodeURIComponent(location.search.match(new RegExp('nav1' + "=(.*?)($|\&)", "i"))[1]);
            var nav2 =decodeURIComponent( location.search.match(new RegExp('nav2' + "=(.*?)($|\&)", "i"))[1]);
            var nav3 = decodeURIComponent(location.search.match(new RegExp('nav3' + "=(.*?)($|\&)", "i"))[1]);
            var nav4 = decodeURIComponent(location.search.match(new RegExp('nav4' + "=(.*?)($|\&)", "i"))[1]);
            $('#insertli').append('<li>'+nav1+'</li><li>'+nav2+'</li><li>'+nav3+'</li><li>'+nav4+'</li>');
            // Create jqxTabs.
           
            $('#tabs').jqxTabs({ width: getWidth('tabs'), height: 448, position: 'top' });
            $('#settings div').css('margin-top', '10px');

        });
        function change() {
            $('#tabs').jqxTabs('select', 1);

        }
        function change1() {
            $('#tabs').jqxTabs('select', 2);

        }
        function change2() {
            $('#tabs').jqxTabs('select', 3);

        }
        function prev() {
            $('#tabs').jqxTabs('select', 0);
        }
        function prev1() {
            $('#tabs').jqxTabs('select', 1);
        }
        function prev2() {
            $('#tabs').jqxTabs('select', 2);
        }
        function closewindow() {
            window.parent.$('#jqxwindowCA').jqxWindow('close');
        }
    </script>
</head>
<body class='default'>
    <form runat="server">
        <div id='tabs'>
            <ul id="insertli" style="margin-left:5px;">
               <%-- <li style="margin-left: 30px;">Node.js</li>--%>
               <%-- <li>JavaServer Pages</li>
                <li>Active Server Pages</li>
                <li>Python</li>--%>
                
            </ul>
            <div>
                <br /><br />
              <textarea rows="19" cols="70" style="margin-left:120px"></textarea><br /><br />
                <asp:Button ID="btnNext1" runat="server" class="btn btn-info btn" Text="Next" OnClientClick="change();return false;"  Style="margin-left:630px;width:75px"/>
            </div>
            <div>
                <br /><br />
               <textarea rows="19" cols="70" style="margin-left:120px"></textarea><br /><br />
                <asp:Button ID="Button2" runat="server" class="btn btn-info btn" Text="Previous" Style="margin-left:120px;width:90px"  OnClientClick="prev();return false;"/>
                <asp:Button ID="btnNext2" runat="server" class="btn btn-info btn" Text="Next" OnClientClick="change1();return false;"  Style="margin-left:630px;width:75px;margin-top:-52px"/>
            </div>
            <div>
                <br /><br />
               <textarea rows="19" cols="70" style="margin-left:120px"></textarea><br /><br />
                <asp:Button ID="Button1" runat="server" class="btn btn-info btn" Text="Previous" Style="margin-left:120px;width:90px"  OnClientClick="prev1();return false;"/>
                <asp:Button ID="btnNext3" runat="server" class="btn btn-info btn" Text="Next" OnClientClick="change2();return false;"  Style="margin-left:630px;width:75px;margin-top:-52px"/>
            </div>
            <div>
                 <br /><br />
               <textarea rows="19" cols="70" style="margin-left:120px"></textarea><br /><br />
                 <asp:Button ID="btnPrev" runat="server" class="btn btn-info btn" Text="Previous" Style="margin-left:120px;width:90px" OnClientClick="prev2();return false;"/>
                <asp:Button ID="btnSave" runat="server" class="btn btn-info btn" Text="Save" Style="margin-left:335px;width:75px"/>
                <asp:Button ID="btncancel" runat="server" class="btn btn-info btn" Text="Cancel" OnClientClick="closewindow();"  Style="margin-left:630px;width:75px;margin-top:-52px"/>
            </div>
                
        </div>   
        <div id='settings'></div>
        </form>
</body>
</html>
