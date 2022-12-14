<!--FILE :          StarPage.aspx
    PROJECT :       PROG2001 - A-07 : JQUERY AND JSON BASED TEXT EDITOR
    PROGRAMMER :    Kushaldeep Singh, Yuvraj Singh
    FIRST VERSION : 12/08/2022
    DESCRIPTION :   the aspx file is to load the file contents that are sent from the server. and pass it to textbox area for editing
                    if the contents are changed prompt to save or neglect changes -->
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="StartPage.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- title for the page --> 
    <title style="font-size: 40px;">Text Editor</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type = "text/javascript" src = "jQuery.js"></script>
    <style>
        body {
            background-attachment:fixed;
            background-image:url(Image.jpg);
            background-size:auto;
        }
    </style>
</head>
<body style>
    
    <h3 style="text-align:center">
        <!-- header name for the game-->
        <strong style="font-size: 40px;">Text Editor</strong>
    </h3>
    <form  runat="server">
        <div  style="text-align:center">
             <!-- div container to ask user for their name and to process input-->
            <span id="Message" name="Message" style="text-align:center;">Please Select a file from the drop-down list for editing -:      </span>
           <select id="dropdown" name="dropdown">
               
           </select>
            <br /><br />
            <div>
                <div>
                    <textarea id="txtBox" class="textbox" name="txtBox" style="height: 250px; width: 600px;"></textarea>
                </div>
                <div class="statusBar">
                    <p id="statusMessage" class="statusBarText"></p>
                </div>
            </div>
            <input type="text" id="saveFileTextbox" name="saveFileTextbox" style="height: 15px; width: 120px;" />
            <button id="save" runat="server" type="button" onclick="saveAs()">SaveAs</button>
            <br /><br />
            <button id="Clear" runat ="server" type="reset">Clear</button>
            <button id="Update" runat="server" type="button" onclick="saveFile()">Update</button>
            <br /><br />
        </div>
    </form>
</body>
</html>
