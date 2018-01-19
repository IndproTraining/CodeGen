<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqmidBFhrUsLeCeyK6o_8U_rD1BrDnE5E&callback=generateMap"></script>

    <style>
        body {
            background-image: url("background2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: inherit;
        }

        #VSSignUp {
            border: 2px solid darkred;
            margin: 20px;
            background-color: pink;
        }

        #txtconfirmpassword, #txtpassword, #txtskills, #txtmobile, #txtmail, #txtname, #txtabout {
            opacity: 0.8;
            height: 35px;
            width: 250px;
            border: 1.3px solid gray;
            border-radius: 4px;
        }

        #txtadd {
            opacity: 0.8;
            height: 105px;
            width: 250px;
            border-radius: 4px;
            border: 1.3px solid gray;
        }

        #divlang {
            height: 140px;
            width: 250px;
        }

        #btnSIgnUp {
            width: 150px;
            height: 38px;
            border-radius: 5px;
            font-size: 14px;
            color: white;
        }

        #btnLogIn {
            margin-left: 900px;
            margin-top: 35px;
            font-size: 18px;
            width: 110px;
            height: 35px;
            border-radius: 5px;
            opacity: 0.8;
            color: white;
        }
    </style>
    <script type="text/javascript">
        function RegistrationSuccessNotification() {
            $("#jqxNotificationRegistrationSuccess").jqxNotification("open");
            $("#jqxNotificationRegistrationSuccess").jqxNotification({
                width: "50%", position: "top-right", opacity: 0.9,
                autoOpen: true, animationOpenDelay: 800, animationCloseDelay: 800, autoClose: true, template: "success"
            });
        }

        function RegistrationErrorNotification() {
            $("#jqxNotificationRegistrationError").jqxNotification("open");
            $("#jqxNotificationRegistrationError").jqxNotification({
                width: "50%", position: "top-right", opacity: 0.9,
                autoOpen: true, animationOpenDelay: 800, animationCloseDelay: 800, autoClose: true, template: "info"
            });
        }

        function RedirectToLogin() {
            window.location.replace("http://localhost/CodeGeneration/Login.aspx");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ValidationSummary ID="ValidationSummaryForm" runat="server" Style="border: 2px solid; width: 98%; font-size: 13px; padding-left: 30px; border-color: red; margin: 10px; color: red" HeaderText="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>You could not be registered</b><br/><br/>" />
        <div class="container" style="margin-top: 60px;">
            <table>
                <tr>
                    <td colspan="2">
                        <h1 style="color: #0094ff">Sign Up</h1>
                    </td>
                    <td>
                        <input id="btnLogIn" type="button" class="btn btn-info btn" value="Login" onclick="RedirectToLogin();" />
                    </td>
                </tr>
            </table>
            <hr />
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                </div>
                <div id="jqxNotificationRegistrationSuccess" style="display: none; position: absolute; left: 370px;">
                    <h5 style="font-family: Verdana">You are registered successfully.</h5>
                </div>
                <div id="jqxNotificationRegistrationError" style="display: none; position: absolute; left: 370px;">
                    <h5 style="font-family: Verdana">This Email is already registered!</h5>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-12 col-xs-12" style="background-color: lightgray; box-shadow: 0px 0px 5px 0px #888888; opacity: 0.65; margin-left: 75px; border-radius: 5px; padding-top: 50px; padding-left: 67px; padding-bottom: 20px; width: 400px; height: 440px;">
                    <div id="divName">
                        &nbsp<b style="font-family: Verdana; font-size: 12px;">Name:</b><asp:Label ID="lblname" runat="server" Text="Name" ForeColor="red">*</asp:Label>
                        <br />
                        <div style="height: 6px"></div>
                        <asp:TextBox ID="txtname" runat="server" placeholder=" Enter Your Name" Font-Bold="true" Font-Size="Small"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVname" runat="server" ErrorMessage="Name is Required!" Display="None" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REVname" runat="server" ErrorMessage="Only Alphabets are allowed!" Display="None" ControlToValidate="txtname" ValidationExpression="[A-Z-.,'ÅÄÖa-zåäöåäöÅÄÖæÆøØüÜéÉ_ ]*"></asp:RegularExpressionValidator>
                    </div>
                    <div style="height: 10px"></div>
                    <div id="divEmail">
                        &nbsp<b style="font-family: Verdana; font-size: 12px;">E-mail:</b><asp:Label ID="lblemail" runat="server" Text="EMail" ForeColor="red">*</asp:Label>
                        <br />
                        <div style="height: 6px"></div>
                        <asp:TextBox ID="txtmail" runat="server" placeholder=" Example@Example.com" Font-Bold="true" Font-Size="Small"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVmail" runat="server" ErrorMessage="Email is Required!" Display="None" ControlToValidate="txtmail"></asp:RequiredFieldValidator></td>
                         <asp:RegularExpressionValidator ID="REVmail" runat="server" ErrorMessage="Please enter valid Email address." Display="None" ControlToValidate="txtmail" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator>
                    </div>
                    <div style="height: 10px"></div>
                    <div id="divpassword" runat="server">
                        &nbsp<b style="font-family: Verdana; font-size: 12px;">Password:</b><asp:Label ID="Label3" runat="server" Text="Name" Value="Name" ForeColor="red">*</asp:Label>
                        <br />
                        <div style="height: 6px"></div>
                        <asp:TextBox ID="txtpassword" type="password" runat="server" placeholder=" Enter new password" Font-Bold="true" Font-Size="Small"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVpassword" runat="server" ErrorMessage="Password is Required!" Display="None" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                    </div>
                    <div style="height: 10px"></div>
                    <div id="divconfirmpassword" runat="server">
                        &nbsp<b style="font-family: Verdana; font-size: 12px;">Confirm Password:</b><asp:Label ID="Label4" runat="server" Text="Name" Value="Name" ForeColor="red">*</asp:Label>
                        <br />
                        <div style="height: 6px"></div>
                        <asp:TextBox ID="txtconfirmpassword" type="password" runat="server" placeholder=" Re- Enter password" Font-Bold="true" Font-Size="Small"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVconfirmpassword" runat="server" ErrorMessage="Confirm Password is Required!" Display="None" ControlToValidate="txtconfirmpassword"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CVconfirmpassword" runat="server" ErrorMessage=" Password does not match the confirm password." Display="None" ControlToValidate="txtconfirmpassword" ControlToCompare="txtpassword"></asp:CompareValidator>
                    </div>
                    <div style="height: 35px"></div>
                    <div style="margin-left: 50px;">
                        <asp:Button ID="btnSIgnUp" class="btn btn-info btn" Font-Size="18px" Font-Bold="true" runat="server" Text="Sign Up" OnClick="btnSIgnUp_Click" />
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                </div>
            </div>
        </div>
    </form>
</body>
</html>

