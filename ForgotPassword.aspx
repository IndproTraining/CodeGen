<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtabs.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxnotification.js"></script>
    <style type="text/css">
        .btnSend {
            margin-left:83px;
            height:30px;
            width:75px;
            border-radius:3px;
            color: #fff;
            background-color: #5bc0de;
            border-color: #46b8da;
            border: 1px solid #46b8da; 
        }
        .btnCancel {
            margin-left:5px;
            height:30px;
            width:75px;
            border-radius:3px;
            color: #fff;
            background-color: #5bc0de;
            border-color: #46b8da;
            border: 1px solid #46b8da; 
        }
    </style>
    <script type="text/javascript">
        function CloseWindow()
        {
            window.parent.$("#jqxwindow").jqxWindow('close');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
     <div class="container">
            <div class="row">
                        <asp:Label ID="lblItem1" CssClass="lblstyle" runat="server" Text="" Style="font-family:Verdana;font-weight:bold;font-size:11px">Please enter your email address, we'll send you the password.<span style="color:red"></span></asp:Label>
                        <div style="height: 5px;"></div>
                        <asp:TextBox ID="txtEmail" runat="server" style="margin-left:11px; width:300px; height:25px;"></asp:TextBox>
                <div style="height: 15px;"></div>
                <asp:Button ID="Send" runat="server" Text="Send" CssClass="btnSend" OnClick="Send_Click"/>
                <asp:Button ID="Cancel" runat="server" Text="Cancel" CssClass="btnCancel" OnClientClick="CloseWindow();"/>
                </div>
         </div>
    </form>
</body>
</html>
