<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Map.aspx.cs" Inherits="Map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9BrEw4FK-AARM5rEjgqt-Z3rcIk3rDf8&callback=initialize">
    </script>
    <script type="text/javascript">
        //var map;
        function initialize() {
            var myLatlng = new google.maps.LatLng(22.5726, 88.3639);
            var myOptions = {
                zoom: 12,
                center: myLatlng,
            }
            map = new google.maps.Map(document.getElementById("gmap"), myOptions);
            // marker refers to a global variable
            marker = new google.maps.Marker({
                position: myLatlng,
                draggable: true,
                map: map
            });

            google.maps.event.addListener(marker, "drag", function (event) {
                // get lat/lon of click
                var clickLat = event.latLng.lat();
                var clickLon = event.latLng.lng();

                // show in input box
                document.getElementById("txtlat").value = clickLat.toFixed(5);
                document.getElementById("txtlong").value = clickLon.toFixed(5);
            });
        }
    </script>

    <script type="text/javascript">

        function ValidatePage() {
            if (ClientClickEvent()) {
                addmapdata();
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


        function addmapdata() {
            var lat = $('#txtlat').val();
            var lng = $('#txtlong').val();
            window.parent.generateMap(lat, lng);
            window.parent.$('#jqxwindowMap').jqxWindow('close');
        }
        function closewindow() {
            window.parent.$('#jqxwindowMap').jqxWindow('close');
        }
    </script>

</head>
<body onload="initialize();">
    <asp:Label ID="lblHeader" runat="server" Text="" Style="font-family: Verdana; font-size: large; position: absolute; left: 250px">Drag The Marker And Set The Location</asp:Label>
    <form runat="server">
        <br />
        <br />
        <div id="gmap" style="width: 500px; height: 450px; border: 2px solid; box-shadow: 10px 10px 10px"></div>
        <asp:ValidationSummary ID="ValidationSummaryForm" runat="server" Style="position: absolute; top: 30px; left: 500px; border: 2px solid; width: 40%; font-size: 13px; padding-left: 30px; border-color: red; background-color: lightyellow; margin: 10px; color: red" HeaderText="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>Following Fields Are Mandatory</b>" />
        <div id="latlong" style="position: absolute; top: 120px; left: 575px; background-color: lightgray; box-shadow: 10px 10px 10px">
            <table runat="server">
                <tr>
                    <td>
                        <p>
                            Latitude:&nbsp&nbsp&nbsp
                            <asp:TextBox ID="txtlat" runat="server"></asp:TextBox>
                        </p>
                        <asp:RequiredFieldValidator ID="rfvLatitude" runat="server" ErrorMessage="Please Specify The Latitude" ControlToValidate="txtlat" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            Longitude:
                            <asp:TextBox ID="txtlong" runat="server"></asp:TextBox>
                        </p>
                        <asp:RequiredFieldValidator ID="rfvLongitude" runat="server" ErrorMessage="Please Specify the Longitude" ControlToValidate="txtlong" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
        <div id="buttonholder" style="position: absolute; top: 240px; left: 630px">
            <button type="button" id="btnsave" class="btn btn-info btn" onclick="ValidatePage();">Save</button>
            <button type="button" id="btncancle" class="btn btn-info btn" onclick="closewindow();">Cancel</button>
        </div>
    </form>
</body>
</html>
