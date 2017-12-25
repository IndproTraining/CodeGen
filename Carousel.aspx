<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Carousel.aspx.cs" Inherits="Carousel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
::-webkit-file-upload-button {
    -webkit-appearance: none;
    background-color: gray;
    border: 1px solid gray;
    border-radius:3px;
    color:white;
    font-size: 15px; padding: 8px;
    height:22px;
    padding-left:10px;
    padding-right:10px;
    padding-top:1px;
}
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#fileupload2').css("opacity", "0.5");
            $('#fileupload3').css("opacity", "0.5");
            $('#fileupload4').css("opacity", "0.5");
            $('#fileupload5').css("opacity", "0.5");
        });
    </script>
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
            $('#fileupload2').css("opacity", "1");
            $('#fileupload2').prop('disabled', false);
            readURL1(args, count);
        }

        function ShowFiles2(args) {
            count = count + 1;
            $('#fileupload3').css("opacity", "1");
            $('#fileupload3').prop('disabled', false);
            readURL2(args, count);
        }

        function ShowFiles3(args) {
            count = count + 1;
            $('#fileupload4').css("opacity", "1");
            $('#fileupload4').prop('disabled', false);
            readURL3(args, count);
        }

        function ShowFiles4(args) {
            count = count + 1;
            $('#fileupload5').css("opacity", "1");
            $('#fileupload5').prop('disabled', false);
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
                <asp:FileUpload runat="server"  Style="padding-left: 20px; padding-top: 15px" ID="fileupload1" onchange="ShowFiles1(this)" ClientIDMode="Static"></asp:FileUpload>
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
                 
            <div style="position: absolute; left: -440px; top: 260px">
                <asp:Image ID="Imageshow4" Style="height: 150px; width: 200px; padding-left: 20px" runat="server" /><br />
                <br />
                <asp:FileUpload runat="server" Style="padding-left: 20px; padding-top: 15px" ID="fileupload4" onchange="ShowFiles4(this)" ClientIDMode="Static"></asp:FileUpload>
                 </div>
            <div style="position: absolute; left: -220px; top: 260px">
                <asp:Image ID="Imageshow5" Style="height: 150px; width: 200px; padding-left: 20px" runat="server" /><br />
                <br />
                <asp:FileUpload runat="server" Style="padding-left: 20px; padding-top: 15px" ID="fileupload5" onchange="ShowFiles5(this)" ClientIDMode="Static"></asp:FileUpload>
            </div>
                </div>
            <asp:Button ID="btnimagesubmit" runat="server" Text="Save" class="btn btn-info" ClientIDMode="Static" Style="margin-left: 260px; margin-top: 520px; width: 100px" OnClick="btnimagesubmit_Click" />
        <button type="button" id="btncancle" class="btn btn-info" onclick="closewindow();" Style="margin-left: 375px; margin-top: -57px; width:100px">Cancel</button>
        </div>
    </form>
</body>
</html>
