<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Navigationpopup.aspx.cs" Inherits="Navigationpopup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <script src="jquery-1.11.1.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function addmenudata() {
            debugger;
            var item1 = $('#txtitem1').val();
            var item2 = $('#txtitem2').val();
            var item3 = $('#txtitem3').val();
            var item4 = $('#txtitem4').val();
            window.parent.ReceiveNavigationHeaders(item1, item2, item3, item4);
            window.parent.$('#jqxwindow').jqxWindow('close');
        }
    </script>
</head>
<body>
    <form runat="server">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
         <div class="container" style="margin-left: 70px;margin-top:30px; height:300px; width:250px;">
            <div>
                <asp:Label ID="MenuHeaders" runat="server" Text="Label" CssClass=" lblstyle " Style="font-size: large">Insert Menu Headers</asp:Label>
                <hr style="width: 172px; margin-left: 0px">
            </div>
            <div class="row">
                <div class="col-lg-3 col-sm-3 col-md-3 col-xs-12">
                    <div>
                        <asp:Label ID="lblItem1" CssClass="lblstyle" runat="server" Text="">Item 1:<span style="color:red">*</span></asp:Label>
                        <div style="height: 6px;"></div>
                        <asp:TextBox ID="txtitem1" runat="server" CssClass="inputbox"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lblitem2" CssClass="lblstyle" runat="server" Text="">Item2:<span style="color:red">*</span></asp:Label>
                        <div style="height: 6px;"></div>
                        <asp:TextBox ID="txtitem2" runat="server" CssClass="inputbox" ></asp:TextBox>
                    </div>
                     <div>
                        <asp:Label ID="lblitem3" CssClass="lblstyle" runat="server" Text="">Item3:<span style="color:red">*</span></asp:Label>
                        <div style="height: 6px;"></div>
                        <asp:TextBox ID="txtitem3" runat="server" CssClass="inputbox" ></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lblitem4" CssClass="lblstyle" runat="server" Text="">Item4:<span style="color:red">*</span></asp:Label>
                        <div style="height: 6px;"></div>
                        <asp:TextBox ID="txtitem4" runat="server" CssClass="inputbox" ></asp:TextBox>
                    </div>
                    </div>
                
                </div>
             <br />
             <asp:Button ID="btnmenusubmit" runat="server" Text="Submit" class="btn btn-info btn-lg"  OnClientClick="addmenudata();" ClientIDMode="Static" style="margin-left:40px"/>
             </div>
                    
                    </form>
</body>
</html>


