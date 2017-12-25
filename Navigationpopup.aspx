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
        function ValidatePage() {
            if (ClientClickEvent()) {
                addmenudata();
            }
            return false;
        }

        function ClientClickEvent() {
            var x = typeof (Page_Validators);
            var y = typeof (Page_ClientValidate);
            var active = typeof (Page_ValidationActive);
            if (x == "object") {
                if (y == "function" && active == "boolean") {
                    isPageValid = Page_ClientValidate();
                    return isPageValid;
                }
            }
            return false;
        }

        function addmenudata() {
            var item1 = $('#txtitem1').val();
            var item2 = $('#txtitem2').val();
            var item3 = $('#txtitem3').val();
            var item4 = $('#txtitem4').val();
            window.parent.ReceiveNavigationHeaders(item1, item2, item3, item4);
            window.parent.$('#jqxwindow').jqxWindow('close');
        }

        function closewindow() {
            window.parent.$('#jqxwindow').jqxWindow('close');
        }
    </script>
</head>
<body>
    <form runat="server">
        <asp:ValidationSummary ID="ValidationSummaryForm" runat="server" Style="border: 2px solid; width: 94%; font-size: 13px; padding-left: 30px; border-color: red; margin: 10px; color: red" HeaderText="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>Menu items could not be added</b>" />
        <div class="container" style="margin-left: 70px; margin-top: 30px; height: 300px; width: 250px;">
            <div>
                <asp:Label ID="MenuHeaders" runat="server" Text="Label" CssClass=" lblstyle " Style="font-size:initial;font-family:Verdana;margin-left:0px;font-size:12px"><b>Add your desired menu names</b></asp:Label>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-3 col-sm-3 col-md-3 col-xs-12">
                    <div style="margin-left:7px">
                        <asp:Label ID="lblItem1" CssClass="lblstyle" runat="server" Text="" Style="font-family:Verdana;font-weight:bold;font-size:11px">Item 1:<span style="color:red">*</span></asp:Label>
                        <div style="height: 2px;"></div>
                        <asp:TextBox ID="txtitem1" runat="server" CssClass="inputbox" Style="height:25px;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtitem1" runat="server" Display="None" ErrorMessage="Item 1 is required" ControlToValidate="txtitem1"></asp:RequiredFieldValidator>
                    </div>
                     <div style="height: 8px;"></div>
                    <div style="margin-left:7px">
                        <asp:Label ID="lblitem2" CssClass="lblstyle" runat="server" Text="" Style="font-family:Verdana;font-weight:bold;font-size:11px">Item 2:<span style="color:red">*</span></asp:Label>
                        <div style="height: 2px;"></div>
                        <asp:TextBox ID="txtitem2" runat="server" CssClass="inputbox" Style="height:25px;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtitem2" runat="server" Display="None" ErrorMessage="Item 2 is required" ControlToValidate="txtitem2"></asp:RequiredFieldValidator>
                    </div>
                    <div style="height: 8px;"></div>
                    <div style="margin-left:7px">
                        <asp:Label ID="lblitem3" CssClass="lblstyle" runat="server" Text="" Style="font-family:Verdana;font-weight:bold;font-size:11px">Item 3:<span style="color:red">*</span></asp:Label>
                        <div style="height: 2px;"></div>
                        <asp:TextBox ID="txtitem3" runat="server" CssClass="inputbox" Style="height:25px;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtitem3" runat="server" Display="None" ErrorMessage="Item 3 is required" ControlToValidate="txtitem3"></asp:RequiredFieldValidator>
                    </div>
                   <div style="height: 8px;"></div>
                    <div style="margin-left:7px">
                        <asp:Label ID="lblitem4" CssClass="lblstyle" runat="server" Text="" Style="font-family:Verdana;font-weight:bold;font-size:11px">Item 4:<span style="color:red">*</span></asp:Label>
                        <div style="height: 2px;"></div>
                        <asp:TextBox ID="txtitem4" runat="server" CssClass="inputbox" Style="height:25px;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtitem4" runat="server" Display="None" ErrorMessage="Item 4 is required" ControlToValidate="txtitem4"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <br />
            <asp:Button ID="btnmenusubmit" runat="server" Text="Save" class="btn btn-info btn"  OnClientClick="ValidatePage();" ClientIDMode="Static" Style="margin-left: 22px;margin-top:8px;width:68px" />
            <button type="button" id="btncancle" class="btn btn-info btn" onclick="closewindow();" style="margin-top:8px">Cancel</button>
        </div>
    </form>
</body>
</html>


