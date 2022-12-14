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
    <title style="font-size: 40px;">SET Pizza Shop</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type = "text/javascript" src = "jQuery.js"></script>
    <style>
        body {
            background-attachment:fixed;
            background-image:url(Image.jpg);
            background-size:auto;
        }
        h3 {
            text-align:center;
            font-size: 40px; 
            font-family:'Italic Outline Art'; 
            font-style:italic;
            font-weight:bold;
            background-color:orange;
            color:white;
        }
        div {
            text-align:center;
        }
        span {
            text-align:center;
            color:white;
            font-size:30px;
            background-color:orange;
        }
        p {
            text-align:center;
            color:darkred;
            font-size: 20px;
        }
        input {
            vertical-align:bottom;
            height:30px;
            width: 400px;
            font-size:20px;
            background-color:orange;
            color:white;
        }
        button {
            height:30px;
            width:80px;
        }
    </style>
</head>
<body>
    
    <h3>
        <!-- header name for the website-->
        <strong>SET Pizza Shop</strong>
    </h3>
    <br /><br /><br /><br />
    <form  runat="server">
        <div>
             <!-- div container to ask user for their name and to process input-->
            <span id="Message" name="Message">Please enter your first and last name -: </span><span>  </span>  
            <input type="text" id="userName" name="userName" runat="server"/>
            <br /><br />
            <p id="error" name="error" ></p>
            <asp:RequiredFieldValidator
                  id="Name"
                  ControlToValidate="userName"
                  display="Static"
                  Forecolor="red"
                  ErrorMessage="The field cannot be left blank, please enter your first and last name"
                  runat="server" /><br /><br />
            <br /><br />
            <button id="Clear" runat ="server" type="reset">Clear</button>
            <button id="Update" runat="server" type="button" onclick="Submit_Click()">Update</button>
            <br /><br />
        </div>
    </form>
</body>
</html>
