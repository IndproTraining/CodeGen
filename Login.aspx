<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LogIn</title>
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqmidBFhrUsLeCeyK6o_8U_rD1BrDnE5E&callback=generateMap"></script>
    <style>
        body {
            background-image: url("background2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: inherit;
        }

        #btnSignUp {
            position: absolute;
            top: 120px;
            right: 113px;
            width: 110px;
            height: 35px;
            border-radius: 5px;
            /*background-color: lightgreen;*/
            opacity: 0.8;
            font-size: 14px;
            color: white;
        }

        #btnLogIn {
            width: 150px;
            height: 38px;
            border-radius: 5px;
            /*background-color: gray;*/
            font-size: 14px;
            color: white;
        }

        #txtmail, #txtpassword {
            opacity: 0.8;
            height: 35px;
            width: 270px;
            border: 1.3px solid gray;
            border-radius: 4px;
        }
    </style>
    <script type="text/javascript">
        function LoginErrorNotification() {
            $("#jqxNotificationLoginError").jqxNotification("open");
            $("#jqxNotificationLoginError").jqxNotification({
                width: "50%", position: "top-right", opacity: 0.9,
                autoOpen: true, animationOpenDelay: 800, animationCloseDelay: 800, autoClose: true, template: "error"
            });
        }

        function EmailSuccessNotification()
        {
            $("#jqxNotificationEmailSuccess").jqxNotification("open");
            $("#jqxNotificationEmailSuccess").jqxNotification({
                width: "50%", position: "top-right", opacity: 0.9,
                autoOpen: true, animationOpenDelay: 800, animationCloseDelay: 800, autoClose: true, template: "info"
            });
        }

        function EmailErrorNotification()
        {
            $("#jqxNotificationEmailError").jqxNotification("open");
            $("#jqxNotificationEmailError").jqxNotification({
                width: "50%", position: "top-right", opacity: 0.9,
                autoOpen: true, animationOpenDelay: 800, animationCloseDelay: 800, autoClose: true, template: "error"
            });
        }

        function RedirectToRegistration()
        {
            window.location.replace("http://localhost/CodeGen/Registration.aspx");
        }

        function ForgotPassword()
        {
                $("#winHeader").html('Forgot Password');
                $("#wincontent").html('<iframe src="ForgotPassword.aspx" height="135" width="340" style="border:none;"></iframe>');
                $("#jqxwindow").jqxWindow({ height: '220', width: '386', resizable: false, isModal: true, draggable: false, showCloseButton: true });
                var x = ($(window).width() - $("#jqxwindow").jqxWindow('width')) / 2 + $(window).scrollLeft();
                var y = ($(window).height() - $("#jqxwindow").jqxWindow('height')) / 2 + $(window).scrollTop();
                $("#jqxwindow").jqxWindow({ position: { x: x, y: y } });
                $("#jqxwindow").jqxWindow('open');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ValidationSummary ID="ValidationSummaryForm" runat="server" Style="border: 2px solid; width: 98%; font-size: 13px; padding-left: 30px; border-color: red; margin: 10px; color: red" HeaderText="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>Following Fields Are Mandatory</b>" />
        <input id="btnSignUp" type="button" value="Sign Up" class="btn btn-info btn" style="font-size: 18px; padding-bottom: 30px; margin-top: -3px" onclick="RedirectToRegistration();" />
        <div class="container" style="margin-top: 90px;">
            <h1 style="color: #0094ff;">Log In</h1>
            <hr />
            <br />
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                </div>
                <div id="jqxNotificationLoginError" style="display: none; position: absolute; left: 370px;">
                    <h5 style="font-family: Verdana">E-mail or Password is incorrect!</h5>
                </div>
                <div id="jqxNotificationEmailSuccess" style="display: none; position: absolute; left: 370px;">
                    <h5 style="font-family: Verdana">Password has been sent to your mail inbox!</h5>
                </div>
                <div id="jqxNotificationEmailError" style="display: none; position: absolute; left: 370px;">
                    <h5 style="font-family: Verdana">This Email does not match our records!</h5>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-12 col-xs-12" style="background-color: lightgray; box-shadow: 0px 0px 5px 0px #888888; opacity: 0.65; margin-left: 75px; border-radius: 5px; padding-top: 50px; padding-left: 67px; padding-bottom: 20px; width: 400px; height: 310px;">
                    <div class="form-group">
                        &nbsp<b style="font-family: Verdana; font-size: 12px;">E-mail:</b><asp:Label ID="lblEmail" runat="server" Text="Name" ForeColor="red"><b style="font-size:14px;"> *</b></asp:Label>
                        <br />
                        <div style="height: 5px"></div>
                        <asp:TextBox ID="txtmail" Font-Bold="true" runat="server" placeholder=" Enter Email" Font-Size="Small"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVmail" runat="server" ErrorMessage="Email is Required!" Display="None" ControlToValidate="txtmail"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REVmail" runat="server" ErrorMessage="Please enter valid Email address." Display="None" ControlToValidate="txtmail" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator>
                        <div style="height: 10px"></div>
                        <div>
                            &nbsp<b style="font-family: Verdana; font-size: 12px;">Password:</b><asp:Label ID="lblpassword" runat="server" Text="Name" ForeColor="red"><b style="font-size:14px;"> *</b></asp:Label>
                            <br />
                            <div style="height: 5px"></div>
                            <asp:TextBox ID="txtpassword" Font-Bold="true" runat="server" type="password" Font-Size="Small" placeholder=" Enter Password"></asp:TextBox>
                            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  
                        <asp:LinkButton ID="linkbtnpass" runat="server"><a style="font-size:12px;" href="#" onclick="ForgotPassword();">Forgot Password?</a></asp:LinkButton>
                            <asp:RequiredFieldValidator ID="RFVpassword" runat="server" ErrorMessage="Password is Required!" Display="None" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                            <div style="height: 30px"></div>
                        </div>
                        <div style="margin-left: 50px;">
                            <asp:Button ID="btnLogIn" class="btn btn-info btn" runat="server" Text="Login" Font-Size="18px" Font-Bold="true" OnClick="btnLogIn_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12"></div>
        </div>
        <div id="jqxwindow">
            <div id="winHeader"></div>
            <div id="wincontent"></div>
        </div>
    </form>
</body>
</html>
