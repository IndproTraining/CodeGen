<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Carousel.aspx.cs" Inherits="Carousel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var count = 0;
        function readURL1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#Imageshow1').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#Imageshow2').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function readURL3(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#Imageshow3').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function readURL4(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#Imageshow4').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        function readURL5(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var a = $('#Imageshow5').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function ShowFiles1(args) {
            count = count + 1;
            readURL1(args, count);
        }


        function ShowFiles2(args) {
            count = count + 1;
            readURL2(args, count);
        }


        function ShowFiles3(args) {
            count = count + 1;
            readURL3(args, count);
        }


        function ShowFiles4(args) {
            count = count + 1;
            readURL4(args, count);
        }


        function ShowFiles5(args) {
            count = count + 1;
            readURL5(args, count);
        }

        function closewindow() {
            window.parent.$('#jqxwindowCar').jqxWindow('close');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ValidationSummary ID="ValidationSummaryForm" runat="server" Style="border: 1px solid; width: 85%; font-size: 12px; padding-left: 10px; padding-top:10px; border-color: red; color: red;margin-left:40px;margin-bottom:10px" HeaderText="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>Images Cannot Be Saved</b>"  />
           <br />
             <div style="position: absolute; left: 20px">
                <asp:Image ID="Imageshow1" Style="height: 150px; width: 200px; padding-left: 20px" runat="server" /><br />
                <br />
                <asp:FileUpload runat="server" Style="padding-left: 20px; padding-top: 15px" ID="fileupload1" onchange="ShowFiles1(this)" ClientIDMode="Static"></asp:FileUpload>
                 </div>
            <div style="position: absolute; left: 240px">
                <asp:Image ID="Imageshow2" Style="height: 150px; width: 200px; padding-left: 20px" runat="server" /><br />
                <br />
                <asp:FileUpload runat="server" Style="padding-left: 20px; padding-top: 15px" ID="fileupload2" onchange="ShowFiles2(this)" ClientIDMode="Static"></asp:FileUpload>
            </div>
            <div style="position: absolute; left: 460px">
                <asp:Image ID="Imageshow3" Style="height: 150px; width: 200px; padding-left: 20px" runat="server" /><br />
                <br />
                <asp:FileUpload runat="server" Style="padding-left: 20px; padding-top: 15px" ID="fileupload3" onchange="ShowFiles3(this)" ClientIDMode="Static"></asp:FileUpload>
                <asp:RequiredFieldValidator ID="rfvfileupload3" runat="server" ErrorMessage="Minimum Three Images Required" ControlToValidate="fileupload3" Display="None"></asp:RequiredFieldValidator>
                 </div>
            <div style="position: absolute; left: 110px; top: 290px">
                <asp:Image ID="Imageshow4" Style="height: 150px; width: 200px; padding-left: 20px" runat="server" /><br />
                <br />
                <asp:FileUpload runat="server" Style="padding-left: 20px; padding-top: 15px" ID="fileupload4" onchange="ShowFiles4(this)" ClientIDMode="Static"></asp:FileUpload>
            </div>
            <div style="position: absolute; left: 370px; top: 290px">
                <asp:Image ID="Imageshow5" Style="height: 150px; width: 200px; padding-left: 20px" runat="server" /><br />
                <br />
                <asp:FileUpload runat="server" Style="padding-left: 20px; padding-top: 15px" ID="fileupload5" onchange="ShowFiles5(this)" ClientIDMode="Static"></asp:FileUpload>
            </div>
            <asp:Button ID="btnimagesubmit" runat="server" Text="Save" class="btn btn-info btn" ClientIDMode="Static" Style="margin-left: 270px; margin-top: 490px; width: 100px" OnClick="btnimagesubmit_Click" />
        <button type="button" id="btncancle" class="btn btn-info btn" onclick="closewindow();" Style="margin-left: 380px; margin-top: -58px; width:100px">Cancel</button>
        </div>
    </form>
</body>
</html>
